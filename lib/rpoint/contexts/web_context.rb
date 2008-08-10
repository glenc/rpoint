module RPoint
	module Contexts
		class WebContext
			
			# Class Methods -------------------------------------------------------------------
			
			##
			# Checks if this context is a valid context for the
			# args provided
			def self.valid_context_for?(*args)
				# if first arg is string, valid
				return true if args[0].is_a? String
				
				# if first arg is hash and has key of :site, valid
				if args[0].is_a? Hash
					return true if args[0].has_key?(:web)
				end
				
				# otherwise, false
				return false
			end
			
			
			# Instance Methods -------------------------------------------------------------------
			
			# alias webs interop
			Webs = RPoint::Interop::Webs
			
			
			def initialize(*args)
			  raise ArgumentError if args.empty?
			  
			  # if we were handed a web, just store it
			  if args[0].is_a? SPWeb
			    @web = args[0]
		    else
			    url = args[0] if args[0].is_a? String
  			  url = args[0][:web] if args[0].is_a? Hash
  			  raise ArgumentError if url.nil?
			  
  			  @web = Webs.get_web(url)
			  end
			  
			end
			
			
			##
			# Creates a new subweb
			def create_web(name, type, options = {}, &blk)
			  # create our new web
			  new_web = Webs.create_web(@web, name, type, options)
			  new_web_context = WebContext.new(new_web)
			  
			  # if we have a block, execute it in the scope of the new context
			  if block_given?
			    new_web_context.instance_eval(&blk)
		    end
		    
		    new_web_context
			end
			
		end
	end
end