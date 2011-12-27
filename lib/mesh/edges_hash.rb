module Mesh
  class EdgesHash < Array
    def initialize *args
      super(*args)
      self << nil
      @journal = EdgesJournal.new
    end

    def add face, pair
      id = self.length
      self[id] = @journal[pair] = Edge.new(id, face, pair)
    end

    def generate_edges face
      half_edges = []
      if seed_edge = find_seed_edge(face)
        face.vertices_ordered(seed_edge).each do |pair|
          if edge = @journal[pair]
            half_edge = edge.half_edge(face)
            half_edge.face = face
            half_edges << half_edge
          else
            edge = self.add face, pair
            half_edges << edge.half_edge(face)
          end
        end
      else
        face.vertices_ordered.each do |pair|
          edge = self.add face, pair
          half_edges << edge.half_edge(face)
        end
      end
      3.times { |i| half_edges[i%3].next = half_edges[(i+1)%3] }
    end

  private
    def find_seed_edge face
      edge = nil
      face.vertices_ordered.each do |pair|
        break if edge = @journal[pair]
      end
      edge
    end
  end
end
