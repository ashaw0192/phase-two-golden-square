def sentence_checker(text)
    fail "Not a sentence." if text.empty?
    enders = [".", "!", "?"]
    if text.start_with?(/[A-Z]/) && enders.include?(text[-1])
        true
    else
        false
    end
end
