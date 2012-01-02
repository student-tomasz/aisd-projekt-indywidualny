$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')

require 'rubygems'
require 'bundler/setup'
require 'perftools'

require 'mesh'

mesh = nil

PerfTools::CpuProfiler.start("profiles/0-mesh_initialization.pprof") do
  10.times do
    mesh = Mesh::Model.new ARGV[0]
  end
end

PerfTools::CpuProfiler.start("profiles/1-vertices_of_a_face.pprof") do
  mesh.faces.each do |face|
    next unless face
    face.vertices
  end
end

[:adjacent_vertices, :faces, :edges].each_with_index do |method, index|
  PerfTools::CpuProfiler.start("profiles/#{index+2}-#{method}_of_a_vertex.pprof") do
    mesh.vertices.each do |vertex|
      next unless vertex
      vertex.send method
    end
  end
end

[:vertices, :faces, :adjacent_vertices, :adjacent_faces, :adjacent_edges].each_with_index do |method, index|
  PerfTools::CpuProfiler.start("profiles/#{index+5}-#{method}_of_an_edge.pprof") do
    mesh.edges.each do |edge|
      next unless edge
      edge.send method
    end
  end
end
