# == Schema Information
#
# Table name: tunings
#
#  id               :integer          not null, primary key
#  nombre_afinacion :string
#  descripcion      :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Tuning < ActiveRecord::Base
	has_many :songs
end
