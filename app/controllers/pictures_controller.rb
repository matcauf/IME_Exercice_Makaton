#encoding: utf-8
class PicturesController < ApplicationController
  authorize_resource
  
  def list
    @pictures = Picture.where(gallery_id: params[:gallery_id],image_type_id: (ImageType.find_by_name(params[:image_type])))
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pictures.map{|picture| picture.to_jq_upload } }
    end
  end
   

  def create
    @picture = Picture.new(params[:picture])   
      respond_to do |format|
      if @picture.save
        format.html {
          render :json => [@picture.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: {files: [@picture.to_jq_upload]}, status: :created, location: @picture }
      else
        format.html { render action: "new" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    render nothing: true
  end
  
end


