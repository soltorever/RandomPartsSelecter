# RandomPartsSelecter
所持している"パーツ"からランダムな組み合わせを生成するスクリプト
# Description
所持している"パーツ"と個数を記述したプロパティファイルを読み込み、
ランダムな組み合わせ(重複なし)を出力するスクリプトです。  
なお、重複なしとは"2本ずつ所持したネジAとネジBから、ネジを3本選択する際、ネジAが3本選ばれることはない"という意味です。
# Demo
引数に読み込みたいプロパティファイルを列挙して実行し、  
数字を入力すると、その数字分(可能な限り)ランダムな組み合わせを出力します。  

    $ perl selecter.pl burger.txt drink.txt side.txt 
    Reading burger.txt... done.
    Reading drink.txt... done.
    Reading side.txt... done.
    
    Please input a number.
    When nothing (means "") is inputed, we use last inputed number(default is 1).
    And, when character that isn't a number is inputed, this program will be finished
    
    NUMBER: 3
    ChickenBurger Coffee VegetableSalada 
    Humberger Tea OnionRing 
    ChickenBurger Tea FriedPotate 
    NUMBER: 2
    CheeseBurger Tea FriedPotate 
    Humberger Coffee FriedPotate 
    NUMBER: q

プロパティファイルには以下のように`[パーツ名] [個数]`の形式で各"パーツ"の情報を列挙します。

    Humberger 2
    CheeseBurger 3
    ChickenBurger 3
