class Investors
    
    attr_accessor :name, :cik
    
    extend Concerns::Findable
    
    @@all = []
    
    def initialize(name, cik)
        @name = name
        @cik = cik
        @@all << self
    end
    
    def self.all
        @@all
    end
    
    
end