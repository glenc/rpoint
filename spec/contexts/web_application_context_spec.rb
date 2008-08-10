require File.join( File.dirname(__FILE__), '..', 'spec_helper')

# alias WebApplicationContext
WebApplicationContext = RPoint::Contexts::WebApplicationContext
SPWebApplication = RPoint::SPWebApplication
Uri = RPoint::Uri

describe "WebApplicationContext" do
  
  describe "WebApplicationContext.valid_context_for?" do
  
    it "should respond to valid_context_for?" do
      WebApplicationContext.respond_to?(:valid_context_for?).should == true
    end
  
    it "should be valid for a hash where :webapp, :web_app, or :web_application is provided" do
      WebApplicationContext.valid_context_for?(:webapp => "http://some_url").should == true
      WebApplicationContext.valid_context_for?(:web_app => "http://some_url").should == true
      WebApplicationContext.valid_context_for?(:web_application => "http://some_url").should == true
    end
  
    it "should not be valid for a hash where :web_app is not provided" do
      WebApplicationContext.valid_context_for?(:site => "http://some_url").should == false
    end
    
    it "should not be valid for a simple url" do
      WebApplicationContext.valid_context_for?("http://localhost").should_not == true
    end
    
  end
  
  describe "WebApplicationContext#initialize" do
    
    it "should require args" do
      should_raise ArgumentError do
        WebApplicationContext.new
      end
    end
    
    it "should accept a hash with :webapp, :web_app, or :web_application" do
      should_raise ArgumentError do
        WebApplicationContext.new(:site => "http://localhost")
      end
      
      WebApplicationContext.new(:webapp => "http://localhost")
      WebApplicationContext.new(:web_app => "http://localhost")
      WebApplicationContext.new(:web_application => "http://localhost")
    end
    
    it "should load the web application based on the hash" do
      # TODO - this doesn't really work
      SPWebApplication.should_receive(:Lookup, :with => Uri.new("http://localhost"))
      WebApplicationContext.new(:webapp => "http://localhost")
      
    end
    
  end
  
end