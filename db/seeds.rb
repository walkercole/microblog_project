walker= User.create! username: "wcole", password: "wdi16"
Profile.create! user: walker, full_name: "walker andrew cole", bio: "rad drummer, turned rad skateboarder, turned okay programmer", location: "DC"
walker2= User.create! username: "swole", password: "123"
Profile.create! user: walker2, full_name: "walker cole",  bio: "lame af", location: "DC"