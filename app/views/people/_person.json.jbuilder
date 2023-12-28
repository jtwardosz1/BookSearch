json.extract! person, :id, :name, :email, :address, :phone, :library_card, :created_at, :updated_at
json.url person_url(person, format: :json)
