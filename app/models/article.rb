# статья в блоге

class Article < ActiveRecord::Base
  validates :title, :text, presence: true
  # статья может иметь много комментариев
  has_many :comments

  def subject
    title
  end
end
