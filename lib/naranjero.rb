class Naranjero
    
	attr_reader :altura, :edad, :vivo
	attr_accessor :naranjas

	def initialize altura,edad
		@altura, @edad = altura, edad
		@naranjas = 0
		@max_edad = 20
		@adulto = 4
		@vivo = true
		@produccion = []
		@mutex= Mutex.new
	end
	
	def uno_mas	
		if @edad < @max_edad
			@edad += 1
			@altura += 0.5
			if @edad.between?(4,10)
				@mutex.synchronize { @naranjas += 5	}
				@produccion << 5
			elsif @edad.between?(11,20)
				@mutex.synchronize { @naranjas += 8 }
				@produccion << 8
			end
		else
			@mutex.synchronize { @naranjas = 0 }
			@altura = 0
			@vivo = false
		end
	end

	def recolectar_una
		if @naranjas > 0
			@mutex.synchronize { @naranjas -= 1 }
		end
		if @edad >= @max_edad
			@mutex.synchronize { @naranjas = 0 }
			@vivo = false
			puts "El naranjo ha muerto."
		elsif @naranjas == 0
			puts "No hay naranjas."
		else
			puts "Estaba muy rica."
		end
	end
end	