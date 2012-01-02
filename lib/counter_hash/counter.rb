module CounterHash
  class Counter
    attr_reader   :element
    attr_accessor :count

    def initialize element
      @element, @count = element, 1
    end
  end
end
