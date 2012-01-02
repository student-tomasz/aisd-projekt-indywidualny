require 'matrix/lil'

module Mesh
  class EdgesJournal
    def initialize
      @journal = Matrix::LIL.new
    end

    def [] pair
      @journal[*hash(pair)]
    end

    def []= pair, edge
      @journal[*hash(pair)] = edge
    end

    def freeze
      @journal = nil
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
