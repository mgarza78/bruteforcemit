$fil = "\applicationHost.config"

    $filename ="C:\Windows\System32\inetsrv\config\applicationHost.config"
    $fold = Get-ChildItem C:\backup\lastbak | ? { $_.PSIsContainer } | sort CreationTime -Descending | select -f 1
    $fold2 = $fold.FullName + $fil
   
  # Copy-Item 'C:\backup\applicationhost.config' $filename -Force
    Copy-Item $fold2 $filename -Force 


    sleep 2
   # Send-MailMessage -To mismailbox@ena.com -From MISBOT@ena.com -Subject "Proxy Fixed" -Body "Verify IIS " -BodyAsHtml   -SmtpServer smtp.corp.ena.net

