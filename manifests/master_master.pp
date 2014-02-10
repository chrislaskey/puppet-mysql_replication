define mysql_replication::master_master (
  $remote_ip = $title,
  $server_id,
  $root_password,
  $auto_increment_offset = $server_id,
  $auto_increment_increment = 10,
){

  # Setting up master_master replication requires ordered syncing between two
  # nodes. Though this may be possible in Puppet using exported variables, it is
  # much easier to setup the initial replication manually or with a
  # multi-machine script like Python Fabric.

  class{ "mysql::server":
    root_password     => $root_password,
    override_options  => {
      "mysqld"              => {
        "server-id"         => $server_id,
        "log_bin"           => "mysql-bin",
        "log_bin_index"     => "mysql-bin.index",
        "relay_log"         => "mysql-relay-bin",
        "relay_log_index"   => "mysql-relay-bin.index",
        "expire_logs_days"  => "10",
        "max_binlog_size"   => "100M",
        "log_slave_updates" => "1",
        "bind_address"      => "0.0.0.0",
        # Prevent auto increment collisions
        # http://scale-out-blog.blogspot.com/2012/04/if-you-must-deploy-multi-master.html
        "auto_increment_offset"    => $auto_increment_offset,
        "auto_increment_increment" => $auto_increment_increment,
      },
    },
  }
}
