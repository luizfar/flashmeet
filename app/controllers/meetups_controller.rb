class MeetupsController < ApplicationController
  def join
    meetup = Meetup.find(params[:id])
    meetup.users << current_user
    meetup.save!
    respond_to do |format|
      format.html
    end
  end
end
