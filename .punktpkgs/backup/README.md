# Install

```
punkt install backup
```

# System

Assuming a folder `~/Borg` for storing backups (usually a link to a secondary disk) and a folder `~/Storage/Secure` for data that should be backed up.

# BorgBackup

## Configuration

Create folder `Borg`.

```
borg init -e keyfile-blake2 Borg
Enter new passphrase: 
Enter same passphrase again: 
```

Save both the **passphrase** and **keyfile**.

```
borg key export Borg keyfile.txt
```

## Create a Snapshot

Patterns are specified in `~/.borpatterns`.
Create a new snapshot by running `bin/backup`, which will also sync with `rclone`.
Configure `rclone` first, as shown next.

# Rclone

## Configuration

```
% rclone config
No remotes found - make a new one
n) New remote
s) Set configuration password
q) Quit config
n/s/q> n
name> nextcloud
```

```
Type of storage to configure.
Enter a string value. Press Enter for the default ("").
Choose a number from below, or type in your own value
Storage> webdav
** See help for webdav backend at: https://rclone.org/webdav/ **

URL of http host to connect to
Enter a string value. Press Enter for the default ("").
Choose a number from below, or type in your own value
 1 / Connect to example.com
   \ "https://example.com"
url>https://<ENTER-URL-HERE>/remote.php/dav/files/<ENTER-USER-HERE>
Choose a number from below, or type in your own value
 1 / Nextcloud
   \ "nextcloud"
 2 / Owncloud
   \ "owncloud"
 3 / Sharepoint
   \ "sharepoint"
 4 / Other site/service or software
   \ "other"
vendor>nextcloud
```

Generate login token `Settings → Security → Create new App Password`.

```
User name
Enter a string value. Press Enter for the default ("").
user><ENTER-USER-HERE>
y) Yes type in my own password
g) Generate random password
n) No leave this optional password blank (default)
y/g/n>y
Enter the password:
password:<ENTER-TOKEN-HERE>
Confirm the password:
password:<ENTER-TOKEN-HERE>
```

Choose defaults and then quit with `q`.

```
Bearer token instead of user/pass (e.g. a Macaroon)
Enter a string value. Press Enter for the default ("").
bearer_token>
Edit advanced config? (y/n)
y) Yes
n) No (default)
y/n> n
Remote config
--------------------
[nextcloud-name]
type = webdav
url = my.nextcloud-instance.com/remote.php/webdav
vendor = nextcloud
user = username
pass = *** ENCRYPTED ***
--------------------
y) Yes this is OK (default)
e) Edit this remote
d) Delete this remote
y/e/d> y
Current remotes:

Name                 Type
====                 ====
nextcloud-name       webdav

e) Edit existing remote
n) New remote
d) Delete remote
r) Rename remote
c) Copy remote
s) Set configuration password
q) Quit config
e/n/d/r/c/s/q> q
```

Test connection:

```
rclone lsd nextcloud:/
```

Create config file directly:

```
[nextcloud]
type = webdav
url = <URL>
vendor = nextcloud
user = <USER>
pass = <SECRET-TOKEN>
```

