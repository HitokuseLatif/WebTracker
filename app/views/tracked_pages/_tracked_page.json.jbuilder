json.extract! tracked_page, :id, :homepageURL, :pageURL, :pageViews, :created_at, :updated_at
json.url tracked_page_url(tracked_page, format: :json)
