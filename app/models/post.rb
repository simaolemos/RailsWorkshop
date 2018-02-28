class Post < ApplicationRecord
  belongs_to :User

  validates do

    if body.length > 280 || body.length == 0 do
      errors.add(:body, "U need put a message with the length between 0 and 280 characters")
    end
  end
end
