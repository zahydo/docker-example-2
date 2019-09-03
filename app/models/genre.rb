# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  nombre     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Genre < ActiveRecord::Base
	has_many :songs
end
