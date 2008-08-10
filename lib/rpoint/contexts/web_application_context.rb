module RPoint
  module Contexts
		class WebApplicationContext
			
			# Class Methods -------------------------------------------------------------------
			
			##
			# Checks if this context is a valid context for the
			# args provided
			def self.valid_context_for?(*args)
				# if first arg is hash and has key of :webapp, :web_app, or :web_application, valid
				if args[0].is_a? Hash
					return true if args[0].has_key?(:web_app)
				  return true if args[0].has_key?(:webapp)
				  return true if args[0].has_key?(:web_application)
				end
				
				# otherwise, false
				return false
			end
			
			
			# Instance Methods -------------------------------------------------------------------
			
			# set up aliases
			Administration = RPoint::Interop::Administration
			
			def initialize(*args)
			  raise ArgumentError if args.empty?
			  if args[0].is_a? SPWebApplication
			    @web_application = args[0]
			  elsif args[0].is_a? Hash
			    url = args[0][:webapp] || args[0][:web_app] || args[0][:web_application]
			    raise ArgumentError if url.nil?
			    
			    # load web app
			    @web_application = Administration.get_webapp(url)
		    else
		      raise ArgumentError
	      end
			end
			
			def create_site(*args)
			  puts "creating a site"
			end
			
		end
	end
end