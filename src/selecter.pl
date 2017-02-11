use strict;
use warnings;

sub load_properties {
  my $file = $_[0];
  open(FH, "<$file") or die("$file couldn't be opened.");
  print "Reading $file...";
  my @result = ();
  my $line = "";
  my $count = 1;
  while (<FH>) {
    chomp($_);
    if (/^([^\s\t]+)\s([0-9]+)$/ ) {
      for (my $i = 0; $i < $2; $i++) {
        push(@result, $1);
      }
    } elsif (/^$/) {
      # Do nothing.
    }else {
      print " failed.\n";
      print "line.$count is wrong format.\n";
      exit 1;
    }
    $count++;
  }
  print " done.\n";
  return @result;
}

sub sort_random {
  my @list = @_;
  my $n = @list;
  for (my $i = $n; $i > 0; $i--) {
    my $r = int(rand($n));
    my $temp = $list[$r];
    $list[$r] = $list[$i - 1];
    $list[$i-1] = $temp;
  }
  return @list;
}

sub print_program_description {
  print "\nPlease input a number.\n";
  print "When nothing (means \"\") is inputed, we use last inputed number(default is 1).\n";
  print "And, when character that isn't a number is inputed, this program will be finished\n\n";
}

sub print_loop_comment {
  print "NUMBER: ";
}

sub calc_property_min_size {
  my @property_refs = @_;
  my $min = 0;
  if (@property_refs > 0 ) {
    $min = @{$property_refs[0]};
  }
  for (my $i = 1; $i < @property_refs; $i++ ){
    my @property = @{$property_refs[$i]};
    if (@property < $min) {
      $min = @property;
    }
  }
  return $min;
}


## main ##
my @property_refs = ();
for (my $i = 0; $i < @ARGV; $i++) {
  my @property = &load_properties("$ARGV[$i]");
  push(@property_refs, \@property);
}

&print_program_description();
&print_loop_comment();

# show "1" result by default 
my $n = 1;
my $property_min_size = &calc_property_min_size(@property_refs); 

while(<STDIN>) {
  chomp();

  if (/^([0-9]+)$/) {
    $n = $1;
    if ($n > $property_min_size) {
      $n = $property_min_size;
    }
  } elsif (/^$/) {
    # do nothing #
  } else {
    last;
  }

  for (my $i = 0; $i < @property_refs; $i++ ){
    my @property = &sort_random(@{$property_refs[$i]});
    $property_refs[$i] = \@property;
  }

  for (my $i = 0; $i < $n; $i++) {
    for (my $j = 0; $j < @property_refs; $j++ ){
      print "${$property_refs[$j]}[$i]";
    }
    print "\n";
  }
  &print_loop_comment();
}
