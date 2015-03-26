apache:
  pkg.installed:
    - pkgs:
      - httpd
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

httpd.conf:
  file.managed:
    - name: /etc/httpd/conf/httpd.conf
    - source: salt://pacclient/files/httpd.conf
    - user: root
    - group: root
    - mode: 644

ssl.conf:
  file.managed:
    - name: /etc/httpd/conf.d/ssl.conf
    - source: salt://pacclient/files/ssl.conf
    - user: root
    - group: root
    - mode: 644
