module Mesh
  class FacesHash < Array
    def add id, *vertices
      self[id] ||= Face.new id, *vertices
    end
  end
end
