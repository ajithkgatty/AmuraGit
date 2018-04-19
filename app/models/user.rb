class User < ApplicationRecord
	def self.from_omniauth(auth)
	    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
	    p "helloo"	
	     auth.credentials.to_json
	     p "byeee"
	      user.email = auth.info.email
	      user.uid = auth.uid
	      user.provider = auth.provider
	      # user.username = auth.info.name
	      user.username = auth.extra.raw_info.login
	      user.oauth_token = auth.credentials.token
	     
	      user.save!
	    end
    end
end
