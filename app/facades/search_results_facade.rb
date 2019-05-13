class SearchResultsFacade

  def initialize(search_key)
    @search_key = search_key

    conn = Faraday.new('https://developer.nrel.gov/api/alt-fuel-stations/v1/') do |f|
      f.params['api_key'] = ENV['NREL_API_KEY']
      f.adapter Faraday.default_adapter
    end

    response = conn.get("nearest.json?fuel_type=ELEC,LPG&access=public&format=JSON&location=#{@search_key}&status=E")
    results = JSON.parse(response.body)
    # results["fuel_stations"] #provides indy station info
    # results["total_results"] #93
  end

end
