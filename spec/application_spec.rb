require "spec_helper"

describe Application do
  
  #
  before :each do
  end
  
  context "retrieving welcome message" do
    it "should say \"It works!\"" do
      get "/"
      last_response.body.should == "It works!"
    end
  end
end
