# Install the salt repository
salt-repo:
  file.managed:
    - name: /etc/yum.repos.d/saltstack-salt-el5-epel-5.repo
    - source: salt://devops/repos/saltstack-salt-el5-epel-5.repo
    - user: root
    - group: root
    - mode: 644
# Install the pandorafms repository
pandora-repo:
  file.managed:
    - name: /etc/yum.repos.d/pandorafms.repo
    - source: salt://devops/repos/pandorafms.repo
    - user: root
    - group: root
    - mode: 644
# Install the rpmforge repository
rpmforge:
  cmd.run:
    - name: rpm -ih http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm && yum-config-manager --enable rpmforge
    - unless: test -f /etc/yum.repos.d/rpmforge.repo
