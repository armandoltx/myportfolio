class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  before_action :set_sidebar_topics, except: [:update, :create, :destroy, :toggle_status] # to have it available to every action except the ones in the array

  layout "blog"
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :toggle_status]}, site_admin: :all # petergate gem for  authorization check the user model to see what we have created

  def index
    if logged_in?(:site_admin) #logged_in is a PEtergate method
      @blogs ||= Blog.recent.page(params[:page]).per(5) # Kaminari gem to have pagination recent is a scope
    else
      @blogs ||= Blog.recent.published.page(params[:page]).per(5)
    end
    @page_title = "My Blog" # to dynamically change the title of the site
  end

  def show
    if logged_in?(:site_admin) || @blog.published?
      @page_title = @blog.title # to dynamically change the title of the site
      @seo_keywords = @blog.body # to add dynamically the seo words
      # To add the comments in the blog view:
      @blog = Blog.includes(:comments).friendly.find(params[:id]) # to include the comments in the blog we do not need to hit the DB anytime we need to get the comments
      @comment = Comment.new
    else
      redirect_to blogs_path, notice: "You are not authorized to access this page"
    end
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
    params.require(:blog).permit(:title, :body, :topic_id)
  end

  def set_sidebar_topics # to use the scope created in the model
    @side_bar_topics = Topic.with_blog
  end
end
