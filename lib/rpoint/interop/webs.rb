module RPoint
  module Interop
    
    ##
    # Interop methods for working with webs
    class Webs
      
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
      def self.create_web(parent, name, template, options = {})
        
        # merge options with defaults
        options = { 
          :language => 1033,              # language id for the new site
          :description => '',             # description for the new site
          :unique_permissions => false,   # if true, new site will have unique permissions
          :convert_if_exists => false,    # will convert existing folder if exists
          :url => nil                     # override the url which will be auto-calculated from the name
        }.merge(options)
        
        # figure out URL for new web
        new_web_url = self.determine_new_url(parent, name, options)
        
        # create new web
        parent.Webs.Add(
          new_web_url, 
          name, 
          options[:description], 
          options[:language], 
          template.id, 
          options[:unique_permissions], 
          options[:convert_if_exists])
      end
      
      private
      
      ##
      # Determine the URL for a new site based on its
      # parent URL and the new name
      def self.determine_new_url(parent_web, new_name, options = {})
        
        # decide whether to use name or url defined in options
        url_explicitly_set = options.has_key?(:url) && !options[:url].nil?
        new_name = url_explicitly_set ? options[:url] : new_name
        
        # url-ize new_name unless it was explicitly set
        new_name = self.urlize_name(new_name) unless url_explicitly_set
        
        # make new url relative to site collection root
        new_uri = Uri.new("#{parent_web.Url}/#{new_name}")
        site_uri = Uri.new(parent_web.Site.Url)
        site_uri.MakeRelative(new_uri)
      end
      
      ##
      # Convert a name into a url-friendly name
      def self.urlize_name(name)
        name.downcase.gsub(/ /, '')
      end
      
    end
  end
end