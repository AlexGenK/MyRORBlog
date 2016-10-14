require "rails_helper"

# тестируем модель Comment
describe Comment do

  # тестируем валидацию
  describe "validation" do  
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body).is_at_most(4000) }
  end
  
  # тестируем ассоциции с моделью Article
  describe "association" do  
    it { should belong_to(:article) }
  end
end