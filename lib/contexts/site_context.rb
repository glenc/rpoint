module RPoint
	module Contexts
		class SiteContext
			
			def initialize(*args, &block)
				
				# expect that args consists of a string
				@site = SPSite.new(args[0])
				block.call(self)
				
			end
			
			def url
				puts @site.Url
			end
		end
	end
end