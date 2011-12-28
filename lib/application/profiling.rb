$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..')

require 'rubygems'
require 'bundler/setup'
require 'perftools'

require 'array'
require 'mesh'

mesh = nil

PerfTools::CpuProfiler.start("profiles/0-mesh_initialization.pprof") do
  10.times do
    mesh = Mesh::Model.new ARGV[0]
  end
end

PerfTools::CpuProfiler.start("profiles/1-vertices_ids_of_a_face.pprof") do
  mesh.faces.each do |face|
    next unless face
    face.vertices_ids
  end
end

[:adjacent_vertices_ids, :faces_ids].each_with_index do |method, index|
  PerfTools::CpuProfiler.start("profiles/#{index+2}-#{method}_of_a_vertex.pprof") do
    mesh.vertices.each do |vertex|
      next unless vertex
      vertex.send method
    end
  end
end

[:vertices_ids, :faces_ids, :adjacent_vertices_ids, :adjacent_faces_ids, :adjacent_edges_ids].each_with_index do |method, index|
  PerfTools::CpuProfiler.start("profiles/#{index+4}-#{method}_of_an_edge.pprof") do
    mesh.edges.each do |edge|
      next unless edge
      edge.send method
    end
  end
end
