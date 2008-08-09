require File.join( File.dirname(__FILE__), '..', 'spec_helper')

# alias webcontext
WebContext = RPoint::Contexts::WebContext

describe "WebContext" do
  
  it "should respond to valid_for_args" do
    WebContext.respond_to?(:valid_for_args).should == true
  end
  
end