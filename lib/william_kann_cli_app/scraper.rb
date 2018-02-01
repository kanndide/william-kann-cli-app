require 'nokogiri'
require 'open-uri'
require 'pry'

class EdgarScraper
    
    def self.scrape_current_holdings(index_url)
        doc = Nokogiri::HTML(open(index_url))
        years = doc.css("td a").collect {|x| x.attribute("href").value}
        years = years - years.select {|x| x.include?("xml")}
        binding.pry      
    end
    
    
end

EdgarScraper.scrape_index_page("https://www.sec.gov/Archives/edgar/daily-index/")