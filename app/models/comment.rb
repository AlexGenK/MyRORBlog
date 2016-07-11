class Comment < ActiveRecord::Base
  validates :author, :body, presence: true
  belongs_to :article
end
