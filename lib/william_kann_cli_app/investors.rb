class Investors
    
    attr_accessor :name, :cik
    
    extend Concerns::Findable
    
    @@all = []
    
    def initialize(name, cik = nil)
        @name = name
        @cik = cik if cik != nil
        @@all << self
    end
    
    def self.all
        @@all
    end
    
    
end