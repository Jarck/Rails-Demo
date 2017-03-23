class TopicsController < ApplicationController

  def index
    @topics = Topic.paginate(page: params[:page], :per_page => 2).order('created_at DESC')
  end

  def show
    @threads = []
    @topic = Topic.unscoped.includes(:user).find(params[:id])
    render_404 if @topic.deleted?
  end

  def new
    @topic = Topic.new
  end

  def edit
    @topic = Topic.find_by_id(params[:id])
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    @topic.node_id = params[:node] || topic_params[:node_id]
    @topic.node_id = 1

    if @topic.save
      redirect_to(topic_path(@topic), notice: I18n.t('common.create_success'))
    else
      render action: 'new'
    end
  end

  def update
    @topic = Topic.find(params[:id])

    @topic.title = topic_params[:title]
    @topic.body  = topic_params[:body]

    if @topic.save
      redirect_to(topic_path(@topic), notice: I18n.t('common.update_success'))
    else
      render action: 'edit'
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy_by(current_user)
    redirect_to(topics_path, notice: t('common.delete_success'))
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :body, :node_id)
  end

end