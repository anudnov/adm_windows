wmic qfe list full /format:table | findstr /i "xxxxx"
##
  #Or Export to HTML file, using this syntax:
##
wmic qfe list full /format:htable >C:\temp\updateslist.htm
