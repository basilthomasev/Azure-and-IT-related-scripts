##Send email functionality from below line, use it if you want    
$smtpServer = "yoursmtpserver.com" 
$smtpFrom = "fromemailaddress@test.com" 
$smtpTo = "receipentaddress@test.com" 
$messageSubject = "Subject " 
$message = New-Object System.Net.Mail.MailMessage $smtpfrom, $smtpto 
$message.Subject = $messageSubject 
$message.IsBodyHTML = $true 
$message.Body = "<head><pre>$style</pre></head>" 
$message.Body += Get-Content C:\scripts\test.htm 
$smtp = New-Object Net.Mail.SmtpClient($smtpServer) 
$smtp.Send($message)