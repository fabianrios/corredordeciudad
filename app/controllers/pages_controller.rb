class PagesController < ApplicationController
  layout "public_layout"
  def show
    @eventos = Evento.all
    @geojson = {}
    @geojson[:type] = "FeatureCollection";
    @geojson[:features] = [];
    
    
    @eventos.each do |event|
      if event.long.present? && event.lat.present? && event.publish
        
        if event.imagen.present?
          @imagen = event.imagen.url
        else
          @imagen = "http://placehold.it/350x200?text=sin+imagen"
        end
        
        @geojson[:features].push({
              type: "Feature",
              geometry: {
                type: "Point",
                coordinates: [event.long, event.lat]
              },
              properties: {
                title: event.nombre.capitalize,
                description: event.descripcion,
                direccion: event.direccion,
                web: event.web,
                cuando: event.cuando.strftime('%F, %I:%M %p'),
                imagen: @imagen,
                duracion: event.duracion,
                tag_list: event.tag_list, 
                user: event.user
              } 
          })
      end
    end
    

    
    render template: "pages/#{params[:page]}"
  end
end
