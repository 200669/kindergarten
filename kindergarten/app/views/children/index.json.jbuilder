json.array!(@children) do |child|
  json.extract! child, :id, :name, :lastname, :birthdate, :pesel, :barcode
  json.url child_url(child, format: :json)
end
