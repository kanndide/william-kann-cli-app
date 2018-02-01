require 'nokogiri'
require 'open-uri'
require 'pry'

class EdgarScraper
    
    @@index_url = "https://www.sec.gov/Archives/edgar/full-index/"
    @@doc = Nokogiri::HTML(open(@@index_url))
    
    def self.scrape_years
        index_url = "https://www.sec.gov/Archives/edgar/full-index/"
        doc = Nokogiri::HTML(open(index_url))
        years = doc.css("td a").collect {|x| x.attribute("href").value}
        years -= years.select {|x| x.include?("xml")}     
    end
    
    def self.scrape_for_last_13fhr(year)
        index_url = "https://www.sec.gov/Archives/edgar/full-index/#{year}/"
        doc = Nokogiri::HTML(open(index_url))
        qtrs = doc.css("td a").collect {|x| x.attribute("href").value}
        index_url << qtrs.last
        doc = Nokogiri::HTML(open(index_url))
        files_to_scrape = 
    end
    
end

EdgarScraper.scrape_for_last_13fhr("2017/")