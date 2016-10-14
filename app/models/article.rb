# статья в блоге

class Article < ActiveRecord::Base
  validates :title, :text, presence: true
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
