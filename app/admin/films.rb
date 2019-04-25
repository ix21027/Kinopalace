ActiveAdmin.register Film do
  config.filters = false
  permit_params :title, :description, :duration, :genre, :times, :poster, :imdbRating, :age_rating  
  
  before_create do |f|
    f.times.split(/,/).sort!.join(",")
  end
  
  
  
  index do
    selectable_column
    column 'Image' do |f| image_tag f.poster.url, size: "80x118"  end
    column :title
    column :times
    column :description #do |text|
      #text.description[0..100] + "..."
    #end
    actions
  end
  
  form do |f|
    f.inputs "New Film" do
      f.input :title
      f.input :duration, as: :number
      f.input :imdbRating, as: :number, label: "IMDB Rating", in: 1..10
      f.input :age_rating, label: "MPAA Rating", as: :tags, collection: ["G","PG","PG-13","R"]
      f.input :genre, as: :tags, collection: %w[adventure action fantasy drama comedy thriller horror musical romantic western documentary]
      f.input :times, as: :tags, collection: %w[10:00]# 12:00 15:00 17:00 20:00]
      f.input :description, as: :text, input_html: { rows: 3, cols: 10, maxlength: 470}
      f.input :poster, :image_preview => true  
    end
    f.actions
  end
  
  

end
