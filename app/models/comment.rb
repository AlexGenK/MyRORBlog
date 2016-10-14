# комментарий к статье в блоге

class Comment < ActiveRecord::Base
  validates :author, :body, presence: true
  validates :body, length: { maximum: 4000 }
  # комментарий привязан к одной статье
  belongs_to :article
end
