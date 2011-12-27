module Mesh
  class Face
    attr_reader   :id, :vertices
    attr_accessor :half_edge

    def initialize id, v1, v2, v3, half_edge = nil
      @id = id
      @vertices = [v1, v2, v3]
      @half_edge = nil
    end

    def vertices_ordered seed_edge = nil
      vertices = []
      if seed_edge
        seed_half_edge = seed_edge.half_edge self
        vertices[0], vertices[1] = seed_half_edge.pair.vertex, seed_half_edge.vertex
        vertices[2] = (@vertices.reject{|v| v == vertices[0] || v == vertices[1]}).first
      else
        vertices = @vertices
      end
      [
        [vertices.first,  vertices.second],
        [vertices.second, vertices.third ],
        [vertices.third,  vertices.first ]
      ]
    end

    def vertices_ids
      vertices.map { |vertex| vertex.id }
    end
  end
end
