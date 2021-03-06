module Censorship
  class << self
    def censorship
      before_save do
        if body_changed?
          response = HTTParty.get(URI.encode("http://poopfilter.herokuapp.com/filter?text=#{self.body}"))
          self.body = JSON.parse(response.body)["output"]
        end
      end
    end
  end
end
