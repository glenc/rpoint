module RPoint
	module Contexts
		class SiteContext
			
			def initialize(url)
				@site = SPSite.new(url)
			end
			
			def create_list(name, type, &blk)
				puts "Create a list called #{name} of type #{type} inside site #{@site.Url}"
				
				if block_given?
					ListContext.new.instance_eval(&blk)
				end
			end
			
		end
	end
end