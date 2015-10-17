#!/usr/bin/zsh

if [ "$PAM_TYPE" = "open_session" ]; then
    #`tail /var/log/auth.log` | pb
    if [ -e /home/squinn/.trusted_ips ];then
        if grep -Fxq "$PAM_RHOST" /home/squinn/.trusted_ips
        then
            return 0
        fi
    fi
    echo "User $PAM_USER just logged in from $PAM_RHOST" | pb > /dev/null
fi

return 0
