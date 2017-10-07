# README

The application is called WebTracker. WebTracker has a helper file called tracker_helper.rb. Inside of this file is the main tracking function that stores tracking data (domain name, pageURL, IP address, etc.). This function utilizes three tables in order to maintain this data: Tracked_Data (each item in this table corresponds to a page view), Tracked_Pages (each item in this table corresponds to a unique page url under the current domain, containing the total page views for that specific page), and Tracked_Sites (each item in this table corresponds to a unique website (domain), containing the total page views for that website). Pages route as such:

Welcome -> Tracked_Data -> Tracked_Pages -> Tracked_Sites

So, if running on localhost, the main websites would be:

localhost:3000 [Welcome]
localhost:3000/tracked_data [Individual PV]
localhost:3000/tracked_pages [PV by Web Page]
localhost:3000/tracked_sites [Total PV across website]

The tracking tag can be placed in any HTML as such: <%= trackHelper() %>
Currently, all pages on the application have this tracking tag, to demonstrate functionality.

At the bottom of the Tracked_Data page, there is a number input field labeled "Only show records from X hours ago:". This field takes in an integer as input, which corresponds to number of hours to filter by (press "Enter" to submit the integer value).

KNOWN BUG/MISSING FEATURE: The ability to edit times for each PageView easily, so that testing as a user may be simpler.

All development and testing has been done on a Windows 7 machine running Google Chrome and Mozilla Firefox.