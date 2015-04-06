php:
  pkg.latest:
    - pkgs:
      - php
      - php-mysql
      - php-odbc
      - php-xml
      - php-pear
      - php-ldap
      - php-soap
      - php-mbstring
      - php-mcrypt
#php.ini:
#  file.managed:
#    - name: /etc/httpd/conf/httpd.conf
#    - source: salt://pacclient/apache/httpd.conf
#    - user: root
#    - group: root
#    - mode: 644
