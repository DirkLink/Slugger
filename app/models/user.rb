class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
  
  validates_uniqueness_of    :email,     :case_sensitive => false, :allow_blank => true, :if => :email_changed?
  validates_format_of    :email,    :with  => Devise.email_regexp, :allow_blank => true, :if => :email_changed?
  validates_presence_of    :password, :username, :first_name, :on=>:create
  validates_confirmation_of    :password, :on=>:create
  validates_length_of    :password, :within => Devise.password_length, :allow_blank => true
  
  has_one :itinerary
  has_one :preference
  has_many :badges
  has_one :car


  def self.all_except(user)
    where.not(id: user.id)
  end


  def nearest_overall
    users = User.all_except(self).joins(:itinerary).where("home_lat is not null OR home_lng is not null OR work_lat is not null OR work_lng is not null")
    users = users.select do |u|
       u.itinerary.home_distance(self.itinerary) < 20 && u.itinerary.work_distance(self.itinerary) < 20
    end
    users
  end 
end
