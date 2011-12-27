module Mesh
  class Face
    attr_reader :id, :vertices

    def initialize id, v1, v2, v3
      @id = id
      @vertices = [v1, v2, v3]
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

    def to_s
      ("%8d " * 4 + "\n") % @vertices.map{|v| v.id}.unshift(id)
    end
  end
end
