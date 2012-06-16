#require 'yelp'

module MeetupsHelper

  require 'rubygems'
  require 'oauth'


  def get_yelp_category_for our_category
    categories = {"eat" => "restaurants"}
    categories[our_category.downcase]
  end

  def indications_for category

    consumer_key = 'OgB1WnTGDFzqI_LF-FlgIA'
    consumer_secret = 'RCFBWNSc-fNiSP8xoy-OAWhoXdY'
    token = '7gZZAMdYe8Ggs6EnfDz5rJXGbkSn4NBG'
    token_secret = 'xG_qA2YxfwX3F1T_R9ZqKg0ZphI'

    #client = Yelp.client.new


    # perform a location-based category search for either ice cream or donut shops in SF
    #request = Yelp::Review::Request::Location.new(
    #    :city => 'New York',
    #    :state => 'NY',
    #    :category => [ category ],
    #    :yws_id => '7wmXg71hx32JtbtmFWsKgw')
    #
    #response = client.search(request)
    #puts "****"
    #puts response


    api_host = 'api.yelp.com'

    consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
    access_token = OAuth::AccessToken.new(consumer, token, token_secret)

    path = "/v2/search?term=#{category}&location=new%20york&limit=3"

    body = access_token.get(path).body
    p body
    as_json = JSON.parse(body)["businesses"]
    locations = []
    as_json.each {|location|
     locations << location["name"]
    }
    p "****"
    p locations
    p "****"
    locations
  end

end
