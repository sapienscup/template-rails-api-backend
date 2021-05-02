class ApplicationController < ActionController::API
  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: :handle_exception
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def handle_exception(exception=nil)
    if exception
      logger = Logger.new(STDOUT)
      logger.debug "Exception Message: #{exception.message} \n"
      logger.debug "Exception Class: #{exception.class} \n"
      logger.debug "Exception Backtrace: \n"
      logger.debug exception.backtrace.join("\n")
      if [ActionController::RoutingError, ActionController::UnknownController, ActionController::UnknownAction].include?(exception.class)
        return render_404
      else
        return render_500
      end
    end
  end

  def render_404
    respond_to do |format|
      format.html { render template: 'errors/not_found', layout: 'layouts/application', status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end

  def render_500
    respond_to do |format|
      format.html { render template: 'errors/internal_server_error', layout: 'layouts/application', status: 500 }
      format.all { render nothing: true, status: 500}
    end
  end
end
