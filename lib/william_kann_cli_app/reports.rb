class Reports
    
    attr_accessor :year, :qtr, :investor, :companies
    
    def initialize(hash)
        @companies = %w{}
        investor_name = nil
        investor_cik = nil
        hash.each do |key, value|
            @year = value if key == :year
            @qtr = value if key == :qtr
            investor_name = value if key == :investor
            investor_cik = value if key == :cik
            if investor_name != nil && investor_cik != nil
                @investor = Investors.find_or_create_by_name(investor_name, investor_cik)
            end
            if key != :year && key != :qtr && key != :investor && key != :cik
                @companies << {
                    Companies.find_or_create_by_name(key.to_s, cik = nil) => value
                    }
            end
        end
    end
    
    def self.print_report(object)
        puts "#{object.investor.name} holdings as of #{object.year}, #{object.qtr.upcase}"
        puts "The Securities and Exchange Commission has not necessarily reviewed the information in this filing and has not determined if it is accurate and complete. The reader should not assume that the information is accurate and complete."
        object.companies.each do |x|
            x.each do |key, value|
                puts "#{key.name.gsub("_", " ").split.map(&:capitalize).join(' ')} - #{value}"
            end
        end
    end
    
end