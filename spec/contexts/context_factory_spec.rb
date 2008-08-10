require File.join( File.dirname(__FILE__), '..', 'spec_helper')

# alias webcontext
ContextFactory = RPoint::Contexts::ContextFactory

describe "ContextFactory" do
  
  describe "ContextFactory.create_context" do
    
    # Create some Mock Contexts
    class IntContext
      def self.valid_context_for?(*args)
        return true if args[0].is_a? Integer
      end
      
      def initialize(*args)
      end
      
      def custom_method
        1
      end
    end
    
    class StringContext
      def self.valid_context_for?(*args)
        return true if args[0].is_a? String
      end
      
      def initialize(*args)
      end
      
      def custom_method
        "str"
      end
    end
    
    class AnyContext
      def self.valid_context_for?(*args)
        return true
      end
      
      def initialize(*args)
      end
      
      def custom_method
        "anything goes"
      end
    end
    
    before do
      # remove contexts so we don't actually try to create any
      RPoint::Contexts::CONTEXT_FACTORIES = [IntContext, StringContext, AnyContext]
    end
    
    it "should have a static create_context method" do
      ContextFactory.respond_to?(:create_context).should == true
    end
    
    it "should raise ArgumentError if no args provided" do
      should_raise ArgumentError do
        ContextFactory.create_context do
          true
        end
      end
    end
    
    it "should raise ArgumentError if no block provided" do
      should_raise ArgumentError do
        ContextFactory.create_context "hi"
      end
    end
    
    it "should find the right context for arguments provided" do
      
      ContextFactory.create_context 123 do
        custom_method.should == 1
      end
      
      ContextFactory.create_context "some string" do
        custom_method.should == "str"
      end
      
    end
    
    it "should find the first valid match" do
      # re-order contexts
      RPoint::Contexts::CONTEXT_FACTORIES = [AnyContext, IntContext, StringContext]
      
      ContextFactory.create_context "anything" do
        custom_method.should == "anything goes"
      end
    end
    
    it "should raise error if no matches are found" do
      RPoint::Contexts::CONTEXT_FACTORIES = []
      
      should_raise RuntimeError do
        ContextFactory.create_context "asdf" do
          true
        end
      end
    end
    
  end
  
  describe "at" do
    
    it "should raise ArgumentError if no block provided" do
      should_raise ArgumentError do
        at "hi"
      end
    end
    
    it "should raise ArgumentError if no args provided" do
      should_raise ArgumentError do
        at do
          true
        end
      end
    end
    
  end
  
end