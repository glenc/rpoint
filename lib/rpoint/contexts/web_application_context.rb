module RPoint
  module Contexts
		class WebApplicationContext
			
			# Class Methods -------------------------------------------------------------------
			
			##
			# Checks if this context is a valid context for the
			# args provided
			def self.valid_context_for?(*args)
			  # valid for SPWebApplication
			  return true if args[0].is_a? SPWebApplication
        
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
			
			# accessors
			attr_reader :web_application
			
			# set up aliases
			Administration = RPoint::Interop::Administration
			Sites = RPoint::Interop::Sites
			
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
			
			
			##
			# Enumerate all site collections
			def sites
			  @sites ||= load_site_collections
			end
			
			
			##
			# Create a site collection
			def create_site(name, type, owner, options = {}, &blk)
			  # create our new web
			  new_site = Sites.create_site(@web_application, name, type, owner, options)
			  new_site_context = SiteContext.new(new_site)
			  
			  # if we have a block, execute it in the scope of the new context
			  if block_given?
			    new_site_context.instance_eval(&blk)
		    end
		    
		    new_site_context
			end
			
			
			private
			
			def load_site_collections
			  site_collections = []
			  @web_application.Sites.each do |site|
			    site_collections << SiteContext.new(site)
		    end
		    site_collections
			end
			
		end
	end
end