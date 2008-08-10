module RPoint
  module Interop
    
    ##
    # Module for working with Site Collections
    class Sites
      
      ##
      # Gets the site collection at the url specified
      def self.get_site(url)
        return url if url.is_a? SPSite
        return SPSite.new url
      end
      
      
      ##
      # Creates a new site collection
      def self.create_site(web_application, name, template, owner, options = {})
        
        # merge options with defaults
        options = { 
          :url => nil,
          :managed_path => nil,
          :description => '',
          :language => 1033,
          :owner_name => nil,
          :owner_email => nil,
          :secondary_contact_login => nil,
          :secondary_contact_name => nil,
          :secondary_contact_email => nil,
          :database_server => nil,
          :database_name => nil,
          :username => nil,
          :password => nil
        }.merge(options)
        
        url = self.determine_new_site_url(web_application, name, options)
        
        # if no database info specified, call shorter method
        if options[:database_server].nil?
          web_application.Sites.Add(
            url,
            name,
            options[:description],
            options[:language],
            template.id,
            owner,
            options[:owner_name],
            options[:owner_email],
            options[:secondary_contact_login],
            options[:secondary_contact_name],
            options[:secondary_contact_email]
          )
        else
          # ensure all database info is provided
          raise ArgumentError if options[:database_name].nil?
          
          # call full method
          web_application.Sites.Add(
            url,
            name,
            options[:description],
            options[:language],
            template.id,
            owner,
            options[:owner_name],
            options[:owner_email],
            options[:secondary_contact_login],
            options[:secondary_contact_name],
            options[:secondary_contact_email],
            options[:database_server],
            options[:database_name],
            options[:username],
            options[:password]
          )
        end
      end
      
      
      private
      
      def self.determine_new_site_url(web_app, name, options)
        
        # if url was provided, ues that
        return options[:url] if options.has_key?(:url) && !options[:url].nil?
        
        # if path was provided, ues it, otherwise use 'sites'
        path = 'sites'
        if options.has_key?(:managed_path) && !options[:managed_path].nil?
          path = options[:managed_path]
        end
        
        # return url of web app + path + name
        web_app.GetResponseUri(SPUrlZone.Default, "#{path}/#{name.url_friendly}").ToString
      end
      
    end
    
  end
end