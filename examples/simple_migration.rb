require File.dirname(__FILE__) + '/example_helper'

# create our site collection
at :webapp => "http://localhost" do
  
  # create a new site collection
  create_site "Testing Site", BlankSite, 'pico\\glenc', :url => "http://localhost/sites/testing" do
    
    # create site hierarchy within our new site
    inside root_web do
      create_web "Test New Site", BlankSite do
        create_web "Child Web", BlankSite
      end
      create_web "TeamSite", BlankSite, :url => 'team_site'
    end
    
  end
  
  # list out all sites in this site collection
  sites.each do |site_context|
    puts site_context.site.Url
  end
  
end