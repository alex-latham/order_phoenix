module Potter
  class Character
    attr_reader :id, :name, :role, :house, :patronus

    def initialize(character_data)
      @id = character_data[:_id]
      @name = character_data[:name]
      @role = character_data[:role]
      @house = character_data[:house]
      @patronus = character_data[:patronus]
    end

    def self.phoenix_members_by_house(house)
      all_character_data = PotterService.new.phoenix_members_by_house(house)
      all_character_data.map do |character_data|
        Character.new(character_data)
      end
    end
  end
end
