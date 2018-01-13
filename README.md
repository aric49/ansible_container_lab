# Ansible Container Lab

**The Official Git Repository for _[Containerization with Ansible 2](https://www.packtpub.com/virtualization-and-cloud/containerization-ansible-2)_ by Aric Renzo**

## To the Reader
Thank you very much for taking the time to purchase and read my first book, _Containerization with Ansible 2_ and having the interest to go over the examples listed within the book.  It is my hope that you not only learn a lot from the book, but gain a deep level of understanding through the lab exercises contained within this repository. *Sincerely - Thank You.*

## Overview
This Github repository contains the supplemental content and code examples as seen in the book _[Containerization with Ansible 2](https://www.packtpub.com/virtualization-and-cloud/containerization-ansible-2)_ by Aric Renzo, available by Packt Publishing. The examples within this repository should be used in conjunction with the book and provide a reference for Ansible Container projects. Unfortunately, if you do not have the context of the book to go on, this repository won't be of much use to you. That being said, you should checkout my book, [here](https://www.packtpub.com/virtualization-and-cloud/containerization-ansible-2)

This `README` file is broken up into two primary sections:
* **Updates**: Describes any updates that have been made in the Ansible Container project that may introduce changes that function differently than described in the book.

* **Errata**: Lists any fixes or corrections to content in the published book

## Updates
None Yet :-)

## Errata
**1) Fixing the `AnsibleContainerException: Expecting --config-path to be a path to a file, not a directory` Error:**  Due to a bug with the 0.92 release of Ansible Container, you may run into the following error message while working through some Ansible Container exercises in the book.  Primarily, the ones which involve `ansible-container push` or `ansible-container deploy` commands:

```
ubuntu@node01:/vagrant/AnsibleContainer/nginx_webserser$ ansible-container push --username rogerfdias --push-to docker --tag 1.0
Enter password for user at Docker Hub:
ERROR Unknown exception
Traceback (most recent call last):
File "/usr/local/lib/python2.7/dist-packages/container/cli.py", line 299, in call
getattr(core, u'hostcmd_{}'.format(args.subcommand))(**vars(args))
File "/usr/local/lib/python2.7/dist-packages/container/init.py", line 28, in wrapped
return fn(*args, **kwargs)
File "/usr/local/lib/python2.7/dist-packages/container/core.py", line 360, in hostcmd_push
**kwargs)
File "/usr/local/lib/python2.7/dist-packages/container/init.py", line 28, in wrapped
return fn(*args, **kwargs)
File "/usr/local/lib/python2.7/dist-packages/container/core.py", line 404, in push_images
u"Expecting --config-path to be a path to a file, not a directory"
AnsibleContainerException: Expecting --config-path to be a path to a file, not a directory
```

This particular error is due to a bug in the 0.92 release of Ansible Container, as outlined in the following [Github Issue](https://github.com/ansible/ansible-container/issues/803).   Essentially, when Ansible Container authenticates to a container image repository, it creates the path:  `~/.docker/config.json` as a directory owned by root, and not a user owned configuration file.  The current work around for this issue is to delete this directory, and perform a manual `docker login`, as seen below:

```
sudo rm -rf ~/.docker
docker login --username username
```

This will ensure the path: `~/.docker/config.json` is created correctly.  All Ansible Container push and deploy commands should work after completing these steps.


## Questions or Concerns
If you have any questions or concerns regarding the examples or material presented in the book _Containerization with Ansible 2_, feel free to send me a message or open an issue in the Github repository. I would love to hear your feedback about the book and the examples presented.
