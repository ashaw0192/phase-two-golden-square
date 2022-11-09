require 'sentence_checker'
RSpec.describe "sentence checker method" do
    it "returns true if capitalized and ends in correct punctuation" do
        result = sentence_checker("Hello, this will pass the test!")
        expect( result ).to eq true
    end

    # it "returns yes if the sentence ends with a valid stop" do
    #     result = sentence_checker("hello, this will pass the test!")
    #     expect( result ).to eq "yes"
    # end

    # it "returns True if the sentence starts with a capital letter" do
    #     result = sentence_checker("Hello, this will pass the test")
    #     expect( result ).to eq "certainly"
    # end
end