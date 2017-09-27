class MessagesController < ApplicationController
  
  include AjaxModalRails::Controller

  def index
  end

  def new
  end

  def create
    if params[:message].blank?
      flash[:alert] = "Please write a message"
      render :new
    else
      session[:last_message] = params[:message]
      redirect_to messages_path
    end
    
  end

end