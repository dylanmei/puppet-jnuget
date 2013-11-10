puppet-jnuget
==============

##Overview
The jnuget module allows you to install and configure a [Java NuGet server](http://code.google.com/p/jnuget) application with minimal effort.

##Setup/Example

### Default (basic default, best used with hiera to provide data)

    include jnuget::webapp

### Slightly more complicated

    class { 'nuget::webapp':
      version =>  '0.7.3',
      user    =>  'tomcat-user',
      feed    =>  'chocolatey',
    }

###Caveats

Supports one package source at the moment.

Supports one user and api-key at the moment.

Requires [maestrodev/puppet-wget](https://github.com/maestrodev/puppet-wget)

Tested on CentOS using the excellent [laurilehmijoki/tomcat7\_rhel module](http://github.com/laurilehmijoki/tomcat7_rhel/tree/master/manifests)
