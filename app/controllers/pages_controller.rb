class PagesController < ApplicationController
  def home
    @counter = CounterJob.perform_now({ arr: [rand] * 100 })
  end
end
