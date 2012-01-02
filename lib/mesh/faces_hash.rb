module Mesh
  class FacesHash < Array
    def [] id
      super(id-1)
    end

    def []= id, face
      super(id-1, face)
    end

    def add id, vertices
      self[id] ||= Face.new id, *vertices
    end
  end
end
