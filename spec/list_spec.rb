# encoding: UTF-8
require 'indice'
require 'spec_helper'

describe List do

	before :each do
		@lista = List.new
		@n1 = Nodo.new(nil,5,nil)
		@n2 = Nodo.new(nil,8,nil)

		@p1 = Exam::Exam.new("1.-) ¿Cuál es la salida del siguiente código Ruby?\nclassXyz\n\tdef pots\n\t\t@nice\n\tend\nend\n\nxyz = Xyz.new\np xyz.pots", {a: "#<Xyz:0xa000208>", b: "nil", c: "0", d: "Ninguna de las anteriores"})
		@p2 = Exam::Exam.new("2.-) La siguiente definiciçopn de un hash en Ruby es válida:\nhash_raro = {[1,2,3] => Object.new(), Hash.new => :toto}", {a: "Cierto", b: "Falso"})
		@p3 = Exam::Exam.new("3.-) ¿Cuál es la salida del siguiente código Ruby?\nclass Array\n\tdef say_hi\n\t\t\"HEY!\"\n\tend\nend\n\np[1,\"bob\"].say.hi", {a: "1", b: "bob", c: "HEY!", d: "Ninguna de las anteriores"})
		@p4 = Exam::Exam.new("4.-) ¿Cuál es el tipo de objeto en el siguiente código Ruby?\nclass Objeto\nend", {a: "Una instancia de la clase Class", b: "Una constante", c: "Un objeto", d: "Ninguna de las anteriores"})
		@p5 = Exam::Exam.new("5.-) Es apropiado que una clase Tablero herede de una clase Juego.", {a: "Cierto", b: "Falso"})
		@np1 = Nodo.new(nil,@p1,nil)
		@np2 = Nodo.new(nil,@p2,nil)
		@np3 = Nodo.new(nil,@p3,nil)
		@np4 = Nodo.new(nil,@p4,nil)
		@np5 = Nodo.new(nil,@p5,nil)
	end 

	describe "# Debe existir un Nodo de la lista con sus datos y su siguiente" do
		it "Existen los datos" do
			@n1.value.should eq(5) 
		end
		it "Existe un next" do
			@n1.next.should eq(nil)  
		end
	end

	describe "# Se puede insertar un elemento" do
		it "Insertar por el final " do
			@lista.insert_end(@n1)
		end
	end

	describe "# Se pueden insertar varios elementos" do
		it "Introduce varios nodos" do
			@lista.insert_end_many(@n1,@n2)
		end
	end

	describe "# Se puede extraer el primer elemento de la lista" do
		it "Extraer inicio" do
			@lista.extract_first  #Si la lista esta vacia no extrae nada y no da error
			@lista.insert_end(@n1)
			@lista.insert_end(@n2)			
			@lista.extract_first   #Se puede extraer con la lista no vacia
		end
	end

	describe "# Se puede mostrar un elemento y su siguiente" do
		it "Mostrar " do
			@lista.insert_end(@n1)
			#@lista.to_s.should eq("[5|] => ")
		end
	end

	describe "# Debe existir una Lista con su cabeza" do
		it "Cabeza de la lista" do
			@lista.insert_end(@n1)
			@lista.inicio.should eq(@n1)
		end
	end

	describe "# Seleccion de preguntas" do
		it "Prueba" do
			@lista.insert_end_many(@np1,@np2,@np3,@np4,@np5)
			#puts @lista
		end
	end	
	

	describe "# Mostrar nodo anterior" do
		it "Mostrar" do
			@lista.insert_end_many(@n1,@n2)
			expect(@lista.final.prev.value).to eq(5)
		end
	end
	
	describe "# Los nodos son comparables" do
		it "Comparar dos nodos" do
		expect(@n1<@n2).to eq(true)
		end
	end
	
	describe "#La lista es enumerable" do
		it "Mostrar los elementos de la lista mediente 'collect'" do
			@lista.insert_end_many(@np1,@np2)
			expect(@lista.map { |x| "#{x}" }).to eq(["#{@np1.value}", "#{@np2.value}"])
		end
		it "Cual es el mayor elemento?" do
			@lista.insert_end_many(@np1,@np5)
			expect(@lista.max).to eq(@np1.value)
		end
		it "Cual es el primer elemento?" do
			@lista.insert_end_many(@np1,@np2)
			expect(@lista.first).to eq(@np1.value)
		end
		it "Esta la pregunta entre la lista de preguntas?" do
			@lista.insert_end_many(@np1,@np2,@np3,@np4,@np5)
			expect(@np1.value.between?(@lista.first,@lista.first)).to eq(true)
		end
	end
	
	
	
end