how to connect by ssh : ssh alpaca@kaistuser.iptime.org / pw : alpaca
	root user pw : alpaca
	if it does not work, use port 22

ALPACA Ubuntu local MySQL
	alpaca / alpaca

how to connect by VSCode
1. Install ftp-simple
2. f1 & click ftp-simple : Config - FTP connection setting
3. change as the following
[

	{
		"name": "alpaca",
		"host": "kaistuser.iptime.org",
		"port": 22,
		"type": "sftp",
		"username": "alpaca",
		"password": "alpaca",
		"path": "/",
		"autosave": true,
		"confirm": false
	}
]
4. f1 & click ftp-simple : Remote directory open to workspace