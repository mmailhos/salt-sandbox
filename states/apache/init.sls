# Install and configure Apache

{% from "apache/map.sls" import apache with context %}

install_apache:
  pkg.installed:
    - name: {{ apache.pkg }}

start_apache:
  service.running:
    - name: {{ apache.srv }}
    - enable: True

