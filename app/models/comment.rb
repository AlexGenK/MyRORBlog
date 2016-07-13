# комментарий к статье в блоге

class Comment < ActiveRecord::Base
  validates :author, :body, presence: true
  # комментарий привязан к статье
  belongs_to :article
end
