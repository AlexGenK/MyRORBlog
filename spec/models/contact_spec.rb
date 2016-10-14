require "rails_helper"

# тестируем модель Contact
describe Contact do  

  # тестируем валидацию
  it { should validate_presence_of(:message) }
end