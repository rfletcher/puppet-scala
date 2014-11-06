require 'spec_helper'

describe 'scala', :type => :class do
  supported_os   = { :osfamily => 'Debian', :lsbdistid => 'Ubuntu', :lsbdistcodename => 'precise' }
  unsupported_os = { :osfamily => 'RedHat', :lsbdistid => 'CentOS', :lsbdistcodename => 'centos'  }

  let( :facts ) { supported_os }

  it { should contain_class( 'scala::giter8' ) }
  it { should contain_class( 'scala::lang' )   }
  it { should contain_class( 'scala::sbt' )    }

  context 'with an invalid distro name' do
    let( :facts ) { unsupported_os }

    it do
      expect {
        should contain_package( 'scala' )
      }.to raise_error( Puppet::Error, /only works on Debian-based distros/ )
    end
  end

  context 'giter8', :type => :class do
    it { should contain_class( 'scala::repository' ) }
    it { should contain_package( 'g8' ).with_ensure( 'present' ) }
  end

  context 'lang', :type => :class do
    it { should contain_class( 'scala::repository' ) }
    it { should contain_package( 'scala' ).with_ensure( 'present' ) }
  end

  context 'sbt', :type => :class do
    it { should contain_class( 'scala::repository' ) }
    it { should contain_package( 'sbt' ).with_ensure( 'present' ) }
  end

  context 'repository', :type => :class do
    it { should contain_class( 'apt' )          }
    it { should contain_class( 'apt::update' )  }
    it { should contain_class( 'wget' )         }

    it { should have_wget__fetch_resource_count( 1 ) }

    it { should contain_package( 'typesafe-repo' ) }
  end
end
