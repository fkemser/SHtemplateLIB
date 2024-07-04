#!/bin/sh
#
# SPDX-FileCopyrightText: 2023-2024 Florian Kemser and the SHtemplateLIB contributors
# SPDX-License-Identifier: LGPL-3.0-or-later
#
#===============================================================================
#
#         FILE:   /lib/shtpl.0.lib.sh
#
#        USAGE:   ---
#                 (This is a library file, so please do NOT run it.)
#
#  DESCRIPTION:   Contains language-independent text snippets and
#                 all the library's functions
#
#         BUGS:   ---
#
#        NOTES:   ---
#
#         TODO:   See 'TODO:'-tagged lines below.
#===============================================================================

#===============================================================================
#  NAMING CONVENTION
#===============================================================================
#  Please make sure that your constants follow the naming convention below.
#  This ensures that help and 'dialog' menus can be created more or less
#  automatically.
#
#===============================================================================
#  Language-independent constants, to be stored within this file
#===============================================================================
#-------------------------------------------------------------------------------
#  Used in interactive ('dialog') menus
#  (For more information on dialog please run 'dialog --help' or 'man dialog')
#-------------------------------------------------------------------------------
#  Constant                   Description             Parameter (dialog)
#  -----------------------------------------------------------------------------
#  LIB_SHTPL_DLG_TAG_<REF>    List item tag           <tag1>...
#
#-------------------------------------------------------------------------------
#  Used in help, section "SYNOPSIS"
#-------------------------------------------------------------------------------
#  Constant                   Description             Example (value)
#  -----------------------------------------------------------------------------
#  LIB_SHTPL_HLP_PAR_<REF>    Parameter cmd switch    -h|--help
#
#-------------------------------------------------------------------------------
#  Used in help, sections "EXAMPLES" "NOTES" "REFERENCES"
#-------------------------------------------------------------------------------
#  Constant                             Description   Example (value)
#  -----------------------------------------------------------------------------
#  LIB_SHTPL_HLP_TXT_REFERENCES_<REF>   Reference     https://www.example.com
#
#===============================================================================
#  Language-specific constants, to be stored separately,
#  e.g. within 'shtpl.en.lib.sh' for English, 'shtpl.de.lib.sh' for German, etc.
#===============================================================================
#-------------------------------------------------------------------------------
#  Used in interactive ('dialog') menus
#  (For more information on dialog please run 'dialog --help' or 'man dialog')
#-------------------------------------------------------------------------------
#  Constant                       Description             Parameter (dialog)
#  -----------------------------------------------------------------------------
#  LIB_SHTPL_<LL>_DLG_ITM_<REF>   List item               <item1>...
#  LIB_SHTPL_<LL>_DLG_TTL_<REF>   Title                   [--title <title>]
#  LIB_SHTPL_<LL>_DLG_TXT_<REF>   Text                    <text>
#
#-------------------------------------------------------------------------------
#  Used in help, section "SYNOPSIS"
#-------------------------------------------------------------------------------
#  Constant                       Description             Example (value)
#  -----------------------------------------------------------------------------
#  LIB_SHTPL_<LL>_HLP_DES_<REF>   Parameter description   Show this help message
#  LIB_SHTPL_<LL>_HLP_REF_<REF>   Reference description   Use '-h|--help'
#                                                         to get further information.
#
#-------------------------------------------------------------------------------
#  Used in help, sections "EXAMPLES" "NOTES" "REFERENCES"
#-------------------------------------------------------------------------------
#  Constant                               Description       Example (value)
#  -----------------------------------------------------------------------------
#  LIB_SHTPL_<LL>_HLP_TTL_EXAMPLES_<REF>  Example (Title)   Show Help
#  LIB_SHTPL_<LL>_HLP_TXT_EXAMPLES_<REF>  Example (Text)    ./run.sh --help
#  LIB_SHTPL_<LL>_HLP_TXT_NOTES_<REF>     Note (Text)       This is the first note.
#
#-------------------------------------------------------------------------------
#  Used in terminal output (<stdout>/<stderr>)
#-------------------------------------------------------------------------------
#  Constant                 Description                               Example (value)
#  -----------------------------------------------------------------------------
#  LIB_SHTPL_<LL>_TXT_<T>   Custom language-specific text constants   Return
#
#===============================================================================
#  Reference
#===============================================================================
#  <...>  Description                                           Example(s)
#  -----------------------------------------------------------------------------
#  <LL>   Language ID (ISO 639-1)                               EN
#
#  <REF>  Function, parameter, or parameter list value          HELP
#         this constant refers to                               ARG_INT
#                                                               ARG_ITEM_ITEM1
#
#  <T>    Identifier that describes what the string is about    GOBACK
#===============================================================================

#===============================================================================
#  'dialog' CONSTANTS
#===============================================================================
#-------------------------------------------------------------------------------
#  <tag1>...
#-------------------------------------------------------------------------------
readonly LIB_SHTPL_DLG_TAG_ABOUT="about"
readonly LIB_SHTPL_DLG_TAG_EXIT="exit"
readonly LIB_SHTPL_DLG_TAG_GOBACK="return"
readonly LIB_SHTPL_DLG_TAG_HELP="help"

#===============================================================================
#  PARAMETER (TEMPLATE)
#===============================================================================
#  Script actions <ARG_ACTION_...>
readonly LIB_SHTPL_HLP_PAR_ARG_ACTION_HELP="-h|--help"

#  Log destination <ARG_LOGDEST_...>
readonly LIB_SHTPL_HLP_PAR_ARG_LOGDEST="--log <dest>"

#  Script operation modes <ARG_MODE_...>
readonly LIB_SHTPL_HLP_PAR_ARG_MODE_DAEMON="-D|--daemon"
readonly LIB_SHTPL_HLP_PAR_ARG_MODE_INTERACTIVE_SUBMENU="--submenu <menu>"

