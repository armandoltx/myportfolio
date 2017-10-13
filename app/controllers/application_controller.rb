git diff class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include CurrentUserConcern
  include DefaultPageContentConcern
  
  before_action :set_copyright
  
  def set_copyright
    @copyright = LtxViewTool::Renderer.copyright('ArmandoLtx', 'All Rights Reserved')
  end
end

module LtxViewTool
  class Renderer
    def self.copyright(name, msg)
      "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
    end
  end
end
