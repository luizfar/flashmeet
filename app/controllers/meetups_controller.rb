class MeetupsController < ApplicationController
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
end
