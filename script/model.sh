#!/bin/bash
# Copyright (c) 2010 by Robert D. Cotey II
#    This file is part of coteyr_pack.
#
#    coteyr_pack is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    coteyr_pack is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with coteyr_pack.  If not, see <http://www.gnu.org/licenses/>.
source "$HOME/.rvm/scripts/rvm"

cd $1
CHOICE=`zenity --entry --text="Model Name" --title="New Model"`
notify-send "$1 $CHOICE"
rails generate model $CHOICE


subl "$1/app/models/${CHOICE}.rb"
subl $1/db/migrate/*_create_${CHOICE}s.rb
subl $1/spec/fabricators/${CHOICE}_fabricator.rb
subl $1/spec/models/${CHOICE}_spec.rb
