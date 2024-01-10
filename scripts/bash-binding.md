https://thevaluable.dev/practical-guide-fzf-example/

https://github.com/s417-lama/terminal-glyph-patcher

# Additional colors
BR_RED=$(tput setaf 9)
BR_GREEN=$(tput setaf 10)
BR_YELLOW=$(tput setaf 11)
BR_BLUE=$(tput setaf 12)
BR_MAGENTA=$(tput setaf 13)
BR_CYAN=$(tput setaf 14)
BR_WHITE=$(tput setaf 15)

# Background colors
BG_BLACK=$(tput setab 0)
BG_RED=$(tput setab 1)
BG_GREEN=$(tput setab 2)
BG_YELLOW=$(tput setab 3)
BG_BLUE=$(tput setab 4)
BG_MAGENTA=$(tput setab 5)
BG_CYAN=$(tput setab 6)
BG_WHITE=$(tput setab 7)

bold=$(tput bold)
underline=$(tput smul)
reset=$(tput sgr0)  # Reset color to default
 
# PS1: 
- This is the primary prompt string. It is displayed whenever Bash is ready to read a new command1. It can contain special characters that are replaced with information (like the current directory or time) when the prompt is displayed1.

# PROMPT_DIRTRIM: 
If this variable is set to a number, Bash will truncate the directory in PS1 to that number of trailing directory components2.

# BASH_COMMAND: 
This variable holds the command currently being executed or about to be executed, unless the shell is executing a command as the result of a trap, in which case it is the command executing at the time of the trap2.

# BASH_EXECUTION_STRING: 
The command argument to the -c option from the shell invocation command line2.

# BASH_SOURCE, BASH_LINENO, FUNCNAME: 
An array variable whose members are the source filenames where the corresponding shell function names in the FUNCNAME array variable are defined. The shell function ${FUNCNAME[$i]} is defined in the file ${BASH_SOURCE[$i]} and called from ${BASH_SOURCE[$i+1]}2.
In GNOME-based systems, 
the "recent" directory might be stored in:

recent_path=~/.local/share/recently-used.xbel

# If there are multiple matches for completion, Tab should cycle through them
bind 'TAB:menu-complete'

# Ctrl-Delete: delete next word
"\e[3;5~": shell-kill-word

# Ctrl-Backspace
"\C-H": shell-backward-kill-word

# mappings for Ctrl-left-arrow and Ctrl-right-arrow for word moving
"\e[1;5C": forward-word
"\e[1;5D": backward-word
"\e[5C": forward-word
"\e[5D": backward-word
"\e\e[C": forward-word
"\e\e[D": backward-word

# And Shift-Tab should cycle backwards
bind '"\e[Z": menu-complete-backward'
TAB: menu-complete

set editing-mode vi
set keymap vi

# Display a list of the matching files
bind "set show-all-if-ambiguous on"
bind '"\e[A":history-search-backward'	
bind '"\e[B":history-search-forward'

# Keep Ctrl-Left and Ctrl-Right working when the above are used
bind '"\e[1;5C":forward-word'
bind '"\e[1;5D":backward-word'
# Required to refresh the prompt after sk
	# \e = escape key
	bind -m emacs-standard '"\er": redraw-current-line'
	bind -m vi-command '"\C-z": emacs-editing-mode'
	bind -m vi-insert '"\C-z": emacs-editing-mode'
	bind -m emacs-standard '"\C-z": vi-editing-mode'

if [ "${BASH_VERSINFO[0]}" -lt 4 ]; then
		# CTRL-T - Paste the selected file path into the command line
		# shellcheck disable=SC2016
		bind -m emacs-standard '"\C-t": " \C-b\C-k \C-u`__sk_select__`\e\C-e\er\C-a\C-y\C-h\C-e\e \C-y\ey\C-x\C-x\C-f"'
		bind -m vi-command '"\C-t": "\C-z\C-t\C-z"'
		bind -m vi-insert '"\C-t": "\C-z\C-t\C-z"'
# CTRL-R - Paste the selected command from history into the command line
		# shellcheck disable=SC2016
		bind -m emacs-standard '"\C-r": "\C-e \C-u\C-y\ey\C-u"$(__sk_history__)"\e\C-e\er"'
		bind -m vi-command '"\C-r": "\C-z\C-r\C-z"'
		bind -m vi-insert '"\C-r": "\C-z\C-r\C-z"'
else
		# CTRL-T - Paste the selected file path into the command line
		bind -m emacs-standard -x '"\C-t": sk-file-widget'
		bind -m vi-command -x '"\C-t": sk-file-widget'
		bind -m vi-insert -x '"\C-t": sk-file-widget'

