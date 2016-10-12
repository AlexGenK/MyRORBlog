require "rails_helper"

describe Comment do
  describe "validation" do  
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:body) }
  end
  
  describe "association" do  
    it { should belong_to(:article) }
  end
end