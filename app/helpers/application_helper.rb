module ApplicationHelper
  
   def controller_stylesheet_link_tag
    stylesheet = "#{params[:controller]}.css"

    if File.exists?(File.join(Rails.public_path, 'stylesheets', stylesheet))
      stylesheet_link_tag stylesheet
    end
  end

  # Will load javascript file on page load based on controller and action name
  def controller_javascript_include_tag
    javascript = "#{params[:controller]}/#{params[:action]}.js"

    if File.exists?(File.join(Rails.public_path, 'javascripts', javascript))
      javascript_include_tag javascript
    end
  end
  
  
  # best in place alows inline editing.  Modified to support growing fields and tab between fields.
  
  def best_in_place(object, field, opts = {})
    opts[:type] ||= :input
    opts[:collection] ||= []

    field = field.to_s
    value = object.send(field).blank? ? "" : object.send(field)
    collection = nil
    if opts[:type] == :select && !opts[:collection].blank?
      v = object.send(field)
      value = Hash[opts[:collection]][!!(v =~ /^[0-9]+$/) ? v.to_i : v] || "Please Select..."
      collection = opts[:collection].to_json
    end
    if opts[:type] == :checkbox
      fieldValue = !!object.send(field)
      if opts[:collection].blank? || opts[:collection].size != 2
        opts[:collection] = ["No", "Yes"]
      end
      value = fieldValue ? opts[:collection][1] : opts[:collection][0]
      collection = opts[:collection].to_json
    end
    extraclass = "'"
    if !opts[:class].blank? 
      extraclass = opts[:class] + "'"
    end
      
    out = "<div class='best_in_place " + extraclass
    out << " id='best_in_place_#{object.class.to_s.gsub("::", "_").underscore}_#{field}'"
    out << " data-url='#{opts[:path].blank? ? url_for(object).to_s : url_for(opts[:path])}'"
    out << " data-object='#{object.class.to_s.gsub("::", "_").underscore}'"
    out << " data-collection='#{collection}'" unless collection.blank?
    out << " data-attribute='#{field}'"
    out << " data-activator='#{opts[:activator]}'" unless opts[:activator].blank?
    out << " data-nil='#{opts[:nil].to_s}'" unless opts[:nil].blank?
    out << " data-type='#{opts[:type].to_s}'"
    if !opts[:sanitize].nil? && !opts[:sanitize]
      out << " data-sanitize='false'>"
      out << sanitize(value.to_s, :tags => %w(b i u s a strong em p h1 h2 h3 h4 h5 ul li ol hr pre span img), :attributes => %w(id class))
    else
      out << ">#{sanitize(value.to_s, :tags => nil, :attributes => nil)}"
    end
    out << "</div>"
    return out
  end
  
  def editablefieldcreate(field_name,field_pointer, opts = {})

    if opts[:divclass].nil? then
      divClass='class="myaccountcontentitem"'
    else
      divClass=opts[:divclass]
    end rescue divClass='class="myacountcontentitem"'
  
    if field_pointer[field_name].class == String and field_pointer[field_name].length > 85 then
      ('<div id="field_'+field_name.to_s + '"' + divClass + '>' +
          best_in_place(field_pointer, field_name, :type => :textarea, :nil => "Click me to add content!", :class=>opts[:class]).html_safe +
          '</div>').html_safe
    else
          
      ('<div id="field_'+field_name.to_s + '"' + divClass + '>' +
          best_in_place(field_pointer, field_name, :type => :input, :nil => "Click me to add content!", :class=>opts[:class]).html_safe +
          '</div>').html_safe
    end
  end 
  
  
end
