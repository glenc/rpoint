# Runs specs based on command-line arguments
#
# 1. Runs all of the array specs using the Dotted reporter:
#
# spec_runner array
#
# 2. Runs specs for the array first method using the Dotted reporter:
#
# spec_runner array first
#
# 3. Runs specs for the array first, last, and [] methods using the Dotted
# reporter:
#
# spec_runner array first,last,[]
#
# 4. Runs all of the array specs using the False reporter (reports names of
# failed tests):
#
# spec_runner array - False
#
# 5. Runs specs for the array first, last and [] methods using the True
# reporter:
#
# spec_runner array "first,last,[]" True
#
# Note that spec_runner is usually invoked using rake:
#
# rake spec array "first,last,[]"

# TODO: require is indexing based on absolute path?
#require 'mini_rspec'
require File.dirname(__FILE__) + '/mini_rspec'

def parse_reporter
  reporter_name = ARGV.length == 3 ? ARGV.last : "summary"

  # TODO: eval this stuff once we get eval working in IronRuby
  case reporter_name.downcase
  when "summary"
    reporter = SummaryReporter.new
  when "dox"
    reporter = SpecDoxReporter.new
  when "gen_excludes"
    reporter = GenerateExcludesReporter.new
  when "dotted"
    reporter = DottedReporter.new
  when "pass"
    reporter = SuccessReporter.new
  when "fail"
    reporter = FailureReporter.new
  when "coverage"
    reporter = CoverageReporter.new
  else
    reporter = DottedReporter.new
  end
  @runner.reporter = reporter
  reporter_name
end

def parse_options(klass)
  if ARGV.length == 1
    specs = Dir.glob "#{klass}/*_spec.rb"
  elsif ARGV.length <= 3
    if ARGV[1] == '-'
      specs = Dir.glob "#{klass}/*_spec.rb"
    else
      names = ARGV[1].split ","
      specs = names.collect { |name| "#{klass}/#{name}_spec.rb" }
    end
  else
    puts "expecting a comma separated list of method names; you gave me too many parameters"
    exit
  end
  return specs
end

def read_exclusions(klass, spec)
  method_name = File.basename(spec).split("_spec.rb").first
  excludes_file = "#{klass}/.spec/#{method_name}_excludes.txt"
  $exclusions = []
  if File.exist? excludes_file
    File.open(excludes_file, 'r') do |f|
      f.each { |line| $exclusions << line.strip }
    end
  end
end

def run_specs(klass)
  specs = parse_options(klass)
  if @runner.reporter.is_a? GenerateExcludesReporter
    specs.each do |spec|
      method_name = File.basename(spec).split("_spec.rb").first
      excludes_name = "#{klass}/.spec/#{method_name}_excludes.txt"
      @runner.reporter.out = excludes_name
      load spec
    end
  elsif @runner.reporter.is_a? CoverageReporter
    specs.each do |spec|
      load spec
    end
  else
    specs.each do |spec|
      read_exclusions(klass, spec)
      load spec 
    end
  end
end

if ARGV.length == 0
  puts "must specify class whose specs you want to run"
  exit
end

# TODO: eliminate class-based exclusions in the future once we get some more
# language features implemented
$simple_mock_loaded = false
$klass_exclusions = ['core\thread']

folder = "core"
klass = ARGV.first

# if you want a non-core set of tests then you have to pass in the folder as part of the klass parameter
# E.g. spec_runner library:socket:udpsocket will run the udpsocket tests in the library/socket/udpsocket folder
if klass.include? ':'
  parts = klass.split(':')
  klass = parts.pop
  folder = parts.join('/')
end
parse_reporter

if klass != '-'
  run_specs("core/#{klass}")
else
  klasses = Dir.glob("core/*")
  klass_list = klasses - $klass_exclusions

  klass_list.each do |klass|
    if File.directory? klass
      run_specs(klass)
    end
  end
end
