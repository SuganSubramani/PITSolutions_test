module ApplicationHelper
	# remove link doesn't work!!!!!!!!!
  	def link_to_remove_fields(name, f)
    	f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  	end

  	# This now sort of works but the field disappears when it is created after about a second.  It also appears at the top of the page.  
  	def link_to_add_fields(name, f, association)  
    	new_object = f.object.class.reflect_on_association(association).klass.new  
    	fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|  
      		render(association.to_s.singularize + "_fields", :f => builder)  
    	end  
    	link_to name, "#", :onclick => h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"), remote: true 
  	end 
 #  	def link_to_add_fields(name, f, association)
 #  		new_object = f.object.class.reflect_on_association(association).klass.new
 #  		fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
 #    		render(association.to_s.singularize + "_fields", :f => builder)
 #  		end
 #  		link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
	# end
end
