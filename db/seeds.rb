puts "Creating projects"

Project.create(title: "Nairo-BNB", description: "Nairobians are suffering from lack of accommodations and hotels. 
    Nairobnb is an app for booking a place to sleep and enjoy cutting edge technology while feeling right at home.", 
    picture: "https://res.cloudinary.com/abzedmohammed/image/upload/v1671102088/nairobnb/bnb_zejrkw.png", 
url: "https://nairobnb.vercel.app/", tags: ["React", "Rails", "Bootstrap"], date: "10/2022")

Project.create(title: "Buildsoko", description: "Search for building products and finishes across Kenya.", 
    picture: "https://res.cloudinary.com/abzedmohammed/image/upload/v1670429985/buildsoko/soko_vffhsi.png",
url: "https://buildsoko-app.onrender.com/", tags: ["Django", "MdBootstrap", "J-Query"], date: "11/2021")

Project.create(title: "Beach Resort", description: "Reach beach resort displays available rooms and its features and price. 
    Rooms can also be filtered by size, price and type.", 
    picture: "https://res.cloudinary.com/abzedmohammed/image/upload/v1671100845/beach/hotel_dbmnlf.png", 
    url: "https://abzed-beach-resort.netlify.app", tags: ["React", " Contentful"], date: "04/2021")

Project.create(title: "ST-System", description: "ST-System is a student management system implements multi login system 
    for various account types and manages students data in one place, suitable for learning institutions.", 
        picture: "https://res.cloudinary.com/abzedmohammed/image/upload/v1671102570/sis/st_uhtuka.png", 
        url: "https://student-system-mu.vercel.app", tags: ["Angular", "Django REST", "Tailwind CSS"], date: "10/2020")

# Project.create(title: "Awards", description: "Rate applications developed by different programmers and organisations", picture: "url", url: "", 
# tags: ["Django", "Contentful"], date: "10/2020")

puts "DOne!"