def reading_time(text)
    number_of_words = text.split.length
    if number_of_words >= 200
        (number_of_words/200.to_f).ceil
    elsif number_of_words < 200 && number_of_words > 0
        "<1"
    else
        return 0
    end
end