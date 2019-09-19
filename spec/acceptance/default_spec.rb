require 'spec_helper_acceptance'

describe 'vision_smart' do
  context 'with defaults' do
    it 'idempotentlies run' do
      pp = <<-FILE

        # Just so that Puppet won't throw an error
       if($facts[os][distro][codename] != 'jessie') {
        file {['/etc/init.d/smartd']:
          ensure  => present,
          mode    => '0777',
          content => 'case "$1" in *) exit 0 ;; esac'
        }}

        class { 'vision_smart':
        }

      FILE

      apply_manifest(pp, catch_failures: true)
    end
  end

  context 'packages installed' do
    describe package('smartmontools') do
      it { is_expected.to be_installed }
    end
  end

  context 'files provisioned' do
    describe file('/etc/smartd.conf') do
      it { is_expected.to be_file }
      it { is_expected.to be_owned_by 'root' }
      it { is_expected.to be_mode 644 }
      it { is_expected.to contain 'This file is managed by Puppet' }
      it { is_expected.to contain 'DEVICESCAN' }
    end
  end
end
