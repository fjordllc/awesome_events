# frozen_string_literal: true

module ApplicationHelper
  def url_for_github(user)
    "https://github.com/#{user.name}"
  end
end
