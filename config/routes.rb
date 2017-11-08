Rails.application.routes.draw do
  controller_action = Gridhook.config.event_create_action || 'gridhook/events#create'
  post Gridhook.config.event_receive_path => controller_action
end
