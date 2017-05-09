module CategoriesHelper
  def show
    @price_rule = @category.get_price_rule(1)
    @products = @category.products.paginate(page: params[:page], per_page: 10).order(updated_at: :desc)
  end

end
