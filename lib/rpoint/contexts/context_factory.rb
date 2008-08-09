module RPoint
	module Contexts
		class ContextFactory
			
			##
			# Create a new context based on the arguments provided.  Then evaluate
			# the block within the scope of that context
			def self.create_context(*args, &blk)
				raise ArgumentError if args.empty?
				#raise ArgumentError unless blk
				
				# just load the default context for now
				SiteContext.new(*args).instance_eval(&blk)
			end
			
		end
	end
end