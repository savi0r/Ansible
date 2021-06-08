<h2>An introduction to ansible:</h2>
In a nutshell configuration management software automates the management of operating systems on a network. Administrators write specifications that describe how servers should be configured, and the configuration management software do the rest.
The traditional approach to sysadmin automation complex shell scripts which over time degenerate into an unmanagable piece of code. On the contrary configuration management is a better approach. It captures desired state in the form of code. Changes and updates can then be tracked over time in a version control system.
Ultimately, the job of a CM system is to apply a series of configuration specifications to an individual machine. Operations that are typically  might plausibly appear on a sysadmin’s to-do list: create a user account, install a software package, and so on. 
<h3>Main elements of configuration management:</h3>
<h4>Operations and parameters:</h4>
We’ve already introduced the concept of operations, which are the small-scale actions and checks used by a CM system to achieve a particular state.
Here are some sample operations that all CM systems can handle right out of the box:

* Create or remove a user account or set its attributes
* Copy files to or from the system being configured
* Synchronize directory contents
* Render a configuration file template
* Add a new line in a configuration file
* Restart a service
* Add a cron job or systemd timer
* Run an arbitrary shell command
* Create a new cloud server instance
* Create or remove a database account
* Set database operating parameters
* Perform Git operations

Operations are basically scripts, usually written in the implementation language of the CM - python for ansible case- system itself and exploiting the system’s standard tools and libraries.

operations differ from typical UNIX commands in a few important ways:

* Most operations are designed to be applied repeatedly without causing problems. Borrowing a term from linear algebra, you’ll sometimes see this latter property referred to as *idempotence.*
* Operations know when they change the system’s actual state.
* Operations know when the system state needs to be changed. If the current configuration already conforms to the specification, the operation exits without doing anything.
* Operations report their results to the CM system. Their report data is richer than a UNIX-style exit code and can aid in debugging.
* Operations strive to be cross-platform. They usually define a constrained set of functions that are common to all supported platforms, and they interpret requests in accordance with the local system.

<h4>Variables:</h4>
Variables are named values that influence how configurations are applied to individual machines. They commonly set parameter values and fill in the blanks in configuration templates.
<h4>Facts:</h4>
CM systems investigate each configuration client to determine descriptive facts such as the IP address of the primary network interface and the OS type. This in-
formation is then accessible from within the configuration base through variable values. As with any other variable, these values can be used to define parameter
values or to expand templates.All CM systems let target machines add their own values to the fact database, either by including a static file of declarations or by running custom code on the target machine.
<h4>Client inventory and registration:</h4>
Because CM systems define lots of ways to segregate clients into categories, the overall universe of machines under configuration management must be well defined. 

Ansible uses no daemons at all (other than sshd), which is an appealing simplification. Configuration runs happen when an administrator (or cron job) on the server runs the ansible-playbook command. ansible-playbook executes the appropriate remote commands over SSH, leaving no trace of its presence on the client machine after configuration has completed. The only requirements for client machines are that they be accessible through SSH and have Python 2 installed. Both ansible-playbooks and inventories are written in YML.

