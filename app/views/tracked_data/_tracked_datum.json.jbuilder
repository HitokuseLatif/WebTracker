json.extract! tracked_datum, :id, :clientIP, :homepageURL, :pageURL, :created_at, :updated_at
json.url tracked_datum_url(tracked_datum, format: :json)
