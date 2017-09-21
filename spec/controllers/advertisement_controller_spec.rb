require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do

  let(:my_ad) {Advertisement.create(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 25)}
  # #8


  describe "GET #index" do
    # WIll run before each test
    before :each do
      my_ad
    end
    
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_ad] to @advertisements" do
      get :index
      # #9
      expect(assigns(:advertisements)).to eq([my_ad])
    end
  end




  describe "GET show" do
    it "returns http success" do
      # #16
      get :show, params: {id: my_ad.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      # #17
      get :show, params: {id: my_ad.id}
      expect(response).to render_template :show
    end

    it "assigns my_post to @post" do
      get :show, params: {id: my_ad.id}
      # #18
      expect(assigns(:advertisement)).to eq(my_ad)
    end
  end



  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end


    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end


    it "instantiates @advertisement" do
      get :new
      expect(assigns(:advertisement)).not_to be_nil
    end
  end

  describe "ADVERTISEMENT create" do

    it "increases the number of Advertisements by 1" do
      expect{post :create, params: {advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 25}}}.to change(Advertisement,:count).by(1)
    end


    it "assigns the new advertisement to @advertisement" do
      post :create, params: {advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 25}}
      expect(assigns(:advertisement)).to eq Advertisement.last
    end


    it "redirects to the new ad" do
      post :create, params:{advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 25}}
      expect(response).to redirect_to Advertisement.last
    end
  end
end