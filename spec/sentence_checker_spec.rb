require 'sentence_checker'
RSpec.describe "sentence checker method" do

    context "given an empty string" do
        it "fails" do
            expect{ sentence_checker("") }.to raise_error "Not a sentence."
        end
    end

    context "given a string with neither capital nor end punctuation" do
        it "returns false" do
            result = sentence_checker("hello")
            expect(result).to eq false
        end
    end

    context "given a capital but no end punctuation" do
        it "returns false" do
            result = sentence_checker("Hello")
            expect(result).to eq false
        end
    end

    context "given a non capitalised string with correct end punctuation" do
        it "returns false" do
            result = sentence_checker("hello.")
            expect(result).to eq false
        end
    end

    context "given correctly capitalised and full stopped" do
        it "returns true" do
            result = sentence_checker("Hello.")
            expect(result).to eq true
        end
    end

    context "given correctly capitalised and question marked" do
        it "returns true" do
            result = sentence_checker("Hello, how are you?")
            expect(result).to eq true
        end
    end

    context "given correctly capitalised and exclaimation marked" do
        it "returns true" do
            result = sentence_checker("Hello, I hope you are well!")
            expect(result).to eq true
        end
    end

    context "given correctly capitalised and full stopped" do
        it "returns true" do
            result = sentence_checker("Hello.")
            expect(result).to eq true
        end
    end

    context "given correctly capitalised but wrong end punctuation" do
        it "returns false" do
            result = sentence_checker("Hello,")
            expect(result).to eq false
        end
    end

    context "given absolute nonsense that still fits the bill" do
        it "returns true" do
            result = sentence_checker("HHHHHHHHHHHHH.!!!!@*@&£!**!&!!!!!")
            expect(result).to eq true
        end
    end
end