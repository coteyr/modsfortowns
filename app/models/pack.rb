class Pack < ActiveRecord::Base
  validates :user_id, presence: true
  validates :title, presence: true
end
