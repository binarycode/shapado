class ExternalUser < ActiveResource::Base
  self.site = AppConfig.external_site
  self.element_name = "user"
end
