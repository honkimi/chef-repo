# this is required for capistrano
directory "/var" do
  owner "root"
  group "root"
  mode "0777"
  action :create
end

