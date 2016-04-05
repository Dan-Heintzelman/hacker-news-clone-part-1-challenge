class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments

  validates :title, :article_url, presence: true
end
