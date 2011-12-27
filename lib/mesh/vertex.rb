module Mesh
  class Vertex
    attr_reader   :id
    attr_reader   :x, :y, :z
    attr_accessor :faces, :half_edge

    def initialize id, x, y, z, faces = [], half_edge = []
      @id = id
      @x, @y, @z = x, y, z
      @faces = faces
      @half_edge = half_edge
    end

    def adjacent_vertices_ids
      ids = []
      half_edge = @half_edge.next
      until half_edge == @half_edge.pair
        ids << half_edge.vertex.id
        half_edge = half_edge.pair.next
      end
      ids << @half_edge.pair.vertex.id
      ids
    end

    def faces_ids
      @faces.map { |f| f.id }
    end
  end
end
