class Examen
    
    attr_accessor :preguntas, :respuestas
    
    def initialize preg, resp
        @preguntas = preg
        @respuestas = resp
        @reverse = Proc.new{|x| x.to_reverse}
    end
    
    
    def to_reverse
        @reverse.call(@preguntas) 
    end
    
end