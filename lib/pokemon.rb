class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id
    
    def initialize(id: nil,name:,type:,db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?,?)
        SQL

        db.execute(sql, name, type)
    end

    def self.find(pokemon_id, db)
        sql = "SELECT * FROM pokemon WHERE pokemon.id = ?"

        new_pokemon = db.execute(sql, pokemon_id)
        Pokemon.new(
            id: new_pokemon[0][0],
            name: new_pokemon[0][1],
            type: new_pokemon[0][2],
            db:db
        )
    end
end
