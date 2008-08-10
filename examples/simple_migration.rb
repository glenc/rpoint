require File.dirname(__FILE__) + '/example_helper'

# create a new subweb beneath the root site collection
at "http://localhost/sites/testing" do
  create_web "Test New Site", BlankSite do
    create_web "Child Web", BlankSite
  end
  
  create_web "TeamSite", TeamSite, :url => 'team_site'
end


#at "http://localhost" do
#	create_site "My Site", BlankSite
#	create_site "Another", BlankSite do
#		create_site "One More"
#	end
#end


# samples with a site collection
#at "http://localhost" do
#	create_list "My List", RPoint::Types::Lists::DocumentLibrary
#	create_list "Another", RPoint::Types::Lists::CustomList do
#		add_column "Test"
#		add_column "There"
#	end
#end

#at :list => "http://localhost/lists/Team Discussion" do
#	add_column "My Column"
#end

#at :site => "http://localhost" do
#	puts "hi"
#end

# sample with a web application
#at :web_application => "http://localhost" do
#	puts "howdy"
#end

# samples with a web
#at "http://localhost/subweb" do
#	puts "hello"
#end

#at :web => "http://localhost/subweb" do
#	puts "hi there"
#end