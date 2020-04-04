class Image < ApplicationRecord
    belongs_to :item, optional: true
    mount_uploader :src, ImageUploader

    # バリデート
    validates :src, presence: true
end
