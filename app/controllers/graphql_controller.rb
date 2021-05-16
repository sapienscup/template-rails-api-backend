class GraphqlController < ApplicationController
  # If accessing from outside this domain, nullify the session
  # This allows for outside API access while preventing CSRF attacks,
  # but you'll have to authenticate your user separately
  # protect_from_forgery with: :null_session
  def execute
    render json: GqlLibs::Service::GraphqlQueryExecutor.new(params, session, request).perform
  end
end
