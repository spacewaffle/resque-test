require 'logger'

class DataController
  @queue = :data_queue

  #start redis server with this
  #redis-server

  #remember to start resque workier with this
  #TERM_CHILD=1 QUEUES=* rake environment resque:work

  def self.perform
    Rails.logger.info "sleeping 10 sec, then storing something in redis"
    redis = Redis.new
    if redis.get("mykey") == nil
      sleep 10
      redis = Redis.new
      redis.set("mykey", "poop")
      redis.expire("mykey", 30)
    end
  end
end