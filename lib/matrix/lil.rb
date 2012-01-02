module Matrix
  class LIL
    def initialize
      @rows = []
    end

    def [] i, j
      @rows[i][j] if @rows[i]
    end

    def []= i, j, value
      @rows[i] = {} if @rows[i].nil?
      @rows[i][j] = value
    end
  end
end
