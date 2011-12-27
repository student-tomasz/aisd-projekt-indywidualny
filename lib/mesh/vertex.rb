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

    def to_s
      "%6d ( %16.12f, %16.12f, %16.12f)\n" % [@id, @x, @y, @z]
    end
  end
end
