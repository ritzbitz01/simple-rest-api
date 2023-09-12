class Incident < ApplicationRecord
  validates :sys_id, presence: true
  validates :number, presence: true
end
