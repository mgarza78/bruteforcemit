
$i = 0

$username1 = "USERNAME"
$password1 = "PASSWORD"
$secstr1 = New-Object -TypeName System.Security.SecureString
$password1.ToCharArray() | ForEach-Object {$secstr1.AppendChar($_)}
$cred1 = new-object -typename System.Management.Automation.PSCredential -argumentlist $username1, $secstr1
New-PSDrive -Name Y -Root "TO YOUR DAG SERVER PATH" -PSProvider FileSystem -Credential $cred1


while ($i -le 4)


{

Try
{

Invoke-RestMethod https://YOUDAGSERVER/dag


}
Catch {



Out-File Y:\down.txt



}


$i++

sleep 65

}