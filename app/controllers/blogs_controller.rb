class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  layout "blog"
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :toggle_status]}, site_admin: :all # petergate gem for  authorization check the user model to see what we have created

  def index
    @blogs ||= Blog.page(params[:page]).per(5)  # Kaminari gem to have pagination
    @page_title = "My Blog" # to dynamically change the title of the site
  end

  def show
    @page_title = @blog.title # to dynamically change the title of the site
    @seo_keywords = @blog.body # to add dynamically the seo words
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
    redirect_to blogs_url
  end

  def toggle_status
    if @blog.draft?
      @blog.published!
    elsif @blog.published?
      @blog.draft!
    end
    flash[:message] = "Post status has been updated."
    redirect_to blogs_url
  end

  private

  def set_blog
    @blog ||= Blog.friendly.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :body)
  end
end
