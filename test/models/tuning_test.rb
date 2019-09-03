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

require 'test_helper'

class TuningTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
