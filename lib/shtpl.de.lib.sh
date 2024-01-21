#!/bin/sh
#
# SPDX-FileCopyrightText: 2023-2024 Florian Kemser and the SHtemplateLIB contributors
# SPDX-License-Identifier: LGPL-3.0-or-later
#
#===============================================================================
#
#         FILE:   /lib/shtpl.de.lib.sh
#
#        USAGE:   ---
#                 (This is a library file, so please do NOT run it.)
#
#  DESCRIPTION:   --German-- String Constants File
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
readonly LIB_SHTPL_DE_TXT_HELP="Weitere Informationen finden Sie in der Hilfe."
readonly LIB_SHTPL_DE_TXT_ABORTING="Abbruch ..."
readonly LIB_SHTPL_DE_TXT_CONTINUE_ENTER="Drücken Sie die <Eingabetaste> um fortzufahren ..."
readonly LIB_SHTPL_DE_TXT_CONTINUE_YESNO="MÖCHTEN SIE WIRKLICH FORTFAHREN (J/N)?"
readonly LIB_SHTPL_DE_TXT_EXIT_LESS="Zum Beenden 'q' drücken ..."
readonly LIB_SHTPL_DE_TXT_FILE_NOT_FOUND_ERR="Eine oder mehrere Dateien wurden nicht gefunden. ${LIB_SHTPL_DE_TXT_HELP} ${LIB_SHTPL_DE_TXT_ABORTING}"
readonly LIB_SHTPL_DE_TXT_GOBACK="Zurück"
readonly LIB_SHTPL_DE_TXT_INVALID_ARG_DE_1="Ungültiges Argument"
readonly LIB_SHTPL_DE_TXT_INVALID_ARG_DE_2="für den Parameter"
readonly LIB_SHTPL_DE_TXT_PROCESSING="Verarbeite Auftrag ..."
readonly LIB_SHTPL_DE_TXT_SELECTALL="Alle(s) auswählen"
readonly LIB_SHTPL_DE_TXT_STDIN_HIDDEN="Aus Sicherheitsgründen werden Ihre Tastatureingaben nicht angezeigt."

readonly LIB_SHTPL_DE_TXT_ARGS_CHECK_ERR="Ein oder mehrere Parameter sind ungültig. ${LIB_SHTPL_DE_TXT_HELP} ${LIB_SHTPL_DE_TXT_ABORTING}"
readonly LIB_SHTPL_DE_TXT_ARGS_READ_ERR="Unbekannter Parameter oder fehlendes/ungültiges Argument. ${LIB_SHTPL_DE_TXT_HELP} ${LIB_SHTPL_DE_TXT_ABORTING}"
readonly LIB_SHTPL_DE_TXT_INIT_CHECK_ERR="Eine oder mehrere Voraussetzungen (Pakete, Dateien, etc.) sind nicht erfüllt. ${LIB_SHTPL_DE_TXT_HELP} ${LIB_SHTPL_DE_TXT_ABORTING}"
readonly LIB_SHTPL_DE_TXT_INIT_CHECK_ERR_LOGSERVICE="Log-Dienst (logd, syslog, syslog-ng) läuft nicht."
readonly LIB_SHTPL_DE_TXT_INIT_CHECK_WARN="Eine oder mehrere optionale Voraussetzungen (Pakete, Dateien, etc.) sind nicht erfüllt. Einige Funktionen sind unter Umständen nicht verfügbar."
readonly LIB_SHTPL_DE_TXT_INIT_FIRST_INFO="Skript gestartet"
readonly LIB_SHTPL_DE_TXT_INIT_UPDATE_ERR="Initialisierung konnte nicht erfolgreich abgeschlossen werden."

#===============================================================================
#  'dialog' CONSTANTS
#===============================================================================
#-------------------------------------------------------------------------------
#  [--title <title>]
#-------------------------------------------------------------------------------
readonly LIB_SHTPL_DE_DLG_TTL_ERROR="!!! FEHLER !!!"
readonly LIB_SHTPL_DE_DLG_TTL_FILE_IN="Quelldatei"
readonly LIB_SHTPL_DE_DLG_TTL_FILE_OUT="Zieldatei"

#-------------------------------------------------------------------------------
#  <text>
#-------------------------------------------------------------------------------
readonly LIB_SHTPL_DE_DLG_TXT_ATTENTION="\
=========
 ACHTUNG
