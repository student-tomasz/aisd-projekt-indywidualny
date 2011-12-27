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

    def vertices_ids
      [@half_edges[0].vertex.id, @half_edges[1].vertex.id]
    end

    def faces_ids
      [@half_edges[0].face.id, @half_edges[1].face.id]
    end

    def adjacent_vertices_ids
      ids = [*@half_edges[0].vertex.adjacent_vertices_ids, *@half_edges[1].vertex.adjacent_vertices_ids]
      ids.reject! { |vertex_id| vertex_id == self.vertices_ids[0] || vertex_id == self.vertices_ids[1] }
      ids.uniq
    end

    def adjacent_faces_ids
      ids = [*@half_edges[0].vertex.faces_ids, *@half_edges[1].vertex.faces_ids]
      ids.reject! { |face_id| face_id == self.faces_ids[0] || face_id == self.faces_ids[1] }
      ids.concat self.faces_ids
    end

    def adjacent_edges_ids
      ids = []
      @half_edges.each do |start_half_edge|
        half_edge = start_half_edge.next
        until half_edge == start_half_edge.pair
          ids << half_edge.edge.id unless half_edge.edge.id == @id
          half_edge = half_edge.pair.next
        end
      end
      ids
    end
  end
end
