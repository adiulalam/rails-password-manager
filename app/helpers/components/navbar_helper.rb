module Components::NavbarHelper
  def render_navbar(home_path:, new_password_path:)
    render "components/ui/navbar", home_path: home_path, new_password_path: new_password_path
  end
end
