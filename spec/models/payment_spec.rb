require 'rails_helper'

RSpec.describe Payment, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:product_id) }
    it { should validate_presence_of(:order_id) }
    it { should validate_presence_of(:total_amount) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:shipping_address) }
  end

end
