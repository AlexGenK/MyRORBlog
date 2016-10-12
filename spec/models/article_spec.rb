require "rails_helper"

describe Article do

  describe "validation" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:text) }
  end

  describe "association" do
    it { should have_many(:comments) }
  end

  describe "#subject" do
    it "returns article title" do
      a=create(:article, title: "simple message", text: "bububu")
      expect(a.title).to eq "simple message"
    end
  end
end