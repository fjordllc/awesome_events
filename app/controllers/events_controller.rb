class EventsController < ApplicationController
  skip_before_action :authenticate, only: :show

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event, notice: "作成しました"
    end
  end

  def show
    @event = Event.find(params[:id])
    @ticket = current_user && current_user.tickets.find_by(event: @event)
    @tickets = @event.tickets.includes(:user).order(:created_at)
  end

  def edit
    @event = current_user.created_events.find(params[:id])
  end

  def update
    @event = current_user.created_events.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: "更新しました"
    end
  end

  def destroy
    @event = current_user.created_events.find(params[:id])
    @event.destroy!
    redirect_to root_path, notice: "削除しました"
  end

  private

  def event_params
    params.require(:event).permit(
      :name, :place, :content, :start_at, :end_at
    )
  end
end
