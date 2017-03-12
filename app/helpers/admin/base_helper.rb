module Admin::BaseHelper

  def add_active_class path 
    if path == request.path
      "active"
    else 
      if path == admin_root_path
        if request.path.include?('sessions')
          return "active"
        end
      end

      if path == admin_categories_path
        if (request.path.include?('category') || request.path.include?('categories'))

          return "active"
        end
      end

      if path == admin_products_path
        if request.path.include?('product')
          return "active"
        end
      end

      ""
    end
  end

end