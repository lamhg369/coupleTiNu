<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ứng dụng cho Cặp đôi Yêu nhau</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffe6e6;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(255, 0, 0, 0.1);
        }
        h1 {
            color: #ff4d4d;
            text-align: center;
        }
        #canvas {
            border: 2px solid #ff4d4d;
            display: block;
            margin: 20px auto;
        }
        #chat {
            height: 300px;
            border: 1px solid #ccc;
            overflow-y: scroll;
            padding: 10px;
            margin-bottom: 10px;
        }
        #message {
            width: calc(100% - 70px);
            padding: 5px;
        }
        button {
            background-color: #ff4d4d;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Ứng dụng Yêu thương</h1>
        <canvas id="canvas" width="400" height="300"></canvas>
        <div>
            <button onclick="clearCanvas()">Xóa vẽ</button>
        </div>
        <div id="chat"></div>
        <input type="text" id="message" placeholder="Nhập tin nhắn...">
        <button onclick="sendMessage()">Gửi</button>
    </div>

    <script>
        const canvas = document.getElementById('canvas');
        const ctx = canvas.getContext('2d');
        let isDrawing = false;

        canvas.addEventListener('mousedown', startDrawing);
        canvas.addEventListener('mousemove', draw);
        canvas.addEventListener('mouseup', stopDrawing);

        function startDrawing(e) {
            isDrawing = true;
            draw(e);
        }

        function draw(e) {
            if (!isDrawing) return;
            ctx.lineWidth = 2;
            ctx.lineCap = 'round';
            ctx.strokeStyle = '#ff4d4d';

            ctx.lineTo(e.clientX - canvas.offsetLeft, e.clientY - canvas.offsetTop);
            ctx.stroke();
            ctx.beginPath();
            ctx.moveTo(e.clientX - canvas.offsetLeft, e.clientY - canvas.offsetTop);
        }

        function stopDrawing() {
            isDrawing = false;
            ctx.beginPath();
        }

        function clearCanvas() {
            ctx.clearRect(0, 0, canvas.width, canvas.height);
        }

        function sendMessage() {
            const messageInput = document.getElementById('message');
            const chatDiv = document.getElementById('chat');
            if (messageInput.value.trim() !== '') {
                chatDiv.innerHTML += `<p><strong>Bạn:</strong> ${messageInput.value}</p>`;
                messageInput.value = '';
                chatDiv.scrollTop = chatDiv.scrollHeight;
            }
        }
    </script>
</body>
</html>
