module Concerns
    module Findable
    
        def find_by_name(name, cik = nil)
            self.all.find {|x| x.name == name}
        end
    
        def find_or_create_by_name(name, cik = nil)
            if find_by_name(name, cik) == nil
                self.new(name, cik) 
            else
                find_by_name(name, cik)
            end
        end
    end
end 