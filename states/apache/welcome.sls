# Write down welcome page

{% set name = salt.pillar.get('name') %}

# Force exit if pillar variable is not defined
check_pillar_values:
  test.check_pillar:
    - present:
      - name
    - failhard: True

welcome_page:
  file.managed:
    - name: /var/www/html/index.html
    - contents: |
        <! doctype html>
        <body>
          <h1> {{ name }} </h1>
        </body>

