class CounterJob < ApplicationJob
  queue_as :low_priority

  def perform(**args)
    arr = args[:arr]
    return 0 if (arr || []).empty?
    arr.sum / (arr.size)
  end
end
