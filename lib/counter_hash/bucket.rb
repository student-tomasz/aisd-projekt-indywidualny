module CounterHash
  class Bucket < Array
    def add element
      counter = self.find(element)
      if counter
        counter.count += 1
      else
        counter = Counter.new(element)
        self << counter
      end
      counter
    end

    def find element
      self.each do |counter|
        return counter if counter.element == element
      end
      nil
    end
  end
end
