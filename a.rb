require 'BCrypt'
signup_password = BCrypt::Password.create("my password")

login_password = BCrypt::Password.new("signup_password")

if login_password == "my password" #←login password
    p "ログイン成功"
end