#===============================================================================
#  HELP
#===============================================================================
#-------------------------------------------------------------------------------
#  TL;DR
#-------------------------------------------------------------------------------
readonly LIB_SHTPL_TXT_HELP_TTL_TLDR="TL;DR"

#===============================================================================
#  CONSTANTS & GLOBAL VARIABLES
#===============================================================================
readonly LIB_SHTPL_DIR_ROOT="$(cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P)"
readonly LIB_SHTPL_DIR_LICENSES="${LIB_SHTPL_DIR_ROOT}/licenses"
readonly LIB_SHTPL_EXT_LICENSES="txt"

#===============================================================================
#  FUNCTIONS
#===============================================================================
#===  FUNCTION  ================================================================
#         NAME:  lib_shtpl_about_print1
#
#  DESCRIPTION:  Print about message (project, author, copyright, license, etc.)
#                to <stdout>
#
# PARAMETER  1:  Display format, possible values are:
#
#                  --dialog     dialog
#                  --help       manpage / --help
#                  --terminal   terminal window (default)
#
#            2:  Project title, e.g. 'My Project'
#
#            3:  Author name and mail address
#                (multiple separated by newline), e.g.:
#
#                John Doe (john.doe@example.com)
#                Jane Doe (jane.doe@example.com)
#
#            4:  (Optional) Institution (multiple lines allowed), e.g.:
#
#                Example Inc.
#                123 Main Street
#                Anytown, USA
#
#                +1 000 000-0000
#                info@example.com
#
#            5:  (Optional) One-line description of what the project is about.
#                Please start with a low letter and leave the terminating '.'
#                out, e.g. 'a piece of software that is really useful'.
#
#            6:  (Optional) Release/Version number, e.g. '1.1.0'
#
#            7:  (Optional) Project years, e.g. '2023', '2023-2024', ...
#
#            8:  (Optional) Project license header (SPDX-License-Identifier)
#
#                For the full SPDX license list please have a look at
#                'https://spdx.org/licenses/'. However, only some licenses
#                are supported by this function, see </lib/licenses> folder.
#
#                If you are not sure which license to choose
#                just have a look at e.g. 'https://choosealicense.com'.
#===============================================================================
lib_shtpl_about_print1() {
  local ARG_FORMAT_DIALOG="--dialog"
  local ARG_FORMAT_HELP="--help"
  local ARG_FORMAT_TERMINAL="--terminal"
  local arg_format="${1:-${ARG_FORMAT_TERMINAL}}"

  local arg_project="$2"
  local arg_authors="$3"
  local arg_institution="$4"
  local arg_description="$5"
  local arg_version="$6"
  local arg_years="${7:-$(date +%Y)}"

  local ARG_LICENSE_APACHE20="Apache-2.0"
  local ARG_LICENSE_MIT="MIT"
  local arg_license="$8"

  case "${arg_format}" in
    ${ARG_FORMAT_DIALOG}|${ARG_FORMAT_HELP}|${ARG_FORMAT_TERMINAL}) ;;
    *) false ;;
  esac                                                                      && \
  lib_core_is --not-empty "${arg_project}" "${arg_authors}"                 || \
  return

  #-----------------------------------------------------------------------------
  #  Set license header
  #-----------------------------------------------------------------------------
  local txt_license

  #  Project one-line description
  txt_license="\
This file is part of "${arg_project}"${arg_description:+, }${arg_description}."

  #  Copyright
  case "${arg_license}" in
    ${ARG_LICENSE_APACHE20})
      txt_license="${txt_license}

Copyright ${arg_years} $(printf "%s" "${arg_authors}" | tr '\n' ',')"
      ;;

    ${ARG_LICENSE_MIT})
      txt_license="${txt_license}

Copyright (c) ${arg_years} $(printf "%s" "${arg_authors}" | tr '\n' ',')"
      ;;

    *)
      txt_license="${txt_license}

Copyright (C) ${arg_years} $(printf "%s" "${arg_authors}" | tr '\n' ',')"
      ;;
  esac

  #  License text
  local file_license
  file_license="${LIB_SHTPL_DIR_LICENSES}/${arg_license}.${LIB_SHTPL_EXT_LICENSES}"
  if lib_core_is --file "${file_license}"; then
    txt_license="${txt_license}

