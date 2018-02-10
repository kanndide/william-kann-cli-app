class Companies
    
    attr_accessor :name
    
    extend Concerns::Findable
    
    @@all = []
    
    def initialize(name, cik = nil)
        @name = name
        @@all << self
    end
    
    def self.all
        @@all
    end
    
    
end