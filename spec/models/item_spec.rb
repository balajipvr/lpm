require 'rails_helper'

RSpec.describe Item, :type => :model do
  describe 'validations' do
    it 'it validates name' do
       is_expected.to validate_presence_of(:item_name) 
    end
  end
end
