# frozen_string_literal: true

module Api
  class ResourceNotFoundSerializer < ApplicationSerializer
    def initialize(id: nil)
      @id = id
    end

    def serialized_json
      { errors: [error_attributes] }
    end

    private

    def error_attributes
      attributes = { status: '404', code: 'not-found', title: 'Resource not found' }
      return attributes if @id.blank?

      attributes.merge(source: { parameter: 'id' })
    end
  end
end
