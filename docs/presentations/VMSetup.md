# Lab Machine Setup

## Invitation
You will get an invitation email that looks like this. Click on the `Register for Lab` button.

![Invitation](../../images/InvitationEmail.png)

## Lab VM Assignment
You'll be prompted to login with your EID and password. Once you do that, you'll the VM assigned to you in the lab:

![LabLogin](../../images/LabLogin.png)

## Starting your VM
Click the button in the bottom left-hand corner of the panel showing your VM that says `Stopped`. It will change to
`Starting`. It will take a minute or two to start.

During this time, you should download and install Microsoft Remote Desktop. You can get it from the Apple Store if
you have a Mac or from the Microsoft Store if you are on Windows.

![ClickStarting](../../images/ClickStarting.png)

Once the button name changes to `Running`, click on the little icon on the bottom right of the panel 
that looks like a computer monitor. Then click on the menu item that says `Connect via RDP`. The first
time you do this it will prompt you for a new password.

![ShowRunningConnectRDP](../../images/ShowRunningConnectRDP.png)

## Setting your password
Enter your password - make sure it's memorable and that you record it somewhere, like a password manager
if you use one.

![SetPassword](../../images/SetPassword)

It's a good idea to click on the preview icon in the password box (it looks like an eye) to be sure you've typed the
password you want correctly.

![ShowPassword](../../images/ShowPassword.png)

The machine will then set your new password - this may take a minute or so.

![SettingPassword](../../images/SettingPassword.png)

When it's done, you'll be back to this screen

![PasswordSet](../../images/PasswordSet.png)

## Connecting to RDP

Click on the computer monitor icon again and select `Connect via RDP`

![ConnectRDP](../../images/ConnectRDP.png)

This will download a file to your Downloads directory called `DE_I320D.rdp`.

![DownloadedRDPFile](../../images/DownloadedRDPFile.png)

Start Microsoft Remote Desktop. On the top level menu, click on `Connections` and then click on 
`Import From RDP File`

![ImportRDPFile](../../images/ImportRDPFile.png)

A dialog box will pop up asking you to pick a file. Go to your Downloads directory and select the
`DE_I320D.rdp` file. Click the `Import` button.

![SelectRDPFile](../../images/SelectRDPFile.png)

The file will be imported into RDP, and you should see an entry for it in RDP:
![](../../../../../Desktop/SQL_Lab_Signed_In.png)
![RDPImported](../../images/RDPImported.png)

Double-click on the entry in RDP and it will take you to a login to the lab. Use `ubuntu` as the username 
and enter your password. If your password doesn't work, enter `DEI320D_student!' as the password.

![EIDLogin](../../images/EIDLogin.png)

Once you login, you will see your VM Desktop

![VMDesktop](../../images/VMDesktop.png)

Once you see your desktop, click on the Firefox icon in the dock on the left-hand side of the screen.

![Firefox](../../images/Firefox.png)

Firefox will open (it's a little slow the first time). You'll see a web page with a set of icon 
links below the search bar. Click on the one that says "SQL Lab"

![SQL Lab](../../images/SQL_Lab.png)

Sign in to SQL Lab. The username is `admin` and the password is `DEI320D_student!`. After you sign
in, click "Save" to save the password so you don't have to sign in again.

![SignIn](../../images/SignIn.png)

You should see a screen that looks like this:

![SignIn](../../images/SQL_Lab_Signed_In.png)

Next, click on the menu selection called `Data` and select `Databases` from the drop-down.

![SignIn](../../images/Select_Databases.png)

You'll see a screen that lists the databases in the system. Click on the `Edit` icon (it looks like 
a pencil at the right-hand end of `music_festival`.

![Edit](../../images/Select_Edit.png)

This will bring up an `Edit Database` screen. Look for a text box titled `SQLAlchemy URI` in that
screen. This is the connection string to the database. Change `festival_read_only` to `festival_read_write`.
Then change `XXXXXXX` to `writer` so that the string looks like it does in the image below. Once you've
done that, click the 'Test Connection' button. You should get a message that says "Connection Successful". If
you don't, make sure you changed the connection information correctly.

![EditConnection](../../images/Edit_Connection.png)

Once you successfully tested the connection, click on the `Advanced` tab at the top of the `Edit 
Database` screen and then open the `SQL Lab` section by clicking on the `v` to the right of `SQL Lab`. 
Change the settings to match what you see in the image below by clicking on the checkboxes for 
`Allow CREATE TABLE AS` and `Allow DML`. `Allow this database to be explored`
should also be checked.

![Advanced](../../images/Advanced.png)

Then click the `Finish` button at the bottom of the page. Click on `SQL Lab` at the top of the
menu and select `SQL Editor` from the pull down. You can now start typing an executing SQL commands
in SQL Lab.

