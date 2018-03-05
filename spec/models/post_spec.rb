require 'rails_helper'

RSpec.describe Post, type: :model do

  context "Should support any test" do

    let(:expected_body) { 'REDACTED U MotherREDACTEDer' }
    let(:user) { { email: "test1@test.com", username: "test", password: '123321' } }
    let(:body) { { body: 'Fuck U MotherFucker' } }

    before do
      @User = User.create!(user)
    end

    it "Should insert a new post" do
      post = @User.posts.new(body: "Fuck U MotherFucker", user_id: 1)
      expect(post.save).to eq(true)
    end


    it "Should check if the post has are censured" do
      post = @User.posts.new(body)
      post.save!

      expect(post.body).to eq(expected_body)
    end
  end

end
