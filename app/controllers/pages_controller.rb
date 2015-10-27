class PagesController < ApplicationController
  layout "public_layout"
  def show
    @eventos = Evento.all
    @geojson = Array.new
    
    @eventos.each do |event|
      if event.long.present? && event.lat.present? && event.publish
        @geojson << {
            type: "Point",
            coordinates: [event.long, event.lat]
          }
      end
    end
    
    @geojson = {
            "type" => "FeatureCollection",
            "features"=> [{
                "type"=> "Feature",
                "geometry"=> {
                    "type"=> "Point",
                    "coordinates"=> [-75.5819034576416,6.2406470719454]
                },
                  "properties" => {
                    "title" => "Proyecto de vivienda",
                    "description" => "1714 14th St NW, Washington DC",
                    'marker-color' => '#fa0',
                    'marker-size'=> 'large',
                    'marker-symbol'=> 'star',
                  }
            }, {
                "type"=> "Feature",
                "geometry"=> {
                    "type"=> "Point",
                    "coordinates"=> [-75.6189823150635,6.25131222134788]
                },
                "properties"=> {
                    "title"=> "Comunidades recilentes",
                    'marker-color' => '#7ec9b1',
                    'marker-size'=> 'large',
                    'marker-symbol'=> 'star'
                }
            }]
        }
    
    render template: "pages/#{params[:page]}"
  end
end
