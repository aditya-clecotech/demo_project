class PostCleanupJob < ApplicationJob
  queue_as :default

  def perform
    # Do something later
    PostCleanup.new.call #calling PostCleanup Service
  end
end
