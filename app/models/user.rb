class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
  		 # :registerable, ここのコメントアウトを外すと/users/sign_upで登録可
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
end
