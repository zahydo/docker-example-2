# == Schema Information
#
# Table name: songs
#
#  id               :integer          not null, primary key
#  titulo           :string           not null
#  autor            :string
#  album            :string
#  anio_creacion    :integer
#  letra            :text
#  genre_id         :integer
#  tuning_id        :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  url_video        :string
#  user_id          :integer
#  contador_visitas :integer
#

require 'test_helper'

class SongTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
