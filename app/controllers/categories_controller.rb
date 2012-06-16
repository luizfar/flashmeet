class CategoriesController < ApplicationController
  def index
    @categories = Category.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  def show
    @category = Category.find(params[:id])
    all_meetups = Meetup.where(:category_id => @category.id)
    @meetups_i_am_attending = all_meetups.find_all { |meetup| current_user.is_attending meetup }
    @meetups_i_am_not_attending = all_meetups.find_all { |meetup| !current_user.is_attending meetup }

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end
end
