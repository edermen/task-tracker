module Sorcery
	module TestHelpers
		module Rails
			module Integration
				def login_user(user, password)
					page.driver.user(user_sessions_url, { login: user, password: password})
				end
			end
		end
	end
end