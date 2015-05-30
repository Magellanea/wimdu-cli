A standalone app that allows users to list their place via a
CLI. For the sake of simplicity, the data is kept locally. Similar to
the web app it should be possible to enter partial data and continue
later. 

1. [Usage](#usage)
2. [Installation](#installation)
3. [Notes](#notes)

<a name="usage"></a>
### Usage
* Allow users to create new properties from the command line
* Prompt for attributes, validate the input
* When the data entry is interrupted, provide a way to resume entering data
An example session could look like this:

<code>
    $ wimdu list
</code>
    
    No properties found.

<code>
    $ wimdu new
</code>

    Starting with new property ABC1DEF2.

    Title: Amazing room at Wimdu Office
    Address: ^C

<code>
    $ wimdu list
</code>

    No offers found.

<code>
    $ wimdu continue ABC1DEF2
</code>

    Continuing with ABC1DEF2

    Address: Voltastr. 5, 13355 Berlin
    Nightly rate in EUR: 12
    Max guests: Two

    Error: must be a number

    Max guests: 2
    ^C

<code>
    $ wimdu continue ABC1DEF2
</code>

    Continuing with ABC1DEF2

    Email: foo@example.com
    Phone number: +1 555 2368

    Great job! Listing ABC1DEF2 is complete!

<code>
    $ wimdu list
</code>
    Found 1 offer.

    ABC1DEF2: Amazing Room at Wimdu Office


<a name="installation"></a>
### Installation
After you choose the local storage that comply with active-record, change that in the Gemfile, create a file ```config/databases.yml``` similar to ```config/databases.yml.sample``` with your config, follow the following steps

1. ```bundle install```
2. ```rake db:create```
3. ```rake db:migrate```

The project is based on rvm, if you don't use it, the ruby version used here is ```ruby-2.1.2```

<a name="notes"></a>
### Notes
While this project uses ```rvm``` for the sake of ```rspec``` tests, you need ```/usr/bin/ruby``` to match the version required by the implementation i.e. ```ruby-2.1.2```
