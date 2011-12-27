$LOAD_PATH.unshift File.dirname(__FILE__)

require 'perftools'
require 'mesh'

PerfTools::CpuProfiler.start("profiles/parsing.pprof") do
  mesh = Mesh::Model.new ARGV[0]
end
