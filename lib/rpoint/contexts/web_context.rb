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
			
			def initialize(url)
			  @web = RPoint::Helpers.get_web(url)
			end
			
			
			##
			# Creates a new subweb
			def create_web(name, type, options = {}, &blk)
			  puts "Creating new web at #{@web.Url}/#{name}"
			end
			
		end
	end
end