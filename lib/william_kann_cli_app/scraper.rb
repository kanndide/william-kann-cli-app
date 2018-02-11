require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative 'concerns/findable'
require_relative 'investors'

class EdgarScraper
    
    INDEX_URL = "https://www.sec.gov/Archives/edgar/full-index/"
    DOC = Nokogiri::HTML(open(INDEX_URL))
    BH = Investors.new("Berkshire Hathaway Inc", "1067983")
#    BH_CIK = "1067983"
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
            self.scrape_landing_page(self.scrape_xml(url, BH.cik).join) if      self.scrape_xml(url, BH.cik) != [] &&
                self.scrape_landing_page(self.scrape_xml(url, BH.cik).join) != BASE_URL
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
    
    def self.hash_13fhr(year, qtr)
        doc = Nokogiri::HTML(open(self.scrape_for_13fhr(year, qtr).join))
        hash = {:year => year, :qtr => qtr.upcase, :investor => BH.name, :cik => BH.cik}
        form_array_raw = doc.css("tbody[1] tr").collect do |x|
                        x.css("td").collect do |x|  
                            x.text    
                        end  
                    end
        form_array = form_array_raw.drop(3).each do |x|
            x[0].gsub!(" ", "_")
            x[0].gsub!("&", "AND") if x[0].include?("&")
            end
        
        form_array.collect do |x|
            if hash.include?(x[0].to_sym)
                hash[x[0].to_sym] += x[4].tr(",", "").to_i
            else
                hash[x[0].to_sym] = x[4].gsub(",", "").to_i
            end
        end 
        hash
        binding.pry
    end
    
end

EdgarScraper.hash_13fhr("2017", "qtr4")