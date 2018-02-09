class Investors
    
    attr_accessor :name, :holdings, :cik
    
    def initialize(name, cik)
        @name = name
        @cik = cik
        @holdings = []
    end
    
    
end