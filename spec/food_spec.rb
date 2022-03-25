require './T1A3'

# describe Food do
#     it 'can be instantiated' do
#     end
# end

describe Food do
    describe '#food_tracker' do
        it 'should ask user what food they ate today ' do
            allow(Food).to receive(:gets).and_return('Steak')
            expect(Food.food_tracker).to eq('Steak')
        end
        it 'should ask user how much calories the food was ' do
            allow(Food).to receive(:gets).and_return('350')
            expect(Food.calorie_tracker).to eq('350')
        end
    end
end

    # it 'should return the values inside the hash' do
    #     allow(food_tracker).to receive(:gets).and_return(5)
    #     expect(food_tracker([a: 5])).to have_value 5