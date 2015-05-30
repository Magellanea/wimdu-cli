A standalone app that allows users to list their place via a
CLI. For the sake of simplicity, the data is kept locally. Similar to
the web app it should be possible to enter partial data and continue
later. 

* Allow users to create new properties from the command line
* Prompt for attributes, validate the input
* When the data entry is interrupted, provide a way to resume entering data
An example session could look like this:

    $ wimdu list
    No properties found.

    $ wimdu new
    Starting with new property ABC1DEF2.

    Title: Amazing room at Wimdu Office
    Address: ^C

    $ wimdu list
    No offers found.

    $ wimdu continue ABC1DEF2
    Continuing with ABC1DEF2

    Address: Voltastr. 5, 13355 Berlin
    Nightly rate in EUR: 12
    Max guests: Two

    Error: must be a number

    Max guests: 2
    ^C
    $ wimdu continue ABC1DEF2
    Continuing with ABC1DEF2

    Email: foo@example.com
    Phone number: +1 555 2368

    Great job! Listing ABC1DEF2 is complete!

    $ wimdu list
    Found 1 offer.

    ABC1DEF2: Amazing Room at Wimdu Office


Steps to setup

After you choose the local storage that comply with active-record, change that in the Gemfile, create a file ```config/databases.yml``` similar to ```config/databases.yml.sample``` with your config, follow the following steps

1. ```bundle install```
2. ```rake db:create```
3. ```rake db:migrate```

The project is based on rvm, if you don't use it, the ruby version used here is ```ruby-2.1.2```