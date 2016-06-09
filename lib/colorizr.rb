class String
    @@colors = {
                "red" => "31",
                "green" => "32",
                "yellow" => "33",
                "blue" => "34",
                "pink" => "95",
                "light_blue" => "96",
                "white" => "97",
                "light_grey" => "27",
                "black" => "30"
            }

    def self.colors
        @@colors.keys
    end

    def self.sample_colors
        @@colors.each do |key, value|
            puts "This is \e[#{value}m#{key}\e[0m"
        end
    end

    def self.create_colors
        @@colors.each do |key, value|
            self.send(:define_method, "#{key}") do
                "\e[#{value}m" + self + "\e[0m"
            end
        end
    end

end

String.create_colors

