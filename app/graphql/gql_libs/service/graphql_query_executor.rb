module GqlLibs
  module Service
    class GraphqlQueryExecutor
      attr_reader :params, :session, :request

      def initialize(params, session, request)
        @params = params
        @session = session
        @request = request
      end

      def perform
        WalrusSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
      rescue => e
        raise e unless Rails.env.development?
        handle_error_in_development(e)
      end

      private

      def query
        params[:query]
      end

      def variables
        ensure_hash(params[:variables])
      end

      def operation_name
        params[:operationName]
      end

      def context
        {
          session: session,
          current_user: current_user
        }
      end

      def ensure_hash(variables_param)
        GqlLibs::Service::EnsureHash.call(variables_param)
      end

      def current_user
        GqlLibs::Service::CurrentUserBuilder.call(request, session)
      end

      def handle_error_in_development(e)
        GqlLibs::Service::HandleError.call(e)
      end

      def prepare_variables(variables_param)
        GqlLibs::Service::PrepareVariables.call(variables_param)
      end
    end
  end
end
