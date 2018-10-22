class beats::auditbeat(
                        $manage_package              = true,
                        $package_ensure              = 'installed',
                        $manage_service              = true,
                        $manage_docker_service       = true,
                        $service_ensure              = 'running',
                        $service_enable              = true,
                        $audit_files                 = [ $beats::params::audit_file_default ],
                        $shipper_name                = undef,
                        $tags                        = [],
                        $fields                      = {},
                        $logstash_hosts              = [],
                        $elasticsearch_hosts         = [],
                        $output_file_dir             = undef,
                        $output_file_name            = undef,
                        $output_file_rotate_every_kb = '10240',
                        $output_file_number_of_files = '7',
                        $output_file_permissions     = '0600',
                      ) inherits beats::params {

  include ::beats

  Class['::beats'] ->
  class { '::beats::auditbeat::install': } ->
  class { '::beats::auditbeat::config': } ~>
  class { '::beats::auditbeat::service': } ->
  Class['::beats::auditbeat']
}
