#!/bin/sh
#
# SPDX-FileCopyrightText: 2023-2024 Florian Kemser and the SHtemplateLIB contributors
# SPDX-License-Identifier: LGPL-3.0-or-later
#
#===============================================================================
#
#         FILE:   /lib/shtpl.en.lib.sh
#
#        USAGE:   ---
#                 (This is a library file, so please do NOT run it.)
#
#  DESCRIPTION:   --English-- String Constants File
#                 Used to generate help texts, interactive dialogues,
#                 and other  terminal/log messages.
#
#         BUGS:   ---
#
#        NOTES:   ---
#
#         TODO:   See 'TODO:'-tagged lines below.
#===============================================================================

#===============================================================================
#  !!! IMPORTANT !!!
#===============================================================================
#  All constants (identifiers) must follow a certain naming convention,
#  see '/lib/shtpl.0.lib.sh'.

#===============================================================================
#  TEXT CONSTANTS
#===============================================================================
readonly LIB_SHTPL_EN_TXT_HELP="For more information please have a look at the script's help."
readonly LIB_SHTPL_EN_TXT_ABORTING="Aborting ..."
readonly LIB_SHTPL_EN_TXT_CONTINUE_ENTER="Press <Return> to continue ..."
readonly LIB_SHTPL_EN_TXT_CONTINUE_YESNO="DO YOU REALLY WANT TO CONTINUE (Y/N)?"
readonly LIB_SHTPL_EN_TXT_EXIT_LESS="Press 'q' to quit ..."
readonly LIB_SHTPL_EN_TXT_FILE_NOT_FOUND_ERR="One or more files were not found. ${LIB_SHTPL_EN_TXT_HELP} ${LIB_SHTPL_EN_TXT_ABORTING}"
readonly LIB_SHTPL_EN_TXT_GOBACK="Return"
readonly LIB_SHTPL_EN_TXT_INVALID_ARG_1="Invalid argument"
readonly LIB_SHTPL_EN_TXT_INVALID_ARG_2="for parameter"
readonly LIB_SHTPL_EN_TXT_PROCESSING="Processing request ..."
readonly LIB_SHTPL_EN_TXT_SELECTALL="Select all"
readonly LIB_SHTPL_EN_TXT_STDIN_HIDDEN="Due to security reasons your keyboard input is not displayed."

readonly LIB_SHTPL_EN_TXT_ARGS_CHECK_ERR="Parameter(s) out of allowed range. ${LIB_SHTPL_EN_TXT_HELP} ${LIB_SHTPL_EN_TXT_ABORTING}"
readonly LIB_SHTPL_EN_TXT_ARGS_READ_ERR="Unknown parameter or missing/invalid argument. ${LIB_SHTPL_EN_TXT_HELP} ${LIB_SHTPL_EN_TXT_ABORTING}"
readonly LIB_SHTPL_EN_TXT_INIT_CHECK_ERR="One or more mandatory requirements are not fulfilled. ${LIB_SHTPL_EN_TXT_HELP} ${LIB_SHTPL_EN_TXT_ABORTING}"
readonly LIB_SHTPL_EN_TXT_INIT_CHECK_ERR_LOGSERVICE="Log service (logd, syslog, syslog-ng) is not running."
readonly LIB_SHTPL_EN_TXT_INIT_CHECK_WARN="One or more optional requirements are not fulfilled. Some features may not be available."
readonly LIB_SHTPL_EN_TXT_INIT_FIRST_INFO="Script started"
readonly LIB_SHTPL_EN_TXT_INIT_UPDATE_ERR="Could not complete initialization process."
readonly LIB_SHTPL_EN_TXT_TRAP_MAIN_TERMINATED="Signal <\${arg_signal}> received. Terminating (PID <\${pid}>) ..."
readonly LIB_SHTPL_EN_TXT_TRAP_MAIN_TERMINATING="Script terminated (PID <\${pid}>)."

