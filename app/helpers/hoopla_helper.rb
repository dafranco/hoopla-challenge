module HooplaHelper
  def get_id_from_href(href)
    href.split('/').last
  end
end