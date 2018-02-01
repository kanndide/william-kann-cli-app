require 'nokogiri'
require 'open-uri'
require 'pry'

class EdgarScraper
    
    index_url = "https://www.sec.gov/Archives/edgar/daily-index/"
    @@doc = Nokogiri::HTML(open(index_url))
    
    def self.scrape_years
        years = @@doc.css("td a").collect {|x| x.attribute("href").value}
        years -= years.select {|x| x.include?("xml")}
        binding.pry      
    end
    
    def self.scrape_for_last_13fhr(year)
        index_url << year
        
    end
    
    
end

EdgarScraper.scrape_index_page("https://www.sec.gov/Archives/edgar/daily-index/")