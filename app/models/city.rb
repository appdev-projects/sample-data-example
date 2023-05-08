# == Schema Information
#
# Table name: cities
#
#  id          :integer          not null, primary key
#  name        :string
#  state_full  :string
#  state_short :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class City < ApplicationRecord
end
