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
      def self.create_site(web_application, name, type, owner, options = {})
        
        # merge options with defaults
        options = { 
          :url => nil,
          :managed_path => nil,
          :description => '',
          :language => '',
          :owner_name => '',
          :owner_email => '',
          :secondary_contact_login => '',
          :secondary_contact_name => '',
          :secondary_contact_email => '',
          :database_server => '',
          :database_name => '',
          :username => '',
          :password => ''
        }.merge(options)
        
        url = self.determine_new_site_url(web_application, name, options)
        puts "creating a site at #{url}"
      end
      
      
      private
      
      def self.determine_new_site_url(web_app, name, options)
        
        # if url was provided, ues that
        return options[:url] if options.has_key?(:url) && !options[:url].nil?
        
        # if path was provided, ues it, otherwise use 'sites'
        path = 'sites'
        if options.has_key?(:path) && !options[:path].nil?
          path = options[:path]
        end
        
        # return url of web app + path + name
        web_app.GetResponseUri(SPUrlZone.Default, "#{path}/#{name.url_friendly}").ToString
      end
      
    end
    
  end
end