========="
readonly LIB_SHTPL_DE_DLG_TXT_CHECKLIST="Zum An-/Abwählen eines Eintrags verwenden Sie bitte die <Leertaste>. Ein Stern [*] vor einem Eintrag zeigt an, dass dieser ausgewählt ist."
readonly LIB_SHTPL_DE_DLG_TXT_CONTINUE="
==================================
 Möchten Sie wirklich fortfahren?
=================================="
readonly LIB_SHTPL_DE_DLG_TXT_ERROR="Es ist ein Fehler aufgetreten oder der Vorgang wurde abgebrochen."
readonly LIB_SHTPL_DE_DLG_TXT_ERROR_TRYAGAIN="${LIB_SHTPL_DE_DLG_TXT_ERROR} Möchten Sie es erneut versuchen?"
readonly LIB_SHTPL_DE_DLG_TXT_FILE_IN="Bitte wählen Sie die zu öffnende / ladende Datei aus."
readonly LIB_SHTPL_DE_DLG_TXT_FILE_OUT="Bitte geben Sie einen Pfad an, an dem die Datei gespeichert werden soll."
readonly LIB_SHTPL_DE_DLG_TXT_FILE_OUT_NOOVERRIDE="${LIB_SHTPL_DE_DLG_TXT_FILE_OUT} Die Datei muss neu sein, bestehende Dateien werden nicht überschrieben."
readonly LIB_SHTPL_DE_DLG_TXT_INFO="\
=============
 INFORMATION
============="
readonly LIB_SHTPL_DE_DLG_TXT_LEAVEDEFAULT="\
${LIB_SHTPL_DE_DLG_TXT_ATTENTION}
Sollten Sie sich nicht sicher sein, so belassen Sie bitte den Standardwert."
readonly LIB_SHTPL_DE_DLG_TXT_OPTIONAL="Bitte beachten Sie, dass dieses Feld in einigen Fällen optional ist."
readonly LIB_SHTPL_DE_DLG_TXT_RADIOLIST="Zum Anwählen einer Option verwenden Sie bitte die <Leertaste>. Welche Option aktuell ausgewählt ist können Sie an einem Stern (*) vor der Option erkennen."
readonly LIB_SHTPL_DE_DLG_TXT_SEEALSO="\
============
 SIEHE AUCH
============
Weitere Informationen hierzu finden Sie unter:"
readonly LIB_SHTPL_DE_DLG_TXT_STDIN_HIDDEN="\
${LIB_SHTPL_DE_DLG_TXT_ATTENTION}
${LIB_SHTPL_DE_TXT_STDIN_HIDDEN}"
readonly LIB_SHTPL_DE_DLG_TXT_WARNING="\
==========
 WARNUNG
=========="

#-------------------------------------------------------------------------------
#  <item1>...
#-------------------------------------------------------------------------------
readonly LIB_SHTPL_DE_DLG_ITM_ABOUT="Über dieses Projekt"
readonly LIB_SHTPL_DE_DLG_ITM_EXIT="Programm beenden"
readonly LIB_SHTPL_DE_DLG_ITM_EXIT_MENU="Menü verlassen"
readonly LIB_SHTPL_DE_DLG_ITM_EXIT_MENU_SAVE="Änderungen speichern und Menü verlassen"
readonly LIB_SHTPL_DE_DLG_ITM_GOBACK="ZURÜCK"
readonly LIB_SHTPL_DE_DLG_ITM_HELP="Hilfe"

#===============================================================================
#  PARAMETER (TEMPLATE)
#===============================================================================
#  Script actions <ARG_ACTION_...>
readonly LIB_SHTPL_DE_HLP_DES_ARG_ACTION_HELP="Diese Hilfe anzeigen"

#  Log destination <ARG_LOGDEST_...>
readonly LIB_SHTPL_DE_HLP_DES_ARG_LOGDEST="Festlegen, wohin protokolliert werden soll"
readonly LIB_SHTPL_DE_HLP_DES_ARG_LOGDEST_BOTH="Kommandozeile + System-Log"
readonly LIB_SHTPL_DE_HLP_DES_ARG_LOGDEST_SYSLOG="Nur System-Log"
readonly LIB_SHTPL_DE_HLP_DES_ARG_LOGDEST_TERMINAL="Nur Kommandozeile"

#  Script operation modes <ARG_MODE_...>
readonly LIB_SHTPL_DE_HLP_DES_ARG_MODE_DAEMON="Dieses Skript im Daemon-Modus (Hintergrund) laufen lassen"
readonly LIB_SHTPL_DE_HLP_DES_ARG_MODE_INTERACTIVE_SUBMENU="Ein bestimmtes Untermenü interaktiv ausführen und beenden"

