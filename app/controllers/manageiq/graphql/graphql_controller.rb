require_dependency 'manageiq/graphql/application_controller'

module ManageIQ
  module GraphQL
    class GraphQLController < ApplicationController
      def execute
        variables = ensure_hash(params[:variables])
        query = params[:query]
        operation_name = params[:operationName]
        context = {
          # Query context goes here, for example:
          # current_user: current_user,
        }
        result = Schema.execute(query, variables: variables, context: context, operation_name: operation_name)
        render json: result
      end

      def queries
        render json: { data: QueriesRepository.all.map { |q| serialize_query(q) } }
      end

      private

      # Handle form data, JSON body, or a blank value
      def ensure_hash(ambiguous_param)
        case ambiguous_param
        when String
          if ambiguous_param.present?
            ensure_hash(JSON.parse(ambiguous_param))
          else
            {}
          end
        when Hash, ActionController::Parameters
          ambiguous_param
        when nil
          {}
        else
          raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
        end
      end

      def serialize_query(query)
        { operationName: query.selected_operation_name, query: query.query_string }
      end
    end
  end
end
