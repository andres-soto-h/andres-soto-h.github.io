

module Conexiones

    class GPS

        attr_reader :lat_lng

        def initialize()
            @lat_lng=[]
        end

        def location    
            lat_lng.push(rand(-90.0000000..90.0000000))
            lat_lng.push(rand(-180.0000000..180.0000000))
        end

    end

    class Internet

        def speed
            p "La velocidad de conexión es: #{rand(5.00..20.00).round(2)} MB"
        end

    end

    class TV

        attr_accessor :channels

        def initialize(channel_list)
            @channels=channel_list
        end

        def movie_on_channel(channel_name)
            if @channels.has_key?(channel_name) 
            
                list=@channels[channel_name]
                n=rand(0..list.length-1)
                p "Estamos presentando: #{list[n]} en #{channel_name.to_s.upcase}"

            else

                p "No tienes #{channel_name.to_s.upcase} en tu paquete de TV."
            
            end
        end

    end


    class Climate

        def get_forecast(day_time)

            try=0
            forecast_result=0

            options={soleado: Array(7..10), lluvia: Array(11..12), nublado: Array(13..16)}

            options.each do |key,value|

            if value.include?(day_time)  
                    p "El pronóstico para las #{day_time} es: #{key.to_s}"
                else 
                    try+=1
                end
            
            end

            if try==3
                 p "No hay pronosticos para las #{day_time}"
            end

        end

    end
    
end
