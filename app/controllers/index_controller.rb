class IndexController < ApplicationController

  def index
    Resque.enqueue(DataController)
  end

  def blah
    redis = Redis.new
    blah = redis.get("mykey")
    logger.info "checking redis value is #{blah}"
    render plain: blah
  end

end