require "./jihantoro/*"
require "kemal"
require "db"
require "sqlite3"
require "kemal-session"

db = DB.open "sqlite3://db.sql"
at_exit { db.close }

module Jihantoro
  get "/" do # <~|~>
    db.query "select content, url from main_posts where wdyw='1'" do |data|
      rd = data
      render "src/views/home.ecr"
    end
  end
  get "/read/:id" do |env|
    id = env.params.url["id"]
    data = db.query_one? "select content from main_posts where url=? and wdyw='1'", id, as: {String}
    if data
      rd = data.split("<~|~>")
      tags = rd[2].split(",")
      render "src/views/detailpost.ecr"
    else
      env.redirect "/404"
    end
  end
  get "/tags/:id" do |env|
    id = env.params.url["id"]
    env.redirect "/404"
  end
  # indonesia
  get "/id" do
    db.query "select content, url from main_posts where wdyw='2'" do |data|
      rd = data
      render "src/views/id/home.ecr"
    end
  end
  get "/404" do
    render "src/views/404.ecr"
  end
end

def reading_time(wc)
  return (wc / 200.0).ceil.to_i
end

Kemal.config.port = 1400
# Kemal.config.mode = ""
Kemal.run

db.close
