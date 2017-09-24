require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do

  let(:my_topic) {Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)}
  let(:my_sponsored_post) {my_topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph)}





  describe "GET show" do
    it "returns http success" do
      # #16
      get :show, params:{topic_id: my_topic.id, id: my_sponsored_post.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      # #17
      get :show, params:{topic_id: my_topic.id, id: my_sponsored_post.id}
      expect(response).to render_template :show
    end

    it "assigns my_sponsored_post to @sponsored_post" do
      get :show, params:{topic_id: my_topic.id, id: my_sponsored_post.id}
      # #18
      expect(assigns(:sponsored_post)).to eq(my_sponsored_post)
    end
  end



  describe "GET edit" do
    it "returns http success" do
      get :edit, params: {topic_id: my_topic.id, id: my_sponsored_post.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, params: {topic_id: my_topic.id, id: my_sponsored_post.id}
      # #1
      expect(response).to render_template :edit
    end

    # #2
    it "assigns post to be updated to @post" do
      get :edit, params: {topic_id: my_topic.id, id: my_sponsored_post.id}

      post_instance = assigns(:sponsored_post)

      expect(post_instance.id).to eq my_sponsored_post.id
      expect(post_instance.title).to eq my_sponsored_post.title
      expect(post_instance.body).to eq my_sponsored_post.body
    end
  end

  # #1
  describe "GET new" do
    it "returns http success" do
      get :new, params:{topic_id: my_topic.id}
      expect(response).to have_http_status(:success)
    end

# #2
    it "renders the #new view" do
      get :new, params:{topic_id: my_topic.id}
      expect(response).to render_template :new
    end

# #3
    it "instantiates @post" do
      get :new, params:{topic_id: my_topic.id}
      expect(assigns(:sponsored_post)).not_to be_nil
    end
  end

  describe "POST create" do
# #4
    it "increases the number of Post by 1" do
      expect{post :create, params:{topic_id: my_topic.id, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}}.to change(SponsoredPost,:count).by(1)
    end

# #5
    it "assigns the new post to @post" do
      post :create, params:{topic_id: my_topic.id, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}
      expect(assigns(:sponsored_post)).to eq SponsoredPost.last
    end

# #6
    it "redirects to the new post" do
      post :create, params:{topic_id: my_topic.id, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}
      expect(response).to redirect_to [my_topic, SponsoredPost.last]
    end
  end


  describe "DELETE destroy" do
    it "deletes the post" do
      delete :destroy, params:{topic_id: my_topic.id, id: my_sponsored_post.id}

      # #6
      count = Post.where({id: my_sponsored_post.id}).size
      expect(count).to eq 0
    end

    it "Redirects to topic show" do
      delete :destroy, params:{topic_id: my_topic.id, id: my_sponsored_post.id}
      # #7
      expect(response).to redirect_to my_topic
    end
  end
end
