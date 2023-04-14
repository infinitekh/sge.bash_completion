_qconf()
{
 local cur prev opts;
 _get_comp_words_by_ref cur prev;
#prev2="${COMP_WORDS[COMP_CWORD-2]}"
 helpopts="-aattr -Aattr -acal -Acal -ackpt -Ackpt -aconf -Aconf -ae -Ae -ah -ahgrp -Ahgrp -arqs -Arqs -am -ao -ap -Ap -aprj -Aprj -aq -Aq -as -astnode -astree -Astree -at -au -Au -auser -Auser -clearusage -cq -dattr -Dattr -dcal -dckpt -dconf -de -dh -dhgrp -drqs -dm -do -dp -dprj -dq -ds -dstnode -dstree -du -dul -duser -help -ke -k -kec -kt -mattr -Mattr -mc -mckpt -Mc -mcal -Mcal -Mckpt -mconf -Mconf -me -Me -mhgrp -Mhgrp -mrqs -Mrqs -mp -Mp -mprj -Mprj -mq -Mq -msconf -Msconf -mstnode -Mstree -mstree -mu -Mu -muser -Muser -purge -rattr -Rattr -sc -scal -scall -sckpt -sckptl -sconf -sconfl -se -secl -sel -sep -sh -shgrp -shgrp_tree -shgrp_resolved -shgrpl -sds -srqs -srqsl -sm -so -sobjl -sp -spl -sprj -sprjl -sq -sql -ss -sss -ssconf -sstnode -rsstnode -sst -sstree -su -suser -sul -suserl -tsm"
modified="-mattr    -mcal     -mconf    -mhgrp    -mprj     -mrqs     -mstnode  -mu       
-mc       -mckpt    -me       -mp       -mq       -msconf   -mstree   -muser"
modified_file="-Mattr    -Mcal     -Mconf    -Mhgrp    -Mprj     -Mrqs     -Mstnode  -Mu       
-Mc       -Mckpt    -Me       -Mp       -Mq       -Msconf   -Mstree   -Muser"
##  if [[ "${prev}" == -m* ]] 
   ##then 
 case "${prev}" in 
   "-Mattr"|"-Mcal"|"-Mconf"|"-Mhgrp"|"-Mprj"|"-Mrqs"|"-Mstnode"|"-Mu"|"-Mc"|"-Mckpt"|"-Me"|"-Mp"|"-Mq"|"-Msconf"|"-Mstree"|"-Muser")
     COMPREPLY=( $( compgen -f  -- ${cur} ) );
     return;
     ;;
    "-me"|"-de"|"-se")
     ret=( $( qconf -sel ) )
     COMPREPLY=(  $( compgen -W "$(echo ${ret[@]})" -- ${cur} ) );
    return ;
    ;;
    "-mhgrp"|"-dhgrp"|"-shgrp")
     ret=( $( qconf -shgrpl ) )
     COMPREPLY=(  $( compgen -W "$(echo ${ret[@]})" -- ${cur} ) );
    return ;
    ;;
    "-mp"|"-dp"|"-sp")
     ret=( $( qconf -spl ) )
     COMPREPLY=(  $( compgen -W "$(echo ${ret[@]})" -- ${cur} ) );
    return ;
    ;;
    "-mq"|"-dq"|"-sq")
     ret=( $( qconf -sql ) )
     COMPREPLY=(  $( compgen -W "$(echo ${ret[@]})" -- ${cur} ) );
    return ;
    ;;

    esac
     ##fi
     COMPREPLY=(  $( compgen -W "${helpopts}" -- ${cur} ) );

} 
complete -F _qconf qconf
