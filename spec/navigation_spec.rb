require './navigation'

describe Navigation do
    describe '#nav_list' do
        it 'is not empty' do
            expect(Navigation.nav_list).not_to be_empty
        end
        it 'should include Track your food intake and calorie intake' do
            expect(Navigation.nav_list).to end_with('3. Exit this program')
        end
    end
end