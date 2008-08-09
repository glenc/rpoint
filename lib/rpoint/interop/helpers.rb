module RPoint
  module Helpers
    
    # TODO - move this somewhere else
    
    # Get Object Helpers -----------------------------------------------------
    
    ##
    # Gets a web application by its URL
    def self.get_webapplication(url)
      return url if url.is_a? SPWebApplication
      return SPWebApplication.Lookup(Uri.new(url))
    end
    
  
    ##
    # Gets a list within a web
    def self.get_list(web, list_name)
      web = get_web(web)
      web.Lists.first { |l| l.Title.to_s == list_name }
    end
    
  end
end