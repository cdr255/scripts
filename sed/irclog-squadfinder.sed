# Double Space
/^$/d;G
# Headers
s/\*\*\*\* /#### /g
# Actions
s/ \*\t\([a-z]*\) / \*\t\*\*\1\*\*\{: .irc-\L\1\} /g
# Date
s/\(^[a-z]\{3\}.[0-9]\{2\}.[0-9:]\{8\}\)/*\1*\{: \.irc-date\}/g
# GameServ
s/<\(GameServ\)>\t\(.*\)\n/**\1**\{: .irc-gameserv\}\t*\2*\{: .irc-roll\}\n/g
# Names
s/<\([a-z0-9]*\)>/**\1**\{: .irc-\L\1\}/g
# Now is not a player
s/\*\*Now\*\*{: .irc-now}/Now/g
# Fancy Action Arrow
s/ \*\t/ **↠**{: .irc-arrow}\t/g
