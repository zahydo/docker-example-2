class WelcomeController < ApplicationController
	
  def index
  	@diez_mas_populares = Song.limit(5).order(contador_visitas: "DESC")
  end
end

#Cómo el cálculo de predicados resuelve el problema de detectar incosistencias
# (refutación completa, reslocución: como busca en la base de conocimientos)