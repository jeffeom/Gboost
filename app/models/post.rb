class Post < ActiveRecord::Base
  def self.search(search)
    where(["title ILIKE :search_term OR
      description ILIKE :search_term", {search_term: "%#{search}%"}])
  end
end
