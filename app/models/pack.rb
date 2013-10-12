class Pack < ActiveRecord::Base
  validates :user_id, presence: true
  validates :title, presence: true, uniqueness: true
  belongs_to :user
end
