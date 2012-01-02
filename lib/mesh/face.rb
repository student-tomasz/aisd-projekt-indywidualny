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

    def vertices_ids
      [@vertices[0].id, @vertices[1].id, @vertices[2].id]
    end
  end
end
