# site Index, query all content inside database
# and show all the content
# TODO : - Infinite Pagination
#        - fix all of this thing
get "/" do
  SQL.query "select title, content, url from main_post where wdyw='1'" do |data|
    rd = data
    render "src/views/home.ecr"
  end
end

# Read article with `:id` as article param
# `query_one` for getting only one article data
get "/read/:id" do |env|
  id = env.params.url["id"]
  data = toone("select title, content, date from main_post where url='#{id}' and wdyw='1'")
  if data
    title = data["title"]
    date = data["date"]
    content = data["content"]
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
# fix this
def reading_time(wc)
  return (wc / 200.0).ceil.to_i
end

def toone(query)
  arr = {} of String => String
  SQL.query query do |data|
    data.each do
      title = data.read(String)
      content = data.read(String)
      date = data.read(String)
      arr["title"] = title
      arr["content"] = content
      arr["date"] = date
    end
  end
  arr
end
