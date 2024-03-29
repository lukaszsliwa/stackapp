class Attachment < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  belongs_to :attachable, :polymorphic => true

  mount_uploader :file, AttachmentUploader

  before_save :set_content_type_and_size
  validates :file, :presence => true

  private

  def set_content_type_and_size
    if file.present? && file_changed?
      file.tap { |x|
        self.content_type = x.file.content_type
        self.size = x.file.size
      }
    end
  end
end
