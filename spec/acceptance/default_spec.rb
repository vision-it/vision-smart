require 'spec_helper_acceptance'

describe 'vision_smart' do
  context 'with defaults' do
    it 'idempotentlies run' do
      pp = <<-FILE

        # For Bash Lint
        package{'shellcheck':
         ensure => present,
        }

        class { 'vision_smart':
        }

      FILE

      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end
  end

  context 'packages installed' do
    describe package('smartmontools') do
      it { is_expected.to be_installed }
    end
  end

  context 'test-smart lint' do
    describe package('shellcheck') do
      it { is_expected.to be_installed }
    end

    describe command('/usr/bin/shellcheck /usr/local/sbin/smart-test.sh') do
      its(:exit_status) { is_expected.to eq 0 }
    end
  end

  context 'files provisioned' do
    describe file('/usr/local/sbin/smart-test.sh') do
      it { is_expected.to be_file }
      it { is_expected.to be_owned_by 'root' }
      it { is_expected.to be_mode 751 }
      it { is_expected.to contain 'This file is managed by puppet' }
    end

    describe file('/etc/cron.d/smart-long-test') do
      it { is_expected.to be_file }
      it { is_expected.to be_owned_by 'root' }
      it { is_expected.to be_mode 751 }
      it { is_expected.to contain 'This file is managed by puppet' }
    end

    describe file('/etc/cron.d/smart-short-test') do
      it { is_expected.to be_file }
      it { is_expected.to be_owned_by 'root' }
      it { is_expected.to be_mode 751 }
      it { is_expected.to contain 'This file is managed by puppet' }
    end
  end
end
