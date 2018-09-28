string = "The quick 12 brown foxes jumped over the 10 lazy dogs"

# Returns the index position where the string quick starts
p string =~ /quick/  

# Returns "Valid" if the character z is found
p string =~ /z/ ? "Valid" : "Invalid"  

# Returns an enumerator with the strings that match the regular expression \d+
p string.to_enum(:scan, /\d+/).map { Regexp.last_match }  