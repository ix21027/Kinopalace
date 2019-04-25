class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :genres
  has_many :age_ratings
  has_many :user_sessions
  has_many :users_film_list
  
  #after creating create users film list 
  Ratings = %w[G PG PG-13 R] 
  Times   = %w[MORNING AFTERNOON EVENING NIGHT]
  Genres  = %w[ADVENTURE ACTION DRAMA FANTASY COMEDY THRILLER HORROR MUSICAL ROMANTIC WESTERN DOCUMENTARY]
  
  after_create do
    Genres.each  { |n| self.genres.create name: n, coef: 0        }  
    Times.each   { |t| self.user_sessions.create time: t, coef: 0 }
    Ratings.each { |r| self.age_ratings.create rating: r, coef: 0 }
  end
  
end

