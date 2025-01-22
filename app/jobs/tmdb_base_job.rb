require "sidekiq-scheduler"

class TmdbBaseJob
  include Sidekiq::Job
  include ActiveSupport::Rescuable

  rescue_from StandardError, with: :handle_standard_error
  rescue_from RestClient::Exception, with: :handle_rest_client_exception

  def handle_standard_error
    @tmdb_log.tmdb_errors.create!(message: e.message, class_name: e.class.to_s, backtrace: e.backtrace)
  end

  def handle_rest_client_exception
    @tmdb_log.tmdb_errors.create!(message: e.message, class_name: e.class.to_s, backtrace: e.backtrace, body: JSON.parse(e.response.body))
  end
end
