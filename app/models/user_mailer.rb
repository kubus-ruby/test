class UserMailer < ActionMailer::Base
	def order_email(order)
		recipients order.email
		from "admministrator@asd.sd"
		subject "your order"
		sent_on Time.now
		body ({:order => order})
	end

end
