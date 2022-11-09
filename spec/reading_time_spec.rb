require "reading_time"

short_text = "The New Republic’s rise reduced the once-mighty Empire to a rump state hemmed in by strict disarmament treaties and punishing reparations.
But in the galaxy’s Unknown Regions, former Imperial officers,
 nobles and technologists plotted a return to power, 
 building fleets and armies in secret. This movement became the First Order, 
 ruled by Supreme Leader Snoke, 
and is now ready to reclaim the Imperial legacy."

medium_text = '"The New Republic’s rise reduced the once-mighty Empire to a rump state hemmed in by strict disarmament treaties and punishing reparations.
But in the galaxy’s Unknown Regions, former Imperial officers,
 nobles and technologists plotted a return to power, 
 building fleets and armies in secret. This movement became the First Order, 
 ruled by Supreme Leader Snoke, 
and is now ready to reclaim the Imperial legacy The New Republic’s rise reduced the once-mighty Empire to a rump state hemmed in by strict disarmament treaties and punishing reparations.
But in the galaxy’s Unknown Regions, former Imperial officers,
 nobles and technologists plotted a return to power, 
 building fleets and armies in secret. This movement became the First Order, 
 ruled by Supreme Leader Snoke, 
and is now ready to reclaim the Imperial legacy. The New Republic’s rise reduced the once-mighty Empire to a rump state hemmed in by strict disarmament treaties and punishing reparations.
But in the galaxy’s Unknown Regions, former Imperial officers,
 nobles and technologists plotted a return to power, 
 building fleets and armies in secret. This movement became the First Order, 
 ruled by Supreme Leader Snoke, 
and is now ready to reclaim the Imperial legacy."
"The New Republic’s rise reduced the once-mighty Empire to a rump state hemmed in by strict disarmament treaties and punishing reparations.
But in the galaxy’s Unknown Regions, former Imperial officers,
 nobles and technologists plotted a return to power, 
 building fleets and armies in secret. This movement became the First Order, 
 ruled by Supreme Leader Snoke, 
and is now ready to reclaim the Imperial legacy."'

long_text = '“The New Republic’s rise reduced the once-mighty Empire to a rump state hemmed in by strict disarmament treaties and punishing reparations.
But in the galaxy’s Unknown Regions, former Imperial officers,
 nobles and technologists plotted a return to power, 
 building fleets and armies in secret. This movement became the First Order, 
 ruled by Supreme Leader Snoke, 
and is now ready to reclaim the Imperial legacy The New Republic’s rise reduced the once-mighty Empire to a rump state hemmed in by strict disarmament treaties and punishing reparations.
But in the galaxy’s Unknown Regions, former Imperial officers,
 nobles and technologists plotted a return to power, 
 building fleets and armies in secret. This movement became the First Order, 
 ruled by Supreme Leader Snoke, 
and is now ready to reclaim the Imperial legacy. The New Republic’s rise reduced the once-mighty Empire to a rump state hemmed in by strict disarmament treaties and punishing reparations.
But in the galaxy’s Unknown Regions, former Imperial officers,
 nobles and technologists plotted a return to power, 
 building fleets and armies in secret. This movement became the First Order, 
 ruled by Supreme Leader Snoke, 
and is now ready to reclaim the Imperial legacy.
"The New Republic’s rise reduced the once-mighty Empire to a rump state hemmed in by strict disarmament treaties and punishing reparations.
But in the galaxy’s Unknown Regions, former Imperial officers,
 nobles and technologists plotted a return to power, 
 building fleets and armies in secret. This movement became the First Order, 
 ruled by Supreme Leader Snoke, 
and is now ready to reclaim the Imperial legacy.
"The New Republic’s rise reduced the once-mighty Empire to a rump state hemmed in by strict disarmament treaties and punishing reparations.
But in the galaxy’s Unknown Regions, former Imperial officers,
 nobles and technologists plotted a return to power, 
 building fleets and armies in secret. This movement became the First Order, 
 ruled by Supreme Leader Snoke, 
and is now ready to reclaim the Imperial legacy The New Republic’s rise reduced the once-mighty Empire to a rump state hemmed in by strict disarmament treaties and punishing reparations.
But in the galaxy’s Unknown Regions, former Imperial officers,
 nobles and technologists plotted a return to power, 
 building fleets and armies in secret. This movement became the First Order, 
 ruled by Supreme Leader Snoke, 
and is now ready to reclaim the Imperial legacy. The New Republic’s rise reduced the once-mighty Empire to a rump state hemmed in by strict disarmament treaties and punishing reparations.
But in the galaxy’s Unknown Regions, former Imperial officers,
 nobles and technologists plotted a return to power, 
 building fleets and armies in secret. This movement became the First Order, 
 ruled by Supreme Leader Snoke, 
and is now ready to reclaim the Imperial legacy.
"The New Republic’s rise reduced the once-mighty Empire to a rump state hemmed in by strict disarmament treaties and punishing reparations.
But in the galaxy’s Unknown Regions, former Imperial officers,
 nobles and technologists plotted a return to power, 
 building fleets and armies in secret. This movement became the First Order, 
 ruled by Supreme Leader Snoke, 
and is now ready to reclaim the Imperial legacy.”'



RSpec.describe "reading_time method" do
    it "returns 0 if handed an empty string" do
        result = reading_time("")
        expect(result).to eq 0
    end

    it "returns < 1 when handed string < 200 words" do
        result = reading_time(short_text)
        expect(result).to eq "<1"
    end
    it "returns 1 if handed a string between 200 and 400" do
        result = reading_time(medium_text)
        expect(result).to eq 1
    end

    it "returns 2 if handed a string between 400 and 600" do
        result = reading_time(long_text)
        expect(result).to eq 2
    end
end


