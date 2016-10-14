require "rails_helper"

# тестируем модель Comment
describe Comment do

  # тестируем валидацию
  describe "validation" do  
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:body) }
  end
  
  # тестируем ассоциции с моделью Article
  describe "association" do  
    it { should belong_to(:article) }
  end
end