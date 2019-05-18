# frozen_string_literal: true

class MetricValuesController < ApplicationController
  def index
    @client = HooplaClient.new
    @users = @client.index('users')
    @metric_values = HooplaClient.new.index("metrics/#{params[:metric_id]}/values", 'owner.href' => @users.map { |u| u['href'] })
    @user_values = @users.map do |user|
      metric_user_value = @metric_values.find { |m| m['owner']['href'] == user['href'] }
      { 'metric_value' => metric_user_value }.merge(user)
    end
  end

  def update; 
    @client = HooplaClient.new
    data = [{
      'owner' => {
        'kind' => 'user',
        'href' => params[:user]
      },
      'value' => params[:value].to_i
    }]
    @client.create(:metric_value_list, "metrics/#{params[:metric_id]}/values", data)
    redirect_to metrics_path(params[:metric_id])
  end

  def create
    @client = HooplaClient.new
    data = [{
      'owner' => {
        'kind' => 'user',
        'href' => params[:user]
      },
      'value' => params[:value].to_i
    }]
    @client.create(:metric_value_list, "metrics/#{params[:metric_id]}/values", data)
    redirect_to metrics_path(params[:metric_id])
  end

  def new
    @user = params[:user]
  end

end
