require "intermezzo_debugging_1"

RSpec.describe "say_hello method" do
    context "when handed a string" do
        it "says hello followed by string" do
            result = say_hello("Tony")
            expect(result).to eq "hello Tony"
        end
    end
end

RSpec.describe "encode method" do
    context "when handed the string theswiftfoxjumpedoverthelazydog with the key secretkey" do
        it "returns EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL" do
            result = encode("theswiftfoxjumpedoverthelazydog", "secretkey")
            expect(result).to eq "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
        end
    end
end

RSpec.describe "decode method" do
    context "when handed the string EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL with the key secretkey" do
        it "returns theswiftfoxjumpedoverthelazydog" do
            result = decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
            expect(result).to eq "theswiftfoxjumpedoverthelazydog"
        end
    end
end

RSpec.describe "get_most_common_letter method" do
    context "when handed ther string tattle" do
        it "returns t" do
            result = get_most_common_letter("tattle")
            expect(result).to eq "t"
        end
    end
end