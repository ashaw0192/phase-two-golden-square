class GrammarStats
    def initialize
        @texts_checked = 0
        @texts_passed = 0
    end
  
    def check(text)
        @text = text
        fail "Not a sentence." if @text == ""
        @texts_checked += 1
        enders = [".", "!", "?"]
        if text.start_with?(/[A-Z]/) && enders.include?(text[-1])
            @texts_passed +=1
            true
        else
            false
        end
    end
  
    def percentage_good
        fail "No texts checked." if @texts_checked == 0
        (@texts_passed/@texts_checked.to_f * 100).round()
    end
  end