<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Real-Time Clock</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<div id="clock-container">
    <div id="clock"></div>
</div>

<!-- JavaScript Code -->
<script>
    function updateClock() {
        // Fetch current time from the servlet
        fetch('time')
            .then(response => response.json())
            .then(data => {
                // Update the clock element with the fetched time
                document.getElementById('clock').innerText = formatTime(data.currentTime);
            })
            .catch(error => console.error('Error fetching time:', error));
    }

    // Function to format the time string (optional)
    function formatTime(dateTimeString) {
        const date = new Date(dateTimeString);
        return date.toLocaleString('en-US', {
            year: 'numeric',
            month: '2-digit',
            day: '2-digit',
            hour: '2-digit',
            minute: '2-digit',
            second: '2-digit',
            hour12: true
        });
    }

    // Call updateClock every second
    setInterval(updateClock, 1000);
</script>
</body>
</html>
