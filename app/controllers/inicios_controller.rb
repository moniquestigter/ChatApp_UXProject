class IniciosController < ApplicationController

	def index 
		@inicios = Inicio.all.order('Created_at DESC')
	end

	def new 
		@inicio = Inicio.new
	end

	def create
		@inicio = current_user.inicios.build(inicio_params)
		if @inicio.save
			flash[:success] = 'Chats iniciados'
			redirect_to inicios_path
		else
			render 'new'
		end
	end

	def show
		@inicio = Inicio.includes(:messages).find_by(id: params[:id])
	end

	private
	def inicio_params
		params.require(:inicio).permit()
	end
end
