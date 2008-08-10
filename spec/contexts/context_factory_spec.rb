require File.join( File.dirname(__FILE__), '..', 'spec_helper')

# alias webcontext
ContextFactory = RPoint::Contexts::ContextFactory

describe "ContextFactory" do
  
  describe "ContextFactory.create_context" do
    
    before do
      # remove contexts so we don't actually try to create any
      RPoint::Contexts::CONTEXT_FACTORIES = [StringContext, IntContext]
    end
    
    it "should have a static create_context method" do
      ContextFactory.respond_to?(:create_context).should == true
    end
    
    it "should raise ArgumentError if no args provided" do
      should_raise ArgumentError do
        ContextFactory.create_context do
          puts "hi"
        end
      end
    end
    
    it "should raise ArgumentError if no block provided" do
      should_raise ArgumentError do
        ContextFactory.create_context "hi"
      end
    end
    
  end
  
end