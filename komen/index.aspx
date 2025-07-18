<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System.IO" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>New comment box</title>
<style type="text/css">
*,body {
font-family: Arial, sans-serif;
margin: 0;
padding: 0;
}
.container {
max-width: 800px;
margin: 0 auto;
padding: 20px;
}
.message {
padding: 15px;
margin-bottom: 20px;
border: 1px solid #ddd;
border-radius: 4px;
background-color: #f9f9f9;
}
.success {
border-color: #4CAF50;
background-color: #e8f5e9;
}
.error {
border-color: #f44336;
background-color: #ffebee;
}
textarea {
min-width: 90vw;
min-height: 150px;
margin: 0 auto;
padding: 20px;
}
p{
color: #4CAF50;
display: block;
text-align: center;
padding:5px;
}
button{
padding: 5px 10px;
margin-bottom: 5px;
border: 1px solid #ddd;
border-radius: 4px;
background-color: green;
}
</style>
</head>
<body>
<p>Comment box berhasil di buat.
silah kan copy kode di atas dan paste,
di paling bawah postingan blog sobat.
jangan lupa tinggal kan komentar.
supaya data komentar id sobat tetap kita jaga. ok</p>
<br/><br/>
<iframe src='./1' style='width:100vw;height:100vh;border:none;'></iframe>
<div class="container">
<script runat="server">
protected void Page_Load(object sender, EventArgs e)
{
string sourceFilePath = Server.MapPath("komen.txt");
string baseDirectory = Server.MapPath("./");
string targetDirectory = Path.Combine(baseDirectory, "a");
string targetFilePath;
string message = "";
string cssClass = "";
// Cari folder yang tersedia
if (!Directory.Exists(targetDirectory))
{
Directory.CreateDirectory(targetDirectory);
}
else
{
int folderNumber = 1;
do {
targetDirectory = Path.Combine(baseDirectory, "a" + folderNumber.ToString());
folderNumber++;
} while (Directory.Exists(targetDirectory));
Directory.CreateDirectory(targetDirectory);
}
// Set path file tujuan
targetFilePath = Path.Combine(targetDirectory, "index.aspx");
// Salin file
if (File.Exists(sourceFilePath))
{
try {
File.Copy(sourceFilePath, targetFilePath, true);
string folderName = Path.GetFileName(targetDirectory);
message = "Comment Box Id: #" + folderName + " <button onclick='copyToClipboard()'>Select</button> <br/><textarea><iframe src='https://src.runasp.net/komen/" + folderName + "' style='width:100vw;height:100vh;border:none;'></iframe></textarea>";
cssClass = "success";
}
catch (Exception ex) {
message = "Error: " + ex.Message;
cssClass = "error";
}
}
else
{
message = "File sumber tidak ditemukan";
cssClass = "error";
}
// Tampilkan pesan
Response.Write("<div class='message " + cssClass + "'>" + message + "</div>");
}
</script>
<script>
function copyToClipboard() {
const textarea = document.querySelector("textarea");
textarea.select();
document.execCommand('copy');
}
</script>
</div>
</body>
</html>