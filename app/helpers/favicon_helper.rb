module FaviconHelper
  def select_favicon(controller_name, action_name)
    case "#{controller_name}##{action_name}"
    when "flights#index"
      favicon_link_tag asset_path("icon.svg"), id: "favicon"
    when "bookings#new"
      favicon_link_tag asset_path("plane.png"), id: "favicon"
    else
      favicon_link_tag asset_path("icon.svg"), id: "favicon"
    end
  end
end
