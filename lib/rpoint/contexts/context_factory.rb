module RPoint
	module Contexts
		
		##
		# Valid context factories
		CONTEXT_FACTORIES = [WebContext, ListContext, SiteContext, WebApplicationContext]
		
		class ContextFactory
			
			##
			# Create a new context based on the arguments provided.  Then evaluate
			# the block within the scope of that context
			def self.create_context(*args, &blk)
				raise ArgumentError if args.empty?
				raise ArgumentError unless block_given?
				
				factory = CONTEXT_FACTORIES.find {|f| f.valid_context_for?(*args) }
				raise "A context factory could not be found for these arguments" if factory.nil?
				
				# context found, execute block
				factory.new(*args).instance_eval(&blk)
			end
			
		end
	end
end

##
# At method creates a new context
def at(*args, &block)
	RPoint::Contexts::ContextFactory.create_context(*args, &block)
end

# allow inside as well as at
alias inside at