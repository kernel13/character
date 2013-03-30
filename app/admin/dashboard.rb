ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
      span :class => "blank_slate" do
        span "Welcome to Active Admin. This is the default dashboard page."
        small "To add dashboard sections, checkout 'app/admin/dashboards.rb'"
      end
    end
    
    columns do
        column do
          panel "Recent logged in User" do
            ul do
                User.order("last_sign_in_at desc").limit(2).map do |user|
                  li link_to(user.email, admin_user_path(user)) + user.last_sign_in_at
                end
            end
          end
        end
        
        column do
          panel "Current loggend in User" do
               User.order("current_sign_in_at desc").limit(2).map do |user|
                  li link_to(user.email, admin_user_path(user)) + user.last_sign_in_at
                end
          end
        end
    end
    

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
