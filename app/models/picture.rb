class Picture < ApplicationRecord
	belongs_to :post
	has_attached_file :image,
		:styles => { medium: "500x500>", thumb: "300x300!" },
		:url => "/assets/arts/:id/:style/:basename.:extension",
		:path => "#{Rails.root}/public/assets/arts/:id/:style/:basename.:extension"
	do_not_validate_attachment_file_type :image
end
