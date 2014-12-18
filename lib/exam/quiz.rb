class Quiz
    
	attr_accessor :name, :questions, :answers

	def initialize name, &block
		@name = name
		@questions = []
		@answers = []
		@correctas = []
		@counter = 0

		if block_given?  
	    if block.arity == 1
	      yield self
	    else
	     instance_eval &block 
	    end
	  end
	end    
	
	def to_s
	    output = name
	    output << "\n#{'=' * name.size}\n\n"
	    questions.each_with_index do |question, index|
	    	output << "#{index+1}) #{question}\n"
			end
	    output
  	end	
  	
	def question(name, options = {})
		@counter = 0
	    q = name
	    answers << options
	
	    options.each do | k,v |
	        q << "\n\t#{k.first}) #{v}"
	    end
	
	    questions << q
	end  	
    
	def wrong
		@counter += 1
		[@counter, :wrong]
	end

	def right
		@counter += 1
		@correctas << @counter
		[@counter, :right]
    end      
    
	def run eleccion

		cor = ""

		cor << "#{name}\n#{'=' * name.size}\n\n"
		questions.each_with_index do |question, index|
    		cor << "#{index+1}) #{question}\n"
			cor << "Respuesta: #{eleccion[index]}\n"
		end

	    contador = 0
		    
	    eleccion.each_with_index do |x,i|
	        if (x == answers[i][[@correctas[i],:right]]) 
	            cor << "Pregunta #{i+1} correcta.\n"
	            contador+=1
	        else
	            cor << "Pregunta #{i+1} incorrecta.\n"
	        end
	    end
	    
	    if contador == eleccion.size
	        cor << "Nota: Sobresaliente.\n"
	    elsif contador >= eleccion.size/2
	        cor << "Nota: Aprobado.\n"
	    else
	        cor << "Nota: Suspendido.\n"
	    end
	    cor
	  end
end