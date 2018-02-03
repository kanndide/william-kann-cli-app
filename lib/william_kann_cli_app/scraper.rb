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
    
    def self.scrape_for_qtr(year)
        @@index_url << "#{year}/"
        @@doc = Nokogiri::HTML(open(@@index_url))
        qtrs = @@doc.css("td a").collect {|x| x.attribute("href").value}
        binding.pry
    end
    
    def self.scrape_for_last_13fhr(qtr)
        @@index_url << "#{qtr.upcase}/"
        @@doc = Nokogiri::HTML(open(@@index_url))
        files_to_scrape = @@doc.css("td a").select {
            |x| x.attribute("href").value.include?(".xml")}.collect {
                |x| x.attribute("href").value}
        binding.pry
    end
    
end

EdgarScraper.scrape_for_qtr("2017")
EdgarScraper.scrape_for_last_13fhr("qtr4")