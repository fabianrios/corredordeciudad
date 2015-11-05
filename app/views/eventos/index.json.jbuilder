json.array!(@eventos) do |evento|
  json.extract! evento, :id, :nombre, :lugar, :direccion, :espacio, :necesidades, :descripcion, :web, :cuando, :imagen, :organiza
  json.url evento_url(evento, format: :json)
end
