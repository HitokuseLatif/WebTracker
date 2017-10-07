json.extract! tracked_site, :id, :homepageURL, :totalPV, :created_at, :updated_at
json.url tracked_site_url(tracked_site, format: :json)
