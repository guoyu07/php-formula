{% from "php/map.jinja" import php with context %}

php-fpm:
  pkg:
    - installed
    - name: {{ php.fpm_pkg }}
  service:
    - running
    - name: {{ php.fpm_service }}
    - enable: True
    - restart: True
    - watch:
      - file: php-fpm.conf 

php-fpm.conf:
  file:
    - name: {{ php.fpm_global_conf }}
    - source: salt://php/templates/php-fpm.conf.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
