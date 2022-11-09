require "count_words"

RSpec.describe "count_words method" do

    context "given an empty string" do
        it "returns 0" do
            result = count_words("")
            expect(result).to eq 0
        end
    end

    context "given a simple string" do
        it "returns number of words" do
            result = count_words("a simple string")
            expect(result).to eq 3
        end
    end

    context "given a more complicated string" do
        it "retuns number of words" do
            result = count_words("This is a hyper-complicated, overly complex, A.I unreadable string")
            expect(result).to eq 9
        end
    end
end