# Ansible code snippets in YAML

As I explore and learn Ansible, I will be adding the simple and easy to use Ansible code snippets written in YAML.

> The snippets include generic yaml code for you to understand the Ansible in-built modules and how to use them for your Ansible automation.

## Run locally 

1. Install and setup [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
2. Command to run locally on your terminal or command prompt
   ```shell
    ansible-playbook list_files.yaml -i hosts.ini --flush-cache  
   ```
   > For verbose output, use `-vvvv` flag in the ansible command
   Expected output:
   ```commandline
   PLAY [List files] *****************************************************************************************************************************************************************************

   TASK [List files in the current directory] ****************************************************************************************************************************************************
   changed: [localhost]
    
   TASK [debug] **********************************************************************************************************************************************************************************
   ok: [localhost] => {
        "output.stdout_lines": [
            "LICENSE",
            "README.md",
            "add_user_to_os.yaml",
            "ansible.cfg",
            "curl_requests.yaml",
            "hosts.ini",
            "list_files.yaml",
            "yum_install_dependencies.yaml"
        ]
    }
    
   PLAY RECAP ************************************************************************************************************************************************************************************
   localhost                  : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
   ```
3. cURL requests: add `--ask-become-pass` flag prompting for a root user password
   ```shell
    ansible-playbook curl_requests.yaml -i hosts.ini --flush-cache --ask-become-pass
   ```
   Expected output:
   ```shell
    BECOME password: 

    PLAY [CURL GET and POST requests] *************************************************************************************************************************************************************
    
    TASK [POST request with JSON and bearer token] ************************************************************************************************************************************************
    [WARNING]: Platform darwin on host localhost is using the discovered Python interpreter at /opt/local/bin/python3.11, but future installation of another Python interpreter could change the
    meaning of that path. See https://docs.ansible.com/ansible-core/2.14/reference_appendices/interpreter_discovery.html for more information.
    ok: [localhost]
    
    TASK [debug] **********************************************************************************************************************************************************************************
    ok: [localhost] => {
        "result.json": {
            "success": "true"
        }
    }
    
    PLAY RECAP ************************************************************************************************************************************************************************************
    localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

   ```
### License

[Check the License](LICENSE)