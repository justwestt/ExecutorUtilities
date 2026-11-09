local hwid = (gethwid and gethwid()) 
    or (getexecutorhwid and getexecutorhwid()) 
    or (get_hwid and get_hwid()) 
    or (GetHWID and GetHWID())

return hwid or false
