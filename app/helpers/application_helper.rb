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
      NavItem.new("Song Queue", root_path),
      NavItem.new("Recordings", recordings_path),
      NavItem.new("About", about_path)
    ].tap do |items|
      if current_user&.admin?
        items << NavItem.new("Add a Song", new_song_path)
      end
    end
  end

  def current_page_title
    @current_page_title ||= nav_items.detect { |item| current_page?(item.path) }&.title
  end
end
