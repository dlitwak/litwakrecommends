module ApplicationHelper
  def title
    base_title = "Litwak Recommends | Travel Blog"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
