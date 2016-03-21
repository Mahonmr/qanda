module EventsHelper

  def get_url(event)
    event_type = EventType.find(event.event_type_id)
    event_type.image_url
  end
end
