# USER SEED DATA

u1 = User.create!(
                  name: 'Admin',
                  email: "test@test.com",
                  roles: "site_admin",
                  password: 123456
                )
u2 = User.create!(
                  name: 'Armando',
                  email: "t@test.com",
                  roles: "user",
                  password: 123456
                )


# --- TOPIC SEED DATA --- #

3.times do |topic|
  Topic.create!(
    title: "#{topic}"
  )
end

puts "3 Topics created"

# --- BLOG SEED DATA --- #

b1 = Blog.create!(
  title: "Blog Manual",
  body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sagittis lacus eu erat malesuada pretium quis vel nisl. Nunc lobortis dui sit amet ipsum ultrices viverra. Morbi laoreet, est et venenatis vestibulum, nibh mauris mattis lacus, ac tincidunt purus neque a nisi. Nulla malesuada porttitor malesuada. Nam id odio in dolor sollicitudin tempor. Duis eu eros vel sapien convallis ultricies. Suspendisse vitae commodo dui, ac dictum metus. Mauris sit amet lorem in massa ornare gravida ac in enim. Aenean dignissim lacus nec leo vehicula accumsan. Sed diam tortor, auctor non volutpat eu, ultrices vel mauris. Cras accumsan, sapien quis porttitor scelerisque, orci diam elementum augue, id mollis quam tortor sit amet purus. Cras ultricies luctus ornare.

  Curabitur convallis erat in nibh convallis, eu elementum velit posuere. Suspendisse et ultrices metus, non vestibulum tellus. Fusce pharetra, purus id hendrerit semper, lectus leo facilisis nunc, id cursus ligula nunc et urna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris gravida gravida nulla, vel egestas sapien rutrum a. Mauris id ornare neque. Donec dapibus metus at odio volutpat cursus.",
  topic_id: Topic.first.id
)

10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sagittis lacus eu erat malesuada pretium quis vel nisl. Nunc lobortis dui sit amet ipsum ultrices viverra. Morbi laoreet, est et venenatis vestibulum, nibh mauris mattis lacus, ac tincidunt purus neque a nisi. Nulla malesuada porttitor malesuada. Nam id odio in dolor sollicitudin tempor. Duis eu eros vel sapien convallis ultricies. Suspendisse vitae commodo dui, ac dictum metus. Mauris sit amet lorem in massa ornare gravida ac in enim. Aenean dignissim lacus nec leo vehicula accumsan. Sed diam tortor, auctor non volutpat eu, ultrices vel mauris. Cras accumsan, sapien quis porttitor scelerisque, orci diam elementum augue, id mollis quam tortor sit amet purus. Cras ultricies luctus ornare.

    Curabitur convallis erat in nibh convallis, eu elementum velit posuere. Suspendisse et ultrices metus, non vestibulum tellus. Fusce pharetra, purus id hendrerit semper, lectus leo facilisis nunc, id cursus ligula nunc et urna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris gravida gravida nulla, vel egestas sapien rutrum a. Mauris id ornare neque. Donec dapibus metus at odio volutpat cursus.

    Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    topic_id: Topic.last.id
  )
end

puts "Blogs created"

8.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio Title N #{portfolio_item}",
    subtitle: "Ruby on Rails",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sagittis lacus eu erat malesuada pretium quis vel nisl. Nunc lobortis dui sit amet ipsum ultrices viverra. Morbi laoreet, est et venenatis vestibulum, nibh mauris mattis lacus, ac tincidunt purus neque a nisi. Nulla malesuada porttitor malesuada. Nam id odio in dolor sollicitudin tempor. Duis eu eros vel sapien convallis ultricies. Suspendisse vitae commodo dui, ac dictum metus. Mauris sit amet lorem in massa ornare gravida ac in enim. Aenean dignissim lacus nec leo vehicula accumsan. Sed diam tortor, auctor non volutpat eu, ultrices vel mauris. Cras accumsan, sapien quis porttitor scelerisque, orci diam elementum augue, id mollis quam tortor sit amet purus. Cras ultricies luctus ornare.",
    thumb_image:"http://via.placeholder.com/350x200" ,
    main_image: "http://via.placeholder.com/400x400"
  )
end
p1 = Portfolio.create!(
  title: "Portfolio Title N",
  subtitle: "Angular",
  body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sagittis lacus eu erat malesuada pretium quis vel nisl. Nunc lobortis dui sit amet ipsum ultrices viverra. Morbi laoreet, est et venenatis vestibulum, nibh mauris mattis lacus, ac tincidunt purus neque a nisi. Nulla malesuada porttitor malesuada. Nam id odio in dolor sollicitudin tempor. Duis eu eros vel sapien convallis ultricies. Suspendisse vitae commodo dui, ac dictum metus. Mauris sit amet lorem in massa ornare gravida ac in enim. Aenean dignissim lacus nec leo vehicula accumsan. Sed diam tortor, auctor non volutpat eu, ultrices vel mauris. Cras accumsan, sapien quis porttitor scelerisque, orci diam elementum augue, id mollis quam tortor sit amet purus. Cras ultricies luctus ornare.",
  thumb_image:"http://via.placeholder.com/350x200" ,
  main_image: "http://via.placeholder.com/400x400"
)

puts "Portfolios created"

3.times do |technology|
  Portfolio.last.technologies.create!(
    name: "Technology #{technology}"
  )
end

puts "Technology created"
