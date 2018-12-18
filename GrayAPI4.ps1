Set-ExecutionPolicy Bypass -Force

#$cred = Get-Credential admin 

$username = "Your USERNAME"
$password = "PASSWORDS"
$secstr = New-Object -TypeName System.Security.SecureString
$password.ToCharArray() | ForEach-Object {$secstr.AppendChar($_)}
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $username, $secstr


$username1 = "SERVER TARGET UN"
$password1 = "PASSWORD"
$secstr1 = New-Object -TypeName System.Security.SecureString
$password1.ToCharArray() | ForEach-Object {$secstr1.AppendChar($_)}
$cred1 = new-object -typename System.Management.Automation.PSCredential -argumentlist $username1, $secstr1


New-PSDrive -Name Y -Root "YOURSERVER_TARGET_PATH" -PSProvider FileSystem -Credential $cred1

$i = 0
#$j = 2
cls

For ($j= 2; $j -le 36 ; $j++ ) {


$blah = Invoke-RestMethod -uri  YOURGRAYLOGAPIURL -Method Get -Credential $cred

$val =  $blah.result.terms

$val | Out-File "c:\file.csv"
$val1 = Get-Content -Path "c:\file.csv"

$val2 = $val1[$i,$j]
$val3 = $val2 -split ' '
$val4 = $val2 -split ' '

$ip = $val3[1]


For ($a=2 ; $a -lt 10 ; $a++ ) {

$ISUS = $val3[$a]
If ($ISUS -eq 'RU' -or $ISUS -eq 'CN' -or $ISUS -eq 'EG' -or $ISUS -eq 'PH' -or $ISUS -eq 'FR' -or $ISUS -eq 'BR' -or $ISUS -eq 'PL' -or $ISUS -eq 'IN' -or $ISUS -eq 'KR'   -or $ISUS -eq 'BS' -or $ISUS -eq 'GB' -or $ISUS -eq 'IS' -or $ISUS -eq 'IT' -or $ISUS -eq 'NL' -or $ISUS -eq 'SG' -or $ISUS -eq 'ID' -or $ISUS -eq 'LA' -or $ISUS -eq 'TW' -or $ISUS -eq 'CZ' -or $ISUS -eq 'VN' -or $ISUS -eq 'UA' -or $ISUS -eq 'AR' -or $ISUS -eq 'JP' -or $ISUS -eq 'TH' -or $ISUS -eq 'MD'  -or $ISUS -eq 'CA'  -or $ISUS -eq 'CO'  -or $ISUS -eq 'GH'  -or $ISUS -eq 'TN' -or $ISUS -eq 'CL' -or $ISUS -eq 'IE' -or $ISUS -eq 'SK'  )

{

For ($z=7 ; $z -lt 20 ; $z++ )


{
$count = $val4[$z]
$intg = [int]$count 
#[int]$intg = [convert]::ToInt32($count,10)


If ($intg -ge 1)
{



$ip

Write-Host "Country Code:$ISUS"
Write-Host "Count is:$count"


Write-Host "

"
$both = -join($val4[1] +" "+ $ISUS)








$both | Out-File Y:\output.csv -Append



}

}
}

}
}
