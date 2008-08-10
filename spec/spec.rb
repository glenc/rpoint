# load all specs
specs = Dir.glob "*/**/*_spec.rb"

# run them all
specs.each do |spec|
  load spec
end