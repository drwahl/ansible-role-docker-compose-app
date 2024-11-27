Role Name
=========

An ansible role to deploy apps with docker-compose. This can be done via the module, but I needed some extra stuff (extra templates, directory creation, etc.) that I wanted to wrap into a role.


Role Development
----------------

To develop against this role, first run `make clean`, then `source env/bin/activate`. After making changes, run `make autolint` to validate style/syntax.

Role Variables
--------------

Templates to additionally include. Example:
```
additional_templates:
  - src: 'haproxy.cfg.j2'
    dest: 'haproxy.cfg'
    owner: 'root'
    group: 'root'
    mode: '0755'
```

All of these come from the docker-compose module configuration. See the upstream docs for more details.

```
dc_api_version: null
dc_build: null
dc_ca_path: null
dc_check_files_existing: null
dc_cli_context: null
dc_client_cert: null
dc_client_key: null
# docker-compose file contents
dc_definition: null  # REQUIRED
dc_dependencies: null
dc_docker_cli: null
dc_docker_host: null
dc_env_files: null
dc_profiles: null
dc_project_name: null  # REQUIRED
dc_project_src: "/opt/stacks/{{ project_name }}"
dc_pull: null
dc_recreate: null
dc_remove_images: null
dc_remove_orphans: null
dc_remove_volumes: null
dc_renew_anon_volumes: null
dc_scale: null
dc_services: null
# present is equivalent to running docker compose up
# stopped is equivalent to running docker compose stop
# absent is equivalent to running docker compose down
# restarted is equivalent to running docker compose restart
dc_state: 'present'
dc_timeout: null
dc_tls: null
dc_tls_hostname: null
dc_validate_certs: null
dc_wait: null
dc_wait_timeout: null
```

Dependencies
------------

The `community.docker` collection is required for this role.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: drwahl.docker_compose_app, dc_definition: {}, dc_project_name: foobar }

License
-------

BSD

Author Information
------------------

David Wahlstrom
david.wahlstrom@gmail.com