#===============================================================================
#  'dialog' CONSTANTS
#===============================================================================
#-------------------------------------------------------------------------------
#  [--title <title>]
#-------------------------------------------------------------------------------
readonly LIB_SHTPL_EN_DLG_TTL_ERROR="!!! ERROR !!!"
readonly LIB_SHTPL_EN_DLG_TTL_FILE_IN="Source File"
readonly LIB_SHTPL_EN_DLG_TTL_FILE_OUT="Destination File"
readonly LIB_SHTPL_EN_DLG_TTL_INFO="*** INFORMATION ***"
readonly LIB_SHTPL_EN_DLG_TTL_WARNING="^^^ WARNING ^^^"

#-------------------------------------------------------------------------------
#  <text>
#-------------------------------------------------------------------------------
readonly LIB_SHTPL_EN_DLG_TXT_ATTENTION="\
===========
 ATTENTION
==========="
readonly LIB_SHTPL_EN_DLG_TXT_CHECKLIST="To select/deselect an entry please press the the space bar. An asterisk [*] indicates that the corresponding option is currently selected."
readonly LIB_SHTPL_EN_DLG_TXT_CONTINUE="
=================================
 Do you really want to continue?
================================="
readonly LIB_SHTPL_EN_DLG_TXT_ERROR="An error has occurred or the request has been cancelled."
readonly LIB_SHTPL_EN_DLG_TXT_ERROR_TRYAGAIN="${LIB_SHTPL_EN_DLG_TXT_ERROR} Would you like to try again?"
readonly LIB_SHTPL_EN_DLG_TXT_FILE_IN="Please select the file to open / load."
readonly LIB_SHTPL_EN_DLG_TXT_FILE_OUT="Please specify a path where the file will be stored."
readonly LIB_SHTPL_EN_DLG_TXT_FILE_OUT_NOOVERRIDE="${LIB_SHTPL_EN_DLG_TXT_FILE_OUT} The file(path) must be new, existing files will not be overridden."
readonly LIB_SHTPL_EN_DLG_TXT_INFO="\
=============
 INFORMATION
============="
readonly LIB_SHTPL_EN_DLG_TXT_LEAVEDEFAULT="\
${LIB_SHTPL_EN_DLG_TXT_ATTENTION}
If you are not sure, just leave the default value."
readonly LIB_SHTPL_EN_DLG_TXT_OPTIONAL="Please note: In some cases this field may be optional."
readonly LIB_SHTPL_EN_DLG_TXT_RADIOLIST="To select an option please press the space bar. An asterisk (*) indicates the option that is currently selected."
readonly LIB_SHTPL_EN_DLG_TXT_SEEALSO="\
==========
 SEE ALSO
==========
For more information please have a look at:"
readonly LIB_SHTPL_EN_DLG_TXT_STDIN_HIDDEN="\
${LIB_SHTPL_EN_DLG_TXT_ATTENTION}
${LIB_SHTPL_EN_TXT_STDIN_HIDDEN}"
readonly LIB_SHTPL_EN_DLG_TXT_WARNING="\
==========
 WARNING
=========="

#-------------------------------------------------------------------------------
#  <item1>...
#-------------------------------------------------------------------------------
readonly LIB_SHTPL_EN_DLG_ITM_ABOUT="About this project"
readonly LIB_SHTPL_EN_DLG_ITM_EXIT="Exit"
readonly LIB_SHTPL_EN_DLG_ITM_EXIT_MENU="Exit menu"
readonly LIB_SHTPL_EN_DLG_ITM_EXIT_MENU_SAVE="Save changes and exit menu"
readonly LIB_SHTPL_EN_DLG_ITM_GOBACK="RETURN"
readonly LIB_SHTPL_EN_DLG_ITM_HELP="Help"

#===============================================================================
#  PARAMETER (TEMPLATE)
#===============================================================================
#  Script actions <ARG_ACTION_...>
readonly LIB_SHTPL_EN_HLP_DES_ARG_ACTION_HELP="Show this help message"

#  Log destination <ARG_LOGDEST_...>
readonly LIB_SHTPL_EN_HLP_DES_ARG_LOGDEST="Specify where to write log message to"
readonly LIB_SHTPL_EN_HLP_DES_ARG_LOGDEST_BOTH="Terminal + System log"
readonly LIB_SHTPL_EN_HLP_DES_ARG_LOGDEST_SYSLOG="System log only"
readonly LIB_SHTPL_EN_HLP_DES_ARG_LOGDEST_TERMINAL="Terminal only"

