class SearchResultsFacade
  def initialize(search_key)
    @search_key = search_key
  end

  def conn
    zip_code = params[:q]
    conn = Faraday.new('https://developer.nrel.gov/api/alt-fuel-stations/v1/') do |f|
      # f.headers[api_key] = ENV['NREL_API_KEY']
      f.params['api_key'] = 'hmstHcsk9ZqgSAQlKIlmpKenfltTwrXK9yr4d30L'
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("nearest.json?fuel_type=ELEC,LPG&access=public&format=JSON&location=#{zip_code}&status=E")
    results = JSON.parse(response.body)
  end
  
end
