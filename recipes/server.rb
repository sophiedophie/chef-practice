powershell_script 'Install IIS' do
  code 'Add-WindowsFeature Web-Server'
end

file 'C:\inetpub\wwwroot\Default.htm' do
  content "<h1>Hello world~</h1>
  <h2>PLATFORM: #{node['platform']}</h2>
  <h2>HOSTNAME: #{node['hostname']}</h2>
  <h2>MEMORY: #{node['memory']['total']}</h2>
  <h2>CPU Mhz: #{node['cpu']['0']['mhz']}</h2>
  <br />
  <h2>whatever information: #{node}</h2>
  "
end

service 'w3svc' do
  action [ :enable, :start ]
end
