class Investors
    
    attr_accessor :name, :cik, :reports
    
    extend Concerns::Findable
    
    @@all = []
    
    def initialize(name, cik = nil)
        @name = name
        @cik = cik if cik != nil
        @reports = %w[]
        @@all << self
    end
    
    def self.all
        @@all
    end
    
    
end