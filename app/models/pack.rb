class Pack < ActiveRecord::Base
  validates :user_id, presence: true
  validates :title, presence: true, uniqueness: true
  validates :screenshot, presence: true
  validates :status, presence: true, inclusion: {in: ['Concept', 'Developement', 'Complete', 'Inactive']}
  mount_uploader :screenshot, ScreenshotUploader
  belongs_to :user
  after_create :set_author
  scope :latest, order: 'updated_at desc'
  scope :hottest, order: 'updated_at desc'
  def tag
    "#{self.title} by #{self.user.name}"
  end
private
  def set_author
    if self.user
      self.user.update_attribute(:author, true)
    end
  end
end
