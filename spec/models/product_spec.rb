require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:remaining_quantity) }
  end

  describe 'update_inventory method' do
    let(:product) { Product.create() }

    it "should update product quantity on payment success" do

    end
  end

end
