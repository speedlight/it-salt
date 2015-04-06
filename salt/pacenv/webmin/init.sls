webminkey:
  cmd.run:
    - unless: 'ls jcameron-key.asc'
    - cwd: /root
    - name: 'wget http://www.webmin.com/jcameron-key.asc; rpm --import jcameron-key.asc'
webmin:
  pkg:
    - installed
    - sources:
      {% if grains['osmajorrelease'] == '5' %}
        - webmin: salt://pacclient/webmin/webmin-1.480-1.noarch.rpm
      {% endif %}
      {% if grains['osmajorrelease'] == '7' %}
        - webmin: salt://pacclient/webmin/webmin-1.740-1.noarch.rpm
      {% endif %}
    - require:
      - cmd: webminkey
