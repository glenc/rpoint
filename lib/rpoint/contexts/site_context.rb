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
			  # valid for SPSite
			  return true if args[0].is_a? SPSite
			  
				# if first arg is hash and has key of :site, valid
				if args[0].is_a? Hash
					return true if args[0].has_key?(:site)
				end
				
				# otherwise, false
				return false
			end
			
			
			# Instance Methods -------------------------------------------------------------------
			
			# accessors
			attr_reader :site
			attr_reader :root_web
			
			
			def initialize(*args)
			  raise ArgumentError if args.empty?
			  
			  if args[0].is_a? SPSite
			    @site = args[0]
		    elsif args[0].is_a? Hash
				  raise ArgumentError unless options.has_key?(:site)
				  @site = RPoint::Interop::Sites.get_site(options[:site])
			  else
			    raise ArgumentError
		    end
		    
		    @root_web = @site.RootWeb
			end
			
		end
	end
end