module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end
  
    def drop_down_menu(title,action,type,number)
      
     content_tag :li, :class => 'dropdown-submenu' do
      concat (content_tag :a, :tabindex => '-1', :href => '#' do
        title
      end)
      concat (content_tag :ul , :class => 'dropdown-menu' do
         concat ( content_tag :li do
       link_to "Aléatoire", {:controller => "/exercices/categories_galleries", :action => action, :id_category => "false", :id_gallery=> "false", :type=> type}
     end)
       concat (content_tag :li, :class => 'dropdown-submenu' do
        (@navigation_categories.collect do |k,v|
            if v.length >= number
              concat (content_tag :li, :class => 'dropdown-submenu'  do
               concat (content_tag :a, :tabindex => '-1', :href => '#' do
                  k.name
                end)
                 concat (content_tag :ul , :class => 'dropdown-menu' do
                    concat ( content_tag :li do
       link_to "Aléatoire", {:controller => "/exercices/categories_galleries", :action => action, :id_category => k.id, :id_gallery=> "false", :type=> type}
         end)
              (v.collect do |gallery|
                  concat (content_tag :li do
                   link_to gallery.pictogramme.name,{:controller => "/exercices/categories_galleries", :action => action, :id_category => k.id, :id_gallery=> gallery.id, :type=> type}
                  end)
              end.join("\n").html_safe)
                end)
              end) #end :li, :class => 'dropdown-submenu'
            end #end if
            
          end.join("\n").html_safe)#end navigation
        end) #end :li, :class => 'dropdown-submenu'
        
      end) #end :ul , :class => 'dropdown-menu'
    end #end :li, :class => 'dropdown-submenu'
    
   
  end
  
  

end