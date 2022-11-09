def sentence_checker(text)
enders = [".", "!", "?"]
    if text.start_with?(/[A-Z]/) && enders.include?(text[-1])
        true
    #elsif text.start_with?(/[A-Z]/) 
        #return "certainly"
    #elsif enders.include?(text[-1])
        #return "yes"
    else
        false
    end

end

puts sentence_checker("Hello, How are you?")
puts sentence_checker("hello, How are you?")
puts sentence_checker("H!@£@££%$£$%£$^$&£$%@£$@£$@£%$^£%^$%&$!")