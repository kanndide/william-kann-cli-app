require 'nokogiri'
require 'open-uri'
require 'pry'

class EdgarScraper
    
    INDEX_URL = "https://www.sec.gov/Archives/edgar/full-index/"
    DOC = Nokogiri::HTML(open(INDEX_URL))
    BH_CIK = "1067983"
    BASE_URL = "https://www.sec.gov"
    
    
    def self.scrape_years
        years = DOC.css("td a").collect {|x| x.attribute("href").value}
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
        
        files_to_scrape.collect do |x|
            url = index_url.dup << "#{x}"
            self.scrape_landing_page(self.scrape_xml(url, BH_CIK).join) if      self.scrape_xml(url, BH_CIK) != [] &&
                self.scrape_landing_page(self.scrape_xml(url, BH_CIK).join) != BASE_URL
        end   
    end
    
    def self.scrape_xml(url, cik)
        doc = Nokogiri::HTML(open(url))
        files = doc.text.split("\n").select {|x| x.include?("https")}
        matches = files.select {|x| x.include?("#{cik}")}
        matches.collect {|x| x.strip}
    end
    
    def self.scrape_landing_page(url)
        doc = Nokogiri::HTML(open(url))
        information = doc.css("td a").select {
            |x| x.text.include?("form13fInfoTable.html")}.collect {
                |x| x.attribute("href").value}
        BASE_URL.dup << information.join
    end
    
    self.hash_13fhr(year, qtr)
        doc = Nokogiri::HTML(open(self.scrape_for_13fhr(year, qtr).strip))
        13fhr_array = doc.css("tr").collect {|x| x.css("td").text}
        binding.pry
    end
    
end


#puts EdgarScraper.scrape_for_13fhr("2017", "qtr4")
#puts EdgarScraper.scrape_xml("https://www.sec.gov/Archives/edgar/full-index/2017/QTR4/sitemap.quarterlyindex4.xml", "1067983").join
#EdgarScraper.scrape_landing_page("https://www.sec.gov/Archives/edgar/data/1067983/000095012317010896/0000950123-17-010896-index.htm")
 
