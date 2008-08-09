module RPoint
  module Helpers
    
    # Get Object Helpers -----------------------------------------------------
    
    ##
    # Gets a web application by its URL
    def self.get_webapplication(url)
      return url if url.is_a? SPWebApplication
      return SPWebApplication.Lookup(Uri.new(url))
    end
    
  
    ##
    # Gets a site collection by its URL
    def self.get_site(url)
      return url if url.is_a? SPSite
      return SPSite.new url
    end
    
  
    ##
    # Gets a web by its URL
    def self.get_web(url)
      return url if url.is_a? SPWeb
      return url.RootWeb if url.is_a? SPSite
      
      # to get the web, first we'll open the site collection,
      # then we'll try to open the web with whatever remains
      # in the web URL
      
      # open the site collection
      site = get_site(url)
      
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
    # Gets a list within a web
    def self.get_list(web, list_name)
      web = get_web(web)
      web.Lists.first { |l| l.Title.to_s == list_name }
    end
    
  end
end