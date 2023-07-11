# MySQL Restore Script

This batch script automates the process of restoring a MySQL database in XAMPP. It provides a convenient solution for resolving the "MySQL shutdown unexpectedly" error that may occur during the startup of MySQL in XAMPP. The script performs a series of steps to restore the MySQL database to a working state.

## Features

- Renames the existing 'C:\xampp\mysql\data' folder to 'C:\xampp\mysql\data_old' (if it exists).
- Makes a copy of the 'C:\xampp\mysql\backup' folder and renames it as 'C:\xampp\mysql\data'.
- Copies the 'ibdata1' file and all database folders (excluding 'mysql', 'performance_schema', 'phpmyadmin', and 'test') from 'C:\xampp\mysql\data_old' to the new 'C:\xampp\mysql\data' folder.

## Getting Started

To resolve the "MySQL shutdown unexpectedly" error, follow these steps:

1. Run the 'mysql_restore.bat' script provided in this package.
2. The script will automatically restore the MySQL database by renaming folders and copying files.
3. After running the script, attempt to start MySQL in XAMPP again to check if the issue is resolved.

If the problem persists, additional troubleshooting steps are provided:

1. Open XAMPP Control Panel.
2. Click on the 'Logs' button next to the MySQL module.
3. Check the error logs displayed in the log window for any relevant error messages.
4. Additionally, you can refer to the Windows Event Viewer for more information on the error.

**Note**: It is essential to carefully review the error output from XAMPP to diagnose any issues with the MySQL database. For further assistance or to report any problems, please provide the complete log window output, including any error messages, in relevant forums or support channels.

## Important Information

- Backup: Before running this script, ensure that you have backed up your MySQL database and important data. The script modifies the MySQL database structure, and it's crucial to have a backup in case of any data loss.
- Risk: Use this script at your own risk. The script author cannot be held responsible for any data loss or system issues that may occur as a result of using this script.

For any questions, concerns, or bug reports, please reach out to the script author or refer to the provided support channels.

We hope this script helps you in resolving the "MySQL shutdown unexpectedly" error and restores your MySQL database successfully.
