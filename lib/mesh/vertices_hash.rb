module Mesh
  class VerticesHash < Array
    def add id, *coordinates
      self[id] ||= Vertex.new id, *coordinates
    end
  end
end
