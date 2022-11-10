require "intermezzo_debugging_1"

RSpec.describe "say_hello method" do
    context "when handed a string" do
        it "says hello followed by string" do
            result = say_hello("Tony")
            expect(result).to eq "hello Tony"
        end
    end
end