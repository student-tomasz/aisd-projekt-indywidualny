module Mesh
  class VerticesHash < Array
    def [] id
      super(id-1)
    end

    def []= id, vertex
      super(id-1, vertex)
    end

    def add id, coordinates
      self[id] ||= Vertex.new id, *coordinates
    end
  end
end