#  Script operation modes <ARG_MODE_...>
readonly LIB_SHTPL_EN_HLP_DES_ARG_MODE_DAEMON="Run this script in daemon (background) mode"
readonly LIB_SHTPL_EN_HLP_DES_ARG_MODE_INTERACTIVE_SUBMENU="Run a certain submenu interactively and exit"

#===============================================================================
#  HELP
#===============================================================================
#-------------------------------------------------------------------------------
#  ABOUT
#-------------------------------------------------------------------------------
readonly LIB_SHTPL_EN_TXT_HELP_TTL_ABOUT="ABOUT"

#-------------------------------------------------------------------------------
#  EXAMPLES
#-------------------------------------------------------------------------------
readonly LIB_SHTPL_EN_TXT_HELP_TTL_EXAMPLES="EXAMPLES"

#-------------------------------------------------------------------------------
#  NOTES
#-------------------------------------------------------------------------------
readonly LIB_SHTPL_EN_TXT_HELP_TTL_NOTES="NOTES"

#  Credentials
readonly LIB_SHTPL_EN_TXT_HELP_TXT_NOTES_CREDENTIALS_ENV="\
It is highly recommended to pass credentials only via environmental variables. To do so, just set this value to 'env:<VAR>' (without '' <>) where <VAR> is your environmental variable's name.

Please note that passing credentials in clear-text form can be highly insecure as any other user/process could display the command line of this application by using system utilities like 'ps'.

Example: You would like to pass the password '123456'.

  Via an environmental variable (preferred)
    > export mypwd=\"123456\"
    > ... \"env:mypwd\"

  Directly, in clear-text form (NOT recommended)
    > ... \"123456\""

#-------------------------------------------------------------------------------
#  REFERENCES
#-------------------------------------------------------------------------------
readonly LIB_SHTPL_EN_TXT_HELP_TTL_REFERENCES="REFERENCES"

#-------------------------------------------------------------------------------
#  REQUIREMENTS
#-------------------------------------------------------------------------------
readonly LIB_SHTPL_EN_TXT_HELP_TTL_REQUIREMENTS="REQUIREMENTS"

#  Interactive Mode
readonly LIB_SHTPL_EN_TXT_HELP_TTL_REQUIREMENTS_INTERACTIVE="Interactive Mode (optional)"
readonly LIB_SHTPL_EN_TXT_HELP_TXT_REQUIREMENTS_INTERACTIVE="\
In case you run this script interactively (see <SYNOPSIS> below)
your terminal window must have a size of <100x30> or bigger.

Required Packages:
  General: Dialog
   Alpine: > sudo apk add dialog
   Debian: > sudo apt install dialog"

#-------------------------------------------------------------------------------
#  SYNOPSIS
#-------------------------------------------------------------------------------
readonly LIB_SHTPL_EN_TXT_HELP_TTL_SYNOPSIS="SYNOPSIS"
readonly LIB_SHTPL_EN_TXT_HELP_TTL_SYNOPSIS_ACTION="ACTION"
readonly LIB_SHTPL_EN_TXT_HELP_TTL_SYNOPSIS_OPTION="OPTION"

readonly LIB_SHTPL_EN_TXT_HELP_TXT_SYNOPSIS_INTRO="There are multiple ways to run this script:"
readonly LIB_SHTPL_EN_TXT_HELP_TXT_SYNOPSIS_INTERACTIVE="Interactive mode (without any args)"
readonly LIB_SHTPL_EN_TXT_HELP_TXT_SYNOPSIS_SCRIPT="Classic (script) mode"

#-------------------------------------------------------------------------------
#  TL;DR
#-------------------------------------------------------------------------------
#  Synopsis
readonly LIB_SHTPL_EN_TXT_HELP_TTL_TLDR_SYNOPSIS="Synopsis"
readonly LIB_SHTPL_EN_TXT_HELP_TXT_TLDR_SYNOPSIS="There are multiple ways to run this script. For more information please have a look at <SYNOPSIS> section below."