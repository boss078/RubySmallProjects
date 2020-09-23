require "rexml/document"
include REXML


class Country
    attr_reader :name, :total_area, :population, :inflation
    def initialize(name, total_area, population, inflation)
        @name = name
        @total_area = total_area.to_i
        @population = population.to_i
        @inflation = inflation.to_i
    end
    def to_s
        puts "Country"
        puts "  Name: #{@name}"
        puts "  Total area: #{@total_area}"
        puts "  Population: #{@population}"
        puts "  Inflation: #{@inflation}"
    end
end
class Continent
    attr_reader :countries, :name
    def initialize(name)
        @countries = []
        @name = name
    end
    def print_info 
        puts "Continent #{@name}"
        puts "List of countries"
        @countries.each { |e| puts e}
    end
end
class World
    attr_reader :continents
    def initialize(filename)
        @continents = []
        doc = Document.new(File.new(filename))
        doc.elements.each("cia/continent") {|continent| @continents << Continent.new(continent.attributes["name"]) }
        doc.elements.each("cia/country") do |country|
            new_country = Country.new(country.attributes["name"], country.attributes["total_area"], country.attributes["population"], country.attributes["inflation"])
            search_result = @continents.detect { |element| element.name == country.attributes['continent'] }
            if search_result
                search_result.countries << new_country
            end
        end
    end
    def print_info
        @continents.each { |e| e.print_info }
    end
    
    def find_country_with_biggest_population
        puts "Country with biggest population"
        result = "None"
        @continents.each do |continent|
            continent.countries.each do |country|
                result = country if result.class == String || (country.population && result.population < country.population)
            end
        end
        result
    end
    def find_top_five_countries_with_biggest_inflation
        puts "Top five countries with biggest inflation"
        all_countries = []
        @continents.each { |continent| continent.countries.each { |country| all_countries << country } }
        all_countries.sort! { |a, b| -a.inflation <=> -b.inflation }
        all_countries[(0..4)]
    end
end


world = World.new("cia-1996.xml")
puts world.find_country_with_biggest_population
world.find_top_five_countries_with_biggest_inflation.each { |country| puts country }