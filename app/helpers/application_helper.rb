module ApplicationHelper
  def path_to_login
    Rails.env.production? ? "/auth/twitter" : "/auth/developer"
  end
end
