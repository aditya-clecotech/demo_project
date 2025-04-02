# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
#   command "/usr/bin/some_great_command"
#   rake "some:great:rake:task"
set :environment, "development"
set :output, "log/cron.log"

every 1.minute do
  runner "Post.clean"
end

# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
