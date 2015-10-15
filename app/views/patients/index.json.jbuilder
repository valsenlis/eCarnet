json.array!(@patients) do |patient|
  json.extract! patient, :id, :nom
  json.url patient_url(patient, format: :json)
end
