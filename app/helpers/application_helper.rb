module ApplicationHelper
  class NavItem
    attr_reader :title, :path
    def initialize(title, path)
      @title = title
      @path = path
    end
  end

  def nav_items
    [
      NavItem.new("Song Queue", main_app.root_path),
      NavItem.new("Recordings", main_app.recordings_path),
      NavItem.new("About", main_app.about_path)
    ].tap do |items|
      if current_user
        if current_user.admin?
          items << NavItem.new("Add a Song", main_app.new_song_path)
        end
        items << NavItem.new("Sign Out", users.sign_out_path)
      else
        items << NavItem.new("Sign In", users.sign_in_path)
        items << NavItem.new("Sign Up", main_app.new_user_path)
      end
    end
  end

  def current_page_title
    @current_page_title ||= nav_items.detect { |item| current_page?(item.path) }&.title
  end
end
