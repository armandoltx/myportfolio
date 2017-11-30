module ApplicationHelper
    def login_helper(style = '') # Setting default value to empty so we can use without passing an argument`
        if current_user.is_a?(GuestUser)  # Doing it in order to remove the Logout button when we are logout. Since we added the current_user method we needed to fix it, we just check if current_user belongs to GuestUser class or if it belongs to GuestUser then do not show the button
          (link_to "Register", '#', { id: 'registerBtn', class: style }) + " ".html_safe +
          (link_to "Login" , '#', { id: 'loginBtn',class: style })
        else
          link_to "Logout", destroy_user_session_path, method: :delete, class: style
        end
    end

    def copyright_generator
      ArmandoltxViewTool::Renderer.copyright('ArmandoLtx', 'All Rights Reserved')
    end

    def nav_items
      [
        {
          url: root_path,
          title: 'Home'
        },
        {
          url: about_path,
          title: 'About'
        },
        {
          url: contact_path,
          title: 'Contact'
        },
        {
          url: blogs_path,
          title: 'Blog'
        },
        {
          url: portfolios_path,
          title: 'Portfolio'
        },
        {
          url: tech_news_path,
          title: 'Tech News'
        }
      ]
    end

    def nav_helper(style, tag_type)
      nav_links = ''

      nav_items.each do |item|
        nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active?(item[:url])}'>#{item[:title]}</a></#{tag_type}>"
      end
      nav_links.html_safe
    end

    def active?(path)
      "active" if current_page? path
    end

    def alerts
      alert = (flash[:alert] || flash[:error] || flash[:notice])

      if alert
        alert_generator(alert)
      end
    end

    def alert_generator(msg)
      js add_gritter(msg, title: "Armandoltx Portfolio", sticky: false)
    end

end