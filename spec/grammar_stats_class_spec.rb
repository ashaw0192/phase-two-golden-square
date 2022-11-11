require "grammar_stats_class"

RSpec.describe GrammarStats do
    describe "check method" do
        context "given an empty string" do
            it "fails" do
                grammar_stats = GrammarStats.new
                expect{ grammar_stats.check("") }.to raise_error "Not a sentence."
            end
        end

        context "given a completely lowercase string with no punctuation" do
            it "returns false" do
                grammar_stats = GrammarStats.new
                result = grammar_stats.check("run of the mill")
                expect(result).to eq false
            end
        end

        context "given a lowercase start but correct puntuation" do
            it "returns false" do
                grammar_stats = GrammarStats.new
                result = grammar_stats.check("run of the mill!")
                expect(result).to eq false
            end
        end

        context "given grammatically correct string" do
            it "returns true" do
                grammar_stats = GrammarStats.new
                result = grammar_stats.check("Run of the mill!")
                expect(result).to eq true
            end
        end            
    end 

    describe "percentage_good method" do
        context "when no texts have been checked yet" do
            it "fails" do
                grammar_stats = GrammarStats.new
                expect{ grammar_stats.percentage_good }.to raise_error "No texts checked."
            end
        end

        context "when only one check has tested and passed" do
            it "returns 100" do
                grammar_stats = GrammarStats.new
                grammar_stats.check("Hi?")
                result = grammar_stats.percentage_good
                expect(result).to eq 100
            end
        end

        context "when half the tests have passed" do
            it "returns 50" do
                grammar_stats = GrammarStats.new
                grammar_stats.check("Hi.")
                grammar_stats.check("bye")
                result = grammar_stats.percentage_good
                expect(result).to eq 50
            end
        end

        context "when given a ratio that needs rounding" do
            it "rounds to nearest whole number, up if over .5" do
                grammar_stats = GrammarStats.new
                grammar_stats.check("Hi.")
                grammar_stats.check("Hi.")
                grammar_stats.check("bye")
                result = grammar_stats.percentage_good
                expect(result).to eq 67
            end

            it "rounds to the nearest whole number, down if below .5" do
                grammar_stats = GrammarStats.new
                grammar_stats.check("Hi.")
                grammar_stats.check("i")
                grammar_stats.check("bye")
                result = grammar_stats.percentage_good
                expect(result).to eq 33
            end
        end
    end
end