module RPoint
	module Contexts
		class ListContext
			
			# Class Methods -------------------------------------------------------------------
			
			##
			# Checks if this context is a valid context for the
			# args provided
			def self.valid_context_for?(*args)
			  return true if args[0].is_a? SPList
			  
				# if first arg is hash and has key of :list, valid
				if args[0].is_a? Hash
					return true if args[0].has_key?(:list)
				end
				
				# otherwise, false
				return false
			end
			
			
			# Instance Methods -------------------------------------------------------------------
			
			attr_reader :list
			
			def initialize(*args)
				if args[0].is_a? SPList
				  @list = args[0]
			  end
			end
			
			def add_column(name)
				puts "Adding column #{name}"
			end
			
		end
	end
end