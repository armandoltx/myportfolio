class PortfoliosController < ApplicationController
  before_action :set_blog, only [:show, :edit, :update, :destroy]

  def index
    @portfolio_items ||= Portfolio.all
  end

  def show
  end

  def new
    @portfolio_item ||= Portfolio.new
  end

  def create
    @portfolio_item ||= Portfolio.new(portfolio_params)

    if @portfolio_item.save
      flash:[message] = 'Portfolio successfully created'
      redirect_to portfolios_path
    else
      flas[:message] = "Portfolio is not created"
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
                                      :thumb_image
                                     )
  end
end
