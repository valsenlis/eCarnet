json.array!(@medecins) do |medecin|
  json.extract! medecin, :id, :nom, :lieu, :specialite
  json.url medecin_url(medecin, format: :json)
end
