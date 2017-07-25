# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Admin user
admin = User.create!({
    email: Rails.configuration.secrets['admin_email'],
    password: Rails.configuration.secrets['password'],
    password_confirmation: Rails.configuration.secrets['password']
  })

admin.add_role :admin

# Create a volunteers
User.create!([
  {
    email: 'v1@smartcity.org',
    password: 'passc0de',
    password_confirmation: 'passc0de'
  },
  {
    email: 'v2@smartcity.org',
    password: 'passc0de',
    password_confirmation: 'passc0de'
  },
  {
    email: 'v3@smartcity.org',
    password: 'passc0de',
    password_confirmation: 'passc0de'
  },
  {
    email: 'v4@smartcity.org',
    password: 'passc0de',
    password_confirmation: 'passc0de'
  }
  ])

# Create few projects
Project.create([
    {
      title: 'Oma Kulam',
      description: 'Oma Kulam is a pond situated in Madhavaram Zone of Greater Chennai Corporation.',
      is_active: true,
      image: Rails.root.join("db/seed_image/omakulam.jpg").open,
      location: 'POINT (13.154747 80.225952)',
      specifications: {
        area: 8093.71,
        budget: 6,
        bod: 3,
        ph: 6.3,
        cod: 3
      }
    },
    {
      title: 'Aavin Pond',
      description: 'Aavin Pond has been chosen for restoration by CMWSSB as part of the Sustainable Water Mission.',
      is_active: true,
      image: Rails.root.join("db/seed_image/aavinpond.jpg").open,
      location: 'POINT (13.150860 80.242396)',
      specifications: {
        area: 8093.71,
        budget: 6,
        bod: 3,
        ph: 6.3,
        cod: 3
      }
    },
    {
      title: 'Savadi Kulam',
      description: 'Savadi Kulam has been chosen for restoration by CMWSSB as part of the Sustainable Water Mission.',
      is_active: true,
      image: Rails.root.join("db/seed_image/savadikulam.jpg").open,
      location: 'POINT (13.132679 80.196302)',
      specifications: {
        area: 8093.71,
        budget: 6,
        bod: 3,
        ph: 6.3,
        cod: 3
      }
    },
    {
      title: 'Chettimedu Sakthi Amman Koil Street Pond',
      description: 'Chettimedu Sakthi Amman Koil Street Pond has been chosen for restoration by CMWSSB as part of the Sustainable Water Mission.',
      is_active: true,
      image: Rails.root.join("db/seed_image/chettimedu.jpg").open,
      location: 'POINT (13.178309 80.202723)',
      specifications: {
        area: 8093.71,
        budget: 6,
        bod: 3,
        ph: 6.3,
        cod: 3
      }
    },
    {
      title: 'Vadaperumbakkam Pond',
      description: 'Vadaperumbakkam Pond has been chosen for restoration by CMWSSB as part of the Sustainable Water Mission.',
      is_active: true,
      image: Rails.root.join("db/seed_image/vadaperumbakkam.jpg").open,
      location: 'POINT (13.181542 80.229921)',
      specifications: {
        area: 8093.71,
        budget: 6,
        bod: 3,
        ph: 6.3,
        cod: 3
      }
    },
    {
      title: 'Panda Kulam',
      description: 'Panda Kulam has been chosen for restoration by CMWSSB as part of the Sustainable Water Mission.',
      is_active: true,
      image: Rails.root.join("db/seed_image/pandakulam.jpg").open,
      location: 'POINT (13.152983 80.227328)',
      specifications: {
        area: 8093.71,
        budget: 6,
        bod: 3,
        ph: 6.3,
        cod: 3
      }
    }
  ])
