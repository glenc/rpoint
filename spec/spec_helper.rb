lib_path = File.expand_path("#{File.dirname(__FILE__)}/../lib")
$LOAD_PATH.unshift lib_path unless $LOAD_PATH.include?(lib_path)
require 'rpoint'
require File.dirname(__FILE__) + '/lib/spec_helper'