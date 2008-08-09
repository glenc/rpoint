module RPoint
  module Interop
    
    ##
    # Module for working with Site Collections
    module Sites
      
      ##
      # Gets the site collection at the url specified
      def self.get_site(url)
        return url if url.is_a? SPSite
        return SPSite.new url
      end
      
    end
    
  end
end