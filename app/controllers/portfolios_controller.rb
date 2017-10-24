class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:show, :edit, :update, :destroy]
  layout 'portfolio'
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all # petergate gem for  authorization check the user model to see what we have created

  def index
    @portfolio_items ||= Portfolio.by_position
  end

  ### SCOPES
  def angular
    @angular_portfolio_items ||= Portfolio.angular
  end
  ##########

  def show
  end

  def new
    @portfolio_item ||= Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item ||= Portfolio.new(portfolio_params)

    if @portfolio_item.save
      flash[:message] = 'Portfolio successfully created'
      redirect_to portfolios_path # redirecting to portfolios#index
    else
      flash[:message] = "Portfolio is not created"
      render :new
    end
  end

  def edit
  end

  def update
    if @portfolio_item.update(portfolio_params)
      flash[:message] = 'Portfolio Updated'
      redirect_to portfolios_path
    else
      render :edit
    end
  end

  def destroy
    @portfolio_item.destroy
    flash[:message] = 'Portfolio Deleted'
    redirect_to portfolios_path
  end

  private

  def set_portfolio_item
    @portfolio_item ||= Portfolio.find(params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      :main_image,
                                      :thumb_image,
                                      technologies_attributes: [:name]
                                     )
  end
end
