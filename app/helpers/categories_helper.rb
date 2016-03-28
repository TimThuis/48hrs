module CategoriesHelper
  def category_banner_css_class(category)
    if category.is_a?(Category)
      "category-banner category-banner-#{category.name.underscore}"
    else
      "category-banner"
    end
  end
end
