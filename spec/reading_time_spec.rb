require "reading_time"

RSpec.describe "reading_time method" do
    context "given an empty string" do
        it "returns 0" do
            result = reading_time("")
            expect(result).to eq 0
        end
    end

    context "given a string of less than 200, greater than 0" do
        it "returns < 1" do
            result = reading_time(("one " * 50))
            expect(result).to eq "<1"
        end
    end

    context "given a string of 200" do
        it "returns 1" do
            result = reading_time(("one " * 200))
            expect(result).to eq 1
        end
    end

    context "given a string of 300" do
        it "returns 2" do
            result = reading_time("one " * 300)
            expect(result).to eq 2
        end
    end

    context "given a string of 400" do
        it "returns 2" do
            result = reading_time("one " * 400)
            expect(result).to eq 2
        end
    end
end

