class Timer < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 20 }
  validates :work_time, presence: true
  validates :rest_time, presence: true
  validates :start_time, presence: true
  validates :finish_time, presence: true

  enum switch: { off: 0, on: 1 }
  enum character: { pome: 0 }
  enum repetition: { no_repeat: 0, everyday: 1, monday: 2, tuesday: 3, wednesday: 4, thursday: 5, friday: 6, saturday: 7, sunday: 8}
end
