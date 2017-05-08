class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
    
    session[:user_id] = user.id
    #로그인이 성공했을때  
    redirect_to contents_path
    else
    #로그인 실패했을때
    flash[:alert] = '당신은 이메일 혹은 비밀번호가 잘못되었습니다.'
    render 'new'
    end
  
  end
  def destroy
    session.delete(:user_id)
    @current_user =nil
    
    redirect_to contents_path
  end
end
