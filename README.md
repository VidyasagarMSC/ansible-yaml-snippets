# Ansible code snippets in YAML

As I explore and learn Ansible, I will be adding the simple and easy to use Ansible code snippets written in YAML.

> :construction: The snippets include generic yaml code for you to understand the Ansible in-built modules and how to use them for your Ansible automation. More code snippets to come. So, :star: this repository :blush:

## Prerequisites
- Install and setup [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

## Run locally using playbooks

1. Command to run locally on your terminal or command prompt
   ```shell
    ansible-playbook list_files.yml -i hosts.ini --flush-cache  
   ```
   > For verbose output, use `-vvvv` flag in the ansible command
   
   Expected output:
   ```shell
    PLAY [List files] *****************************************************************************************************************************************************************************

    TASK [List files in the current directory] ****************************************************************************************************************************************************
    changed: [localhost]
    
    TASK [debug] **********************************************************************************************************************************************************************************
    ok: [localhost] => {
        "output.stdout_lines": [
            "LICENSE",
            "README.md",
            "add_user_to_os.yml",
            "ansible.cfg",
            "curl_requests.yml",
            "hosts.ini",
            "list_files.yml",
            "yum_install_dependencies.yml"
        ]
    }
    
    PLAY RECAP ************************************************************************************************************************************************************************************
    localhost                  : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
   ```
2. cURL requests: add `--ask-become-pass` flag prompting for a root user password
   ```shell
    ansible-playbook curl_requests.yml -i hosts.ini --flush-cache --ask-become-pass
   ```
   Expected output:
   ```shell
    BECOME password: 

    PLAY [CURL GET and POST requests] *************************************************************************************************************************************************************

    TASK [POST request with JSON and bearer token] ************************************************************************************************************************************************
    ok: [localhost]

    TASK [Print return information from the previous task] ****************************************************************************************************************************************
    ok: [localhost] => {
        "result.json": {
            "success": "true"
        }
    }

    TASK [GET request to download a file] *********************************************************************************************************************************************************
    ok: [localhost]

    TASK [debug] **********************************************************************************************************************************************************************************
    ok: [localhost] => {
        "result": {
            "changed": false,
            "dest": "./filename.txt",
            "elapsed": 0,
            "failed": false,
            "gid": 0,
            "group": "wheel",
            "mode": "0644",
            "msg": "HTTP Error 304: Not Modified",
            "owner": "root",
            "size": 10612,
            "state": "file",
            "status_code": 304,
            "uid": 0,
            "url": "https://reqbin.com/echo"
        }
    }

    PLAY RECAP ************************************************************************************************************************************************************************************
    localhost                  : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

   ```


## Run locally using Ansible roles
Roles in Ansible are reusable tasks. You can either use playbooks or roles.
1. To run the roles, run the below command. `site.yml` is the playbook file. `staging` is the inventory file.

   ```sh
   ansible-playbook site.yml -i staging --ask-become-pass
   ```
2. Part of the output

   ```sh
    BECOME password:

    PLAY [File and OS management] ***************************************************************************************************

    TASK [file_management : List files in the current directory] ********************************************************************
    [WARNING]: Platform darwin on host localhost is using the discovered Python interpreter at /opt/local/bin/python3.11, but future
    installation of another Python interpreter could change the meaning of that path. See https://docs.ansible.com/ansible-
    core/2.15/reference_appendices/interpreter_discovery.html for more information.
    changed: [localhost]

    TASK [file_management : debug] **************************************************************************************************
    ok: [localhost] => {
        "msg": [
            "LICENSE",
            "README.md",
            "filename.txt",
            "group_vars",
            "host_vars",
            "playbooks",
            "production",
            "roles",
            "scripts",
            "site.yml",
            "staging"
        ]
    }

    TASK [os_management : Add a new user to the Operation system] *******************************************************************
    included: /Users/vmac/Documents/Code/GitHub/ansible-yaml-snippets/roles/os_management/tasks/add_os_user.yml for localhost

    TASK [os_management : Add the user 'new-user' with a specific uid] **************************************************************
    changed: [localhost]

    TASK [os_management : Change OS user password] **********************************************************************************
    skipping: [localhost]

    TASK [os_management : Add a new user to the Operation system] *******************************************************************
    skipping: [localhost]

    TASK [os_management : Change OS user password] **********************************************************************************
    included: /Users/vmac/Documents/Code/GitHub/ansible-yaml-snippets/roles/os_management/tasks/change_os_user_passwd.yml for localhost

    TASK [os_management : Change os user password] **********************************************************************************
    New password:
   ```

### License

[Check the License](LICENSE)