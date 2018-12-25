# Resume Builder

## Overview
This web app allows users to easily create a beautiful, professional resume.

### Features:
- Users can register (hopefully add OAuth for one-click registration through Facebook/Google)
- Users can login
- Users can CRUD `user_address` objects, information about themselves that allows for a Applicant Tracking Systems to find them easily (e.g., zip code for candidates-within-this-radius searches)
- Users can CRUD `experience` objects, describing different positions they have held, job descriptions, durations, etc.
- Users can CRUD `education` objects, describing degrees they have, years they attended school, etc.
- Users can CRUD `philanthropy` objects, describing the various ways they have volunteered, given back to the community, the duration they did this for, etc.
-

### Set Up

#### Pull the project and install dependencies

One-liner:

```
$ git clone https://github.com/markrmullan/ResumeBuilderRails && cd ResumeBuilderRails && bundle install
```

See `Troubleshooting` section for more information. If there are issues during `bundle install` on OS X El Capitan, I think you might have to execute
```
ResumeBuilder (master) $ bundle install --path vendor/bundle
```

#### Set up MySQL
TODO. This step is probably the most difficult.



`rake db:create` to create databases

`rake db:migrate` to run migrations

`rake db:seed` to seed db with data defined in `seeds.rb`


### Troubleshooting
I had a ton of trouble installing Ruby on Rails on Mac OS X El Capitan. Seems related to the [System Integrity Protection](https://support.apple.com/en-us/HT204899) feature that was introduced with that version of the OS.
