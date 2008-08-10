class String
  ##
  # Convert a string to a url friendly version
  def url_friendly
    self.downcase.gsub(/ /, '')
  end
  
end