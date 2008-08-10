require File.join( File.dirname(__FILE__), '..', 'spec_helper')

describe "String#url_friendly" do
  
  it "should respond to url_friendly" do
    "A String".respond_to?(:url_friendly).should == true
  end
  
  it "should downcase and remove spaces in the string" do
    "A String".url_friendly.should == "astring"
  end
  
  it "should not change a string in proper format" do
    "astring".url_friendly.should == "astring"
  end
  
end