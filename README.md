# Chennai Smart City - Community Engagement Platform

[![Build Status](https://travis-ci.org/rajbharath/swasm.svg?branch=master)](https://travis-ci.org/rajbharath/swasm)
[![Code Climate](https://codeclimate.com/github/rajbharath/swasm/badges/gpa.svg)](https://codeclimate.com/github/rajbharath/swasm)

This project is part of Chennai Smart City for engaging the community. Currently SWaSM (Sustainable Water Security Mission) is one of the initiatives of that. It can evolve into complete package for all sort of smart city initiatives.

* Website Link
  TODO

* To get the code
  TODO

* System dependencies
  - Ruby 2.4.1
  - Rails 5
  - Google api for places
  - Google api for reCaptcha
  - Postgresql 9.6

* Keys Configuration
  - GOOGLE_MAP_API_KEY
  - CLOUDINARY CLOUDNAME
  - CLOUDINARY API_KEY
  - CLOUDINARY API_SECRET

* Environment Variables
  export the following environment variables in your ```.bashrc``` or ```.zshrc```

 ```
      export GOOGLE_API_KEY="<<Google location api key>>"
      export CLOUDINARY_URL="<<Cloudinary url>>"
      export RECAPTCHA_SITE_KEY="<<Google Recaptcha site key>>"
      export RECAPTCHA_SECRET_KEY="<<Google Recaptcha secret key>>"
  ```

* Database creation
  - db: postgresql 9.6
  - extensions: postgis, hstore

* Database initialization
  - rake db:create
  - rake db:migrate
  - rake db:seed

* How to run the test suite
  ```bundle exec rake ```

* Deployment instructions
  TODO

* Livereload during development
  ``` cd <<project_folder>> ```
  ``` gaurd ```

* Contribution

* License
  Content is released under GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007

* Code of Conduct
  TODO

* Disclaimer
  TODO
