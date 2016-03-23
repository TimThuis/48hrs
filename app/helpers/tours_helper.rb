module ToursHelper
  def tour_banner_css_class(tour)
    "banner-photo banner-photo-#{tour.category.name.underscore}"
  end
end
