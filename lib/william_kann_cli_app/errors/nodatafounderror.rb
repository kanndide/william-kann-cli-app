module InvestorsApp
    module Errors
        class DataNotFoundError < StandardError
            def message
                puts "No data was found for the requested year & quarter."
                WilliamKannCliApp::CLI.error_restart
            end
        end
    end
end