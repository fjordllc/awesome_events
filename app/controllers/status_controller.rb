# frozen_string_literal: true

class StatusController < ApplicationController
  skip_before_action :authenticate
  def index; end
end
