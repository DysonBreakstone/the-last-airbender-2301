class SearchFacade
  def initialize(nation)
    @nation = nation
  end

  def conn 
    @_conn ||= Faraday.new(url: "https://last-airbender-api.fly.dev")
  end

  def nation_count
    response = conn.get("/api/v1/characters?affiliation=#{@nation}&perPage=100000")
    json = JSON.parse(response.body, symbolize_names: true)
    json.count
  end

  def first_25
    response = conn.get("/api/v1/characters?perPage=25&affiliation=#{@nation}")
    json = JSON.parse(response.body, symbolize_names: true)
    json.map do |resident_info|
      Resident.new(resident_info)
    end
  end

end