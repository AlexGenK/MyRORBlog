# сообщение

class Contact < ActiveRecord::Base
  validates :message, presence: true
  validates :email, format: {with: /@/}
end
