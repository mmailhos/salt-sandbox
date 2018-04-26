# Install and configure Apache

{% set apache = salt.grains.filter_by({
    'Debian': {
      'pkg': 'apache2',
      'srv': 'apache2',
    },
    'RedHat': {
      'pkg': 'httpd',
      'srv': 'httpd',
    },
  })
%}


install_apache:
  pkg.installed:
    - name: {{ apache.pkg }}

start_apache:
  service.running:
    - name: {{ apache.srv }}
    - enable: True

welcome_page:
  file.managed:
    - name: /var/www/html/index.html
    - contents: |
        <! doctype html>
        <body>
          <h1> Hello, world</h1>
        </body>
