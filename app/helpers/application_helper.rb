module ApplicationHelper
    def login_helper
        if current_user.is_a?(GuestUser)  # Doing it in order to remove the Logout button when we are logout. Since we added the current_user method we neede to fix it, we just check if current_user belongs to GuestUser class or if it belongs to GuestUser then do not show the button
          (link_to "Register", new_user_registration_path) + "<br>".html_safe +
          (link_to "Login" , new_user_session_path)
        else
          link_to "Logout", destroy_user_session_path, method: :delete
        end
    end

    def copyright_generator
      ArmandoltxViewTool::Renderer.copyright('ArmandoLtx', 'All Rights Reserved')
    end
end