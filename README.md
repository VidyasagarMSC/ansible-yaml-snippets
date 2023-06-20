# Ansible code snippets in YAML

As I explore and learn Ansible, I will be adding the simple and easy to use Ansible code snippets written in YAML.

> :construction: The snippets include generic yaml code for you to understand the Ansible in-built modules and how to use them for your Ansible automation. More code snippets to come. So, :star: this repository :blush:

## Run locally 

1. Install and setup [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
2. Command to run locally on your terminal or command prompt
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
3. cURL requests: add `--ask-become-pass` flag prompting for a root user password
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
### License

[Check the License](LICENSE)