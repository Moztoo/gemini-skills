#!/bin/bash
#-*--
#_ver=20240307_193503
#_bas=get-git-status
#
# get concise, machine-readable git status
#
#_usage[0]="show git status in a concise format"
#

set -e

git status --porcelain=v1
