require File.dirname(__FILE__) + '/example_helper'

#at "http://localhost" do
#	create_site "My Site", BlankSite
#	create_site "Another", BlankSite do
#		create_site "One More"
#	end
#end

# samples with a site collection
at "http://localhost" do |site|
	puts url
end

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