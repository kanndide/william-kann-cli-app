class Investors
    
    attr_attribute :name, :holdings, :cik
    
    def initialize(name, cik)
        @name = name
        @cik = cik
        @holdings = []
    end
    
end