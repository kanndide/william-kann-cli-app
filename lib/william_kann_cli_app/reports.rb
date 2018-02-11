class Reports
    
    attr_accessor :year, :qtr, :investor, :companies
    
    def initialize(year = nil, qtr = nil)
        @companies = %w[]
        
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
    
    def print_report(object)
        puts "#{object.investor} holdings as of #{object.year}, #{object.qtr.upcase}"
        puts "The Securities and Exchange Commission has not necessarily reviewed the information in this filing and has not determined     if it is accurate and complete.
        The reader should not assume that the information is accurate and complete."
        object.companies.each do |key, value|
            puts "#{key.name} - #{value}"
        end
    end
    
end