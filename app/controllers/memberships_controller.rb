class MembershipsController < ApplicationController
    def create
        membership = Membership.create(membership_params)
        if membership.valid?
            render json: membership
        else
            render json: { errors: membership.errors.full_message }
        end
    end

    private

    def membership_params
        params.permit(:gym_id, :client_id, :charge)
    end
end
