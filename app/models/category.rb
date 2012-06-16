class Category < ActiveRecord::Base

  def uncapitalized_name
    self.category[0, 1].downcase + self.category[1..-1]
  end
end
