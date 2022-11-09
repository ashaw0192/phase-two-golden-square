require 'make_snippet'

RSpec.describe "make_snippet method" do
    context "given an empty string" do
        it "returns an empty string" do
            result = make_snippet("")
            expect(result).to eq ""
        end
    end

    context "given a string of 5 words" do   
        it "returns the string" do
            result = make_snippet("a string of five words")
            expect(result).to eq "a string of five words"
        end
    end

    context "given a string of 6 words" do
        it "returns the first five words followed by an elipse" do
            result = make_snippet("a string of too many words")
            expect(result).to eq "a string of too many..."
        end
    end
end
