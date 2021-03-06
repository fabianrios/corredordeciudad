class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  realtime_controller({:queue => :redis}) # instruct all requests to enable realtime support via redis
  
  
  def realtime_user_id
    if current_user.present?
      return current_user.id # if using devise, change this to current_user.id
    end
  end

  def realtime_server_url
    # point this to your node.js-socket.io-redis/zmq realtime server (you can set this later)
    if Rails.env.production?
      return 'https://obscure-stream-1971.herokuapp.com/'
    else
      return 'http://127.0.0.1:5001'
    end
  end
  
  def configure_permitted_parameters
      # tag_list must be an Array dahh  
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :nombre, :lugar, :direccion, :telefono, :comuna, :barrio, :categoria, :logo, :web, :imagen, :descripcion, :user_id, :admin, {:tag_list => []}) }
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :nombre, :lugar, :direccion, :telefono, :comuna, :barrio, :categoria, :logo, :web, :imagen, :descripcion, :user_id, :admin, {:tag_list => []})}
  end
  
  rescue_from ActiveRecord::RecordNotFound do
    respond_to do |type|
      type.all  { render :nothing => true, :status => 404 }
    end
  end
end
