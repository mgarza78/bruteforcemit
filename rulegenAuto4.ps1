
$outpath = 'C:\PowerShell Repo\output.csv'

#$da = (get-date).hour
$da = get-date


$pth = "C:\backup\lastbak\"

$fil = "\applicationHost.config"

#$fullp = $pth + $da + $fil 
$fullp = $pth + $da.DayOfWeek + $da.Hour + $da.Minute


if (Test-Path $outpath)

{

$filename ="C:\Windows\System32\inetsrv\config\applicationHost.config"
#Copy-Item -Path $filename -Destination 'C:\backup\lastbak\applicationHost.config' 
$f = New-Item $fullp -ItemType Directory -Force


Copy-Item $filename $f.FullName

$blah = Get-Content -Path 'C:\PowerShell Repo\output.csv' 
$count = $blah.Count - 1
#$stuff = Get-Content  'C:\PowerShell Repo\rules.csv'

# Remember -lt was the limiter. Trying -le which should be the correct operator. But for some reason caused problems early. 
For ($i=0 ;$i -lt $count ; $i++) 

{

$blah1 = $blah[$i] -split ' '




$ip = $blah1[0]
$CC = $blah1[1]

$ip
$CC


$mill =  (Get-Date).second

$date = Get-Date -Format g




Try {

#Most recent and running backups of config


if (Select-String -Path $filename -Pattern $ip)

{

     $ip | out-file 'C:\PowerShell Repo\exists.txt' -Append

    sleep 1

    }

    else{ 
Copy-Item $filename -Destination "C:\backup\applicationhost.config" -Recurse -force
Get-Content $filename | add-Content -path "C:\backup\running.txt"


(Get-Content $fileName) | 
    Foreach-Object {
        $_ # send the current line to output
        if ($_ -match "##############ADDNEW RULE") 
        {
            #Add Lines after the selected pattern 
            "
             <rule name=""$CC $date $mill"" patternSyntax=""Wildcard"" stopProcessing=""true"" lockItem=""false"">
                    <match url=""*"" />
                    <conditions>
                        <add input=""{HTTP_X_MS_FORWARDED_CLIENT_IP}"" matchType=""Pattern"" pattern=""$ip"" ignoreCase=""true"" negate=""false"" />
                    </conditions>
                    <action type=""CustomResponse"" statusCode=""403"" statusReason=""Forbidden: Access is denied."" statusDescription=""You do not have permission to view this directory or page using the credentials that you supplied."" />
                </rule>"
             
	# sleep 3
        }
        }  | Set-Content $filename
    sleep 1
    }
    }

    catch { "I WET THE BED!" | Out-File 'c:\text.txt'

    $fold = Get-ChildItem C:\backup\lastbak | ? { $_.PSIsContainer } | sort CreationTime -desc | select -f 1
    $fold2 = $fold.FullName + $fil
   
  # Copy-Item 'C:\backup\applicationhost.config' $filename -Force
    Copy-Item $fold2 $filename -Force  

   
     }


   # $ip, $CC | Out-File 'C:\PowerShell Repo\created.txt' -Append

    


 
 }
Remove-Item $outpath
 }






 