# CTRL-R - Paste the selected command from history into the command line
		bind -m emacs-standard -x '"\C-r": __sk_history__'
		bind -m vi-command -x '"\C-r": __sk_history__'
		bind -m vi-insert -x '"\C-r": __sk_history__'
	fi
fi
# Required to refresh the prompt after sk
	# \e = escape key
	bind -m emacs-standard '"\er": redraw-current-line'
	bind -m vi-command '"\C-z": emacs-editing-mode'
	bind -m vi-insert '"\C-z": emacs-editing-mode'
	bind -m emacs-standard '"\C-z": vi-editing-mode'

if [ "${BASH_VERSINFO[0]}" -lt 4 ]; then
		# CTRL-T - Paste the selected file path into the command line
		# shellcheck disable=SC2016
		bind -m emacs-standard '"\C-t": " \C-b\C-k \C-u`__sk_select__`\e\C-e\er\C-a\C-y\C-h\C-e\e \C-y\ey\C-x\C-x\C-f"'
		bind -m vi-command '"\C-t": "\C-z\C-t\C-z"'
		bind -m vi-insert '"\C-t": "\C-z\C-t\C-z"'
# CTRL-R - Paste the selected command from history into the command line
		# shellcheck disable=SC2016
		bind -m emacs-standard '"\C-r": "\C-e \C-u\C-y\ey\C-u"$(__sk_history__)"\e\C-e\er"'
		bind -m vi-command '"\C-r": "\C-z\C-r\C-z"'
		bind -m vi-insert '"\C-r": "\C-z\C-r\C-z"'
else
		# CTRL-T - Paste the selected file path into the command line
		bind -m emacs-standard -x '"\C-t": sk-file-widget'
		bind -m vi-command -x '"\C-t": sk-file-widget'
		bind -m vi-insert -x '"\C-t": sk-file-widget'

# CTRL-R - Paste the selected command from history into the command line
		bind -m emacs-standard -x '"\C-r": __sk_history__'
		bind -m vi-command -x '"\C-r": __sk_history__'
		bind -m vi-insert -x '"\C-r": __sk_history__'
	fi
fi
"\C-g": abort
"\C-x\C-g": abort
"\e\C-g": abort
"\C-j": accept-line
"\C-m": accept-line
# alias-expand-line (not bound)
# arrow-key-prefix (not bound)
# backward-byte (not bound)
"\C-b": backward-char
"\eOD": backward-char
"\e[D": backward-char
"\C-h": backward-delete-char
"\C-?": backward-delete-char
"\C-x\C-?": backward-kill-line
"\e\C-h": backward-kill-word
"\e\C-?": backward-kill-word
"\e\e[D": backward-word
"\e[1;3D": backward-word
"\e[1;5D": backward-word
"\e[5D": backward-word
"\eb": backward-word
"\e<": beginning-of-history
"\C-a": beginning-of-line
"\eOH": beginning-of-line
"\e[1~": beginning-of-line
"\e[H": beginning-of-line
"\e[200~": bracketed-paste-begin
"\C-xe": call-last-kbd-macro
"\ec": capitalize-word
"\C-]": character-search
"\e\C-]": character-search-backward
"\e\C-l": clear-display
"\C-l": clear-screen
"\C-i": complete
"\e\e": complete
"\e!": complete-command
"\e/": complete-filename
"\e@": complete-hostname
"\e{": complete-into-braces
"\e~": complete-username
"\e$": complete-variable
# copy-backward-word (not bound)
# copy-forward-word (not bound)
# copy-region-as-kill (not bound)
# dabbrev-expand (not bound)
"\C-d": delete-char
"\e[3~": delete-char
# delete-char-or-list (not bound)
"\e\\": delete-horizontal-space
"\e-": digit-argument
"\e0": digit-argument
"\e1": digit-argument
"\e2": digit-argument
"\e3": digit-argument
"\e4": digit-argument
"\e5": digit-argument
"\e6": digit-argument
"\e7": digit-argument
"\e8": digit-argument
"\e9": digit-argument
"\C-x\C-v": display-shell-version

