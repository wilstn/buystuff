namespace :time_utils do
  desc "this should show current time"
  task :show_time => :environment do
    puts "Current time is #{Time.now}"
  end
end
