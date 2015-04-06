apache:
  pkg.latest:
    - pkgs:
      - httpd
      - mod_perl
      - mod_python
      - mod_ssl
      - mod_auth_mysql
  service.running:
    - name: httpd
    - watch:
      - pkg:  apache
      - file: httpd.conf
      - file: ssl.conf
      - user: apache
  user.present:
    - uid: 48
    - gid: 48
    - home: /var/www/html
    - shell: /bin/nologin
    - require:
      - group: apache
  group.present:
    - gid: 48
    - require:
      - pkg: apache

{% if grains['osmajorrelease'] == '5' %}
httpd.conf:
  file.managed:
    - name: /etc/httpd/conf/httpd.conf
    - source: salt://pacclient/apache/httpd-centos5.conf
    - user: root
    - group: root
    - mode: 644
{% endif %}

{% if grains['osmajorrelease'] == '5' %}
ssl.conf:
  file.managed:
    - name: /etc/httpd/conf.d/ssl.conf
    - source: salt://pacclient/apache/ssl-centos5.conf
    - user: root
    - group: root
    - mode: 644
{% endif %}
