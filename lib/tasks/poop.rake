require "resque/tasks"

task "resque:setup" => :environment

#to run this rake task, use this command
#TERM_CHILD=1 QUEUES=* rake resque:work