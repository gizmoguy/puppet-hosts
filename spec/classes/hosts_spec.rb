require 'spec_helper'

describe 'hosts' do
  let(:hosts_file) { '/etc/hosts' }

  context 'file resource' do
    it { should contain_file(hosts_file).with(
      :ensure => 'present',
      :owner  => 'root',
      :group  => 'root',
      :mode   => '0644'
    )}
  end

  context 'self' do
    context 'domain and certificate set correctly' do
      let(:facts) {{
        :hostname   => 'foo',
        :domainname => 'example.com',
        :clientcert => 'foo.example.com',
      }}

      it { should contain_file(hosts_file).with_content(
        /^127\.0\.1\.1 foo.example.com foo$/
      )}
    end
  end

  context 'loopback' do
    it 'should contain entry for IPv4 loopback' do
      should contain_file(hosts_file).with_content(
        /^127\.0\.0\.1 localhost$/
      )
    end

    it 'should contain entry for IPv6 loopback with additional localhost alias' do
      should contain_file(hosts_file).with_content(
        /^::1 ip6-localhost ip6-loopback localhost$/
      )
    end
  end

  context 'IPv6' do
    it 'should contain standard IPv6 entries' do
      should contain_file(hosts_file).with_content(
/^fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
ff02::3 ip6-allhosts\Z/
      )
    end
  end
end
