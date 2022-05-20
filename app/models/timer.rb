class Timer < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :work_time, presence: true
  validates :rest_time, presence: true

  enum switch: { OFF: 0, ON: 1 }
  enum character: { pome: 0 }
end
