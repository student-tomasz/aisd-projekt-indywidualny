module Mesh
  class Edge
    attr_reader :id, :vertices

    def initialize id, v1, v2
      @id, @vertices = id, [v1, v2]
      v1.edges << self
      v2.edges << self
    end

    def vertices_ids
      [@vertices[0].id, @vertices[1].id]
    end

    def faces_ids
      @vertices[0].faces_ids & @vertices[1].faces_ids
    end

    def adjacent_vertices_ids
     [@vertices[0].adjacent_vertices_ids, @vertices[1].adjacent_vertices_ids].flatten.uniq
    end

    def adjacent_faces_ids
     [@vertices[0].faces_ids, @vertices[1].faces_ids].flatten.uniq
    end

    def adjacent_edges_ids
     [@vertices[0].edges.map{|e| e.id}, @vertices[1].edges.map{|e| e.id}].flatten.reject{|e| e == @id}
    end
  end
end