$(cat "${file_license}")"
  fi

  #  Remove newlines as <lib_msg_print_propvalue> will do proper formatting
  txt_license="$(lib_core_str_remove_newline "${txt_license}" " " "true" "true")"

  #-----------------------------------------------------------------------------
  #  Print to stdout
  #-----------------------------------------------------------------------------
  case "${arg_format}" in
    ${ARG_FORMAT_HELP})
      #-------------------------------------------------------------------------
      #  help style
      #-------------------------------------------------------------------------
      local emptyline="false"

      if [ -n "${arg_authors}" ]; then
        printf "  %s\n" "AUTHORS"
        printf "${arg_authors}" | while IFS= read -r line || [ -n "${line}" ]; do
          printf "    %s\n" "${line}"
        done
        emptyline="true"
      fi

      if [ -n "${arg_institution}" ]; then
        if ${emptyline}; then printf "\n"; fi
        printf "  %s\n" "INSTITUTION"
        printf "${arg_institution}" | while IFS= read -r line || [ -n "${line}" ]; do
          printf "    %s\n" "${line}"
        done
        emptyline="true"
      fi

      if [ -n "${txt_license}" ]; then
        local cols="$(lib_msg_term_get --cols)"
        if ${emptyline}; then printf "\n"; fi
        printf "  %s\n" "COPYRIGHT"
        printf "${txt_license}"                               \
          | fold -w $(( cols - 4 )) -s                        \
          | while IFS= read -r line || [ -n "${line}" ]; do
              printf "    %s\n" "${line}"
            done
      fi
      ;;

    ${ARG_FORMAT_DIALOG}|${ARG_FORMAT_TERMINAL})
      #-------------------------------------------------------------------------
      #  dialog/terminal style
      #-------------------------------------------------------------------------
      local width=""

      # (dialog only) limit width
      case "${arg_format}" in
        ${ARG_FORMAT_DIALOG})
          width="$(lib_msg_dialog_autosize --width)"
          width="$(( width - 3 ))"
          ;;
      esac

      # extend project information
      arg_project="$(printf "%s%s"          \
        "${arg_project}"                    \
        "${arg_version:+ v${arg_version}}"  \
      )"

      # generate output
      lib_msg_print_propvalue --center --center "" "${width}" ":" \
        "${arg_project:+Project}" "${arg_project}"                \
        "${arg_project:+ }" ""                                    \
        "${arg_authors:+Authors}" "${arg_authors}"                \
        "${arg_authors:+ }" ""                                    \
        "${arg_institution:+Institution}" "${arg_institution}"    \
        "${arg_institution:+ }" ""                                \
        "${txt_license:+License}" "${txt_license}"
      ;;
  esac
}

#===  FUNCTION  ================================================================
#         NAME:  lib_shtpl_about_print2
#
#  DESCRIPTION:  Print about message (project, author, copyright, license, etc.)
#                either to the terminal or to a 'dialog' message box.
#                Like <lib_shtpl_about_print1()> but with some additional
#                features, see parameters 9-11 below.
#
# PARAMETER  1:  Destination
#
#                  --dialog     dialog
#                  --terminal   terminal window (default)
#
#            2:  Project title, e.g. 'My Project'
#
#            3:  Author name and mail address
#                (multiple separated by newline), e.g.:
#
#                John Doe (john.doe@example.com)
#                Jane Doe (jane.doe@example.com)
#
#            4:  (Optional) Institution (multiple lines allowed), e.g.:
#
#                Example Inc.
#                123 Main Street
#                Anytown, USA
#
#                +1 000 000-0000
#                info@example.com
#
#            5:  (Optional) One-line description of what the project is about.
#                Please start with a low letter and leave the terminating '.'
#                out, e.g. 'a piece of software that is really useful'.
#
#            6:  (Optional) Release/Version number, e.g. '1.1.0'
#
#            7:  (Optional) Project years, e.g. '2023', '2023-2024', ...
#
#            8:  (Optional) Project license header (SPDX-License-Identifier)
#
#                For the full SPDX license list please have a look at
#                'https://spdx.org/licenses/'. However, only some licenses
#                are supported by this function, see </lib/licenses> folder.
#
#                If you are not sure which license to choose
#                just have a look at e.g. 'https://choosealicense.com'.
#
#            9:  (Optional) ASCII logo to display before showing the
#                welcome message
#
#           10:  (Optional) message/dialog title (default: (script's filename))
#
#           11:  (Optional) Message/dialog timeout in seconds
#                depending on parameter <1> this has different meanings:
#
#                  --dialog   time after which dialog box automatically closes
#                             (if set to '0' the dialog will not exit
#                             until the user hits 'Return')
#                             (default '0')
#
#                  --terminal time to "sleep" - afterwards the message gets
#                             cleared automatically
#                             (default: '7')
#===============================================================================
lib_shtpl_about_print2() {
  local ARG_DESTINATION_DIALOG="--dialog"
  local ARG_DESTINATION_TERMINAL="--terminal"
  local arg_destination="$1"

  local arg_project="$2"
  local arg_authors="$3"
  local arg_institution="$4"
  local arg_description="$5"
  local arg_version="$6"
  local arg_years="${7:-$(date +%Y)}"
  local arg_license="$8"
  local arg_logo="$9"
  local i=1; while [ $i -le 9 ]; do shift; i=$(( i+1 )); done

  local arg_title="${1:-./$(basename "$0")}"
  local arg_timeout="$2"

  case "${arg_destination}" in
    ${ARG_DESTINATION_DIALOG})
      lib_core_is --cmd "dialog"          && \
      lib_msg_dialog_autosize >/dev/null  && \
      arg_timeout="${arg_timeout:-0}"
      ;;
    ${ARG_DESTINATION_TERMINAL})
      arg_timeout="${arg_timeout:-7}"
      ;;
    *) false ;;
  esac                                                      && \
  lib_core_is --not-empty "${arg_project}" "${arg_authors}" && \
  lib_core_int_is_within_range "0" "${arg_timeout}" ""      || \
  return

  local exitcode
  local text
  text="$(lib_shtpl_about_print1                                                \
    "${arg_destination}" "${arg_project}" "${arg_authors}" "${arg_institution}" \
    "${arg_description}" "${arg_version}" "${arg_years}"   "${arg_license}")"

  clear
  case "${arg_destination}" in
    ${ARG_DESTINATION_DIALOG})
      # Show ASCII logo if defined
      if lib_core_is --not-empty "${arg_logo}"; then
        dialog --no-collapse --infobox "${arg_logo}" 0 0
        sleep 3
      fi

      # Show project dialog
      dialog                                  \
        --no-collapse                         \
        --timeout "${arg_timeout}"            \
        --title   "${arg_title}"              \
        --extra-button --extra-label "Cancel" \
        --msgbox  "${text}"                   \
        0 0                                   || \

      # In case 'Cancel' button was pressed
      { exitcode="$?"
        clear
        return ${exitcode}
      }
      ;;

    ${ARG_DESTINATION_TERMINAL})
      lib_msg_print_heading -1 "${arg_title}"
      printf "%s\n" "${text}"
      sleep ${arg_timeout}
      ;;
  esac
  clear
}

