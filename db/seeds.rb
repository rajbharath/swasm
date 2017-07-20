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
      title: 'Velachery Pond Restoration',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
                    do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                    Ut enim ad minim veniam, quis nostrud exercitation ullamco
                    laboris nisi ut aliquip ex ea commodo consequat.
                    Duis aute irure dolor in reprehenderit in voluptate velit
                    esse cillum dolore eu fugiat nulla pariatur.',
      is_active: true,
      image: Rails.root.join("db/seed_image/pond.jpg").open,
      location: 'POINT (12.975971 80.221209)'
    },
    {
      title: 'Shols Pond Restoration',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
                    do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                    Ut enim ad minim veniam, quis nostrud exercitation ullamco
                    laboris nisi ut aliquip ex ea commodo consequat.
                    Duis aute irure dolor in reprehenderit in voluptate velit
                    esse cillum dolore eu fugiat nulla pariatur.',
      is_active: true,
      image: Rails.root.join("db/seed_image/pond.jpg").open,
      location: 'POINT (12.885963 80.232299)'
    },
    {
      title: 'Shols Elcot Pond Restoration',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
                    do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                    Ut enim ad minim veniam, quis nostrud exercitation ullamco
                    laboris nisi ut aliquip ex ea commodo consequat.
                    Duis aute irure dolor in reprehenderit in voluptate velit
                    esse cillum dolore eu fugiat nulla pariatur.',
      is_active: true,
      image: Rails.root.join("db/seed_image/pond.jpg").open,
      location: 'POINT (12.912694 80.223301)'
    },
    {
      title: 'Mambakkam Pond Restoration',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
                    do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                    Ut enim ad minim veniam, quis nostrud exercitation ullamco
                    laboris nisi ut aliquip ex ea commodo consequat.
                    Duis aute irure dolor in reprehenderit in voluptate velit
                    esse cillum dolore eu fugiat nulla pariatur.',
      is_active: true,
      image: Rails.root.join("db/seed_image/pond.jpg").open,
      location: 'POINT (12.835405 80.163361)'
    },
    {
      title: 'Chrompet Pond Restoration',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
                    do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                    Ut enim ad minim veniam, quis nostrud exercitation ullamco
                    laboris nisi ut aliquip ex ea commodo consequat.
                    Duis aute irure dolor in reprehenderit in voluptate velit
                    esse cillum dolore eu fugiat nulla pariatur.',
      is_active: true,
      image: Rails.root.join("db/seed_image/pond.jpg").open,
      location: 'POINT (12.953932 80.123082)'
    }
  ])
