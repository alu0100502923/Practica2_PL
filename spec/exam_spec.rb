# encoding: UTF-8
require 'indice'
require 'spec_helper'

describe Exam do

	before :each do
		@p1 = Exam::Exam.new("¿Cuál de estos lenguajes no es interpretado?", {a: "Python", b: "C/C++", c: "Ruby", d: "JavaScript"})
	end  

	describe "# Almacenamiento de las preguntas y respuestas" do
		it "Existe una pregunta" do
			@p1.pregunta.should eq("¿Cuál de estos lenguajes no es interpretado?") 
		end
		it "Existen opciones de respuesta" do
			@p1.respuestas.should eq({a: "Python", b: "C/C++", c: "Ruby", d: "JavaScript"})  
		end
	end
	describe "#Mostrar por pantalla la pregunta" do
		it "Mostrar por pantalla" do
			@p1.to_s.should eq("¿Cuál de estos lenguajes no es interpretado?\na) Python\nb) C/C++\nc) Ruby\nd) JavaScript\n")
		end
	end
end

describe Seleccionsimple do
	
	before :each do
		@ss1 = Seleccionsimple.new("1.-) ¿Cuál es el tipo del objeto en el siguiente código Ruby?\n\tclass Objeto\n\tend",{a: "Una instancia de la clase Class", b: "Una constante", c: "Un objeto", d: "Ninguna de las anteriores"})
	end

	describe "# Almacenamiento de preguntas de selccion simple" do
		it "Existe una pregunta" do
			expect(@ss1.pregunta).to eq("1.-) ¿Cuál es el tipo del objeto en el siguiente código Ruby?\n\tclass Objeto\n\tend")
		end
	end

end


describe Verfal do
	
	before :each do
		@vf1 = Verfal.new("2.-) Es apropiado que una clase Tablero herede de una clase Juego.")
	end
	
	describe "# Almacenamiento de respuestas verdadero y falso" do
		it "Existen respuestas" do
			expect(@vf1.respuestas).to eq({a: "Cierto", b: "Falso"})
		end
	end
	

end


describe "Comprobar que las preguntas son comparables" do

	before :each do
		@vf1 = Verfal.new("2.-) Es apropiado que una clase Tablero herede de una clase Juego.")
		@ss1 = Seleccionsimple.new("1.-) ¿Cuál es el tipo del objeto en el siguiente código Ruby?\n\tclass Objeto\n\tend",{a: "Una instancia de la clase Class", b: "Una constante", c: "Un objeto", d: "Ninguna de las anteriores"})
	end
	
	describe "son dos preguntas de diferente tamaño?" do
		it "es menor una que otra?" do
			expect(@vf1<@ss1).to eq(true)
		end
		it "son iguales dos preguntas?" do
			expect(@vf1==@ss1).to eq(false)
		end
	end
end