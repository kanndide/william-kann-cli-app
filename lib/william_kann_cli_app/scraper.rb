require 'nokogiri'
require 'open-uri'
require 'pry'

class EdgarScraper
    
    INDEX_URL = "https://www.sec.gov/Archives/edgar/full-index/"
    @@doc = Nokogiri::HTML(open(INDEX_URL))
    
    def self.scrape_years
        years = @@doc.css("td a").collect {|x| x.attribute("href").value}
        years -= years.select {|x| x.include?("xml")}     
    end
    
    def self.scrape_for_qtr(year)
        index_url = INDEX_URL.dup
        index_url << "#{year}/"
        doc = Nokogiri::HTML(open(index_url))
        qtrs = doc.css("td a").collect {|x| x.attribute("href").value}
    end
    
    
    def self.scrape_for_13fhr(year, qtr)
        index_url = INDEX_URL.dup
        index_url << "#{year}/#{qtr.upcase}/"
        doc = Nokogiri::HTML(open(index_url))
        
        files_to_scrape = doc.css("td a").select {
            |x| x.attribute("href").value.include?(".xml")}.collect {
                |x| x.attribute("href").value}
        
    end
    
end

EdgarScraper.scrape_for_13fhr("2017", "qtr4")