#===  FUNCTION  ================================================================
#         NAME:  lib_shtpl_about
#
#  DESCRIPTION:  Print about message (project, author, copyright, license, etc.)
#                Wrapper for `lib_shtpl_about_print1()` and
#                `lib_shtpl_about_print2()`. Please note that the function has
#                no arguments but expects certain environmental variables
#                to be set, see below.
#
#      GLOBALS:  The function relies on the following constants/variables,
#                usually set in '/src/lang/<s>.0.lang.sh'
#
#                  L_<S>_ABOUT_AUTHORS    L_<S>_ABOUT_DESCRIPTION   L_<S>_ABOUT_INSTITUTION
#                  L_<S>_ABOUT_LICENSE    L_<S>_ABOUT_LOGO          L_<S>_ABOUT_PROJECT
#                  L_<S>_ABOUT_VERSION    L_<S>_ABOUT_YEARS
#
#                where <S>/<s> is the script's filename without '.sh', in
#                uppercase/lowercase letters.
#
#                Example: If this function is called from a file named 
#                '/src/run.sh' then it expects <L_RUN_ABOUT_...> variables
#                defined in '/src/lang/run.0.lang.sh'.
#
# PARAMETER  1:  Display format, possible values are:
#                  --dialog     dialog
#                  --help       manpage / --help
#                  --terminal   terminal window (default)
#===============================================================================
lib_shtpl_about() {
  local arg_destination="$1"

  local prefix
  prefix="L_$(lib_core_file_get --name "$0")"
  prefix="$(lib_core_str_to --const "${prefix}")"
  
  if lib_core_var_is --not-empty                        \
    "${prefix}_ABOUT_PROJECT" "${prefix}_ABOUT_AUTHORS" \
    "${prefix}_ABOUT_DESCRIPTION" "${prefix}_ABOUT_YEARS"; then
    case "${arg_destination}" in
      --dialog|--terminal)
        eval lib_shtpl_about_print2 \"${arg_destination}\"                        \
          \"\${${prefix}_ABOUT_PROJECT}\" \"\${${prefix}_ABOUT_AUTHORS}\"         \
          \"\${${prefix}_ABOUT_INSTITUTION}\" \"\${${prefix}_ABOUT_DESCRIPTION}\" \
          \"\${${prefix}_ABOUT_VERSION}\" \"\${${prefix}_ABOUT_YEARS}\"           \
          \"\${${prefix}_ABOUT_LICENSE}\" \"\${${prefix}_ABOUT_LOGO}\"
        ;;

      --help)
        eval lib_shtpl_about_print1 \"${arg_destination}\"                        \
          \"\${${prefix}_ABOUT_PROJECT}\" \"\${${prefix}_ABOUT_AUTHORS}\"         \
          \"\${${prefix}_ABOUT_INSTITUTION}\" \"\${${prefix}_ABOUT_DESCRIPTION}\" \
          \"\${${prefix}_ABOUT_VERSION}\" \"\${${prefix}_ABOUT_YEARS}\"           \
          \"\${${prefix}_ABOUT_LICENSE}\"
        ;;
    esac
  fi
}

