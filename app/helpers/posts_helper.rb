module PostsHelper
  def get_gist(uri)
    "<script src='#{uri}'></script>"
  end
end
