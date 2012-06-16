class MeetupsController < ApplicationController

  include MeetupsHelper

  def join
    meetup = Meetup.find(params[:id])
    unless current_user.is_attending meetup
      meetup.users << current_user
      meetup.save!
    end
    respond_to do |format|
      format.html
    end
  end

  def create
    category = Category.find(params[:category_id])
    location = params[:location_name]
    @meetup = Meetup.new
    @meetup.category = category
    @meetup.location = location
    @meetup.users << current_user

    respond_to do |format|
      if @meetup.save
        format.html { redirect_to :controller => "categories", :action=> "show", :id => params[:category_id],  notice: 'Meetup was successfully created! :)' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def new
    category = Category.find(params[:category_id])
    @category_id = params[:category_id]
    @meetup = Meetup.new
    @meetup.category = category
    @suggestions = indications_for get_yelp_category_for(category.category)
    respond_to do |format|
      format.html
    end
  end

end
