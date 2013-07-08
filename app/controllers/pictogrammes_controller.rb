#encoding: utf-8
class PictogrammesController < ApplicationController
  authorize_resource
  # GET /pictogrammes
  # GET /pictogrammes.json
  def index
    if params[:q]!= nil
    #if char 3 is blanck delete begin of char
    params[:q] = params[:q][3..-1] if params[:q][2] == " "
    params[:q] = params[:q][4..-1] if params[:q][3] == " "
    end
    @pictogrammes = Pictogramme.where("name like ?", "%#{params[:q]}%")
   respond_to do |format|
    format.html
    format.json { render :json => @pictogrammes.map(&:attributes) }
  end
  end

 def list
    @pictogrammes = Pictogramme.where(level_pictogramme_id: params[:level_pictogramme_id])

    respond_to do |format|
      format.html 
      format.json { render json: @pictogrammes.map{|pictogramme| pictogramme.to_jq_upload } }
    end
  end
  

  
  def create
    @pictogramme = Pictogramme.new(params[:pictogramme])

     respond_to do |format|
      if @pictogramme.save
        format.html {
          render :json => [@pictogramme.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: {files: [@pictogramme.to_jq_upload]}, status: :created, location: @pictogramme }
      else
        format.html { render action: "new" }
        format.json { render json: @pictogramme.errors }
      end
    end
  end
end
