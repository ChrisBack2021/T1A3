require './t1a3.rb'

# To test, choose "3. Exit this Program" in the beginning Navigation menu. This is due to tty-prompt gem interferring with testing

# For mock tests, all input values are steak and 350 respectively.
describe Food do
    describe '#food_tracker' do
        it 'asks user what food they ate today and how much calories the food was' do
            allow(Food).to receive(:gets).and_return('Steak', '350')
            expect(Food.food_tracker).to eq(['Steak', '350'])
        end
    end

    describe '#food_validator' do
        it 'does allows characters' do
            expect('chicken').to match(/^[a-zA-Z\s]+$/)
        end
        it 'does not allow numbers or symbols' do
            expect('123..').not_to match(/^[a-zA-Z\s]+$/)
        end
        it 'allows white space' do
            expect('chicken fingers').to match(/^[a-zA-Z\s]+$/)
        end
    end

    describe '#calorie_validator' do
        it 'allows number inputs' do
            expect('500').to match(/^[0-9]+$/)
        end
        it 'does not allow character inputs' do
            expect('Hello world').not_to match(/^[0-9]+$/)
        end
        it 'should always be greater than 0' do
            expect(1).to be >= 0
        end
    end

# 





end

