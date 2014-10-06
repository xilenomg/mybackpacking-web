class Checkin < ActiveRecord::Base
  belongs_to :user
  belongs_to :place

  validates :user, :presence => true
  validates :place, :presence => true
end
