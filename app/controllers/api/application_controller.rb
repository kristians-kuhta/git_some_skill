# frozen_string_literal: true

module Api
  class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found

    def resource_not_found
      render json: ResourceNotFoundSerializer.new.serialized_json, status: :not_found
    end
  end
end
