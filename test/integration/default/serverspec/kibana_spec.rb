require 'spec_helper'

describe file('/etc/kibana/kibana.yml') do
  it { should exist }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its(:sha256sum) { should eq '85df2c6c511c7bb0efee94c79df701dea21109c742c28c6132091ec6f003f393' }
end

describe service('kibana') do
  it { should_not be_enabled }
  it { should_not be_running }
end
