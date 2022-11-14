require './lib/diary_integration/diary.rb' 

RSpec.describe Diary do
    context 'when no entry is present' do
        it 'returns an empty array' do
            diary = Diary.new
            expect(diary.all).to eq []
        end
    end
end 