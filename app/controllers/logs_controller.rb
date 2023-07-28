class LogsController < ApplicationController
  skip_before_action :verify_authenticity_token
    def index
      @logs = Log.all
      render json: @logs
    end
  end
  