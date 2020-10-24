# frozen_string_literal: true

module Api
  module V1
    class RepositoriesController < ApplicationController
      def index
        repositories = Repository.all

        render json: { repositories: RepositorySerializer.new(repositories) }
      end

      def show
        repository = Repository.find(params[:id])

        render json: RepositorySerializer.new(repository)
      end

      def create
        repository = Repository.new(create_params)

        if repository.save
          render status: :no_content
        else
          render json: ErrorsSerializer.new(repository).serialized_json,
            status: :unprocessable_entity
        end
      end

      def update
        repository = Repository.find(params[:id])

        if repository.update(update_params)
          render status: :no_content
        else
          render json: ErrorsSerializer.new(repository).serialized_json,
            status: :unprocessable_entity
        end
      end

      def destroy
        repository = Repository.find(params[:id])

        repository.destroy

        render status: :no_content
      end

      private

      def create_params
        params.
          require(:data).
          require(:attributes).
          permit(:name, :description, :owner_login, :private, :html_url, :clone_url)
      end

      def update_params
        params.
          require(:data).
          require(:attributes).
          permit(:description, :private, :html_url, :clone_url)
      end
    end
  end
end

