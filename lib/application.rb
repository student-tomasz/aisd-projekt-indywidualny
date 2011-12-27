$LOAD_PATH.unshift File.dirname(__FILE__)

require 'perftools'
require 'array'
require 'mesh'

mesh = nil
PerfTools::CpuProfiler.start("profiles/parsing.pprof") do
  mesh = Mesh::Model.new ARGV[0]
end
