@config = { host: 'my.host.com',
            port: '9999',
            database: 'my_database',
            user: ENV['REDSHIFT_USER'].try(:strip),
            adapter: 'redshift',
            aws_access_key: ENV['AWS_ACCESS_KEY_ID'].try(:strip),
            aws_secret_key: ENV['AWS_SECRET_ACCESS_KEY'].try(:strip) }
