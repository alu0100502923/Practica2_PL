class Interfaz
   
    attr_accessor :examen, :eleccion
    def initialize examen
       @examen = examen
       @eleccion = []
    end
    
    def soluciones
        sol = ""
        @examen.respuestas.each_with_index do |x,i|
            sol << "#{i+1}.#{x}\n" 
        end
        sol
    end
       
       
    def interaccion
       
        aux = @examen.preguntas.inicio
       
        @examen.preguntas.each do |pregunta|
            puts pregunta
            @eleccion << aux.value.respuestas.values.sample
            puts "Contestacion: #{@eleccion.last}"
            aux = aux.next
        end
    end
    
    def correccion
        
        cor = ""
        contador = 0
        
        @eleccion.each_with_index do |x,i|
            if (x == @examen.respuestas[i]) 
                cor << "Pregunta #{i+1} correcta.\n"
                contador+=1
            else
                cor << "Pregunta #{i+1} incorrecta.\n"
            end
        end
        
        if contador == @eleccion.size
            cor << "Nota: Sobresaliente.\n"
        elsif contador >= @eleccion.size/2
            cor << "Nota: Aprobado.\n"
        else
            cor << "Nota: Suspendido.\n"
        end
        cor
    end
end