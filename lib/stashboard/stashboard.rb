require 'rubygems'
require 'oauth'
require 'yajl/json_gem'

module Stashboard
  class Stashboard
    
    def initialize(base_url, oauth_token, oauth_secret)
      @consumer = OAuth::Consumer.new("anonymous", "anonymous", { :site => base_url })
      @client = OAuth::AccessToken.new(@consumer, oauth_token, oauth_secret)
    end
  
    def services
      response = @client.get("/api/v1/services")
      return JSON.parse(response.body)
    end
  
    def service(service_id)
      response = @client.get("/api/v1/services/#{service_id}")
      return JSON.parse(response.body)
    end
  
    def create_service(name, description)
      response = @client.post("/api/v1/services", { "name" => name, "description" => description })
      return JSON.parse(response.body)
    end
  
    def delete_service(service_id)
      response = @client.delete("/api/v1/services/#{service_id}")
      return JSON.parse(response.body)
    end
  
    def update_service(service_id, name, description)
      response = @client.post("/api/v1/services/#{service_id}", { "name" => name, "description" => description })
      return JSON.parse(response.body)
    end
  
    def levels
      response = @client.get("/api/v1/levels")
      return JSON.parse(response.body)
    end
  
    def events(service_id, options = {})
      response = @client.get("/api/v1/services/#{service_id}/events", options)
      return JSON.parse(response.body)
    end
  
    def create_event(service_id, status_id, message)
      response = @client.post("/api/v1/services/#{service_id}/events", { "status" => status_id, "message" => message })
      return JSON.parse(response.body)
    end
  
    def current_event(service_id)
      response = @client.get("/api/v1/services/#{service_id}/events/current")
      return JSON.parse(response.body)
    end
  
    def event(service_id, event_sid)
      response = @client.get("/api/v1/services/#{service_id}/events/#{event_sid}")
      return JSON.parse(response.body)
    end
  
    def delete_event(service_id, event_sid)
      response = @client.delete("/api/v1/services/#{service_id}/events/#{event_sid}")
      return JSON.parse(response.body)
    end
  
    def statuses
      response = @client.get("/api/v1/statuses")
      return JSON.parse(response.body)
    end
  
    def status(status_id)
      response = @client.get("/api/v1/statuses/#{status_id}")
      return JSON.parse(response.body)
    end
  
    def create_status(name, description, level, image)
      response = @client.post("/api/v1/statuses", { "name" => name, "description" => description, "level" => level, "image" => image })
      return JSON.parse(response.body)
    end
  
    def status_images
      response = @client.get("/api/v1/status-images")
      return JSON.parse(response.body)
    end
  end
end
