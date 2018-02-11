module InvestorsApp
    module Errors
        class DataNotFoundError < StandardError
            def message
                "No data was found for the requested year & quarter."
            end
        end
    end
end