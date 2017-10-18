module ApplicationHelper
    def login_helper(style = '') # Setting default value to empty so we can use without passing an argument
        if current_user.is_a?(GuestUser)  # Doing it in order to remove the Logout button when we are logout. Since we added the current_user method we needed to fix it, we just check if current_user belongs to GuestUser class or if it belongs to GuestUser then do not show the button
          (link_to "Register", new_user_registration_path, class: style) + " ".html_safe +
          (link_to "Login" , new_user_session_path, class: style)
        else
          link_to "Logout", destroy_user_session_path, method: :delete, class: style
        end
    end

    def copyright_generator
      ArmandoltxViewTool::Renderer.copyright('ArmandoLtx', 'All Rights Reserved')
    end
end