require 'mini_rspec'

# Table of specs and exclusions

tests = [
  ['core/struct', 
    [      
      'eql_spec.rb', # these two specs depend on non-existent files
      'equal_value_spec.rb',
    ]],
  ['core/string',
    [ 'each_char_spec.rb', # not implemented in Ruby 1.8.x
      'element_reference_spec.rb', # this blows up the parser with asserts
      'gsub_spec.rb', # NTH_REF expression transform assert
      'hex_spec.rb', # Not implemented exception
      'modulo_spec.rb', # stack overflow
      'multiply_spec.rb', # Not implemented exception
      'slice_spec.rb', # parser asserts
      'sub_spec.rb', # NTH_REF
      'to_i_spec.rb', # Not implemented exception
    ]],
  ['core/hash',
    [ 
    ]],
  ['core/range',
    [
    ]],
  ['core/array', 
    [
      'pack_spec.rb', # we don't implement this at all ...
    ]],
]

def run_tests(type)
  dir, excluded = type.first, type.last
  Dir.chdir dir
  specs = Dir.glob '*_spec.rb'
  (specs - excluded).each do |file|
    print "#{dir}/#{file}: "
    load file
    puts
  end
  Dir.chdir $master_dir
end

$runner = SpecRunner.new
$master_dir = Dir.getwd

tests.each { |type| run_tests type }

$runner.reporter.summary

