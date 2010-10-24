class ExternalUser < ActiveResource::Base
  self.site = AppConfig.external_site
  self.element_name = "user"

  def to_user
    user = User.new :external_id => self.id, :email => self.email
    user.role = self.role rescue nil
    user.role = "user" unless user.role?
    user.identity_url = self.identity rescue nil
    user.login = self.login rescue nil
    user.login = user.email unless user.login?
    user.login = user.identity_url unless user.login?
    user.save!
    user
  end
end
