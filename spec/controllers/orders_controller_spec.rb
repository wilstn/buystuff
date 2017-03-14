require "rails_helper"

RSpec.describe OrdersController, :type => :controller do

  describe "GET #new" do
    let(:product) {Product.create(name: "product name", description: "product description", price: 1, remaining_quantity: 10)}

    it "gets a new form to input order" do
      order = Order.new

      get :new, params: { product_id: product.id }
      expect(assigns(:order).new_record?).to be true
    end
  end

  describe "POST #create" do
    let(:product) {Product.create(name: "product name", description: "product description", price: 1, remaining_quantity: 10)}

    # it "creates a new order" do
    #   expect do
    #     post :create, params: {
    #       product_id: product.id,
    #       order: {
    #         quantity: 10,
    #         total_amount: 100,
    #         shipping_address: "somewhere",
    #         email: "some@email.com"
    #       }
    #     }
    #   end.to change { Order.count }.from(0).to(1)
    # end
  end

end
