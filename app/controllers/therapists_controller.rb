class TherapistsController < ApplicationController
    def index
        @therapists = Therapist.all

        if @therapists
            render json: {
                status: :ok,
                therapists: @therapists,
            }
        else
            render json: {
                status: 404,
                errors: ['No therapist found']
            }
        end
    end

    def show
        @therapist = Therapist.find(params[:id])
        if @therapist
            render json: {
                therapist: @therapist
            }
        else
            render json: {
                status: 500,
                errors: ['Therapist not found']
            }
        end
    end

    def create
        @therapist = Therapist.new(therapists_params)

        if @therapist.save
            render json: {
                status: :created,
                therapist: @therapist
            }
        else
            render json: {
                status: 500,
                errors: @therapist.errors.full_messages
            }
        end
    end

    def destroy
        @therapist = Therapist.find(params[:id])

        if @therapist.destroy
            render json: {
                status: :deleted
            }
        else
            render json: {
                errors: @therapist.errors.full_messages
            }
        end
    end

    private

    def therapists_params 
        params.require(:therapist).permit(:firstName, :lastName, :username, :email, :password, :password_confirmation, :location, :gender, :specialization, :image_url)
    end
end