#===  FUNCTION  ================================================================
#         NAME:  lib_shtpl_arg
#
#  DESCRIPTION:  Generate/Format script's help. Only for script parameters
#                (help's SYNOPSIS section), for other help sections see
#                <lib_shtpl_genhelp()> instead.
#
# PARAMETER  1:  Type of help text
#                (--def|--des|--list-des|--list-ptr|--list-val|--minmax|--par)
#
#                To append the default value ('--def') to any of the types,
#                below just put the suffix '-def' behind, e.g. '--des-def' to
#                get the parameter's description succeeded by its default value.
#
#-------------------------------------------------------------------------------
#lib_shtpl_arg... Description               Example Output (with <arg_item>)
#-------------------------------------------------------------------------------
#   --def         Default value             (default: 'item1')
#
#   --des         Parameter description     Help <arg_item>
#
#   --list-des    List of possible values   item1  :  Help <ARG_ITEM_ITEM1>
#                 (with description)        item2  :  Help <ARG_ITEM_ITEM2>
#
#   --list-ptr    List of possible values   <item> = { item1 | item2 }
#   --list-val    (without description)
#
#   --minmax      Value range               <int> = [0, 10]
#
#   --par         Parameter cmd switch      -j|--item <item>
#
#-------------------------------------------------------------------------------
#lib_shtpl_arg ...  Required variables/constants in ...
#                   '/src/run.sh'       '/src/lang/run.<ll>.lang.sh'
#-------------------------------------------------------------------------------
#   --def           arg_item            -
#
#   --des           -                   L_RUN_<DE|EN|..>_HLP_DES_ARG_ITEM
#
#   --list-des                          L_RUN_<DE|EN|..>_HLP_DES_ARG_ITEM
#
#                   ARG_ITEM_LIST (1)   L_RUN_HLP_PAR_ARG_ITEM
#
#                   ARG_ITEM_ITEM1      L_RUN_<DE|EN|..>_HLP_DES_ARG_ITEM_ITEM1
#                                       (or L_RUN_<DE|EN|..>_DLG_ITM_ARG_ITEM_ITEM1)
#
#                   ARG_ITEM_ITEM2      L_RUN_<DE|EN|..>_HLP_DES_ARG_ITEM_ITEM2
#                                       (or L_RUN_<DE|EN|..>_DLG_ITM_ARG_ITEM_ITEM2)
#
#                   ...                 ...
#
#   --list-ptr      ARG_ITEM_LIST (1)   -
#                   ARG_ITEM_ITEM1
#                   ARG_ITEM_ITEM2
#                   ...
#
#   --list-val      ARG_ITEM_LIST (2)   -
#
#   --minmax        ARG_INT_MIN         -
#                   ARG_INT_MAX
#
#   --par           -                   L_RUN_HLP_PAR_ARG_ITEM
#
#   (1)             Must contain constant pointers, e.g. 'ITEM1' 'ITEM2'.
#   (2)             Must contain values, e.g. 'item1' 'item2'.
#-------------------------------------------------------------------------------
#
# PARAMETER  2:  Parameter (identifier) for which the help text should be
#                generated, e.g. 'arg_item'
#
#            3:  Pointer suffix (only if param <1> is '--des' or '--list-*')
#                Useful if a parameter has multiple descriptions and/or
#                argument lists
#
#      OUTPUTS:  Help text to <stdout>
#
#   RETURNS  0:  Success
#            1:  Error
#
#      EXAMPLE:  > lib_shtpl_arg --list-ptr "arg_item"
#                >> <item> = { item1 | item2 }
#
#                > lib_shtpl_arg --list-ptr-def "arg_item"
#                >> <item> = { item1 | item2 } (default: 'item1')
#
#                > lib_shtpl_arg --list-ptr "arg_action" "INTERACTIVE"
#                >> = { custom2 | custom3 | custom4 | custom5 }
#===============================================================================
lib_shtpl_arg() {
  local arg_type="$1"
  local arg_arg="$2"
  local arg_ptr_suffix="$3"

  # Prefix (from '/src/lang/*.*.lang.sh') that most of the constants start with,
  # e.g. 'L_RUN'
  local prefix
  prefix="L_$(lib_core_file_get --name "$0")"

  local ptr1 # Constant 1 (pointer)
  local val1 # Constant 1 (value)
  local ptr2 # Constant 2 (pointer)
  local val2 # Constant 2 (value)
  local ptr3 # Constant 3 (pointer)
  local val3 # Constant 3 (value)

  # Get pointer
  case "${arg_type}" in
    --def)
      # Default value is stored in variable itself
      ptr1="${arg_arg}"
      ;;

    --des|--des-def)
      # e.g. <L_RUN_HLP_DES_ARG_ITEM>
      ptr1="${prefix}_${ID_LANG}_HLP_DES_${arg_arg}${arg_ptr_suffix:+_${arg_ptr_suffix}}"
      ;;

    --par)
      # e.g. <L_RUN_HLP_PAR_ARG_ITEM>
      ptr1="${prefix}_HLP_PAR_${arg_arg}"
      ;;

    --list-des|--list-ptr|--list-val|\
    --list-des-def|--list-ptr-def|--list-val-def)
      case "${arg_type}" in
        --list-des*)
          # e.g. <L_RUN_HLP_DES_ARG_ITEM>
          ptr1="${prefix}_${ID_LANG}_HLP_DES_${arg_arg}${arg_ptr_suffix:+_${arg_ptr_suffix}}"
          ;;
        --list-ptr*|--list-val*)
          # e.g. <L_RUN_HLP_PAR_ARG_ITEM>
          ptr1="${prefix}_HLP_PAR_${arg_arg}"
          ;;
      esac

      # e.g. <ARG_ITEM_LIST>, <ARG_ACTION_LIST_INTERACTIVE>
      ptr2="${arg_arg}_LIST${arg_ptr_suffix:+_${arg_ptr_suffix}}"
      ;;

    --minmax|--minmax-def)
      # e.g. <L_RUN_HLP_PAR_ARG_INT>
      ptr1="${prefix}_HLP_PAR_${arg_arg}"
      # e.g. <ARG_INT_MIN>
      ptr2="${arg_arg}_MIN"
      # e.g. <ARG_INT_MAX>
      ptr3="${arg_arg}_MAX"
      ;;

    *)
      return 1
      ;;
  esac

  # Pointer / Value 1
  if lib_core_is --not-empty "${ptr1}"; then
    ptr1="$(lib_core_str_to --const "${ptr1}")"
    if lib_core_is --varname "${ptr1}"; then
      eval "val1=\${${ptr1}}"
    fi
  fi

  # Pointer / Value 2
  if lib_core_is --not-empty "${ptr2}"; then
    ptr2="$(lib_core_str_to --const "${ptr2}")"
    if lib_core_is --varname "${ptr2}"; then
      eval "val2=\${${ptr2}}"
    fi
  fi

  # Pointer / Value 3
  if lib_core_is --not-empty "${ptr3}"; then
    ptr3="$(lib_core_str_to --const "${ptr3}")"
    if lib_core_is --varname "${ptr3}"; then
      eval "val3=\${${ptr3}}"
    fi
  fi

  # Get '<arg>' from '-p|--param <arg>'
  case "${arg_type}" in
    --list-ptr*|--list-val*|--minmax*)
      val1="$(printf "%s" "${val1}" | sed -e "s/^[^[:blank:]]*[[:blank:]]//")"
      ;;
  esac

  # Print help text
  case "${arg_type}" in
    --des*|--par)
      printf "%s" "${val1}"
      ;;

    --list-des*)
      local ptr_arg
      local ptr_des
      local val_arg
      local val_des
      local list
      for a in ${val2}; do
        # e.g. <ARG_ITEM_ITEM1>
        ptr_arg="${arg_arg}_${a}"
        ptr_arg="$(lib_core_str_to --const "${ptr_arg}")"
        val_arg=""
        if lib_core_is --varname "${ptr_arg}"; then
          eval val_arg=\"\${${ptr_arg}}\"
        fi

        # e.g. <L_RUN_EN_HLP_DES_ARG_ITEM_ITEM1>
        ptr_des="${prefix}_${ID_LANG}_HLP_DES_${arg_arg}_${a}"
        ptr_des="$(lib_core_str_to --const "${ptr_des}")"
        val_des=""
        if lib_core_is --varname "${ptr_des}"; then
          eval val_des=\"\${${ptr_des}}\"

          # If e.g. <L_RUN_EN_HLP_DES_ARG_ITEM_ITEM1> is not existing
          # try to use <L_RUN_EN_DLG_ITM_ARG_ITEM_ITEM1> instead.
          if lib_core_is --empty "${val_des}"; then
            ptr_des="${prefix}_${ID_LANG}_DLG_ITM_${arg_arg}_${a}"
            ptr_des="$(lib_core_str_to --const "${ptr_des}")"
            eval val_des=\"\${${ptr_des}}\"
          fi
        fi

        # Add argument/description pair to list
        list="${list:+${list} }\"${val_arg}\" \"${val_des}\""
      done

      # Print description (if available) and list
      if lib_core_is --not-empty "${val1}"; then printf "%s\n\n" "${val1}"; fi
      eval lib_msg_print_propvalue \
        --left --center \"2\" \"$(( $(lib_msg_term_get --cols) / 2))\" \":\" ${list}
      ;;

    --list-ptr*)
      printf "%s = %s" "${val1}" \
        "$(lib_msg_print_list_ptr "${val2}" "$(lib_core_str_to --const "${arg_arg}")_")"
      ;;

    --list-val*)
      printf "%s = %s" \
        "${val1}" "$(lib_msg_print_list_val "${val2}")"
      ;;

    --minmax*)
      printf "%s = [%s, %s]" "${val1}" "${val2}" "${val3}"
      ;;
  esac

  # (Optionally) print default value
  case "${arg_type}" in
    --*def)
      ptr1="${arg_arg}"
      val1=""
      if lib_core_is --varname "${ptr1}"; then
        eval "val1=\${${ptr1}}"
      fi

      case "${arg_type}" in
        --def)
          printf "%s" "(default: '${val1}')"
          ;;
        --des-def|--list-ptr-def|--list-val-def)
          printf "\n\n%s" "(default: '${val1}')"
          ;;
        --list-des-def)
          printf "\n%s" "(default: '${val1}')"
          ;;
        --*-def)
          printf " %s" "(default: '${val1}')"
          ;;
      esac
      ;;
  esac
}

