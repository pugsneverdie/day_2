import Char "mo:base/Char";
import Array "mo:base/Array";
import Text "mo:base/Text";
import Nat8 "mo:base/Nat8";

actor {

  

 //Challenge 1 - Write a function nat_to_nat8 that converts a Nat n to a Nat8. Make sure that your function never trap.
  //public var nat_to_nat8(n : Nat) : async Nat;
  
    
  public func nat_to_nat8(n : Nat) : async Nat8 {
    if(n > 255) {
      return 0;
    } else {
      return Nat8.fromNat(n);
    };
   };
  





 //Challenge 2 - Write a function max_number_with_n_bits that takes a Nat n and returns the maximum number than can be represented with only n-bits.
  public func max_number_with_n_bits(n : Nat) : async Nat {
    var count = n;
    var max_number = 0;
    while(count > 0){
      max_number := max_number + 2**(count - 1);
      count := count -1;
    };
    return(max_number);
  };
  





 //Challenge 3 -Write a function decimal_to_bits that takes a Nat n and returns a Text corresponding to the binary representation of this number.
              //Note : decimal_to_bits(255) -> "11111111".


    public func decimals_to_bits(n : Nat) : async Text {
        var m = n;
        var bits = "";
        while(m > 0){
            let remainder = m % 2;
            let m = m / 2;
            if(remainder == 1){
                bits := "1" # bits;
            } else {
                bits := "0" # bits;
            };
        };
        return(bits)
    };

  






 //Challenge 4 - Write a function capitalize_character that takes a Char c and returns the capitalized version of it.

    public func capitalize_character(char : Char) : async Char {
        let unicode_value = Char.toNat32(char);
        if(unicode_value >= 97 or unicode_value <= 122){
            return(Char.fromNat32(unicode_value - 32))
        } else {
            return (Char.fromNat32(unicode_value));
        };
    };




 //Challenge 5 - Write a function capitalize_text that takes a Text t and returns the capitalized version of it.
    
    
    func _capitalize_character(char : Char) : Char {
        let unicode_value = Char.toNat32(char);
        if(unicode_value >= 97 or unicode_value <= 122){
            return(Char.fromNat32(unicode_value - 32))
        } else {
            return (Char.fromNat32(unicode_value));
        };
    };

    public func capitalize_text(word : Text) : async Text {
        var new_word : Text = "";
        for(char in word.chars()){
            new_word #= Char.toText(_capitalize_character(char));
        };
        new_word;
    };




 //Challenge 6 - Write a function is_inside that takes two arguments : a Text t and a Char c and returns a Bool indicating if c is inside t .

    public func is_inside(t : Text, l : Text) : async Bool {
        let p = #text(l);
        return(Text.contains(t, p));
    };





 //Challenge 7 - Write a function trim_whitespace that takes a text t and returns the trimmed version of t. 
              //Note : Trim means removing any leading and trailing spaces from the text : trim_whitespace(" Hello ") -> "Hello".

    public func trim_whitespace(t : Text) : asyncText {
        let pattern = #text(" ");
        return(Text.trim(t, p));
    };



 //Challenge 8 - Write a function duplicated_character that takes a Text t and returns the first duplicated character in t converted to Text. 
              //Note : The function should return the whole Text if there is no duplicate character : duplicated_character("Hello") -> "l" & duplicated_character("World") -> "World".
    
    public func duplicate_character(t : Text) : async Text {
        var characters : [Char] = [];
        for (character in{
            switch(Array.filter(characters, f(x) : Text -> Bool {x == character})); {
                case(null) {
                    characters := Array.append<Text>(characters, [character]);
                }; t.vals())
                case(?char){
                    return Char.toText(char);
                };
            };
        };
        return (t);
    };





 //Challenge 9 - Write a function size_in_bytes that takes Text t and returns the number of bytes this text takes when encoded as UTF-8.

    public func size_in_bytes (t : Text) : async Nat {
        let utf_blob = Text.encodeUtf8(t);
        let array_bytes = Blob.toArray(utf_blob);
        return(array_bytes.size()); 
    };


 //Challenge 10 - Watch this video on bubble sort.
              //Implement a function bubble_sort that takes an array of natural numbers and returns the sorted array .

    func swap(array : [Nat], i : Nat, j : Nat) : [Nat] {
        let mutable_array = Array.thaw<Nat>(array);
        let tmp = mutable_array[i];
        mutable_array[i] := mutable_array[j];
        mutable_array[j] := tmp;
        return(Array.freeze<Nat>(mutable_array))
    };

    public func bubble_sort(array : [Nat]) : async [Nat] {
        var sorted = array;
        let size = array.size();
        for(i in Iter.range(0, size - 1){
            for (j in Iter.range(0, size - 1 - i)){
                if(sorted[i] > sorted[i + 1]){
                    sorted := _swap(sorted, i , j);
                };
            };
        };
        return (sorted)
    };

};
