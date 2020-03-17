class Image < ApplicationRecord
    belongs_to :item
    mount_uploader :src, ImageUploader

    # バリデート
    validates :src, presence: true
end
