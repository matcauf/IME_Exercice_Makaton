#encoding: utf-8
class UsersController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!
  skip_before_filter :require_no_authentication
  

  

  def pictures_exercices_stats
    authorize! :pictures_exercices_stats, @user, :message => "Vous n'étes pas autorisé à voir cette page"
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user.pictures_exercices_stats_to_json(params[:category_name], params[:gallery_name] ,params[:type])  }
    end
  end

  def pictures_galleries_stats
    authorize! :pictures_galleries_stats, @user, :message => "Vous n'étes pas autorisé à voir cette page"
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user.pictures_galleries_stats_to_json(params[:category_name],params[:type])  }
    end
  end

  def pictures_categories_stats
    authorize! :pictures_categories_stats, @user, :message => "Vous n'étes pas autorisé à voir cette page"
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user.pictures_categories_stats_to_json(params[:type])  }
    end
  end

  def show
    authorize! :show, @user, :message => "Vous n'étes pas autorisé à voir cette page"
    @user = User.find(params[:id])
    @categories = Category.all
    @stats = Hash.new
    @categories.each do |category|
      category.galleries.each do |gallery|
        @stats[gallery] = gallery.user_stats.find_by_user_id(@user.id)
      end
    end

  end

end