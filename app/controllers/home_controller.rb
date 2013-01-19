class HomeController < ApplicationController
  def index
    @users = User.all
    if session[:poem] && user_signed_in?
      current_user.poems.create session[:poem]
      session[:poem] = nil
      redirect_to my_poems_poems_path
    else
      @poem = Poem.new
    end
  end
end