#===  FUNCTION  ================================================================
#         NAME:  lib_shtpl_arg_action_is_valid
#  DESCRIPTION:  Check if <arg_action> (see '/src/run.sh') is valid
#      OUTPUTS:  An error message to <stderr> and/or <syslog> if <arg_action>
#                is not valid. See also <lib_shtpl_message()>.
#   RETURNS  0:  <arg_action> is valid
#            1:  <arg_action> is empty or not valid
#===============================================================================
lib_shtpl_arg_action_is_valid() {
  local msg
  local txt
  eval "txt=\${LIB_SHTPL_${ID_LANG}_TXT_ARG_ACTION_ERR_NOTALLOWED}"

  case "${arg_mode}" in
    ${ARG_MODE_DAEMON}|${ARG_MODE_INTERACTIVE})
      ;;

    ${ARG_MODE_INTERACTIVE_SUBMENU})
      msg="<${arg_action}> ${txt} <${arg_mode}>."

      lib_core_list_contains_str_ptr \
        "${arg_action}" "${ARG_ACTION_LIST_INTERACTIVE}" " " "ARG_ACTION_"
      ;;

    ${ARG_MODE_SCRIPT})
      msg="$(lib_core_str_to --const \
        "L_$(lib_core_file_get --name "$0")_HLP_PAR_ARG_ACTION_${arg_action}")"
      eval "msg=\${${msg}}"
      msg="[${msg}] ${txt} <${arg_mode}>."

      lib_core_list_contains_str_ptr \
        "${arg_action}" "${ARG_ACTION_LIST_SCRIPT}" " " "ARG_ACTION_"
      ;;
  esac || \

  if lib_core_is --not-empty "${arg_action}"; then
    lib_shtpl_message --error "${msg}"
  else
    eval lib_shtpl_message --error \"\${LIB_SHTPL_${ID_LANG}_TXT_ARG_ACTION_ERR_NOTSET}\"
  fi
}

#===  FUNCTION  ================================================================
#         NAME:  lib_shtpl_arg_error
#  DESCRIPTION:  Log/Print an error message ("Invalid argument <...> for
#                parameter [...]") for a certain argument
# PARAMETER  1:  Argument (identifier)
#            2:  (Optional) Separate parameter (identifier) in case parameter
#                <1> does not have a command line switch (L_RUN_HLP_PAR_ARG_...)
#      OUTPUTS:  An error message to <stderr> and/or <syslog>,
#                see also <lib_shtpl_message()>.
#   RETURNS  1:  Default return value, see also <lib_shtpl_message()>
#            2:  At least one of the parameters is not valid
#      EXAMPLE:  > lib_shtpl_arg_error "arg_str"
#                >> Invalid argument <${arg_str}> for parameter [${L_RUN_HLP_PAR_ARG_STR}].
#
#                > lib_shtpl_arg_error "arg_str" "ARG_ACTION_CUSTOM4"
#                >> Invalid argument <${arg_str}> for parameter [${L_RUN_HLP_PAR_ARG_ACTION_CUSTOM4}].
#===============================================================================
lib_shtpl_arg_error() {
  local arg_arg="$1"
  local arg_param="$2"

  lib_core_is --empty "${arg_param}"  && \
  arg_param="${arg_arg}"              || \
  arg_param="$(lib_core_str_to --const "${arg_param}")"

  lib_core_is --posix-name "${arg_arg}" "${arg_param}" || return 2

  local text1
  local text2
  eval "text1=\${LIB_SHTPL_${ID_LANG}_TXT_INVALID_ARG_1}"
  eval "text2=\${LIB_SHTPL_${ID_LANG}_TXT_INVALID_ARG_2}"

  local value
  local param
  eval "value=\${${arg_arg}}"
  param="$(lib_core_str_to --const "L_$(lib_core_file_get --name "$0")_HLP_PAR_${arg_param}")"
  eval "param=\${${param}}"

  lib_shtpl_message --error "${text1} <${value}> ${text2} [${param}]."
}

