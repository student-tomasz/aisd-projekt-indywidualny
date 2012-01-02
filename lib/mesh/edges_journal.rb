module Mesh
  class EdgesJournal
    def initialize
      @journal = []
    end

    def [] pair
      i, j = hash pair
      @journal[i][j] if @journal[i]
    end

    def []= pair, edge
      i, j = hash pair
      @journal[i] = {} if @journal[i].nil?
      @journal[i][j] = edge
    end

  private
    def hash pair
      id0, id1 = pair[0].id, pair[1].id
      if id0 < id1
        return id0, id1
      else
        return id1, id0
      end
    end
  end
end
