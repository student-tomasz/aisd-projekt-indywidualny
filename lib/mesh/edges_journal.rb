module Mesh
  class EdgesJournal
    def initialize
      @journal = {}
    end

    def [] pair
      @journal[key(pair)]
    end

    def []= pair, edge
      @journal[key(pair)] = edge
    end

  private
    # Uses Cantor pairing: http://en.wikipedia.org/wiki/Cantor_pairing_function#Cantor_pairing_function
    def key pair
      ids = [pair.first.id, pair.second.id]
      ids.reverse! if ids.first > ids.second
      (ids[0] + ids[1]) * (ids[0] + ids[1] + 1) / 2 + ids[1]
    end
  end
end
