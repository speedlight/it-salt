mysql:
  pkg.latest:
    - pkgs:
      - mysql
      - mysql-server
      - mysql-connector-odbc
      - unixODBC
      - perl-DBD-MySQL
  service.running:
    - name: mysqld
    - watch:
      - pkg:  mysql
