# == Class: scala
#
# Install the Typesafe scala stack
#
class scala {
  include ::scala::giter8
  include ::scala::lang
  include ::scala::sbt
}
