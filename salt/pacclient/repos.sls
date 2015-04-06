# Install the mysql-community repository
{% if grains['osmajorrelease'] == '7' %}
  mysql-community:
    cmd.run:
      - name: yum -y install http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm; yum makecache
{% endif %}
