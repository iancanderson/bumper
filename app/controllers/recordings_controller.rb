class RecordingsController < ApplicationController
  def index
    @recordings = Recording.order(created_at: :desc)
  end
end
