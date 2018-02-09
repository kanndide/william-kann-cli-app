class Investors
    
    attr_attribute :name, :holdings, :cik
    
    def initialize(name, cik)
        @name = name
        @cik = cik
        @holdings = []
    end
    
    def self.create_from_hash(hash)
        hash.each do |key, value|
            Companies.new(key.to_s)
        end
    end
    
end