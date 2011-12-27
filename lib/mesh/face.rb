module Mesh
  class Face
    attr_reader :id, :vertices

    def initialize id, v1, v2, v3
      @id = id
      @vertices = [v1, v2, v3]
    end

    def to_s
      ("%8d " * 4 + "\n") % @vertices.map{|v| v.id}.unshift(id)
    end
  end
end
