module RPoint
	
	def self.make_aliases(namespace, names=[])
		names.each do |name|
			eval "#{name} = #{namespace}::#{name}"
		end
	end
	
	# Set up aliases to common Microsoft.SharePoint objects
	make_aliases 'Microsoft::SharePoint', %w(SPSite SPWeb SPList SPListItem)
	make_aliases 'Microsoft::SharePoint::Administration', %w(SPWebApplication)
	make_aliases 'System', %w(Uri)
	
end