json.extract! @geojson, :type, :features
json.count @geojson[:features].count

