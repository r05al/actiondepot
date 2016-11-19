module Admin::PermissionsHelper
	def permissions
		{
			"view" => "View",
			"create_reviews" => "Create Reviews",
			"edit_reviews" => "Edit Reviews",
			"delete_reviews" => "Delete Reviews"
		}
	end
end