#===  FUNCTION  ================================================================
#         NAME:  lib_shtpl_arg_is_set
#
#  DESCRIPTION:  Check if one or more arguments are set (not empty)
#
# PARAMETER
#         1...:  Argument(s) to check (identifiers, without '${}')
#
#      OUTPUTS:  An error message for each argument that is not set,
#                see also <lib_shtpl_arg_error()>.
#
#   RETURNS  0:  All arguments are set
#            1:  At least one argument is empty
#            2:  At least one argument (identifier) is not valid
#
#      EXAMPLE:  > arg_int="5"
#                > arg_str=""
#                > lib_shtpl_arg_is_set "arg_int" "arg_str"
#                >> Invalid argument <> for parameter [${L_RUN_HLP_PAR_ARG_STR}].
#===============================================================================
lib_shtpl_arg_is_set() {
  lib_core_args_passed "$@" || return
  local result="0"

  local par
  for par in "$@"; do
    if lib_core_is --posix-name "${par}"; then
      eval lib_core_is --not-empty \"\${${par}}\" || \
      { lib_shtpl_arg_error "${par}"; result="1"; }
    else
      lib_shtpl_message --error "<${par}> identifier is not valid."
      result="2"
    fi
  done

  return "${result}"
}

#===  FUNCTION  ================================================================
#         NAME:  lib_shtpl_genhelp
#
#  DESCRIPTION:  Generate/Format script's help. For all help sections except
#                script parameters (see <lib_shtpl_arg()> instead).
#
# PARAMETER  1:  Type of help text
#                (--about|--examples|--intro|--notes|--references|
#                 --requirements|--tldr)
#
#-------------------------------------------------------------------------------
#   Parameter <1>   Description     Required constants in '/src/lang/run.<ll>.lang.sh'
#-------------------------------------------------------------------------------
#   --about         About           ---
#   --examples      Examples        L_RUN_<DE|EN|..>_HLP_<TTL|TXT>_EXAMPLES_<1|2|..>
#   --intro         Intro           L_RUN_<DE|EN|..>_HLP_TXT_INTRO
#   --notes         Notes           L_RUN_<DE|EN|..>_HLP_TXT_NOTES_<1|2|..>
#   --references    References      L_RUN_HLP_TXT_REFERENCES_<1|2|..>
#   --requirements  Requirements    L_RUN_<DE|EN|..>_HLP_<TTL|TXT>_REQUIREMENTS_<1|2|..>
#   --tldr          TL;DR           L_RUN_<DE|EN|..>_HLP_<TTL|TXT>_TLDR_<1|2|..>
#-------------------------------------------------------------------------------
#
#      OUTPUTS:  Help text to <stdout>
#
#   RETURNS  0:  Success
#            1:  Error
#===============================================================================
lib_shtpl_genhelp() {
  local arg_section="$1"

  # Prefix (from '/src/lang/*.*.lang.sh') that most of the constants start with,
  # e.g. 'L_RUN'
  local prefix
  prefix="L_$(lib_core_file_get --name "$0")"
  prefix="$(lib_core_str_to --const "${prefix}")"

  local i=1
  local heading
  local title
  local title_ptr_pre
  local title_ptr_suf
  local text
  local text_ptr_pre
  local text_ptr_suf
  local str
  local str_l
  local str_r
  case "${arg_section}" in
    --about)
      eval lib_msg_print_heading -111 \"\${LIB_SHTPL_${ID_LANG}_TXT_HELP_TTL_ABOUT}\"
      lib_shtpl_about --help
      ;;

    --examples|--requirements|--tldr)
      case "${arg_section}" in
        --examples)
          heading="LIB_SHTPL_${ID_LANG}_TXT_HELP_TTL_EXAMPLES"
          title_ptr_pre="${prefix}_${ID_LANG}_HLP_TTL_EXAMPLES_"
          title_ptr_suf=""
          text_ptr_pre="${prefix}_${ID_LANG}_HLP_TXT_EXAMPLES_"
          text_ptr_suf=""
          ;;
        --requirements)
          heading="LIB_SHTPL_${ID_LANG}_TXT_HELP_TTL_REQUIREMENTS"
          title_ptr_pre="${prefix}_${ID_LANG}_HLP_TTL_REQUIREMENTS_"
          title_ptr_suf=""
          text_ptr_pre="${prefix}_${ID_LANG}_HLP_TXT_REQUIREMENTS_"
          text_ptr_suf=""
          ;;
        --tldr)
          heading="LIB_SHTPL_TXT_HELP_TTL_TLDR"
          title_ptr_pre="${prefix}_${ID_LANG}_HLP_TTL_TLDR_"
          title_ptr_suf=""
          text_ptr_pre="${prefix}_${ID_LANG}_HLP_TXT_TLDR_"
          text_ptr_suf=""
          ;;
      esac

      eval "heading=\${${heading}}"
      eval "title=\${${title_ptr_pre}${i}${title_ptr_suf}}"
      eval "text=\${${text_ptr_pre}${i}${text_ptr_suf}}"

      if lib_core_is --not-empty "${title}"; then
        lib_msg_print_heading -111 "${heading}"
      fi

      while lib_core_is --not-empty "${title}"; do
        if [ $i -eq 1 ]; then
          lib_msg_print_heading -301 "${str_l}${title}${str_r}"
        else
          lib_msg_print_heading -311 "${str_l}${title}${str_r}"
        fi
        printf "%s\n" "${text}"

        i=$(( i + 1 ))
        eval "title=\${${title_ptr_pre}${i}${title_ptr_suf}}"
        eval "text=\${${text_ptr_pre}${i}${text_ptr_suf}}"
      done
      ;;

    --intro)
      heading="$(eval printf \"%s\\n\(\%s\)\" \"\${${prefix}_${ID_LANG}_DLG_TTL_ARG_ACTION}\" \"\${LIB_SHTPL_${ID_LANG}_TXT_EXIT_LESS}\")"
      lib_msg_print_heading -101 "${heading}"
      eval printf \"%s\\n\" \"\${${prefix}_${ID_LANG}_HLP_TXT_INTRO}\"
      ;;

    --notes)
      heading="LIB_SHTPL_${ID_LANG}_TXT_HELP_TTL_NOTES"
      text_ptr_pre="${prefix}_${ID_LANG}_HLP_TXT_NOTES_"
      text_ptr_suf=""

      str_l="("
      str_r=")"

      eval "heading=\${${heading}}"
      eval "text=\${${text_ptr_pre}${i}${text_ptr_suf}}"

      if lib_core_is --not-empty "${text}"; then
        lib_msg_print_heading -111 "${heading}"
      fi

      while lib_core_is --not-empty "${text}"; do
        if [ $i -eq 1 ]; then
          lib_msg_print_heading -301 "${str_l}${i}${str_r}"
        else
          lib_msg_print_heading -311 "${str_l}${i}${str_r}"
        fi
        printf "%s\n" "${text}"

        i=$(( i + 1 ))
        eval "text=\${${text_ptr_pre}${i}${text_ptr_suf}}"
      done
      ;;

    --references)
      eval "heading=\${LIB_SHTPL_${ID_LANG}_TXT_HELP_TTL_REFERENCES}"
      eval "text=\${${prefix}_HLP_TXT_REFERENCES_${i}}"

      if lib_core_is --not-empty "${text}"; then
        lib_msg_print_heading -111 "${heading}"
      fi

      while lib_core_is --not-empty "${text}"; do
        str="${str}${str:+ \" \" \"\" }\"[${i}]\" \"${text}\""
        i=$(( i + 1 ))
        eval "text=\${${prefix}_HLP_TXT_REFERENCES_${i}}"
      done

      eval lib_msg_print_propvalue \"--left\" \"--left\" \"2\" \"\" \" \" ${str}
      ;;

    *)
      return 1
      ;;
  esac
}

