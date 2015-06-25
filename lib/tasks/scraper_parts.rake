namespace :scraper_parts do
  desc "Fetch craigslist, Ebay posts from 3 taps"
  task scrape: :environment do


  	require 'open-uri'
	require 'json'

	#Set API token and URL
	auth_token = "968104a069364eba6a578a3016e696bf"
	polling_url = "http://polling.3taps.com/poll"



		#Specify request parameters
		if total > 300 then 

		params = {
			auth_token: auth_token,
			anchor: 2291371270,
			source: "CARSD|EBAYM",
			category_group: "VVVV",
			category: "VPAR",
			'location.city' => "USA-ATL-ATA",
			retvals: "source,category,location,external_url,heading,body,timestamp,price,images,annotations"
		}

		else


		params = {
			auth_token: auth_token,
			anchor: 2291371270,
			source: "CRAIG|CARSD|EBAYM",
			category_group: "VVVV",
			category: "VPAR",
			'location.city' => "USA-ATL-ATA",
			retvals: "source,category,location,external_url,heading,body,timestamp,price,images,annotations"
		}

		end 

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

			if posting["source"] = "CRAIG" then 
				$total = $total + 1
			end 

			#Create New Post
			@post_part = PostPart.new
			@post_part.heading = posting["heading"]
			@post_part.body = posting["body"]
			@post_part.price = posting["price"]
			@post_part.neighborhood = posting["location"]["locality"]
			@post_part.external_url = posting["external_url"]
			@post_part.timestamp = posting["timestamp"]


			#save post
			@post_part.save

  		end
  	end 


  

  desc "destroying all post"
  task destroy_all_posts: :environment do
  	PostPart.destroy_all
  end

end
