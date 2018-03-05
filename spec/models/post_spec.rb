require 'rails_helper'

RSpec.describe Post, type: :model do

  context "Should support any test" do

    before do
      user = User.create!(email: "test1@test.com", username: "test", password: '123321')
    end

    it "Should insert a new post" do
      post = Post.new(body: "Fuck U MotherFucker", user_id: 1)
      expect(post.save).to eq(true)
    end


    it "Should check if the post has are censured" do
      post = Post.new(body: "Fuck U MotherFucker", user_id: 1)
      post.save!

      expect(post.body).to eq("REDACTED U MotherREDACTEDer")
    end
  end

end
