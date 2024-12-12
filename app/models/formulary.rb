class Formulary < ApplicationRecord
  has_one_attached :attachment

  private

  def attachment_size
    if attachment.attached? && attachment.blob.byte_size > 3.megabytes
      errors.add(:attachment, I18n.t('formularies.errors.file_too_large'))
    end  
  end  
end
