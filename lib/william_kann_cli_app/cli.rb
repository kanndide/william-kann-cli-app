class WilliamKannCliApp::CLI
    
    def call
        puts "Welcome to the Warren Buffet (Berkshire Hathaway) holdings thingy!"
        main_menu
    end
    
    def main_menu
        puts "What would you like to see?"
        puts "Current holdings, or holdings for another year? Type 'current holdings' or 'different year'."
        user_input = gets.strip
        if user_input == "Current holdings" || user_input == "current holdings" || user_input == "Current Holdings"
            EdgarScraper.hash_13fhr("2017", "qtr4")
        elsif user_input == "Different year" || user_input == "different year" || user_input == "Different year"
            choose_your_own
        end
    end
    
    def display_years
        EdgarScraper.scrape_years.each do |x|
            
        end
    end
    
    def display_qtr
        
    end
    
    def choose_your_own
        
    end
    
    
    
        
end