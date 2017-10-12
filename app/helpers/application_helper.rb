module ApplicationHelper
    def login_helper
        if current_user.is_a?(User) %> <!-- Doing it in order to remove the Logout button when we are logout. Since we added the current_user method we neede to fix it, we just check if current_user belongs to User clas or to OpenStruct class, if it belongs to User then do not show the button  -->
            link_to "Logout", destroy_user_session_path, method: :delete
        else
            (link_to "Register", new_user_registration_path) + "<br>.html_safe" +
            (link_to "Login" , new_user_session_path)
        end    
    end
end