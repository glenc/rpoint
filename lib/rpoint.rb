# Set up CLR references
require 'mscorlib, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089, processorArchitecture=x86'
require 'System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089, processorArchitecture=MSIL'
require 'Microsoft.SharePoint, Version=12.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c, processorArchitecture=MSIL'


# require the rest of the library
require 'rpoint/aliases'
require 'rpoint/contexts'
require 'rpoint/types'

def at(*args, &block)
	RPoint::Contexts::ContextFactory.create_context(*args, &block)
end