require 'spec_helper'

describe file('/etc/kibana/kibana.yml') do
  it { should exist }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its(:sha256sum) { should eq '40f4dd0db8bd15609089c64e2e2d29df7d6dc035841621601ea771f1523d79e9' }
end

describe service('kibana') do
  it { should_not be_enabled }
  it { should_not be_running }
end
