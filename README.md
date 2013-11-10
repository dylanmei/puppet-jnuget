puppet-jnuget
==============

##Overview
The jnuget module allows you to install and configure a [Java NuGet server](http://code.google.com/p/jnuget) application with minimal effort.

##Setup/Example

### Default (basic default, best used with hiera to provide data)

    include jnuget::webapp

### Example site.pp

    user { 'jnuget':
      ensure     => present,
      managehome => true,
    }

    tomcat7_rhel::tomcat_application { 'jnuget':
      application_root => "/opt",
      tomcat_user      => "jnuget",
      tomcat_port      => "8080",
      jvm_envs         => "-server -Xmx1024m -Xms128m -XX:MaxPermSize=256m \
                           -Dcom.sun.management.jmxremote \
                           -Dcom.sun.management.jmxremote.authenticate=false \
                           -Dcom.sun.management.jmxremote.ssl=false",
      require          => User['jnuget'],
    }

    class { 'jnuget::webapp':
      user     => 'jnuget',
      source   => 'chocolatey',
      require  => [
        User['jnuget'],
        Tomcat7_Rhel::Tomcat_application['jnuget']
      ],
    }

##Caveats

Supports one package source at the moment.

Supports one user and api-key at the moment.

Requires [maestrodev/puppet-wget](https://github.com/maestrodev/puppet-wget)
