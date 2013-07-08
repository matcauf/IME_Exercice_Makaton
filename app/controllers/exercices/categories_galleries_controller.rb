#encoding: utf-8
class Exercices::CategoriesGalleriesController < ApplicationController
  include Exercices::CategoriesGalleriesHelper
  def three_different
    answers_gall = initialize_exercice(params,3)
    case params[:type]
    when 'photo3DIFphotos'
      temp = @gallery.pictures.where('image_type_id = 1').random(2)
      @question = temp[0].image.url(:small)
      @true_answer = temp[1].image.url(:small)
      answers_gall.each do |answer_gall|
        @answers << answer_gall.pictures.where('image_type_id = 1').random.image.url(:small)
      end

    when 'photo3DIFdessins'
      @question = @gallery.pictures.where('image_type_id = 1').random.image.url(:small)
      @true_answer = @gallery.pictures.where('image_type_id = 2').random.image.url(:small)
      answers_gall.each do |answer_gall|
        @answers << answer_gall.pictures.where('image_type_id = 2').random.image.url(:small)
      end

    when 'photo3DIFpictogrammes'
      @question = @gallery.pictures.where('image_type_id = 1').random.image.url(:small)
      @true_answer = @gallery.pictogramme.picto.url(:small)
      answers_gall.each do |answer_gall|
        @answers << answer_gall.pictogramme.picto.url(:small)
      end
      
    when 'photo3DIFwords'
      @question = @gallery.pictures.where('image_type_id = 1').random.image.url(:small)
      @true_answer = @gallery.pictogramme.name
      answers_gall.each do |answer_gall|
        @answers << answer_gall.pictogramme.name
      end
      render 'three_words'
      return
      
    else
    redirect_to root_path, :alert => "Error"
    return
    end

    render 'three_pictures'
  end

  def three_identique
    answers_gall = initialize_exercice(params,3)
    case params[:type]
    when 'photo3IDphotos'
      @question =  @gallery.pictures.where('image_type_id = 1').random.image.url(:small)
      @true_answer = @question
      answers_gall.each do |answer_gall|
        @answers << answer_gall.pictures.where('image_type_id = 1').random.image.url(:small)
      end

    when 'dessin3IDdessins'
      @question =  @gallery.pictures.where('image_type_id = 2').random.image.url(:small)
      @true_answer = @question
      answers_gall.each do |answer_gall|
        @answers << answer_gall.pictures.where('image_type_id = 2').random.image.url(:small)
      end

    when 'pictogramme3IDpictogrammes'
      @question = @gallery.pictogramme.picto.url(:small)
      @true_answer =  @question
      answers_gall.each do |answer_gall|
        @answers << answer_gall.pictogramme.picto.url(:small)
      end
    else
    redirect_to root_path, :alert => "Error"
    return
    end
    render 'three_pictures'
  end

  def two_different
    answer_gall = initialize_exercice(params,2)
    case params[:type]
    when 'photo2DIFphotos'
      temp = @gallery.pictures.where('image_type_id = 1').random(2)
      @question = temp[0].image.url(:small)
      @true_answer = temp[1].image.url(:small)
      @answer = answer_gall.pictures.where('image_type_id = 1').random.image.url(:small)

    when 'photo2DIFdessins'
      @question = @gallery.pictures.where('image_type_id = 1').random.image.url(:small)
      @true_answer = @gallery.pictures.where('image_type_id = 2').random.image.url(:small)
      @answer = answer_gall.pictures.where('image_type_id = 2').random.image.url(:small)

    when 'photo2DIFpictogrammes'
      @question = @gallery.pictures.where('image_type_id = 1').random.image.url(:small)
      @true_answer = @gallery.pictogramme.picto.url(:small)
      @answer = answer_gall.pictogramme.picto.url(:small)
      
    when 'photo2DIFwords'
      @question = @gallery.pictures.where('image_type_id = 1').random.image.url(:small)
      @true_answer = @gallery.pictogramme.name
      @answer = answer_gall.pictogramme.name

      render 'two_words'
      return
    else
    redirect_to root_path, :alert => "Error"
    return
    end
    render 'two_pictures'
  end

  def two_identique
    answer_gall = initialize_exercice(params,2)
    case params[:type]
    when 'photo2IDphotos'
      @question =  @gallery.pictures.where('image_type_id = 1').random.image.url(:small)
      @true_answer = @question
      @answer = answer_gall.pictures.where('image_type_id = 1').random.image.url(:small)

    when 'dessin2IDdessins'
      @question =  @gallery.pictures.where('image_type_id = 2').random.image.url(:small)
      @true_answer = @question
      @answer = answer_gall.pictures.where('image_type_id = 2').random.image.url(:small)
    when 'pictogramme2IDpictogrammes'
      @question = @gallery.pictogramme.picto.url(:small)
      @true_answer =  @question
      @answer = answer_gall.pictogramme.picto.url(:small)
    else
    redirect_to root_path, :alert => "Error"
    return
    end
    render 'two_pictures'
  end

  def two_white
    initialize_exercice(params,2)
    @answer = ActionController::Base.helpers.asset_path('white.png')
    case params[:type]
    when 'photo2Whitephotos'
      @question =  @gallery.pictures.where('image_type_id = 1').random.image.url(:small)
      @true_answer = @question
    when 'dessin2Whitedessins'
      @question =  @gallery.pictures.where('image_type_id = 2').random.image.url(:small)
      @true_answer = @question
    when 'pictogramme2Whitepictogrammes'
      @question = @gallery.pictogramme.picto.url(:small)
      @true_answer =  @question
    else
    redirect_to root_path, :alert => "Error"
    return
    end
    render 'two_pictures'
  end

end