#===  FUNCTION  ================================================================
#         NAME:  lib_shtpl_help
#  DESCRIPTION:  Print help message using 'less' utility
#         TODO:  Please do not hardcode any help texts here.
#                Edit '/src/lang/run.<ll>.lang.sh' to define your help texts and
#                <help_synopsis()> (in '/src/run.sh') to modify the SYNOPSIS
#                section of your help.
#===============================================================================
lib_shtpl_help() {
  { #  INTRO
    lib_shtpl_genhelp --intro

    #  TL;DR
    lib_shtpl_genhelp --tldr
    help_synopsis --tldr

    #  REQUIREMENTS
    lib_shtpl_genhelp --requirements

    #  SYNOPSIS
    help_synopsis --synopsis

    #  EXAMPLES
    lib_shtpl_genhelp --examples

    #  NOTES
    lib_shtpl_genhelp --notes

    #  REFERENCES
    lib_shtpl_genhelp --references

    #  ABOUT
    lib_shtpl_genhelp --about
  } | less
}

#===  FUNCTION  ================================================================
#         NAME:  lib_shtpl_message
#
#  DESCRIPTION:  Log/Print error/info/warning message and optionally exit
#
#      GLOBALS:  The function relies on the following constants/variables,
#                usually set in '/src/run.sh'
#                  arg_logdest           ARG_LOGDEST_BOTH
#                  ARG_LOGDEST_SYSLOG    ARG_LOGDEST_TERMINAL
#
# PARAMETER  1:  Message type (see <lib_msg_message()>)
#          (2):  (Optional) Log destination filter, see switch-case statement
#                below. The function will only log/print the message if the
#                script's log destination (<arg_logdest>) matches the filter
#         2(3):  Message
#         3(4):  Previous command output (optional)
#         4(5):  Exit? (true|false) (default: see <lib_msg_message()>)
#         5(6):  Exit/Return code (default: see <lib_msg_message()>)
#      OUTPUTS:  Depends on <arg_logdest>
#      RETURNS:  Depends on parameter <6(5)>
#===============================================================================
lib_shtpl_message() {
  local arg_type="$1"; shift

  # Log filter
  local logdest
  logdest="${arg_logdest}"
  case "$1" in
    --${ARG_LOGDEST_BOTH}) shift ;;
    --${ARG_LOGDEST_SYSLOG}|--${ARG_LOGDEST_TERMINAL})
      case "${logdest}" in
        ${ARG_LOGDEST_BOTH})
          logdest="${1#--}"
          ;;
        ${ARG_LOGDEST_SYSLOG}|${ARG_LOGDEST_TERMINAL})
          if [ "${1#--}" != "${logdest}" ]; then return; fi
          ;;
      esac
      shift
      ;;
    *) ;;
  esac

  # Print/Log message
  lib_msg_message --${logdest} "${arg_type}" "$1" "$1${2:+ COMMAND OUTPUT: <$2>}" "$3" "$4"
}