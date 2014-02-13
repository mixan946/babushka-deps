require 'byebug'
dep 'add_user', :username, :app_path do

  username.ask("Type 'username' which you want to add?")
  app_path.ask("Tyle 'app_path' where you want to add permission for #{username}").default("/rails_projects/#{username}")

  met? do
    shell? "cat /etc/passwd | cut -d: -f1 | grep #{username}"
  end

  meet do
    if app_path.p.exist?
      shell "adduser --no-create-home --home #{app_path} --ingroup sshusers dr_tai"
    else
      raise "There no directory #{app_path}"
    end
  end

end
