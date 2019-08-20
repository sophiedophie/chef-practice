# InSpec test for recipe workstation::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

# unless os.windows?
#   # This is an example test, replace with your own test.
#   describe user('root'), :skip do
#     it { should exist }
#   end
# end
#
# # This is an example test, replace it with your own test.
# describe port(80), :skip do
#   it { should_not be_listening }
# end

system_policies = 'HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System'

describe registry_key('System Policies', system_policies) do
  its('EnableLUA') { should eq 0 }
  its('ConsentPromptyBehaviorAdmin') { should eq 0 }
end
