class Investors
    
    attr_accessor :name, :holdings, :cik
    
    extend Concerns::Findable
    
    def initialize(name, cik)
        @name = name
        @cik = cik
        @holdings = []
    end
    
    
end