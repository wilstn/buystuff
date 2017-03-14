require 'rails_helper'

RSpec.describe Order, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:product_id) }
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:total_amount) }
  end

end
