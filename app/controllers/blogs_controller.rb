class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs ||= Blog.all.order("created_at DESC")
  end

  def show
  end

  def new
    @blog ||= Blog.new
  end

  def edit
  end

  def create
    @blog ||= Blog.new(blog_params)

    if @blog.save
      flash[:message] = "Blog successfully created"
      redirect_to @blog # redirect to the blog just created
    else
      flash[:message] = "Blog not created"
      render :new
    end
  end

  def update
    if @blog.update(blog_params)
      flash[:message] = 'Blog Updated'
      redirect_to @blog
    else
      flash[:message] = "Blog NOT Updated"
      render :edit
    end
  end

  def destroy
    @blog.destroy
    flash[:message] = 'Blog Deleted'
    redirect_to blogs_path
  end

  private

  def set_blog
    @blog ||= Blog.friendly.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :body)
  end
end
