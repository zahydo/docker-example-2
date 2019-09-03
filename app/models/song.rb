class Song < ActiveRecord::Base

  #RELACIONES
  belongs_to :genre
  belongs_to :tuning
  belongs_to :user
  has_many :comments, :dependent => :destroy
  belongs_to :rating_caches, :dependent => :destroy

  ratyrate_rateable 'visual_effects', 'original_score', 'director', 'custome_design'

  #CALLBACK
  before_save :set_contador_visitas
  before_save :minusculas_atributos

  #VALIDACIONES
  validates :titulo, :presence => {:message => "El titulo es requerido"}
  validates :autor, :presence => {:message => "El autor es requerido"}
  validates :anio_creacion, :presence => {:message => "El año de creacion es requerido"}
  validates :album, :presence => {:message => "El album es requerido"}
  validates :letra, :presence => {message: "La letra es requerida"}
  validates :letra, :length => {minimun: 50, maximum: 5000, message: "La letra es muy corta "}
  validates :url_video, :presence => {:message => "La url del video es requerida"}

  # Validamos en una expresion regular
  VALID_TITULO_REGEX = /\A[a-zA-F0-9ñÑáéíóú ]+\z/i
  validates :titulo, format: { :with => VALID_TITULO_REGEX , message: "Utiliza solo letras y numeros" }

  VALID_AUTOR_REGEX = /\A[a-zA-FñÑáéíóú ]+\z/i
  validates :autor, format: { :with => VALID_AUTOR_REGEX , message: "Utiliza solo letras" }

  VALID_ALBUM_REGEX = /\A[a-zA-F0-9ñÑáéíóú ]+\z/i
  validates :album, format: { :with => VALID_ALBUM_REGEX , message: "Utiliza solo letras y numeros" }

  VALID_LETRA_REGEX = /\A[a-zA-Z0-9ñÑáéíóú_\-+*,.;:¡!"?¿'()#$%&={}º\[\]\\^´\r\n… ]+\z/i
  validates :letra, format: { :with => VALID_LETRA_REGEX , message: "No utilice caracteres como < >" }

  VALID_URL_REGEX = /\A[a-zA-Z0-9ñÑáéíóú_\-+*,.;:¡!"?¿'()#$%&={}º\[\]\\^´\n… ]+\z/i
  validates :url_video, format: { :with => VALID_URL_REGEX , message: "Url invalida" }

  #MÉTODOS DEL MODELO
  def update_contador_visitas
    #Si el contador de visitas es nulo, guardelo -> Activa before_save que llama a set_...
    self.save if self.contador_visitas.nil?
    self.update(contador_visitas: self.contador_visitas + 1)
  end

  private

  def minusculas_atributos
    self.titulo = self.titulo.downcase
    self.autor = self.autor.downcase
    self.album = self.album.downcase
  end

  def set_contador_visitas
    #Sí contador_visitas es nulo asignarle 0, sino dejarlo como está
    self.contador_visitas ||= 0
  end
end