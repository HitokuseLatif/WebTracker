module TrackerHelper ActiveRecord::Base
  # Increment PageView variable for current URL
  # GET /tracked_data
  # GET /tracked_data.json
  def trackHelper()
    #increment the page view variable
    sourcePageURL = request.original_url
    domain = request.domain
    clientIP = request.remote_ip

    # returns true if the TrackedSites db can receive our data. If false, we need to create
    # a TrackedSite
    @trackedSite = TrackedSite.where("homepageURL like ?", "%#{domain}%").first

    # If no existing trackedSite, create it
    if (!@trackedSite)
      @trackedSite = TrackedSite.new
      @trackedSite.homepageURL = domain
      @trackedSite.totalPV = 0
      t = Time.now
      @trackedSite.updated_at = t
    end

    # returns true if the TrackedPages db can receive our data. if false, we need to create
    # a TrackedPage
    @trackedPage = TrackedPage.where("pageURL like ?", "%#{sourcePageURL}%").first

    # If no existing trackedPage, create it
    if (!@trackedPage)
      @trackedPage = TrackedPage.new
      @trackedPage.homepageURL = domain
      @trackedPage.pageURL = sourcePageURL
      @trackedPage.pageViews = 0
      t = Time.now
      @trackedPage.updated_at = t
    end

    # Set TrackedData object, store with time
    @trackeddata = TrackedDatum.new
    @trackeddata.clientIP = clientIP
    @trackeddata.homepageURL = domain
    @trackeddata.pageURL = sourcePageURL
    t = Time.now
    @trackeddata.updated_at = t
    @trackeddata.save

    # Update TrackedPage object
    if (@trackedPage.pageViews == 0)
      @trackedPage.pageViews = TrackedDatum.where("pageURL like ?", "%#{sourcePageURL}%").all.length
    else
      @trackedPage.pageViews += 1
    end
      @trackedPage.save

    # Update TrackedSite object
    if (@trackedSite.totalPV == 0)
      @trackedSite.totalPV = TrackedPage.where("homepageURL like ?", "%#{domain}%").all.length
    else
      @trackedSite.totalPV += 1
    end
      @trackedSite.save
    return nil
  end
end
