class Version < ActiveRecord::Base
  validates :number, presence: true
  validates :mod_id, presence: true
  validates :major_changes, presence: true
  validates :download, presence: true
  mount_uploader :download, ModUploader
  belongs_to :mod
  default_scope order: 'created_at desc'
end
