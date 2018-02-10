class Reports
    
    attr_accessor :year, :qtr, :investor, :companies
    
    def initialize(year = nil, qtr = nil)
        @companies = %w{}
        
    end
    
    def self.create_from_hash(hash)
        hash.each do |key, value|
            self.year = value if key == :year
            self.qtr = value if key == :qtr
            investor_name = value if key == :investor
            investor_cik = value if key == :cik
            self.investor = Investor.find_or_create_by_name(investor_name, investor_cik)
            self.companies = {
                Companies.find_or_create_by_name(key.to_s).to_sym => value
                }
        end
    end
    
end