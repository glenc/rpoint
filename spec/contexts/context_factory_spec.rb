require File.join( File.dirname(__FILE__), '..', 'spec_helper')

# alias webcontext
ContextFactory = RPoint::Contexts::ContextFactory

describe "ContextFactory" do
  
  describe "ContextFactory.create_context" do
    
    it "should have a static create_context method" do
      ContextFactory.respond_to?(:create_context).should == true
    end
    
  end
  
end