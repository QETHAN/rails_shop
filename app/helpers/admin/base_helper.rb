module Admin::BaseHelper

  def add_active_class path 
    controller = params[:controller]
    if path.include?(controller) || ((path+'/sessions').include?(controller))
      "active"
    else 
      ""
    end
  end

end