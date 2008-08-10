# RPoint README #

RPoint is a domain specific language (DSL) for SharePoint scripting and automation.  RPoint is built on IronRuby so scripts are written in Ruby but can leverage the SharePoint object model.

## Example ##

RPoint is designed to allow scripts such as the following:

	at "http://myserver" do
		
		# create a web with two lists
		create_web "Web One", TeamSite do
			create_list "List One", DocumentLibrary
			create_list "List Two", Announcements
		end
		
		# create several similar webs using names in an array
		["Another", "Web", "Here"].each do |web|
			create_web web, BlankSite
		end
		
		# create a deep site structure
		create_web "Parent", BlankSite do
			create_web "Child 1", BlankSite do
				create_web "Child 1.1", BlankSite
			end
			
			create_web "Child 2", BlankSite do
				create_web "Child 2.1", BlankSite do
					create_web "Child 2.1.1", BlankSite
				end
			end
		end
		
	end

## Goals ##

When complete, RPoint should allow for the following:

- Write scripts to quickly build out a site structure including lists, web parts, pages, etc.
- Create Rails-like migrations which apply changes to existing sites
- Create site, list, and view definitions which can easily be applied directly or converted to site and list definitions