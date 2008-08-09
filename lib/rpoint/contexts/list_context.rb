module RPoint
	module Contexts
		class ListContext
			
			# Class Methods -------------------------------------------------------------------
			
			##
			# Checks if this context is a valid context for the
			# args provided
			def self.valid_for_args(*args)
				# if first arg is hash and has key of :site, valid
				if args[0].is_a? Hash
					return true if args[0].has_key?(:list)
				end
				
				# otherwise, false
				return false
			end
			
			
			# Instance Methods -------------------------------------------------------------------
			
			def initialize(*args)
				
			end
			
			def add_column(name)
				puts "Adding column #{name}"
			end
			
		end
	end
end