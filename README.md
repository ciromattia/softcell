# SoftCell - Nokia 3310 Software Emulator

SoftCell is a Nokia 3310 software emulator written in Assembly for the Computer Architecture 2003/2004 academic IT course.

## AUTHORS
- Matteo Chiarion <matteo@winged.it>
- Ciro Mattia Gonano <ciromattia@gmail.com>

## LICENSE
This software is copyrighted under the GNU General Public License v. 2.0

## REGISTER USE
- **$s0-$s3**	store the mutable display lines' addresses
- **$s4**		stores last pressed button's ID
- **$s5**		is used to store the current buffer's pointer
- **$s6**		is mainly used to register how many times a button has been pressed, sometimes used also to store indexes
- **$s7**		is mainly used to store current display's status
- **$s8**		is used together with $ra to manage return jumps
