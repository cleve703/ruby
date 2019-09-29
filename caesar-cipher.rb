puts "Enter a message: "
message = gets.chomp

puts "Enter a shift: "
shift = gets.chomp


def encoder(message, shift)
  convertedString = ""
  shift = shift.to_i
    if shift >= 26
    shift = shift % 26
    end
  char_code = message.chars do |char| 
    charInt = char.ord.to_i
    if (charInt >= 97 && charInt <= 122)
      convertedChar = charInt + shift
      if convertedChar > 122
        convertedChar -= 26
      end
    elsif (charInt >= 65 && charInt <= 90)
      convertedChar = charInt + shift
      if convertedChar > 90
        convertedChar -= 26
      end
    else
      convertedChar = charInt
    end
    convertedString  << convertedChar.chr
  end
  puts convertedString
end

encoder(message, shift)