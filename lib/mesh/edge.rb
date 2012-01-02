module Mesh
  class Edge
    attr_reader :id, :vertices

    def initialize id, v1, v2
      @id, @vertices = id, [v1, v2]
      v1.edges << self
      v2.edges << self
    end

    def faces
      @vertices[0].faces & @vertices[1].faces
    end

    def adjacent_vertices
     [@vertices[0].adjacent_vertices, @vertices[1].adjacent_vertices].flatten.uniq
    end

    def adjacent_faces
     [@vertices[0].faces, @vertices[1].faces].flatten.uniq
    end

    def adjacent_edges
     [@vertices[0].edges, @vertices[1].edges].flatten.reject { |e| e == self }
    end

    def to_s
      @id.to_s
    end
  end
end
