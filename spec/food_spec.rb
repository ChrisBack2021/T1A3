require './newfile'


describe Food do
    describe '#food_tracker' do
        it 'should ask user what food they ate today and how much calories the food was' do
            allow(Food).to receive(:gets).and_return('Steak', '350')
            expect(Food.food_tracker).to eq(['Steak', '350'])
        end
    end
end

# describe '#tracker' do
#     it 'should have the Food module inputs in the food_cal_pairing array' do
#         expect(food_cal_pairing).to eq(Food.food_tracker)
#     end
# end