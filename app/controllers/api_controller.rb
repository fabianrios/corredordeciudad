class ApiController < ApplicationController
  layout "public_layout"
  def index
    @eventos_all = Evento.where(:publish => true).order("cuando ASC")
    
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @eventos_all }
      format.ics do
          calendar = Icalendar::Calendar.new
          @eventos_all.each do |event|
            @fin = event.cuando + event.duracion.hour
            evento = Icalendar::Event.new
            evento.dtstart = event.cuando.strftime("%Y%m%dT%H%M%S")
            evento.dtend = @fin.strftime("%Y%m%dT%H%M%S")
            evento.duration = event.duracion
            evento.summary = event.nombre
            evento.description = event.descripcion
            evento.geo = [event.lat,event.long]
            evento.attach = event.imagen.big.url
            evento.contact = "#{event.user.nombre}\; #{event.user.telefono}\; #{event.user.email}\; #{event.user.web}"
            evento.created = event.created_at
            evento.last_modified = event.updated_at
            evento.categories = "LANGUAGE=es-ES:MDE Expandido, #{event.organiza}"
            evento.organizer = event.organiza
            evento.location = event.direccion
            evento.uid = event.id.to_s+"app"
            evento.url = event.web
            calendar.add_event(evento)
          end
          calendar.publish
          render :text => calendar.to_ical
        end
    end
    
  end
  
  def getting
    # Open a file or pass a string to the parser
    
    cal_file = File.open("#{Rails.public_path}" + '/descarga.ics')

    # Parser returns an array of calendars because a single file
    # can have multiple calendars.
    cals = Icalendar.parse(cal_file)
    cal = cals.first

    # Now you can access the cal object in just the same way I created it
    cal.events.each do |event|
      p event
    end
    
    @eventos = cal.events
    
  end
  
  
end
