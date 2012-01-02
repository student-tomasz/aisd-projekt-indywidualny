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

    def adjacent_vertices_ids
      @edges.map { |e| e.vertices[0] == self ? e.vertices[1].id : e.vertices[0].id }
    end

    def faces_ids
      @faces.map { |f| f.id }
    end
  end
end
