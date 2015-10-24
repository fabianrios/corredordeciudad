class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_taggable
  has_many :eventos, dependent: :destroy
  
  mount_uploader :logo, LogoUploader
  mount_uploader :imagen, PicUploader
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
