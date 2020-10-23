# frozen_string_literal: true

module Api
  module V1
    class RepositorySerializer < ApplicationSerializer
      attributes :name,
        :description,
        :owner_login,
        :html_url,
        :clone_url,
        :private
    end
  end
end
