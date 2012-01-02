module Mesh
  class EdgesHash < Array
    def initialize *args
      super(*args)
      self << nil
      @journal = EdgesJournal.new
    end

    def add pair
      unless @journal[pair]
        id = self.length
        self[id] = @journal[pair] = Edge.new(id, *pair)
      end
    end

    def freeze
      @journal = nil
    end
  end
end
