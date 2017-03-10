class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.roots.page(params[:page] || 1).per_page(params[:per_page] || 10).order(id: "desc")
  end

  def new
  end
end