"\el": downcase-word
# dump-functions (not bound)
# dump-macros (not bound)
# dump-variables (not bound)
"\e\C-i": dynamic-complete-history
"\C-x\C-e": edit-and-execute-command
# emacs-editing-mode (not bound)
"\C-x)": end-kbd-macro
"\e>": end-of-history
"\C-e": end-of-line
"\eOF": end-of-line
"\e[4~": end-of-line
"\e[F": end-of-line
"\C-x\C-x": exchange-point-and-mark
# forward-backward-delete-char (not bound)
# forward-byte (not bound)
"\C-f": forward-char
"\eOC": forward-char
"\e[C": forward-char
"\C-s": forward-search-history
"\e\e[C": forward-word
"\e[1;3C": forward-word
"\e[1;5C": forward-word
"\e[5C": forward-word
"\ef": forward-word
"\eg": glob-complete-word
"\C-x*": glob-expand-word
"\C-xg": glob-list-expansions
# history-and-alias-expand-line (not bound)
"\e^": history-expand-line
# history-search-backward (not bound)
# history-search-forward (not bound)
# history-substring-search-backward (not bound)
# history-substring-search-forward (not bound)
"\e#": insert-comment
"\e*": insert-completions
"\e.": insert-last-argument
"\e_": insert-last-argument
"\C-k": kill-line
# kill-region (not bound)
# kill-whole-line (not bound)
"\e[3;5~": kill-word
"\ed": kill-word
# magic-space (not bound)
# menu-complete (not bound)
# menu-complete-backward (not bound)
"\C-n": next-history
"\eOB": next-history
"\e[B": next-history
# next-screen-line (not bound)
"\en": non-incremental-forward-search-history
# non-incremental-forward-search-history-again (not bound)
"\ep": non-incremental-reverse-search-history
# non-incremental-reverse-search-history-again (not bound)
# old-menu-complete (not bound)
"\C-o": operate-and-get-next
# overwrite-mode (not bound)
"\C-x!": possible-command-completions
"\e=": possible-completions
"\e?": possible-completions
"\C-x/": possible-filename-completions
"\C-x@": possible-hostname-completions
"\C-x~": possible-username-completions
"\C-x$": possible-variable-completions
"\C-p": previous-history
"\eOA": previous-history
"\e[A": previous-history
# previous-screen-line (not bound)
# print-last-kbd-macro (not bound)
"\C-q": quoted-insert
"\C-v": quoted-insert
"\e[2~": quoted-insert
# redraw-current-line (not bound)
"\C-x\C-r": re-read-init-file
"\C-r": reverse-search-history
"\e\C-r": revert-line
" ": self-insert
"!": self-insert
"\"": self-insert
"#": self-insert
"$": self-insert
"%": self-insert
"&": self-insert
"'": self-insert
"(": self-insert
")": self-insert
"*": self-insert
"+": self-insert
",": self-insert
"-": self-insert
".": self-insert
"/": self-insert
"0": self-insert
"1": self-insert
"2": self-insert
"3": self-insert
"4": self-insert
"5": self-insert
"6": self-insert
"7": self-insert
"8": self-insert
"9": self-insert
":": self-insert
";": self-insert
"<": self-insert
"=": self-insert
">": self-insert
"?": self-insert
"@": self-insert
"A": self-insert
"B": self-insert
"C": self-insert
"D": self-insert
"E": self-insert
"F": self-insert
"G": self-insert
"H": self-insert
"I": self-insert
"J": self-insert
"K": self-insert
"L": self-insert
"M": self-insert
"N": self-insert
"O": self-insert
"P": self-insert
"Q": self-insert
"R": self-insert
"S": self-insert
"T": self-insert
"U": self-insert
"V": self-insert
"W": self-insert
"X": self-insert
"Y": self-insert
"Z": self-insert
"[": self-insert
"\\": self-insert
"]": self-insert
"^": self-insert
"_": self-insert
"a": self-insert
"b": self-insert
"c": self-insert
"d": self-insert
"e": self-insert
"f": self-insert
"g": self-insert
"h": self-insert
"i": self-insert
"j": self-insert
"k": self-insert
"l": self-insert
"m": self-insert
"n": self-insert
"o": self-insert
"p": self-insert
"q": self-insert
"r": self-insert
"s": self-insert
"t": self-insert
"u": self-insert
"v": self-insert
"w": self-insert
"x": self-insert
"y": self-insert
"z": self-insert
"{": self-insert
"|": self-insert
"}": self-insert
"~": self-insert
"\200": self-insert
"\201": self-insert
"\202": self-insert
"\203": self-insert
"\204": self-insert
"\205": self-insert
"\206": self-insert
"\207": self-insert
"\210": self-insert
"\211": self-insert
"\212": self-insert
"\213": self-insert
"\214": self-insert
"\215": self-insert
"\216": self-insert
"\217": self-insert
"\220": self-insert
"\221": self-insert
"\222": self-insert
"\223": self-insert
"\224": self-insert
"\225": self-insert
"\226": self-insert
"\227": self-insert
"\230": self-insert
"\231": self-insert
"\232": self-insert
"\233": self-insert
"\234": self-insert
"\235": self-insert
"\236": self-insert
"\237": self-insert
" ": self-insert
"¡": self-insert
"¢": self-insert
"£": self-insert
"¤": self-insert
"¥": self-insert
"¦": self-insert
"§": self-insert
"¨": self-insert
"©": self-insert
"ª": self-insert
"«": self-insert
"¬": self-insert
"­": self-insert
"®": self-insert
"¯": self-insert
"°": self-insert
"±": self-insert
"²": self-insert
"³": self-insert
"´": self-insert
"µ": self-insert
"¶": self-insert
"·": self-insert
"¸": self-insert
"¹": self-insert
"º": self-insert
"»": self-insert
"¼": self-insert
"½": self-insert
"¾": self-insert
"¿": self-insert
"À": self-insert
"Á": self-insert
"Â": self-insert
"Ã": self-insert
"Ä": self-insert
"Å": self-insert
"Æ": self-insert
"Ç": self-insert
"È": self-insert
"É": self-insert
"Ê": self-insert
"Ë": self-insert
"Ì": self-insert
"Í": self-insert
"Î": self-insert
"Ï": self-insert
"Ð": self-insert
"Ñ": self-insert
"Ò": self-insert
"Ó": self-insert
"Ô": self-insert
"Õ": self-insert
"Ö": self-insert
"×": self-insert
"Ø": self-insert
"Ù": self-insert
"Ú": self-insert
"Û": self-insert
"Ü": self-insert
"Ý": self-insert
"Þ": self-insert
"ß": self-insert
"à": self-insert
"á": self-insert
"â": self-insert
"ã": self-insert
"ä": self-insert
"å": self-insert
"æ": self-insert
"ç": self-insert
"è": self-insert
"é": self-insert
"ê": self-insert
"ë": self-insert
"ì": self-insert
"í": self-insert
"î": self-insert
"ï": self-insert
"ð": self-insert
"ñ": self-insert
"ò": self-insert
"ó": self-insert
"ô": self-insert
"õ": self-insert
"ö": self-insert
"÷": self-insert
"ø": self-insert
"ù": self-insert
"ú": self-insert
"û": self-insert
"ü": self-insert
"ý": self-insert
"þ": self-insert
"ÿ": self-insert
"\C-@": set-mark
"\e ": set-mark
# shell-backward-kill-word (not bound)
"\e\C-b": shell-backward-word
"\e\C-e": shell-expand-line
"\e\C-f": shell-forward-word
"\e\C-d": shell-kill-word
"\e\C-t": shell-transpose-words
# skip-csi-sequence (not bound)
"\C-x(": start-kbd-macro
# tab-insert (not bound)
"\e&": tilde-expand
"\C-t": transpose-chars
"\et": transpose-words
# tty-status (not bound)
"\C-x\C-u": undo
"\C-_": undo
# universal-argument (not bound)
# unix-filename-rubout (not bound)
"\C-u": unix-line-discard
"\C-w": unix-word-rubout
"\eu": upcase-word
# vi-append-eol (not bound)
# vi-append-mode (not bound)
# vi-arg-digit (not bound)
# vi-back-to-indent (not bound)
# vi-backward-bigword (not bound)
# vi-backward-word (not bound)
# vi-bword (not bound)
# vi-bWord (not bound)
# vi-change-case (not bound)
# vi-change-char (not bound)
# vi-change-to (not bound)
# vi-char-search (not bound)
# vi-column (not bound)
# vi-complete (not bound)
# vi-delete (not bound)
# vi-delete-to (not bound)
# vi-editing-mode (not bound)
# vi-end-bigword (not bound)
# vi-end-word (not bound)
# vi-eof-maybe (not bound)
# vi-eword (not bound)
# vi-eWord (not bound)
# vi-fetch-history (not bound)
# vi-first-print (not bound)
# vi-forward-bigword (not bound)
# vi-forward-word (not bound)
# vi-fword (not bound)
# vi-fWord (not bound)
# vi-goto-mark (not bound)
# vi-insert-beg (not bound)
# vi-insertion-mode (not bound)
# vi-match (not bound)
# vi-movement-mode (not bound)
# vi-next-word (not bound)
# vi-overstrike (not bound)
# vi-overstrike-delete (not bound)
# vi-prev-word (not bound)
# vi-put (not bound)
# vi-redo (not bound)
# vi-replace (not bound)
# vi-rubout (not bound)
# vi-search (not bound)
# vi-search-again (not bound)
# vi-set-mark (not bound)
# vi-subst (not bound)
# vi-tilde-expand (not bound)
# vi-unix-word-rubout (not bound)
# vi-yank-arg (not bound)
# vi-yank-pop (not bound)
# vi-yank-to (not bound)
"\C-y": yank
"\e.": yank-last-arg
"\e_": yank-last-arg
"\e\C-y": yank-nth-arg
"\ey": yank-pop
