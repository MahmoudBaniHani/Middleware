require 'redis'
class PagesController < ApplicationController
  def home


    redis = Redis.new(host: "localhost")

    redis.set("a", 1)

    arr =redis.lpush( "arr" , [1,2,3,4,5,6,7,8,9,10] )

    a = redis.get("a")
    username= redis.get('username')
    password= redis.get('password')
    array = redis.get('array')
    puts a,username,password,array,arr

  end
end
