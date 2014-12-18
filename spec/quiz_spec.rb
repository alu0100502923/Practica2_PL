# encoding: utf-8

require 'indice'
require 'spec_helper'

describe Quiz do
    before :each do
       @quiz = Quiz.new("Cuestionario LPP") do
            question '¿Cuantos argumentos de tipo bloque se le pueden pasar a un metodo?',
            wrong=> '4',
            right=> '1',
            wrong=> '2'
        
            question '¿Ruby es un lenguaje interpretado?',
            wrong=> 'No',
            right=> 'Si'
        end
    end
    
    describe "probando la clase quiz" do
        it "Comprobando que se imprima el test" do
        
            expect(@quiz.to_s).to eq("Cuestionario LPP\n================\n\n1) ¿Cuantos argumentos de tipo bloque se le pueden pasar a un metodo?\n\t1) 4\n\t2) 1\n\t3) 2\n2) ¿Ruby es un lenguaje interpretado?\n\t1) No\n\t2) Si\n")    
    
        end
        it "corregir un test" do
            expect(@quiz.run(["1","Si"])).to eq("Cuestionario LPP\n================\n\n1) ¿Cuantos argumentos de tipo bloque se le pueden pasar a un metodo?\n\t1) 4\n\t2) 1\n\t3) 2\nRespuesta: 1\n2) ¿Ruby es un lenguaje interpretado?\n\t1) No\n\t2) Si\nRespuesta: Si\nPregunta 1 correcta.\nPregunta 2 correcta.\nNota: Sobresaliente.\n")
        end
    end
    
    
end