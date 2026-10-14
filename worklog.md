# DevOps & Shell Scripting Log

## Date: 2026-10-13

### 1. Topics Learned & Implemented
* **Positional Parameters & Arguments:**
  * Handled dynamic script inputs using `$1`, `$2`, `$@`, and `$#`.
  * Debugged arithmetic evaluation errors caused by unpassed positional arguments.
* **ANSI Color Codes:**
  * Configured terminal output coloring using ANSI escape sequences (`\e[31m`, `\e[32m`, `\e[0m`).
  * Fixed color persistence issues by properly terminating the reset escape sequence.
* **Automation & Validation Functions:**
  * Created reusable bash validation functions reading exit codes (`$?`).
  * Managed root user permission checks using `$ID`.
* **Standard Output & Error Redirection:**
  * Implemented timestamped log creation in `/tmp` using standard redirection (`&>> $LOG_FILE`).
  * Used `date +%F-%H-%M-%S` and dynamic script names for automated log filenames.

### 2. Issues Encountered & Resolutions
* **Issue:** Text remained green across terminal output after running the script.
  * *Root Cause:* The reset sequence was missing the terminating `m` (`\e[0` instead of `\e[0m`).
  * *Resolution:* Corrected variable definition to `N="\e[0m"`.
* **Issue:** Log redirection failed to create files in `/tmp`.
  * *Root Cause:* Missing `$` prefix before `LOG_FILE` caused output to redirect to a literal relative file.
  * *Resolution:* Updated redirection to `&>> $LOG_FILE`.

### 3. Key Commits
* `06-data-types.sh`: Dynamic argument handling and arithmetic.
* `11-logs.sh`: Automatic logging, timestamps, and status checks.