class Verfal < Exam::Exam
    
    attr_accessor :pregunta
    
    def initialize pregunta
        @pregunta = pregunta
        super(pregunta,{a: "Cierto", b: "Falso"})
    end
end