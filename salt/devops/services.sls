service: 
    - name: salt-minion 
    - running 
    - require: 
      - cmd: minion-service 
minion-service: 
  cmd.run: 
    - name: /etc/init.d/salt-minion restart 
    - require: 
      - pkg: salt-minion 
