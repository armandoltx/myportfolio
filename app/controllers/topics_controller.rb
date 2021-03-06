class TopicsController < ApplicationController
  before_action :set_sidebar_topics # to have it available to every action
  layout 'blog' #to use the blogs layout
  def index
    @topics ||= Topic.all
  end

  def show
    @topic ||= Topic.find(params[:id]) #params is a hash and we get teh value of the key :id
    # TO ACCESS TO THE BLOGS IN TOPICS VIEW
    if logged_in?(:site_admin) #logged_in is a PEtergate method
      @blogs ||= @topic.blogs.recent.page(params[:page]).per(5) # Kaminari gem to have pagination recent is a scope
    else
      @blogs ||= @topic.blogs.recent.published.page(params[:page]).per(5)
    end
  end

  private

  def set_sidebar_topics # to use the scope created in the model
    @side_bar_topics = Topic.with_blog
  end
end
