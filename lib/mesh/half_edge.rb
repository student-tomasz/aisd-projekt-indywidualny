module Mesh
  class HalfEdge
    attr_reader   :edge, :vertex
    attr_accessor :face, :pair, :next

    def initialize edge, face, vertex
      @edge, @face, @vertex = edge, face, vertex
      @pair, @next = nil, nil
    end
  end
end
