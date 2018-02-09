class Reports
    
    attr_accessor :year, :qtr, :investor, :companies
    
    def initialize(year, qtr)
        @companies = %w[]
    end
    
    def self.create_from_hash(hash)
        hash.each do |key, value|
            self.year = value if key = :year
            self.qtr = value if key = :qtr
            Companies.find_or_create_by_name(key.to_s)
                
        end
    end
    
end