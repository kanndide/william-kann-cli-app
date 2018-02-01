class WilliamKannCliApp::CLI
    
    def call
        puts "Welcome to the Warren Buffet (Berkshire Hathaway) holdings thingy!"
    end
    
    def main_menu
        puts "What would you like to see?"
        puts "Current holdings, or holdings for another year?"
        user_input = gets.strip
    end
    
    def display_years
        EdgarScraper.scrape_years.each do |x|
            
        end
    end
    
    
    
        
end