class MetricsController < ApplicationController

  def index
    @metrics = HooplaClient.new.index('metrics')
  end
end
