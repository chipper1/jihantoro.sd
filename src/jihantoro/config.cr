# Blog config options

# Start new database connection
SQL = DB.open "sqlite3://db.sql"

# `host_binding` for setting web host
# set `host_binding` to 0.0.0.0 for public site access
# set `host_binding` to localhost for local only access
# default value for this site is "0.0.0.0"
Kemal.config.host_binding = "0.0.0.0"

# `port` for setting your web port
# default value for this site is 2500
Kemal.config.port = 2500

# `server_static` with Directory Listing and GZIP Compression
# default value for this site is {"dir_listing" => false, "gzip" => true}
Kemal.config.serve_static = {"dir_listing" => false, "gzip" => true}

# `public_folder` for serving static file,
# default value is "./public"
Kemal.config.public_folder = "./public"

# `logging` for showing Kemal & Site log message
# default value is true
Kemal.config.logging = false

# `env`, Kemal environment config
# make sure to set this option to "production"
# if your site is on public production mode
# default value is "development"
Kemal.config.env = "development"
