module ApplicationHelper
	def title(*words)
		unless words.empty?
			content_for :title do
				(words << "ActionDepot").join(" - ")
			end
		end
	end
end
