require File.dirname(__FILE__) + '/example_helper'

at "http://localhost/sites/testing" do
  
  create_list "Custom List", GenericList
  create_list "Links List", Links
  create_list "Tasks List", Tasks
  create_list "Documents", DocumentLibrary
  
end