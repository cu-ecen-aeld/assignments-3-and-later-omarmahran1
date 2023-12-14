#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <syslog.h>

void createFile(const char *writefile, const char *writestr) {
    // Check if writefile argument is specified
    if (writefile == NULL || strlen(writefile) == 0) {
        syslog(LOG_ERR, "Error: File path is not specified.");
        exit(1);
    }

    // Check if writestr argument is specified
    if (writestr == NULL || strlen(writestr) == 0) {
        syslog(LOG_ERR, "Error: Text string is not specified.");
        exit(1);
    }

    // Open the file for writing
    FILE *file = fopen(writefile, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Error: Failed to create the file.");
        exit(1);
    }

    // Write the content to the file
    fputs(writestr, file);

    // Close the file
    fclose(file);

    syslog(LOG_INFO, "File created successfully: %s", writefile);
}

int main(int argc, char *argv[]) {
    // Open syslog with a specific identifier for the program
    openlog("writer", LOG_PID | LOG_CONS, LOG_USER);

    // Check if the number of arguments is correct
    if (argc != 3) {
        syslog(LOG_ERR, "Error: Two arguments are required.");
        exit(1);
    }

    // Extract the arguments
    const char *writefile = argv[1];
    const char *writestr = argv[2];

    // Create the file
    createFile(writefile, writestr);

    // Close syslog
    closelog();

    return 0;
}
