class PhotosController < ApplicationController

  def index
    @all_photos = Photo.all.order({ :created_at => :desc })

    render({ :template => "photos_templates/index" })
  end

  def show
    photo_id = params.fetch("id")

    @the_photo = Photo.where({ :id => photo_id })[0]

    render({ :template => "photos_templates/show" })
  end

  def add
    image_url = params.fetch("input_image")
    caption = params.fetch("input_caption")
    owner_id = params.fetch("input_owner_id")
    @the_photo = Photo.new 
    @the_photo.image = image_url
    @the_photo.caption = caption
    @the_photo.owner_id = owner_id

    @the_photo.save 

    redirect_to("/photos/" + @the_photo.id.to_s)
  end

  def update
    photo_id = params.fetch("id")

    @the_photo = Photo.where({ :id => photo_id })[0]

    @the_photo.image = params.fetch("input_image")
    @the_photo.caption = params.fetch("input_caption")

    @the_photo.save

    redirect_to("/photos/" + @the_photo.id.to_s)
  end

  def delete 
    photo_id = params.fetch("id")

    @the_photo = Photo.where({ :id => photo_id })[0]

    @the_photo.destroy
    
    redirect_to("/photos")
  end
end
