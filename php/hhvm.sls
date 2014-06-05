hhvm-apt-key:
  file.managed:
    - name: /etc/apt/trusted.gpg.d/hhvm.gpg
    - source: http://dl.hhvm.com/conf/hhvm.gpg.key
    - source_hash: sha256=5caf3a73033b194f59b025ff4de341ddc17ccfa29725278c817756731d4011ef

hhvm-add-key:
  cmd.wait:
    - name: apt-key add /etc/apt/trusted.gpg.d/hhvm.gpg
    - watch:
      - file: hhvm-apt-key

hhvm-repo:
  pkgrepo.managed:
    - humanname: HHVM Official
    - name: deb http://dl.hhvm.com/ubuntu trusty main
    - dist: trusty
    - require:
      - cmd: hhvm-add-key

hhvm:
  pkg.installed:
    - require:
      - pkgrepo: hhvm-repo
