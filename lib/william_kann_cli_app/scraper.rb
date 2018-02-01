require 'nokogiri'
require 'open-uri'
require 'pry'

class EdgarScraper
    
    @@index_url = "https://www.sec.gov/Archives/edgar/full-index/"
    @@doc = Nokogiri::HTML(open(@@index_url))
    
    def self.scrape_years
        years = @@doc.css("td a").collect {|x| x.attribute("href").value}
        years -= years.select {|x| x.include?("xml")}     
    end
    
    def self.scrape_for_last_quarter(year)
        @@index_url << year
        @@doc = Nokogiri::HTML(open(@@index_url))
        qtrs = @@doc.css("td a").collect {|x| x.attribute("href").value}
        qtrs.last
    end
    
    def self.scrape_for_last_13fhr(year)
        @@index_url << year
        @@doc = Nokogiri::HTML(open(@@index_url))
        qtrs = @@doc.css("td a").collect {|x| x.attribute("href").value}
        @@index_url << qtrs.last
        @@doc = Nokogiri::HTML(open(@@index_url))
    end
    
    
end

EdgarScraper.scrape_for_last_13fhr("2017/")