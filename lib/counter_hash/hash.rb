require 'counter_hash/counter'
require 'counter_hash/bucket'

module CounterHash
  class Hash
    @@buckets_length = 8

    def initialize
      @buckets = Array.new(@@buckets_length) { Bucket.new }
    end

    def add element
      @buckets[hash(element)].add(element)
    end

    def find element
      @buckets[hash(element)].find(element)
    end

    def find_all count = nil
      elements = []
      @buckets.each do |bucket|
        bucket.each do |counter|
          if count
            elements << counter.element if counter.count == count
          else
            elements << counter.element
          end
        end
      end
      elements
    end

  private
    def hash element
      element.id & (@@buckets_length-1)
    end
  end
end
