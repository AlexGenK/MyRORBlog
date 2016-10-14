require "rails_helper"

# тестируем модель Article
describe Article do

  # тест валидации
  describe "validation" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:text) }
  end

  # тест ассоциаий с моделью Comments
  describe "association" do
    it { should have_many(:comments) }
  end

  # тест метода subject
  describe "#subject" do
    it "returns article title" do
      a=create(:article, title: "wow!")
      expect(a.subject).to eq "wow!"
    end
  end

  # тест метода last_comment
  describe "#last_comment" do
    it "returns last comment" do
      a=create(:article_with_comments)
      expect(a.last_comment.body).to eq "be be be be be - 3"
    end
  end
end