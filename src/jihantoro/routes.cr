# site Index, query all content inside database
# and show all the content
# TODO : Infinite Pagination
get "/" do
  SQL.query "select content, url from main_posts where wdyw='1'" do |data|
    rd = data
    render "src/views/home.ecr"
  end
end

# Read article with `:id` as article param
# `query_one` for getting only one article data
get "/read/:id" do |env|
  id = env.params.url["id"]
  data = SQL.query_one? "select content from main_posts where url=? and wdyw='1'", id, as: {String}
  if data
    rd = data.split("<~|~>")
    tags = rd[2].split(",")
    render "src/views/detailpost.ecr"
  else
    env.redirect "/404"
  end
end

# todo : tags/:id
get "/tags/:id" do |env|
  id = env.params.url["id"]
  env.redirect "/404"
end

# 404 Page
get "/404" do
  render "src/views/404.ecr"
end

# helper function
def reading_time(wc)
  return (wc / 200.0).ceil.to_i
end
