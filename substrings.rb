dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(str, dict)
    str = str.downcase.split(/[^[[:word:]]]+/)
    matches = {}
    dict.each do |dict_word|
        matches[dict_word]=0
        str.each do |str_word|
            if str_word.include?(dict_word)
                matches[dict_word]+=1
            end
        end
    end
    matches.each do |key, value|
        if value == 0
            matches.delete(key)
        end
    end
    puts matches
end

substrings("below", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)