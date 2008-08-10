BASE_DIR = File.dirname(__FILE__)

specs = []
if ARGV.empty?
  specs = Dir.glob("#{BASE_DIR}/**/*_spec.rb").uniq
else
  ARGV.each do |a|
    specs << Dir.glob("#{BASE_DIR}/#{a}/**/*_spec.rb").uniq
  end
  specs.flatten!.uniq!
end

puts "Running Specs:"
puts specs

# run them all
specs.each do |spec|
  load spec
end