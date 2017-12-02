require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception
  layout proc { false if request.xhr? }
  include DeviseWhitelist
  include CurrentUserConcern
  include DefaultPageContentConcern
end