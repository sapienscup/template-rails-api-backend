require "active_support/concern"

module DefaultFormat
  extend ActiveSupport::Concern

  def graphql(account)
    headers = { "Authorization" => "#{account.authorization_token}" }
    post "/graphql", params: { query: query, variables: JSON.dump(variables) }, headers: headers
    @body = JSON.parse(response.body).with_indifferent_access
  end

  def graphql_without_auth_header
    post "/graphql", params: { query: query, variables: JSON.dump(variables) }
  end
end

RSpec.configure do |config|
  config.include(DefaultFormat, type: :request)
end
