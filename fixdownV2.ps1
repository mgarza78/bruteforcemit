
$i = 0

While ($i -lt 8)
{

$downpath = 'C:\PowerShell Repo\down.txt'



if(Test-Path $downpath)

{


$foldlist = Get-ChildItem -Directory C:\backup\lastbak

$foldlist.FullName | Out-File C:\backup\dirlist.csv






foreach ($folder in Get-content C:\backup\dirlist.csv ) 
{

$foldersize = Get-ChildItem $folder -Recurse | Measure-Object -Property length -sum
$foldersize = $foldersize.sum /1gb

$foldersize



If ($foldersize -eq 0) {Remove-Item $folder -Force -Recurse  }


else {$fil = "\applicationHost.config"

    $filename ="C:\Windows\System32\inetsrv\config\applicationHost.config"
    $fold = Get-ChildItem C:\backup\lastbak | ? { $_.PSIsContainer } | sort CreationTime -Descending | select -f 1
    $fold2 = $fold.FullName + $fil
   
  # Copy-Item 'C:\backup\applicationhost.config' $filename -Force
    Copy-Item $fold2 $filename -Force 


    sleep 2
   # Send-MailMessage -To yourdistro@blah.com -From noreply@blah.com -Subject "Proxy Fixed" -Body "Verify IIS " -BodyAsHtml   -SmtpServer smtp.yours.com

    Remove-Item $downpath


      }


}








iisreset

  

    
}
  $i ++
sleep 30
write-host $i
}







