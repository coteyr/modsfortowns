class Pack < ActiveRecord::Base
  validates :user_id, presence: true
  validates :title, presence: true, uniqueness: true
  belongs_to :user
  after_create :set_author
private
  def set_author
    if self.user
      self.user.update_attribute(:author, true)
    end
  end
end
