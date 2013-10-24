class Mod < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, presence:  true
  validates :user_id, presence: true
  validates :screenshot, presence: true
  validates :category_id, presence: true
  validates :status, presence: true, inclusion: {in: ['Concept', 'Developement', 'Complete', 'Inactive']}
  mount_uploader :screenshot, ScreenshotUploader
  belongs_to :user
  belongs_to :category
  has_many :versions
  after_create :set_author
  scope :latest, order: 'updated_at desc'
  scope :hottest, order: 'updated_at desc'
  def last_version
    self.versions.last if self.versions.length > 0
  end
  def tag
    "#{self.name} by #{self.user.name}"
  end
private
  def set_author
    if self.user
      self.user.update_attribute(:author, true)
    end
  end
end
