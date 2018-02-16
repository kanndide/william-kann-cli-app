require "william_kann_cli_app/version"

module WilliamKannCliApp
    class CLI
    
        def call
            puts "Welcome to the Warren Buffet (Berkshire Hathaway) holdings thingy!"
            main_menu
        end
    
        def main_menu
            puts "What would you like to see?"
            puts "Current holdings, or holdings for another year? Type 'current holdings' or 'different year'."
            user_input = gets.strip
            if user_input == "Current holdings" || user_input == "current holdings" || user_input == "Current Holdings"
                object = Reports.new(EdgarScraper.hash_13fhr("2017", "qtr4"))
                Reports.print_report(object)
            elsif user_input == "Different year" || user_input == "different year" || user_input == "Different year"
                choose_your_own
            elsif user_input == "exit"
                exit
            end
            restart
        end
    
        def display_years
            EdgarScraper.scrape_years.each do |x|
                puts "#{x.gsub('/', '')}"
            end
        end
    
        def display_qtr(year)
            EdgarScraper.scrape_for_qtr(year).each do |x|
                puts "#{x.gsub('/', '')}"
            end
        end
    
        def choose_your_own
            puts "What year would you like to see"
            puts "*Note that some years or quarters may not have the correct format to show data.*"
            display_years
            puts "Please choose a year."
            year = gets.strip
            puts "What quarter would you like to check?"
            display_qtr(year)
            puts "Please choose a quarter."
            qtr = gets.strip
            object = Reports.new(EdgarScraper.hash_13fhr(year, qtr))
            Reports.print_report(object)
        end
    
        def restart
            puts "Would you like to know more?"
            user_input = gets.strip
            if user_input == "yes"
                main_menu
            else
                exit
            end
        end  
        
        def self.error_restart
            puts "Would you like to try again?"
            user_input = gets.strip
            if user_input == "yes"
                self.new.call
            else
                exit
            end
        end
        
    end
end
