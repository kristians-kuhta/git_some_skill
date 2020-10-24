# frozen_string_literal: true

module Api
  module V1
    class ErrorsSerializer < ApplicationSerializer
      def initialize(model)
        @model = model
      end

      def serialized_json
        @model.errors.messages.map do |field, error_messages|
          error_messages.map do |message|
            { source: { pointer: "/data/attributes/#{field}" }, detail: message }
          end
        end.flatten
      end
    end
  end
end
