class ActiveSupport::TestCase
  parallelize(workers: :number_of_processors, with: :threads)
end
