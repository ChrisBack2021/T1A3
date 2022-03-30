require './T1A3'


describe Food do
    describe '#food_tracker' do
        it 'should ask user what food they ate today and how much calories the food was' do
            allow(Food).to receive(:gets).and_return('Steak', '350')
            expect(Food.food_tracker).to eq(['Steak', '350'])
        end
    end
end

describe '#trackers' do
    it 'should have an empty array called food_cal_pairing' do
        expect(food_cal_pairing).to eq[]
    end
end