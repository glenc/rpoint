module RPoint
  module Interop
    
    ##
    # Interop methods for working with webs
    module Webs
      
      ##
      # Gets a web by its URL
      def self.get_web(url)
        return url if url.is_a? SPWeb
        return url.RootWeb if url.is_a? SPSite

        # to get the web, first we'll open the site collection,
        # then we'll try to open the web with whatever remains
        # in the web URL

        # open the site collection
        site = Sites.get_site(url)

        # TODO - extract this into some other helper method
        # if we get a different host name back as the site URL,
        # use the new host for our web URL
        site_uri = Uri.new(site.Url)
        web_uri = Uri.new(url)

        if web_uri.Host.to_s.downcase != site_uri.Host.to_s.downcase
          web_uri = Uri.new("#{site_uri.GetLeftPart(UriPartial.Authority)}#{web_uri.PathAndQuery}")
        end

        # get the relative uri
        relative_url = site_uri.MakeRelative(web_uri)

        return site.OpenWeb(relative_url)
      end
      
      
      ##
      # Create a new web beneath the parent web specified and
      # returns the result
      def self.create_web(parent, name, type, options = {})
        
        # merge options with defaults
        options = { 
          :language => 1033, 
          :description => '',
          :unique_permissions => false,
          :convert_if_exists => false
        }.merge(options)
        
        # figure out URL for new web
        
        # create new web
        parent.Webs.Add(
          name, 
          name, 
          options[:description], 
          options[:language], 
          'STS#0', 
          options[:unique_permissions], 
          options[:convert_if_exists])
      end
      
    end
  end
end