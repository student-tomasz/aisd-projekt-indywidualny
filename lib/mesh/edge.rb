require 'counter_hash/hash'

module Mesh
  class Edge
    attr_reader :id, :vertices

    def initialize id, v1, v2
      @id, @vertices = id, [v1, v2]
      v1.edges << self
      v2.edges << self
    end

    def faces
      # @vertices[0].faces & @vertices[1].faces
      hash = CounterHash::Hash.new
      found_faces = []
      @vertices[0].faces.each { |face| hash.add(face) }
      @vertices[1].faces.each { |face| found_faces << face if hash.find(face) }
      found_faces
    end

    def adjacent_vertices
      # [@vertices[0].adjacent_vertices, @vertices[1].adjacent_vertices].flatten.reject { |v| v == @vertices[0] || v == @vertices[1] }
      hash = CounterHash::Hash.new
      @vertices[0].adjacent_vertices.each { |vertex| hash.add(vertex) unless vertex == @vertices[1] }
      @vertices[1].adjacent_vertices.each { |vertex| hash.add(vertex) unless vertex == @vertices[0] }
      hash.find_all
    end

    def adjacent_faces
      # [@vertices[0].faces, @vertices[1].faces].flatten.uniq
      hash = CounterHash::Hash.new
      @vertices[0].faces.each { |face| hash.add(face) }
      @vertices[1].faces.each { |face| hash.add(face) }
      hash.find_all
    end

    def adjacent_edges
      # [@vertices[0].edges, @vertices[1].edges].flatten.reject { |e| e == self }
      found_edges = []
      @vertices[0].edges.each { |edge| found_edges << edge unless edge == self }
      @vertices[1].edges.each { |edge| found_edges << edge unless edge == self }
      found_edges
    end

    def to_s
      @id.to_s
    end
  end
end
