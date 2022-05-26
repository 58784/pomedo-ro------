class TimersController < ApplicationController
    before_action :set_timer, only: %i[ edit update destroy ]

    def index
        @timers = current_user.timers.all
    end

    def new
        @timer = current_user.timers.new
    end

    def create
        @timer = current_user.timers.new(timer_params)
        if @timer.save
            redirect_to timers_path, info: "タイマーを作成しました"
        else
            flash.now[:warning] = "タイマーを作成できませんでした"
            render :new
        end
    end

    def edit
    end

    def update
        if @timer.update(timer_params)
            redirect_to timers_path, info: "タイマーを更新しました"
        else
            flash.now[:warning] = "タイマーを更新できませんでした"
            render :edit
        end
    end

    def destroy
        @timer.destroy!
        redirect_to timers_path, danger: "タイマーを削除しました"
    end

    private
    
    def timer_params
        params.require(:timer).permit(:name, :work_time, :rest_time, :start_time, :finish_time, :switch, :repetition, :character, :sound)
    end

    def set_timer
        @timer = current_user.timers.find(params[:id])
    end
end
