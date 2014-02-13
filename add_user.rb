require 'byebug'
dep 'add_user', :username, :app_path, :password do

  username.ask("Type 'username' which you want to add?")
  app_path.ask("Tyle 'app_path' where you want to add permission for #{username}").default("/rails_projects/#{username}")
  password.ask("Type 'password' which you want to add?")

  met? do
    debugger
    not shell? "cat /etc/passwd | cut -d: -f1 | grep #{username}" &&
      app_path.p.exist?
  end

  meet do
    shell "adduser --no-create-home --home #{app_path} -p #{password} #{username}"
  end

end
