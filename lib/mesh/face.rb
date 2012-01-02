module Mesh
  class Face
    attr_reader :id, :vertices

    def initialize id, v1, v2, v3
      @id, @vertices = id, [v1, v2, v3]
    end

    def vertices_ordered
      [
        [@vertices[0], @vertices[1]],
        [@vertices[1], @vertices[2]],
        [@vertices[2], @vertices[0]]
      ]
    end

    def to_s
      @id.to_s
    end
  end
end
