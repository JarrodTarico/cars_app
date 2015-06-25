namespace :scraper_vehicles do
  desc "Fetch craigslist, Ebay, Cars.com posts from 3 taps"
  task scrape: :environment do


  	require 'open-uri'
	require 'json'

	#Set API token and URL
	auth_token = "968104a069364eba6a578a3016e696bf"
	polling_url = "http://polling.3taps.com/poll"


		
		#Specify request parameters
		params = {
			auth_token: auth_token,
			anchor: 2291371270,
			source: "CRAIG|CARSD|EBAYM",
			category_group: "VVVV",
			category: "VAUT",
			'location.city' => "USA-ATL-ATA",
			retvals: "source,category,location,external_url,heading,body,timestamp,price,images,annotations"
		}

		 

		#Prepare API Request

		uri = URI.parse(polling_url)
		uri.query = URI.encode_www_form(params)

		#Submit request
		result = JSON.parse(open(uri).read)

		#Display results to screen
		#puts JSON.pretty_generate result 

		#Store results in database
		result["postings"]. each do |posting|


			#Limit number of Craigslist Post
			case
			    when PostVehicle.count(:conditions => "source = CRAIG") > 50 and (PostVehicle.include?('EBAYM'|'CARSD'); then
			 	copy = Array.new(arr.keep_if { |posting| posting["source"] = "EBAYM|CARSD" })
			 	puts copy 
			end
			

			#Create New Post
			@post_vehicle = PostVehicle.new
			@post_vehicle.heading = posting["heading"]
			@post_vehicle.body = posting["body"]
			@post_vehicle.price = posting["price"]
			@post_vehicle.neighborhood = posting["location"]["locality"]
			@post_vehicle.external_url = posting["external_url"]
			@post_vehicle.timestamp = posting["timestamp"]
			@post_vehicle.source = posting["source"]

			#save post
			@post_vehicle.save

  		end 
end 

  desc "Destroy all post"
  task destroy_all_posts: :environment do
  	  	PostVehicle.destroy_all
  end

end
