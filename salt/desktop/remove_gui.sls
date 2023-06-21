{% from 'vars/globals.map.jinja' import GLOBALS %}

{# we only want this state to run it is CentOS #}
{% if GLOBALS.os == 'Rocky' %}

remove_graphical_target:
  file.symlink:
    - name: /etc/systemd/system/default.target
    - target: /lib/systemd/system/multi-user.target
    - force: True

{% else %}
desktop_trusted-ca_os_fail:
  test.fail_without_changes:
    - comment: 'SO Desktop can only be installed on Rocky'

{% endif %}
