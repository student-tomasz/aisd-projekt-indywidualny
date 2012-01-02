module UI
  module Timer
    def realtime
      time_started = Time.now
      ids = yield
      time_elapsed = Time.now - time_started
      return ids, time_elapsed * 1000
    end
  end
end
