module RPoint
	module Contexts
		
		##
		# Valid context factories
		CONTEXT_FACTORIES = [WebContext, ListContext, SiteContext]
		
		class ContextFactory
			
			##
			# Create a new context based on the arguments provided.  Then evaluate
			# the block within the scope of that context
			def self.create_context(*args, &blk)
				raise ArgumentError if args.empty?
				#raise ArgumentError unless blk
				
				factory = CONTEXT_FACTORIES.find {|f| f.valid_for_args(*args) }
				raise ArgumentError if factory.nil?
				
				# context found, execute block
				factory.new(*args).instance_eval(&blk)
			end
			
		end
	end
end