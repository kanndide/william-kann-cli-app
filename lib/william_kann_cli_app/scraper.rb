require 'nokogiri'
require 'open-uri'
require 'pry'

class EdgarScraper
    
    def self.scrape_index_page(index_url)
        doc = Nokogiri::HTML(open(index_url))
        binding.pry      
    end
    
    
end

EdgarScraper.scrape_index_page("https://www.sec.gov/Archives/edgar/daily-index/")