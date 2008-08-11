module RPoint
	module Contexts
		class WebContext
			
			# Class Methods -------------------------------------------------------------------
			
			##
			# Checks if this context is a valid context for the
			# args provided
			def self.valid_context_for?(*args)
			  # if arg is an SPWeb or a String, valid
				return true if args[0].is_a? String
				return true if args[0].is_a? SPWeb
				
				# if first arg is hash and has key of :site, valid
				if args[0].is_a? Hash
					return true if args[0].has_key?(:web)
				end
				
				# otherwise, false
				return false
			end
			
			
			# Instance Methods -------------------------------------------------------------------
			
			# accessors
			attr_reader :web
			
			# alias interop classes
			Webs = RPoint::Interop::Webs
			Lists = RPoint::Interop::Lists
			
			
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
			def create_web(name, template, options = {}, &blk)
			  # create our new web
			  new_web = Webs.create_web(@web, name, template, options)
			  context_for_new_object(new_web, WebContext, &blk)
			end
			
			
			##
			# Creates a new list
			def create_list(name, template, options = {}, &blk)
			  # create the new list
			  new_list = Lists.create_list(@web, name, template, options)
			  context_for_new_object(new_list, ListContext, &blk)
			end
			
			private
			
			def context_for_new_object(created_object, context_class, &blk)
			  ctx = context_class.new(created_object)
			  if block_given?
			    ctx.instance_eval(&blk)
		    end
		    ctx
			end
			
		end
	end
end