class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def tag
    @image_id = params[:image_id]
    @image = Image.find(@image_id)
    tag = params[:tag]
    @image.pet_list << tag
    @image.save
   
    @name = tag
    respond_to do |format|
      format.js { render :layout => false }
    end
  end

  def tag_suggestions
    @suggestions = Pet.where(["name LIKE ?", "%#{params[:text]}%"]).limit(5)
 
    respond_to do |format|
      format.html { render :layout => false }
      format.js { render :file => "tag_suggestions.html", :layout => false }
    end
  end
end
