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
    describe '#add' do
        it 'will add to an array for exercises' do
        expect(%w[bicep arms legs squats DLs tricep core]).to match(%w[bicep arms legs squats DLs tricep core])
        end
        # it 'will have 7 elements in the array' do
        # expect (%w[bicep arms legs squats DLs tricep core']).to eq == 7
        # end
    end

end

