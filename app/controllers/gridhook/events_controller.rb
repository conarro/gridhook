module Gridhook
  class EventsController < ActionController::Base
    def create
      Gridhook::Event.process(permitted_params)
      head :ok
    end

    private

    def permitted_params
      if Array(whitelist = Gridhook.config.whitelisted_params).any?
        params.permit(whitelist)
      else
        params.permit!
      end
    end
  end
end
