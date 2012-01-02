module Mesh
  class Vertex
    attr_reader   :id
    attr_reader   :x, :y, :z
    attr_accessor :faces, :edges

    def initialize id, x, y, z, faces = [], edges = []
      @id = id
      @x, @y, @z = x, y, z
      @faces, @edges = faces, edges
    end

    def adjacent_vertices
      @edges.map { |e| e.vertices[0] == self ? e.vertices[1] : e.vertices[0] }
    end

    def to_s
      @id.to_s
    end
  end
end
