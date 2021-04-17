require "test_helper"

class CounterJobTest < ActiveJob::TestCase
  let(:arr) { [1, 2, 3] }

  let(:action) {
    CounterJob.perform_now(arr)
  }

  context "calculation" do
    let(:expected) { 0.5 }

    it do
      expect(action).to eq(expected)
    end
  end
end
