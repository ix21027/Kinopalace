class FilmList
  def initialize(user, params=nil)
    @user = user
    @params = params
  end  
  
  Ratings = %w[G PG PG-13 R] 
  Times   = %w[MORNING AFTERNOON EVENING NIGHT]
  Genres  = %w[ADVENTURE ACTION DRAMA FANTASY COMEDY THRILLER HORROR MUSICAL ROMANTIC WESTERN DOCUMENTARY]
  
  IMDBCoef = 0.3 
  TimeCoef = 0.3
  MPAACoef = 0.2
  GenreCoef = 0.2
  
  def build 
    if @params
      Genres.each  { |n| g = @user.genres.find_by(name: n);          g.update(coef: @params[n])  }
      Times.each   { |t| s = @user.user_sessions.find_by(time: t);   s.update(coef: @params[t])  }
      Ratings.each { |r| a_r = @user.age_ratings.find_by(rating: r); a_r.update(coef: @params[r]) }
    end
               
    Film.all.each do |f|
      r = 0.0 
      f.genres.each { |g| r+= (@user.genres.find_by(name: g.upcase).coef.to_i * GenreCoef)  }
      f.times_all.each do |t|
        if t < "24:00"
          time = "NIGHT"
        elsif t < "20:00"
          time = "EVENING"
        elsif t < "17:00"
          time = "AFTERNOON"  
        elsif t < "12:00"
          time = "MORNING"
        end
        r += (@user.user_sessions.find_by(time: time).coef.to_i * TimeCoef)
      end
      r += (@user.age_ratings.find_by(rating: f.age_rating).coef.to_i * MPAACoef)
      r += (f.imdbRating * IMDBCoef)
      list = f.users_film_lists.find_or_create_by(user: @user)
      list.update(rating: r.round(1))
    end  
  end 
  
end