module RPoint
  module Interop
    
    ##
    # Interop methods for working with lists
    class Lists
      
      ##
      # Create a new list in the web specified
      def self.create_list(web, name, template, options = {})
        
        # merge options with defaults
        options = {
          :description => '',           # uh... description
          :url => nil,                  # url-friendly name for the list
          :feature_id => '',            # not exactly sure how this is used
          :doc_template_type => '100',  # none
          :show_in_quicklaunch => true  # just what it sounds like
        }.merge(options)
        
        # set url unless already set
        options[:url] = name.url_friendly if options[:url].nil?
        
        # create the new list
        list_id = web.Lists.Add(
          name,
          options[:description],
          options[:url],
          options[:feature_id],
          template.id,
          options[:doc_template_type]
        )
        
        # get list and return
        web.Lists.GetList(list_id, false)
      end
      
    end
    
  end
end