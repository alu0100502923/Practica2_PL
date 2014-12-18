module Exam
	class Exam

		include Comparable

		attr_accessor :pregunta, :respuestas

		def initialize pregunta, respuestas
			@pregunta, @respuestas = pregunta, respuestas
		end
		def to_s
			preg = "#{@pregunta}\n"
			@respuestas.each do |k,v|
				preg += "#{k}) #{v}\n"
			end
			preg
		end

		def <=> other
			self.pregunta.size <=> other.pregunta.size
		end
		
		def == other
			self.pregunta == other.pregunta
		end
	end
end