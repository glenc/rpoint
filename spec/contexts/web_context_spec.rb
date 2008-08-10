require File.join( File.dirname(__FILE__), '..', 'spec_helper')

# alias webcontext
WebContext = RPoint::Contexts::WebContext

describe "WebContext" do
  
  describe "WebContext.valid_for_args" do
  
    it "should respond to valid_context_for?" do
      WebContext.respond_to?(:valid_context_for?).should == true
    end
  
    it "should be valid for a url" do
      WebContext.valid_context_for?("http://some_url").should == true
    end
  
    it "should be valid for a hash where :web is provided" do
      WebContext.valid_context_for?(:web => "http://some_url").should == true
    end
  
    it "should not be valid for a hash where :web is not provided" do
      WebContext.valid_context_for?(:site => "http://some_url").should == false
    end
    
  end
  
end