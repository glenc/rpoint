module RPoint
  module Interop
    
    ##
    # Class for administrative functionality
    class Administration
      
      def self.get_webapp(url)
        return url if url.is_a? SPWebApplication
        return SPWebApplication.Lookup(Uri.new(url))
      end
      
    end
    
  end
end