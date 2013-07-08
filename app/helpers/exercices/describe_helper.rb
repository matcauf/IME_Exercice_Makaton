module Exercices::DescribeHelper
  
  def initialize_exercice 
   @question = DescribePicture.random
   if @question.nil?
     return false
   end
   @pictogrammes = @question.pictogrammes
   first_passage = true
   sql_string = ""
   @pictogrammes.each do |pictogramme|
     if first_passage
        sql_string = " pictogrammes.id != " + pictogramme.id.to_s
        first_passage = false
     else
      sql_string += " AND pictogrammes.id != " + pictogramme.id.to_s
     end
   end
   return sql_string
  end
  
  
end
