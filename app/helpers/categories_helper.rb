module CategoriesHelper
  def category_icon_css_class(category)
    return "mdi" unless category.is_a?(Category)

    name = category.name.underscore

    case name
    when "food"
      "mdi mdi-food-variant"
    when "active"
      "mdi mdi-bike"
    when "cultural"
      "mdi mdi-church"
    when "bar"
      "mdi mdi-beer"
    when "shopping"
      "mdi mdi-shopping"
    when "party"
      "mdi mdi-weather-night"
    end
  end

  def category_item_css_class(category)
    if category.is_a?(Category)
      active = category.id == params[:category_id].to_i
      "category-item category-item-#{category.name.underscore} #{'is-active' if active} "
    else
      "category-item"
    end
  end

  def category_banner_css_class(category)
    if category.is_a?(Category)
      "category-banner category-banner-#{category.name.underscore}"
    else
      "category-banner"
    end
  end
end
