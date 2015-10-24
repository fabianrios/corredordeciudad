class EventosController < ApplicationController
  before_action :set_evento, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_action :tag_cloud
  
  # GET /eventos
  # GET /eventos.json
  def index
    
    @tags = current_user.tag_counts_on(:tags)
    if current_user.try(:admin?) && params[:tag]
      @eventos = Evento.tagged_with(params[:tag])
    elsif current_user.try(:admin?)
      @eventos = Evento.all
    elsif params[:tag]
      @eventos = Evento.where(:user_id => current_user.id).tagged_with(params[:tag])
    else
      @eventos = Evento.where(:user_id => current_user.id)
    end
  end

  # GET /eventos/1
  # GET /eventos/1.json
  def show
  end

  # GET /eventos/new
  def new
    @evento = Evento.new
  end

  # GET /eventos/1/edit
  def edit
  end

  # POST /eventos
  # POST /eventos.json
  def create
    @evento = Evento.new(evento_params)

    respond_to do |format|
      if @evento.save
        format.html { redirect_to eventos_url, notice: 'El evento fue exitosamente creado.' }
        format.json { render :show, status: :created, location: @evento }
      else
        format.html { render :new }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventos/1
  # PATCH/PUT /eventos/1.json
  def update
    respond_to do |format|
      if @evento.update(evento_params)
        format.html { redirect_to eventos_url, notice: 'El evento fue actualizado.' }
        format.json { render :show, status: :ok, location: @evento }
      else
        format.html { render :edit }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventos/1
  # DELETE /eventos/1.json
  def destroy
    @evento.destroy
    respond_to do |format|
      format.html { redirect_to eventos_url, notice: 'El evento fue eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento
      @evento = Evento.find(params[:id])
    end
    
    def tag_cloud
      @tags = Evento.tag_counts_on(:tags).order('count desc').limit(20)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def evento_params
      params.require(:evento).permit(:nombre, :lugar, :direccion, :espacio, :necesidades, :descripcion, :web, :cuando, :imagen, :duracion, :user_id, :publish, {:tag_list => []})
    end
end
