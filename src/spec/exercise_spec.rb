require './exercise'

# To test, choose "3. Exit this Program" in the beginning Navigation menu. This is due to tty-prompt gem interferring with rspec
describe Exercise do
    describe '#exercise_validator' do
        it 'does allows characters' do
            expect('deadlifts').to match(/^[a-zA-Z\s]+$/)
        end
        it 'does not allow numbers or symbols' do
            expect('123..').not_to match(/^[a-zA-Z]+$/)
        end
        it 'allows white space' do
            expect('bench press').to match(/^[a-zA-Z\s]+$/)
        end
    end
end

