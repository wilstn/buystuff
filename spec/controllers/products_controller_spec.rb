require "rails_helper"

RSpec.describe ProductsController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    let(:product) {Product.create(name: "product name", description: "product description", price: 1, remaining_quantity: 10)}

    it "shows the individual product page" do
      get :show, params: { id: product.id }
      expect(assigns(:product)).to eq(Product.find(product.id))
    end
  end

  describe "GET #new" do
    it "gets a new form to add product" do
      get :new
      expect(assigns(:product).new_record?).to be true
    end
  end

  describe "POST #create" do
    it "should create a new product" do
      expect do
        post :create, params: {product: {name: "product name", description: "product description", price: 1, remaining_quantity: 10}}
      end.to change {Product.count}.from(0).to(1)
    end
  end

  describe "GET #edit" do
    let(:product) {Product.create(name: "product name", description: "product description", price: 1, remaining_quantity: 10)}

    it "should get a form to edit product" do
      get :edit, params: { id: product.id }
      expect(assigns(:product)).to eq(Product.find(product.id))
    end
  end

  describe "PUT #update" do
    let(:product) {Product.create(name: "product name", description: "product description", price: 1, remaining_quantity: 10)}

    it "should update the product given a product id" do
      put :update, params: {id: product.id, product: {name: "product name2"}}

      expect(Product.find(product.id).name).to eq("product name2")
    end
  end

  describe "DELETE #destroy" do
    let(:product) {Product.create(name: "product name", description: "product description", price: 1, remaining_quantity: 10)}

    it "destroys selected product" do
      product = Product.create(name: "product name", description: "product description", price: 1, remaining_quantity: 10)
      
      expect do
        delete :destroy, params: { id: product.id }
      end.to change {Product.count}.from(1).to(0)
    end
  end
end
