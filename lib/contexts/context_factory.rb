module RPoint
	module Contexts
		class ContextFactory
			
			##
			# Create a context based on the arguments provided
			def self.create_context(*args, &block)
				raise ArgumentError if args.empty?
				#raise ArgumentError unless block
				
				# just load the default context for now
				SiteContext.new(*args, &block)
				
			end
			
		end
	end
end