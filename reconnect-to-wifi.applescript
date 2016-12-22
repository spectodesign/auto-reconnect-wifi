-- will re-connect a OSX server back to the specified WiFi network after a router reboot
-- tested on OSX 10.11

log "starting " & (date string of (current date)) & " " & (time string of (current date))

set wifiNetwork to "your own network name"
set networkInterface to "your own wifi network interface" -- e.g. en1
set wifiPassword to "your own password"
set sleepTimeInSeconds to 30 * 60 -- =30 mins


repeat
	log "waking up"
	set currentSelectedWifiNetwork to do shell script "networksetup -getairportnetwork " & networkInterface
	log currentSelectedWifiNetwork
	if (currentSelectedWifiNetwork does not contain wifiNetwork) then
		log "attempting to select wifi network " & (date string of (current date)) & " " & (time string of (current date))
		do shell script "networksetup -setairportnetwork " & "'" & networkInterface & "'" & " " & "'" & wifiNetwork & "'" & " " & "'" & wifiPassword & "'"
	end if
	delay sleepTimeInSeconds
end repeat
