module ApplicationHelper
	def title(*words)
		unless words.empty?
			content_for :title do
				(words << "ActionDepot").join(" - ")
			end
		end
	end

	def admins_only(&block)
		block.call if current_user.try(:admin?)
	end
end
