# статья в блоге

class Article < ActiveRecord::Base
  validates :title, :text, presence: true
  validates :title, length: { maximum: 140 }
  validates :text, length: { maximum: 4000 }
  # статья может иметь много комментариев
  has_many :comments

  # возвращает заголовок статьи
  def subject
    title
  end

  # возвращает последний комментарий
  def last_comment
    comments.last
  end
end
