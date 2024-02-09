Rails.application.routes.draw do
  
  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:username", { :controller => "users", :action => "show" })
  post("add_user", { :controller => "users", :action => "add" })
  post("/update_user/:id", { :controller => "users", :action => "update"})

  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:id", { :controller => "photos", :action => "show" })
  post("/update_photo/:id", { :controller => "photos", :action => "update" })
  get("/delete_photo/:id", { :controller => "photos", :action => "delete" })
  post("insert_photo_record", { :controller => "photos", :action => "add" })

  post("add_comment", { :controller => "comments", :action => "add" })
  
end
