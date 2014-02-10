About
================================================================================

A thin wrapper on top of the
[puppetlabs/mysql](https://forge.puppetlabs.com/puppetlabs/mysql). Reduces the
amount of duplicate code in node manifest files.

```puppet
    mysql_replication::master_master { '10.0.0.120':
      server_id => "2",
      root_password => "a_root_password",
    }
```

License
================================================================================

All code written by me is released under MIT license. See the attached
license.txt file for more information, including commentary on license choice.
