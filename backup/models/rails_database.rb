# encoding: utf-8

##
# Backup Generated: rails_database
# Once configured, you can run the backup with the following command:
#
# $ backup perform -t rails_database [-c <path_to_configuration_file>]
#
# For more information about Backup's components, see the documentation at:
# http://meskyanichi.github.io/backup
#
Model.new(:rails_database, 'Description for rails_database') do

  ##
  # PostgreSQL [Database]
  #
  database PostgreSQL do |db|
    db.name               = DB_CONFIG["database"]
    db.username           = DB_CONFIG["username"]
    db.password           = DB_CONFIG["password"]
    db.host               = DB_CONFIG["host"]
    db.skip_tables        = []
    db.socket             = DB_CONFIG["socket"]
    db.additional_options = ["-xc", "-E=utf8"]
  end

  ##
  # Amazon Simple Storage Service [Storage]
  #
  store_with S3 do |s3|
    s3.path              = "/#{RAILS_ENV}/daily/"
    s3.bucket            = "tlq_backup_test"
    s3.path              = "rails_database"
  end

  ##
  # Gzip [Compressor]
  #
  compress_with Gzip

end
