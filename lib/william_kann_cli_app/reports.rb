class Reports
    
    attr_accessor :year, :qtr, :investor, :companies, :shares
    
    def initialize(year, qtr)
        @companies = %w[]
    end
    
    def self.create_from_hash(hash)
        hash.each do |key, value|
            Companies.all.each do |x|
                x.name == key.to_s
                
        end
    end
    
end