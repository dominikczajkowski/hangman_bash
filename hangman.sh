#!/usr/bin/env bash

select i in easy hard;
do
    case ${i} in
        easy)
        LN=`wc -l ~/easy.txt | cut -d ' ' -f1`
        BASE=`sed -n "$(( (RANDOM % LN) + 1 ))p" ~/easy.txt`

#        echo $[${BASE} != PT]
        ;;
        hard)
        echo hard
        LN=`wc -l ~/hard.txt | cut -d ' ' -f1`
        BASE=`sed -n "$(( (RANDOM % LN) + 1 ))p" ~/hard.txt`
#        echo ${LN}

#        echo ${BASE}
        ;;
    esac
    break
done

        PT=`echo ${BASE//?/_}`
        echo ${#BASE}
        echo ${#PT}
        ERR=0
        PT2=${PT}
        PT3=${PT}
        while [ "${BASE}" != "${PT2}" ]
        do
            read IN
            INADD="${INADD}"+"${IN}"+"_"
            for i in {0.."${#BASE}"}; do
                PT2=`echo ${BASE} | sed "s/"[^${INADD}]"/_/g"`

#                if [ ${i} > 0 ]
#                then
                    if [ "${PT2}" == "${PT3}" ]
                    then
                        (( ERR++ ))
                    fi
#                fi
                PT3="${PT2}"
            done
            echo ${PT2}
            echo ${ERR}
            if [ ${ERR} == 1 ] ; then
				echo "  "
				echo "  "
				echo "  "
				echo "  "
				echo "  "
				echo "/|\\"
			elif [ ${ERR} == 2 ] ; then
				echo " |"
				echo " |"
				echo " |"
				echo " |"
				echo "/|\\"
			elif [ ${ERR} == 3 ] ; then
				echo " ____"
				echo " |"
				echo " |"
				echo " |"
				echo " |"
				echo "/|\\"
			elif [ ${ERR} == 4 ] ; then
				echo " ____"
				echo " |/"
				echo " |"
				echo " |"
				echo " |"
				echo "/|\\"
			elif [ ${ERR} == 5 ]
			then
				echo " ____"
				echo " |/ |"
				echo " |"
				echo " |"
				echo " |"
				echo "/|\\"
			elif [ ${ERR} == 6 ] ; then
				echo " ____"
				echo " |/ |"
				echo " |  O"
				echo " | /|\\"
				echo " | / \\"
				echo "/|\\"
			fi
			if [ ${ERR} == 6 ] ; then
 				echo przegrałeś
 				break
 			fi

        done
        if [ ${ERR} != 6 ] ; then
            echo wygrałeś
        fi