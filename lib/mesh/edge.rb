module Mesh
  class Edge
    attr_reader :id, :half_edges

    def initialize id, face, vertices
      @id = id
      @half_edges = [
        HalfEdge.new(self, face, vertices.second),
        HalfEdge.new(self, nil, vertices.first)
      ]
      @half_edges.first.pair = @half_edges.second
      @half_edges.second.pair = @half_edges.first
    end

    def half_edge item
      if item.is_a? Face
        @half_edges.first.face == item ? @half_edges.first : @half_edges.second
      elsif item.is_a? Vertex
        @half_edges.first.vertex == item ? @half_edges.first : @half_edges.second
      elsif item.is_a? Array
        @half_edges.first.vertex == item.second ? @half_edges.first : @half_edges.second
      else
        nil
      end
    end
  end
end
