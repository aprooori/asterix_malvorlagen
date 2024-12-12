<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Asterix Malvorlagen</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f7f9fc;
            margin: 0;
            padding: 0;
        }
        h1 {
            margin: 0;
            padding: 20px;
            color: white;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
        }
        .header {
            background-color: orange;
            padding: 10px 0;
            width: 100%;
        }
        .footer {
            background-color: orange;
            padding: 10px 0;
            position: fixed;
            width: 100%;
            bottom: 0;
            color: white;
        }
        .gallery {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 15px;
            margin: 20px auto;
            max-width: 800px;
        }
        .gallery button {
            border: none;
            background: none;
            cursor: pointer;
        }
        .gallery button img {
            width: 150px; /* Einheitliche Breite */
            height: 200px; /* Einheitliche Höhe */
            object-fit: cover; /* Stellt sicher, dass das Bild skaliert wird, ohne die Proportionen zu verzerren */
            transition: transform 0.2s;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .gallery button img:hover {
            transform: scale(1.1);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }
        .templates {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 15px;
            margin: 20px auto;
            max-width: 800px;
        }
        .back-button {
            display: inline-block;
            width: 100px; /* Feste Breite */
            height: 20px; /* Feste Höhe */
            margin: 20px auto;
            padding: 5px; /* Innenabstand (Padding) für Text */
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 10px; /* Abrundung der Ecken */
            cursor: pointer;
            text-align: center; /* Text zentrieren */
            line-height: 20px; /* Text vertikal zentrieren */
            font-size: 14px;
            text-decoration: none;
            transition: transform 0.2s ease, background-color 0.2s ease; /* Hinzugefügte Übergänge */
        }

        .back-button:hover {
            background-color: #0056b3;
            transform: scale(1.1); /* Vergrößerung des Buttons bei Hover */
        }

        .background-image {
            background-image: url('file:///C:/Users/arifm/Downloads/Asterix/asterix-obelix-heroes-119139.jpg'); /* Hintergrundbild */
            background-size: cover; /* Das Bild wird so skaliert, dass es den gesamten Bildschirm abdeckt */
            background-position: center center; /* Bild wird zentriert */
            background-attachment: fixed; /* Bild bleibt fixiert beim Scrollen */
        }
    </style>
</head>
<body class="background-image">
    <!-- Orange Header mit Titel -->
    <div class="header">
        <h1>Asterix Malvorlagen</h1>
    </div>

    <div class="gallery" id="mainMenu">
        <button onclick="showImages('asterix')">
            <img src="file:///C:/Users/arifm/Downloads/Asterix/asterix-button.png" alt="Asterix">
        </button>
        <button onclick="showImages('obelix')">
            <img src="file:///C:/Users/arifm/Downloads/Asterix/obelix-button.jpg" alt="Obelix">
        </button>
        <button onclick="showImages('idefix')">
            <img src="file:///C:/Users/arifm/Downloads/Asterix/idefix-button.jpg" alt="Idefix">
        </button>        
    </div>
    <div class="templates" id="images" style="display: none;"></div>
    <a href="#" class="back-button" id="backButton" style="display: none;" onclick="goBack()">Zurück</a>

    <!-- Footer mit Hinweis -->
    <div class="footer">
        Website wird durch Milanovic Arif bereitgestellt
    </div>

    <script>
        // Pfade zu den JPEGs und PNGs
        const templates = {
            asterix: [
                'file:///C:/Users/arifm/Downloads/Asterix/asterix1.png'
            ],
            obelix: [
                'file:///C:/Users/arifm/Downloads/Asterix/obelix1.jpg'
            ],
            idefix: [
                'file:///C:/Users/arifm/Downloads/Asterix/Idefix1.png'
            ]
        };

        function showImages(character) {
            const container = document.getElementById('images');
            container.innerHTML = ''; // Leere den Container bei jedem Aufruf
            const imagePaths = templates[character];

            imagePaths.forEach((imagePath) => {
                const button = document.createElement('button');
                const img = document.createElement('img');
                img.src = imagePath;
                img.alt = 'Malvorlage';
                button.appendChild(img);
                button.onclick = () => printImage(imagePath); // Verknüpfen des Klicks mit dem Druck
                container.appendChild(button);
            });

            // Menü ausblenden und die Bilder anzeigen
            document.getElementById('mainMenu').style.display = 'none';
            document.getElementById('backButton').style.display = 'block';
            container.style.display = 'flex';
        }

        function printImage(imagePath) {
            const printWindow = window.open('', '', 'width=600,height=600');
            printWindow.document.write(`
                <html>
                    <head><title>Drucken</title></head>
                    <body style="text-align: center; margin: 0;">
                        <img src="${imagePath}" style="max-width: 100%; max-height: 100%; margin-top: 20px;">
                    </body>
                </html>
            `);
            printWindow.document.close();
            printWindow.onload = function() {
                printWindow.print();  // Öffne den Druckdialog für das Bild
                printWindow.onafterprint = function () {
                    printWindow.close();  // Schließe das Fenster nach dem Drucken
                };
            };
        }

        function goBack() {
            document.getElementById('mainMenu').style.display = 'flex';
            document.getElementById('images').style.display = 'none';
            document.getElementById('backButton').style.display = 'none';
        }
    </script>
</body>
</html>
