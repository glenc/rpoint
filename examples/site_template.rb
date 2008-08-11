require File.dirname(__FILE__) + '/example_helper'

class ExampleSite << WebTemplate
  
  list "Announcements", AnnouncementList
  list "Documents", DocumentLibrary
  
end