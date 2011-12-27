module Mesh
  class HalfEdge
    attr_reader   :edge, :vertex
    attr_accessor :face, :pair, :next

    def initialize edge, face, vertex
      @edge, @face, @vertex = edge, face, vertex
      @pair, @next = nil, nil

      @vertex.half_edge = self
      @face.half_edge = self if @face && !@face.half_edge
    end
  end
end
