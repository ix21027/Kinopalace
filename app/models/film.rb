class Film < ApplicationRecord
  has_many :sessions
  has_attached_file :poster, styles: { large: "300x450>", medium: "200x350", thumb: "100x100",thumbnail: "60x60#" }
  validates_attachment_content_type :poster, content_type: /\Aimage/
  
  validates_presence_of :title, :times
  validates :times, format: /\A((([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9])[,]?)+\Z/
  
  before_validation {self.times = times.split(/,/).sort!.join(",")}
  
  def times_s
    self.times.gsub ',', " ".html_safe
  end
  
end
