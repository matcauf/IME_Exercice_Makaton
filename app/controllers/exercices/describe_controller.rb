#encoding: utf-8
class Exercices::DescribeController < ApplicationController
   include Exercices::DescribeHelper
   
  def hard
   sql_string = initialize_exercice
   if !sql_string
     redirect_to root_path, :alert => "Aucune description de disponible"
     return
   end
   @answers = Pictogramme.where(sql_string).random(10-@pictogrammes.size) if 10-@pictogrammes.size < 10
   @answers.concat @pictogrammes
   @answers = @answers.shuffle
   render 'hard'
  end
  
  def easy
   sql_string = initialize_exercice
   if !sql_string
     redirect_to root_path, :alert => "Aucune description de disponible"
     return
   end
   @answers = Pictogramme.where(sql_string).random(10-@pictogrammes.size) if 10-@pictogrammes.size < 10
   @answers.concat @pictogrammes
   @answers = @answers.shuffle
   render 'easy'
  end
  
  def very_easy
   sql_string = initialize_exercice
   if !sql_string
     redirect_to root_path, :alert => "Aucune description de disponible"
     return
   end
   @sujets = Pictogramme.where(sql_string + " AND pictogrammes.grammar_pictogramme_id = "+ @question.pictogrammes[0].grammar_pictogramme.id.to_s ).random(2)
   @verbes = Pictogramme.where(sql_string + " AND pictogrammes.grammar_pictogramme_id = "+ @question.pictogrammes[1].grammar_pictogramme.id.to_s ).random(2)
   
   @sujets.each do |pictogramme|     
      sql_string += " AND pictogrammes.id != " + pictogramme.id.to_s
   end
   
   @complements = Pictogramme.where(sql_string + " AND pictogrammes.grammar_pictogramme_id = "+ @question.pictogrammes[2].grammar_pictogramme.id.to_s ).random(2)
   @sujets << @question.pictogrammes[0]
   @sujets  = @sujets.shuffle
   
   @verbes << @question.pictogrammes[1]
   @verbes  = @verbes.shuffle
   
   @complements << @question.pictogrammes[2]
   @complements  = @complements.shuffle
   render 'very_easy'
  end
end
