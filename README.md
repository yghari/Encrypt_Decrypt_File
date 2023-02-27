<<<<<<< HEAD
To use these scripts, save the first script to a file (e.g. encrypt.sh) and the second script to another file (e.g. decrypt.sh), and make them executable (chmod +x encrypt.sh decrypt.sh). Then you can encrypt a file by running ./encrypt.sh file_to_encrypt, which will create an encrypted file called file_to_encrypt.enc and key and IV files called file_to_encrypt.enc.key and file_to_encrypt.enc.iv. To decrypt the file, run ./decrypt.sh file_to_encrypt.enc file_to_encrypt.enc.key file_to_encrypt.enc.iv, which will create a decrypted file called file_to_encrypt in the same directory as the encrypted file.

>>-> second script : time_tracker

To use this script:

Open a terminal and navigate to the directory where the script is saved.
Run the command chmod +x time_tracker.sh to make the script executable.
Run the command ./time_tracker.sh to start the script.
Use the menu options to start and stop tasks, generate reports, and exit the script.

>>-> third script : file_conversion

To use this script:

Open a terminal and navigate to the directory where the script is saved.
Edit the FROM_FORMAT and TO_FORMAT variables at the top of the script to specify the input and output file formats you want to convert.
Run the command chmod +x file_conversion.sh to make the script executable.
Run the command ./file_conversion.sh to start the script.

The script will loop through all files with the input format in the current directory and convert them to the output format using the appropriate command. The output files will have the same name as the input files, but with the new extension. Currently, the script only supports converting PNG images to JPEG images and WAV audio files to MP3 audio files. You can modify the script to add support for other file formats by adding additional if statements in the convert_file function.

>>-> forth script : git_automation


To use the script, save it as a `.sh` file (e.g. `git-automation.sh`), make it executable (`chmod +x git-automation.sh`), and run it in your Git repository directory. The script will display a menu of options to choose from, such as creating a new branch, committing changes, or generating a report of the commit history. Simply enter the number corresponding to the option you want to choose, and follow the prompts to complete the action.

=======
To use these scripts, save the first script to a file (e.g. 'encrypt.sh') and the second script to another file (e.g. 'decrypt.sh'), and make them executable (chmod +x encrypt.sh decrypt.sh). Then you can encrypt a file by running ./encrypt.sh file_to_encrypt, which will create an encrypted file called file_to_encrypt.enc and key and IV files called file_to_encrypt.enc.key and file_to_encrypt.enc.iv. To decrypt the file, run ./decrypt.sh file_to_encrypt.enc file_to_encrypt.enc.key file_to_encrypt.enc.iv, which will create a decrypted file called file_to_encrypt in the same directory as the encrypted file.
