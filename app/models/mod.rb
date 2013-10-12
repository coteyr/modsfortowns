class Mod < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, presence:  true
  validates :user_id, presence: true
  belongs_to :user
  has_many :versions
  def last_version
    self.versions.last
  end
end
