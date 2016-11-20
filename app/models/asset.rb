class Asset < ApplicationRecord

	mount_uploader :asset, AssetUploader

end
