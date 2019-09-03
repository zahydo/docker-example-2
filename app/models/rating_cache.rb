class RatingCache < ActiveRecord::Base
  belongs_to :cacheable, :polymorphic => true
  belongs_to :song
end