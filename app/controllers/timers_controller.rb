class TimersController < ApplicationController
    before_action :set_timer, only: %i[ show update destroy ]

    def index
        @timers = current_user.timers.all
    end

    def new
        @timer = current_user.timers.new
    end

    def create
        @timer = current_user.timers.new(timer_params)
        if @timer.save
            redirect_to timers_path, notice: "タイマーを作成しました"
        else
            flash.now[:alert] = "タイマーを作成できませんでした"
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @timer.update
            redirect_to timer_path(@timer), notice: "タイマーを更新しました"
        else
            flash.now[:alert] = "タイマーを更新できませんでした"
            render :edit
        end
    end

    def destroy
        @timer.destroy!
        redirect_to timers_path, notice: "タイマーを削除しました"
    end

    private
    
    def timer_params
        params.require(:timer).permit(:name, :work_time, :rest_time, :implementation_time, :switch, :repetition, :character, :sound)
    end

    def set_timer
        @timer = current_user.timer.find(params[:id])
    end
end
