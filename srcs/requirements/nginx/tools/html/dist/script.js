for (let i = 0; i < 500; i++) {
        const rose = document.createElement("img");
        rose.src = "https://emojicdn.elk.sh/🌹";
        rose.classList.add("rose");

        
        if (i < 50) {
          
          if (i < 25) {
            rose.style.top = `5vh`;
            rose.style.left = `${(i * 100) / 25}vw`;
          } else {
            rose.style.top = `90vh`;
            rose.style.left = `${((i - 25) * 100) / 25}vw`;
          }
        } else if (i < 85) {
         
          if (i < 65) {
            rose.style.left = `5vw`;
            rose.style.top = `${((i - 50) * 100) / 15}vh`;
          } else {
            rose.style.left = `95vw`;
            rose.style.top = `${((i - 65) * 100) / 15}vh`;
          }
        } else {
          
          rose.style.top = `${Math.random() * 60 + 15}vh`;
          rose.style.left = `${Math.random() * 60 + 15}vw`;
        }

        // Random delay and animation for the roses
        rose.style.animationDelay = `${Math.random() * 5}s`;

        document.body.appendChild(rose);
      }