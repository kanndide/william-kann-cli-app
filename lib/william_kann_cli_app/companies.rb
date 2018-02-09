class Companies
    
    attr_accessor :name
    
    @@all = []
    
    def initialize(name)
        @name = name
        @@all << self
    end
    
    def self.all
        @@all
    end
    
    def self.find_by_name(company)
        self.all.detect {|x| x.name == company}
    end
    
    def self.find_or_create_by_name(company)
        if self.find_by_name(company) != nil
            self.find_by_name(company)
        else
            Company.new(company)
        end
    end
    
end