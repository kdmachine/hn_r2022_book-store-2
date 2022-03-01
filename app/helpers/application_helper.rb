module ApplicationHelper
  include Pagy::Frontend

  def full_title page_title
    base_title = t "base_title_page"
    page_title.blank? ? base_title : "#{page_title} | #{base_title}"
  end

  def check_logged_in
    return if logged_in?

    flash[:danger] = t "must_login"
    redirect_to login_path
  end
end
