require 'serverspec'

# Required by serverspec
set :backend, :exec

describe package('kibana') do
  it { should be_installed }
end
