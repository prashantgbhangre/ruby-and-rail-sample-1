module ApplicationHelper
  def fullTitle(page_title)
    base_title = "Welcome to parami soft"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
