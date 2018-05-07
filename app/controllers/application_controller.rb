class ApplicationController < ActionController::Base
  $time_now = (Time.now + 3.hours).to_s(:time)
end
