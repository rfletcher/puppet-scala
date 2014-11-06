# == Class: scala
#
# Install the Typesafe scala stack
#
class scala {
  validate_re($::osfamily, '^Debian$', "This module relies on a deb package \
and only works on Debian based distros")

  include ::scala::giter8
  include ::scala::lang
  include ::scala::sbt
}
