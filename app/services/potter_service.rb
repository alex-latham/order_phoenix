class PotterService
  def initialize(api_key = ENV['POTTERSERVICE_KEY'])
    @api_key = api_key
  end

  def phoenix_members_by_house(house)
    params = {key: @api_key, house: house, orderOfThePhoenix: true}
    get_json('/v1/characters', params)
  end

  private

  def get_json(url, params = nil)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://www.potterapi.com') do |f|
      f.adapter Faraday.default_adapter
    end
  end

end