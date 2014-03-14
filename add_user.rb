dep 'add_user', :username, :password do
  username.ask("Type 'username' which you want to add")
  met? do
    "cat /etc/passwd | cut -d: -f1".p.grep(username)
  end
  meet do
    "useradd -m -s /bin/bash -p PASSWORD USER_NAME"
  end
end