#===============================================================================
#  HELP
#===============================================================================
#-------------------------------------------------------------------------------
#  ABOUT
#-------------------------------------------------------------------------------
readonly LIB_SHTPL_DE_TXT_HELP_TTL_ABOUT="ÜBER"

#-------------------------------------------------------------------------------
#  EXAMPLES
#-------------------------------------------------------------------------------
readonly LIB_SHTPL_DE_TXT_HELP_TTL_EXAMPLES="BEISPIELE"

#-------------------------------------------------------------------------------
#  NOTES
#-------------------------------------------------------------------------------
readonly LIB_SHTPL_DE_TXT_HELP_TTL_NOTES="HINWEISE"

#  Credentials
readonly LIB_SHTPL_DE_TXT_HELP_TXT_NOTES_CREDENTIALS_ENV="\
Es wird dringend empfohlen, vertrauenswürdige Daten wie Passwörter nur über Umgebungsvariablen zu übermitteln. Hierzu verwenden Sie bitte als Argument 'env:<VAR>' (ohne '' <>), wobei <VAR> durch den Namen der Umgebungsvariablen zu ersetzen ist.

Wenn Sie die Daten im Klartext übermitteln, können andere Benutzer/Prozesse diese mitlesen, indem Sie den ausgeführten Befehl mithilfe von Systemwerkzeugen, wie beispielsweise 'ps', abfragen.

Beispiel: Sie möchten dem Skript das Passwort '123456' übergeben.

  Mithilfe einer Umgebungsvariable (empfohlen)
    > export mypwd=\"123456\"
    > ... \"env:mypwd\"

  Direkt, im Klartext (NICHT empfohlen)
    > ... \"123456\""

#-------------------------------------------------------------------------------
#  REFERENCES
#-------------------------------------------------------------------------------
readonly LIB_SHTPL_DE_TXT_HELP_TTL_REFERENCES="REFERENZEN"

#-------------------------------------------------------------------------------
#  REQUIREMENTS
#-------------------------------------------------------------------------------
readonly LIB_SHTPL_DE_TXT_HELP_TTL_REQUIREMENTS="ANFORDERUNGEN"

#  Interactive Mode
readonly LIB_SHTPL_DE_TXT_HELP_TTL_REQUIREMENTS_INTERACTIVE="Interaktiver Modus (optional)"
readonly LIB_SHTPL_DE_TXT_HELP_TXT_REQUIREMENTS_INTERACTIVE="\
Wenn Sie dieses Skript interaktiv (siehe <ÜBERSICHT> unten) ausführen möchten,
muss Ihr Terminal-Fenster eine Größe von mindestens <100x30> aufweisen.

Benötigte Pakete:
  Allgemein: Dialog
     Debian: > sudo apt install dialog"

#-------------------------------------------------------------------------------
#  SYNOPSIS
#-------------------------------------------------------------------------------
readonly LIB_SHTPL_DE_TXT_HELP_TTL_SYNOPSIS="ÜBERSICHT"
readonly LIB_SHTPL_DE_TXT_HELP_TTL_SYNOPSIS_ACTION="AKTION"
readonly LIB_SHTPL_DE_TXT_HELP_TTL_SYNOPSIS_OPTION="OPTION"

readonly LIB_SHTPL_DE_TXT_HELP_TXT_SYNOPSIS_INTRO="Es gibt mehrere Möglichkeiten, dieses Skript aufzurufen:"
readonly LIB_SHTPL_DE_TXT_HELP_TXT_SYNOPSIS_INTERACTIVE="Interaktiver Modus (ohne weitere Argumente)"
readonly LIB_SHTPL_DE_TXT_HELP_TXT_SYNOPSIS_SCRIPT="Skript-Modus"

#-------------------------------------------------------------------------------
#  TL;DR
#-------------------------------------------------------------------------------
#  Synopsis
readonly LIB_SHTPL_DE_TXT_HELP_TTL_TLDR_SYNOPSIS="Übersicht"
readonly LIB_SHTPL_DE_TXT_HELP_TXT_TLDR_SYNOPSIS="Es gibt mehrere Möglichkeiten, dieses Skript aufzurufen. Weitere Informationen finden Sie im Abschnitt <ÜBERSICHT> weiter unten."