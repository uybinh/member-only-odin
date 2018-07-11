module ApplicationHelper
  def full_title(page_title = "")
    base_title = "Clubhouse App"
    full_page_title = page_title.empty? ? base_title : "#{page_title} - #{base_title}"
  end

  def logged_in_user
    unless logged_in?
      redirect_to root_path
    end
  end

end
