class WelcomeController < ApplicationController
  before_action :set_tracked_datum, only: [:show, :edit, :update, :destroy]

  def index
  end
end
