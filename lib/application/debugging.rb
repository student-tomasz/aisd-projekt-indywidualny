$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..')

require 'rubygems'
require 'bundler/setup'
require 'pry'

require 'mesh'

mesh = Mesh::Model.new ARGV[0]

binding.pry