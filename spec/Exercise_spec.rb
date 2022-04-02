require './t1a3.rb'

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

