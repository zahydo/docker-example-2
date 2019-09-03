# == Schema Information
#
# Table name: users
#
#  id                        :integer          not null, primary key
#  email                     :string           not null
#  encrypted_password        :string           not null
#  reset_password_token      :string
#  reset_password_sent_at    :datetime
#  remember_created_at       :datetime
#  sign_in_count             :integer          default(0), not null
#  current_sign_in_at        :datetime
#  last_sign_in_at           :datetime
#  current_sign_in_ip        :string
#  last_sign_in_ip           :string
#  nombres                   :string           not null
#  apellidos                 :string           not null
#  apodo                     :string           not null
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  imagenPerfil_file_name    :string
#  imagenPerfil_content_type :string
#  imagenPerfil_file_size    :integer
#  imagenPerfil_updated_at   :datetime
#  role                      :integer          default(0)
#

class User < ActiveRecord::Base

	has_many :songs, :dependent => :destroy
  has_many :comments,  :dependent => :destroy
  ratyrate_rater



	enum role: [:normal_user, :admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


    validates :apodo, :uniqueness => {:message => "Ya existe un apodo con este nombre"}
    validates :apodo, :presence => {:message => "El apodo es requerido"}
    validates :nombres, :presence => {:message => "El nombre es requerido"}
    validates :apellidos, :presence => {:message => "El apellido es requerido"}
    validates :password, length: {minimum: 8, maximum: 15, :message => "La contraseña debe contener minimo 8 caracteres y maximo 15 "}
    validates :password_confirmation, length: {minimum: 8, maximum: 15, :message => "La confirmacion de contraseña debe contener minimo 8 caracteres y maximo 15 "}
    validates :password_confirmation, :presence => {:message => "La confirmación de contraseña no puede estar vacía"}
    
    # Validamos en una expresion regular
    VALID_NOMBRE_REGEX = /\A[a-zA-FñÑáéíóú ]+\z/i
    validates :nombres, format: { :with => VALID_NOMBRE_REGEX , message: "Utiliza solo letras" }

    VALID_APELLIDO_REGEX = /\A[a-zA-FñÑáéíóú ]+\z/i
    validates :apellidos, format: { :with => VALID_APELLIDO_REGEX , message: "Utiliza solo letras" }

    VALID_APODO_REGEX = /\A[a-zA-F0-9áéíóúñÑ_\-]+\z/i
    validates :apodo, format: { :with => VALID_APODO_REGEX , message: "Utiliza solo letras, numeros, guiones y guion bajo" }

    VALID_PASSWORD_REGEX = /\A[a-zA-Z0-9_.,+*&%ñÑáéíóú´\-]+\z/i
    validates :password, format: { :with => VALID_PASSWORD_REGEX , message: "Contraseña invalida" }

    VALID_PASSWORDC_REGEX = /\A[a-zA-Z0-9_.,+*&%ñÑáéíóú´\-]+\z/i
    validates :password_confirmation, format: { :with => VALID_PASSWORDC_REGEX , message: "Confirmacion de contraseña invalida" }


    #MANEJO DE IMÁGENES
    has_attached_file :imagenPerfil,
                      styles: { medium:"1280x720", thumb:"100x100>" },
                      :default_url => '/assets/default_user2.png'
    validates_attachment_content_type :imagenPerfil, content_type: /\Aimage\/.*\Z/
end
