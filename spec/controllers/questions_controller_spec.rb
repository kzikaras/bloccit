require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  let(:my_question) {Question.create(title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: true)}
  # #8


  describe "GET #index" do
    # WIll run before each test
    before :each do
      my_question
    end
    
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_question] to @questions" do
      get :index
      # #9
      expect(assigns(:questions)).to eq([my_question])
    end
  end




  describe "GET show" do
    it "returns http success" do
      # #16
      get :show, params: {id: my_question.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      # #17
      get :show, params: {id: my_question.id}
      expect(response).to render_template :show
    end

    it "assigns my_question to @question" do
      get :show, params: {id: my_question.id}
      # #18
      expect(assigns(:question)).to eq(my_question)
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


    it "instantiates @question" do
      get :new
      expect(assigns(:question)).not_to be_nil
    end
  end

  describe "Question create" do

    it "increases the number of Advertisements by 1" do
      expect{post :create, params: {question: {title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: true}}}.to change(Question,:count).by(1)
    end


    it "assigns the new advertisement to @advertisement" do
      post :create, params: {question: {title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: true}}
      expect(assigns(:question)).to eq Question.last
    end


    it "redirects to the new ad" do
      post :create, params:{question: {title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: true}}
      expect(response).to redirect_to Question.last
    end
  end
end
