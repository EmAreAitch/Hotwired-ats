module ApplicationHelper
	def job_options_for_select(account_id)
  	Job.where(account_id: account_id).order(:title).pluck(:title, :id)
	end
	def fetch_filter_key(resource, user_id, key)
  	Kredis.hash("#{resource}_filters:#{user_id}")[key]
	end
end