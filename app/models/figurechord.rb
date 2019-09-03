# == Schema Information
#
# Table name: figurechords
#
#  id                        :integer          not null, primary key
#  nombre_figura             :string
#  chord_id                  :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  imagenFigura_file_name    :string
#  imagenFigura_content_type :string
#  imagenFigura_file_size    :integer
#  imagenFigura_updated_at   :datetime
#

class Figurechord < ActiveRecord::Base
  belongs_to :chord
end
