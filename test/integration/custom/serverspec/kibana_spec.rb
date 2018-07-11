require 'spec_helper'

describe file('/etc/kibana/kibana.yml') do
  it { should exist }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its(:content) { should match /^elasticsearch\.url: https:\/\/localhost:9200/ }
  its(:content) { should match /^elasticsearch\.password: pass/ }
  its(:content) { should match /^elasticsearch\.ssl\.ca: \/etc\/pki\/test_ca\/test_ca_ca_cert\.crt/ }
  its(:content) { should match /^elasticsearch\.ssl\.certificate: \/etc\/pki\/test_ca\/certs\/kibana\.crt/ }
  its(:content) { should match /^elasticsearch\.ssl\.key: \/etc\/pki\/test_ca\/certs\/kibana\.key/ }
  its(:content) { should match /^elasticsearch\.ssl\.verify: true/ }
  its(:content) { should match /^elasticsearch\.username: user/ }
  its(:content) { should match /^server\.host: 0\.0\.0\.0/ }
  its(:content) { should match /^server\.port: 5601/ }
  its(:content) { should match /^server\.ssl\.certificate: \/etc\/pki\/test_ca\/certs\/kibana\.crt/ }
  its(:content) { should match /^server\.ssl\.key: \/etc\/pki\/test_ca\/certs\/kibana\.key/ }
end

describe service('kibana') do
  it { should be_enabled }
  it { should be_running }
end
