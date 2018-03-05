class Post < ApplicationRecord
  belongs_to :user

  validate do
    if body.length > 280
      errors.add(:body, "You need put a message with the max of 280 characters")
    end
  end

  before_save do
    response = HTTParty.get("http://poopfilter.herokuapp.com/filter?text=#{self.body}")
    self.body = JSON.parse(response.body)["output"]
  end
end
