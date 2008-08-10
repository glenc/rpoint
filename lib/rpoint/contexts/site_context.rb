module RPoint
	module Contexts
		
		##
		# Context for a site collection
		class SiteContext
			
			# Class Methods -------------------------------------------------------------------
			
			##
			# Checks if this context is a valid context for the
			# args provided
			def self.valid_context_for?(*args)
				# if first arg is hash and has key of :site, valid
				if args[0].is_a? Hash
					return true if args[0].has_key?(:site)
				end
				
				# otherwise, false
				return false
			end
			
			
			# Instance Methods -------------------------------------------------------------------
			
			def initialize(options = {})
				raise ArgumentError unless options.has_key?(:site)
				@site = SPSite.new(options[:site])
			end
			
		end
	end
end