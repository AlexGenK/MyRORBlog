class Contact < ActiveRecord::Base
  validates :email, :message, presence: true
  validates :email, format: {with: /@/}
end
