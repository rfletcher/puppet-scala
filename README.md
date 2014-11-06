Puppet module for installing the Typesafe Scala distribution.
 This module is also available on the [Puppet Forge](https://forge.puppetlabs.com/garethr/scala)

[![Build Status](https://secure.travis-ci.org/rfletcher/puppet-scala.png)](http://travis-ci.org/rfletcher/rfletcher-scala)
[![Dependency Status](https://gemnasium.com/garethr/garethr-scala.png)](http://gemnasium.com/garethr/garethr-scala)

## Usage

Install the full scala stack:

    include scala

...or only the parts of the stack you need, choosing from these classes:

    include scala::giter8
    include scala::lang
    include scala::sbt

All software is installed from the Typesafe Apt repository.
