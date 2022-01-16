class MoodsController < ApplicationController
    before_action :mood_params, only: %i[ show edit update destroy ]
    def index
        @moods = Mood.all

        if @moods
            render json: {
                moods: @moods
            }
        else
            render json: {
                status: 500,
                errors: ['No moods are available currently']
            }
        end
    end

    def show
        @mood = Mood.find(params[:id])
        if @mood
        render json: {
            mood: @mood
        }
        else
        render json: {
            status: 500,
            errors: ['Mood not found']
        }
        end
    end

    def new
        @mood = Mood.new
    end

    def create
        @mood = Mood.new(mood_params)
        if @mood.save
        render json: {
            status: :created,
            mood: @mood
        }
        else 
        render json: {
            status: 500,
            errors: @mood.errors.full_messages
        }
        end
    end

    def edit
    end

    
    def update
        @mood = Mood.find(params[:id])

        if @mood.update(mood_params)
            render json: {
                status: :updated,
                mood: @mood
            }
        else
            render json: {
                status: 500,
                errors: @mood.errors.full_messages
            }
        end
    end

    def destroy
        @mood = Mood.find(params[:id])
        @mood.destroy

        render json: {
            status: :deleted
        }
    end

    private

    def mood_params
        params.require(:mood).permit(:hours_slept, :depressed, :anxiety, :irritability_level, :elevated_level, :psychotic_symptoms, :weather, :user_id)
    end
end