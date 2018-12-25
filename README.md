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


- Frontend will make requests to get all of this data for the logged in user.
- Users can select from a variety of different resume templates to fit all of that data into some CSS we provide, to make their resume look nice
- Once users pay and checkout, they can download the resume they have created in `.pdf` and `.doc(x)` format.
- TODO: figure out how to charge users after that. They should definitely be able to download the same resume for free after that first time... but should they be able to create and download completely different resumes after they have paid once, or should that require another round of payment?
- TODO: figure out enterprise opportunities. Staffing agencies might like this kind of product so that they can create beautiful resumes of candidates who they are representing. Would need to work out features for these kinds of customers.

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

`rubocop` to lint files, `rubocop -a` to auto-fix violations

## Running tests

Currently, both API tests and unit tests are stored in the `/spec` directory and can be executed by running `bundle exec rspec`. Tests use the RSpec framework.

```
ResumeBuilder (master) $ bundle exec rspec
```

Migrations can be executed on the test db by running:
```
ResumeBuilder (master) $ rake db:migrate RAILS_ENV=test
```

### Troubleshooting
I had a ton of trouble installing Ruby on Rails on Mac OS X El Capitan. Seems related to the [System Integrity Protection](https://support.apple.com/en-us/HT204899) feature that was introduced with that version of the OS.

If you encounter an error like,

```
An error occurred while installing {some dependency} (1.3.13), and Bundler cannot continue.
```

You might have to run,
```
ResumeBuilder (master) $ bundle install --path vendor/bundle
```
