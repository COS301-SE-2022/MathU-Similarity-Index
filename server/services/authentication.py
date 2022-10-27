# Access Levels:
# 0: Public Functions, 1: Website Default, 2: Website logedin, 3: Admin
# 0: Permanent Key, 1: default Key, 2: Logedin Key, 3: Admin Key

from cgitb import reset
from datetime import datetime
from app import GLOBAL_SERVER_CONFIG_AUTO_CACHE, GLOBAL_SERVER_DATA


class APIKey():
    def __init__(self, key, accesslevel: int, useremail, max_uses: int, expiration: datetime, min_interval: int, is_perm: bool, uses_reset_interval: int = -1):
        self.key = key
        self.accesslevel = accesslevel
        self.useremail = useremail
        self.max_uses = max_uses
        self.uses = 0
        self.expiration = expiration
        self.min_interval = min_interval # seconds
        self.is_perm = is_perm
        self.created = datetime.now()
        self.last_used = datetime.now()

        if uses_reset_interval == -1:
            self.uses_reset = False
        else:
            self.uses_reset = True
            self.uses_reset_interval = uses_reset_interval
            self.uses_reset_last = datetime.now()
            self.uses_reset_next = datetime.now() + datetime.timedelta(seconds=uses_reset_interval)

    
    def use(self):
        if self.expiration >= datetime.now() or self.is_perm:
            if self.max_uses > 0: # limited uses
                # check if reset
                has_been_reset = self.reset_uses()

                if self.uses < self.max_uses:
                    self.uses += 1
                    return True
                else:
                    return False
            elif self.max_uses == -1: #infinite uses
                return True
        else:
            return False

    def reset_uses(self):
        if self.uses_reset:
            if self.uses_reset_last + datetime.timedelta(seconds=self.uses_reset_interval) >= datetime.now():
                self.uses_reset_last = datetime.now()
                self.uses_reset_next = datetime.now() + datetime.timedelta(seconds=self.uses_reset_interval)
                self.uses = 0
                return True
            else:
                return False
        else:
            return False

    def is_valid(self):
        if self.expiration >= datetime.now() or self.is_perm:
            if self.uses_reset or self.max_uses == -1:
                return True # infinite uses
            else:
                if self.uses < self.max_uses:
                    return True # limited uses - not used up
                else:
                    return False # limited uses - used up
        else:
            return False # expired and not perm

    def get_uses(self):
        return self.uses
    
    def get_key(self):
        return self.key

    def get_accesslevel(self):
        return self.accesslevel

    def check_access_level(self, accesslevels = [0]):
        has_access = False
        for access in accesslevels:
            if self.accesslevel == access:
                has_access = True
                break
        return has_access
    
# usage: check if key is valid, if so, use it, if not deny access

def authenticate(useremail: str, apikey: str, accesslevels = [0,1,2,3]):
    # check if user is logged in
    if useremail in GLOBAL_SERVER_DATA["users"]:
        # check if user has a key
        if apikey in GLOBAL_SERVER_DATA["users"][useremail]["apikeys"]:
            # check if key is valid
            if GLOBAL_SERVER_DATA["users"][useremail]["apikeys"][apikey].is_valid():
                # check if key has access
                if GLOBAL_SERVER_DATA["users"][useremail]["apikeys"][apikey].check_access_level(accesslevels):
                    # use key
                    return GLOBAL_SERVER_DATA["users"][useremail]["apikeys"][apikey].use()
                else:
                    return False
            else:
                return False
        else:
            return False