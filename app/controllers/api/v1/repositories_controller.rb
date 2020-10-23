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
          render json: RepositorySerializer.new(repository)
        else
          render json: RepositorySerializer.new(repository),
            status: :unprocessable_entity
        end
      end

      def update
        repository = Repository.new(create_params)

        if repository.save
          render json: RepositorySerializer.new(repository)
        else
          render json: RepositorySerializer.new(repository),
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
        create_params
      end
    end
  end
end

