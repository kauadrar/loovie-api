class YourBackgroundJob < ApplicationJob
  queue_as :default
  def perform
    puts "I'm starting the job"
  end
end
