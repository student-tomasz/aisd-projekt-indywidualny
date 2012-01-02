module Mesh
  class EdgesHash < Array
    def initialize *args
      super(*args)
      @journal = EdgesJournal.new
    end

    def [] id
      super(id-1)
    end

    def []= id, edge
      super(id-1, edge)
    end

    def add pair
      unless @journal[pair]
        id = self.length+1
        self[id] = @journal[pair] = Edge.new(id, *pair)
      end
    end

    def freeze
      @journal = nil
    end
  end
end
