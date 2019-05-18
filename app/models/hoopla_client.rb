# frozen_string_literal: true

class HooplaClient < ApplicationRecord
  require 'oauth2'
  require 'json'

  MEDIA_TYPES = {
    metric_value_list: { media_type_name: 'application/vnd.hoopla.metric-value-list+json' }
  }.freeze

  def initialize(_arg)
    @oauth_client = OAuth2::Client.new(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], token_url: '/oauth2/token', site: ENV['HOOPLA_BASE_URL']).client_credentials.get_token
  end

  def index(entity_name, params = {})
    JSON.parse(@oauth_client.get("/#{entity_name}", params: params).body)
  end

  def show(entity_name, entity_id)
    JSON.parse(@oauth_client.get("/#{entity_name}/#{entity_id}").body)
  end

  def create(entity_type, entity_path, data)
    content_type = MEDIA_TYPES[entity_type.to_sym][:media_type_name]
    JSON.parse(@oauth_client.post(entity_path, {headers: { 'Content-Type': content_type }, body: data.to_json}).body)
  end
end
