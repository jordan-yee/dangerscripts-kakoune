# TODO: accept arguments or create argument-accepting version of the command?

# Not sure if this is the right hook to use:
hook global WinSetOption filetype=sh %{
    define-command exec-script-in-split \
    -docstring "Execute open shell script in a split" %{
        evaluate-commands %sh{
            smart_split () {
                # This adjustment may be dependent on font.
                ADJUSTED_HEIGHT=`expr $kak_window_height \* 2`
                if [ $ADJUSTED_HEIGHT -ge $kak_window_width ] ; then
                    	echo "tmux-terminal-vertical sh $1"
                	else
                    	echo "tmux-terminal-horizontal sh $1"
            	fi
            }

            smart_split $kak_buffile
            
         #    ADJUSTED_HEIGHT=`expr $kak_window_height \* 2`
         #    if [ $ADJUSTED_HEIGHT -ge $kak_window_width ] ; then
         #        	echo 'tmux-terminal-vertical sh %val{buffile}'
         #    	else
         #        	echo 'tmux-terminal-horizontal sh %val{buffile}'
        	# fi
        }
    }

    # NOTE: Executed script will immediately close after running unless held open by read
    #       - Would it be possible to add a hold-open option?
    map global user e ': exec-script-in-split<ret>' \
    	-docstring "Execute open shell script in a split"
}
