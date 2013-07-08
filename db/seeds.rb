# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_username :username => ENV['ADMIN_NAME'].dup,  :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.username
user.add_role :admin
user.remove_role :user
user = User.find_or_create_by_username :username => "superadmin",  :password => "changemoi", :password_confirmation => "changemoi"
puts 'user: ' << user.username
user.add_role :super_admin
user.remove_role :user
user = User.find_or_create_by_username :username => "createur",  :password => "changemoi", :password_confirmation => "changemoi"
puts 'user: ' << user.username
user.add_role :super_admin
user.remove_role :user

image_type = ImageType.find_or_create_by_name :name =>'photo'
puts 'type: ' << image_type.name
image_type2 = ImageType.find_or_create_by_name :name =>'dessin'
puts 'type: ' << image_type2.name
grammar_pictogramme = GrammarPictogramme.find_or_create_by_name :name =>'nom'
puts 'grammar: ' << grammar_pictogramme.name
grammar_pictogramme1 = GrammarPictogramme.find_or_create_by_name :name =>'determinant'
puts 'grammar: ' << grammar_pictogramme1.name
grammar_pictogramme2 = GrammarPictogramme.find_or_create_by_name :name =>'verbe'
puts 'grammar: ' << grammar_pictogramme2.name
level = LevelPictogramme.find_or_create_by_name :name =>'niveau 1'
puts 'level: ' << level.name
level2 = LevelPictogramme.find_or_create_by_name :name =>'niveau 2'
puts 'level: ' << level2.name
level3 = LevelPictogramme.find_or_create_by_name :name =>'niveau 3'
puts 'level: ' << level3.name
level4 = LevelPictogramme.find_or_create_by_name :name =>'niveau 4'
puts 'level: ' << level4.name
level5 = LevelPictogramme.find_or_create_by_name :name =>'niveau 5'
puts 'level: ' << level5.name
level6 = LevelPictogramme.find_or_create_by_name :name =>'niveau 6'
puts 'level: ' << level6.name
level7 = LevelPictogramme.find_or_create_by_name :name =>'niveau 7'
puts 'level: ' << level7.name
level8 = LevelPictogramme.find_or_create_by_name :name =>'niveau 8'
puts 'level: ' << level8.name
level9 = LevelPictogramme.find_or_create_by_name :name => 'complément'
puts 'level: ' << level9.name



