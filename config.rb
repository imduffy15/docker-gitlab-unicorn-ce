module Gitlab
  module Auth
    module OAuth
      class Config
        class << self
          def options
            Gitlab::Auth::OAuth::Provider.config_for('oauth2_generic')
          end

          def groups
            options[:groups_attribute]
          end

          def admin_groups
            options[:admin_groups]
          end
        end
      end
    end
  end
end

