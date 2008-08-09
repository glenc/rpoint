module RPoint
	module Contexts
		class WebContext
			
			# Class Methods -------------------------------------------------------------------
			
			##
			# Checks if this context is a valid context for the
			# args provided
			def self.valid_for_args(*args)
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
			  url = args[0] if args[0].is_a? String
			  url = args[0][:web] if args[0].is_a? Hash
			  raise ArgumentError if url.nil?
			  
			  @web = Webs.get_web(url)
			end
			
			
			##
			# Creates a new subweb
			def create_web(name, type, options = {}, &blk)
			  puts "creating a new web"
			  new_web = Webs.create_web(@web, name, type, options)
			  puts "new web: #{new_web.Url}"
			  
			  
			  
			  #puts "Creating new web at #{@web.Url}/#{name}"
			end
			
		end
	end
end