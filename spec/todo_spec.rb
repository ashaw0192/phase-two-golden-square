require "todo"

RSpec.describe "todo method" do

    context "given an empty string" do
        it "fails" do
            expect{ todo("") }.to raise_error "No text entered."
        end
    end

    context "given a string without #TODO" do
        it "returns false" do
            result = todo("This is a string but not a task")
            expect(result).to eq false
        end
    end

    context "given a string with #todo" do
        it "returns false" do
            result = todo("This is a string that contains the wrong #todo")
            expect(result).to eq false
        end
    end

    context "given a string with #TODO" do
        it "returns true" do
            result = todo("This is a string that contains the correct #TODO")
            expect(result).to eq true
        end
    end

    context "given a string with multiple #TODO" do
        it "returns true" do
            result = todo("This is a string that contains #TODO #TODO #TODO #TODO #TODO #TODO you better do it")
            expect(result).to eq true
        end
    end

    context "given a string with #TODO without spaces" do
        it "returns true" do
            result = todo("Thisisastringthatcontains#TODO do it")
            expect(result).to eq true
        end
    end
end
