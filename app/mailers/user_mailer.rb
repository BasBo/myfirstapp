class UserMailer < ApplicationMailer
	default from: "sbottermann@web.de"

	def contact_form(email, name, message)
		@message = message
		mail(:from =>email,
			:to => "sbottermann@web.de",
			:subject => "A new contact message from #{name}")
	end
end
