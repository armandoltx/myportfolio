class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout proc { false if request.xhr? }
  include DeviseWhitelist
  include CurrentUserConcern
  include DefaultPageContentConcern
end