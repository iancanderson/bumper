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
    ]
  end

  def current_page_title
    @current_page_title ||= nav_items.detect { |item| current_page?(item.path) }&.title
  end
end
