# == Schema Information
#
# Table name: chords
#
#  id            :integer          not null, primary key
#  nombre_acorde :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Chord < ActiveRecord::Base
	has_many :figurechords
end
