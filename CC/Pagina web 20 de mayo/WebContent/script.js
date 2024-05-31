document.addEventListener('DOMContentLoaded', function() {
    const gif = document.getElementById('gif');
    const bulbasaur = document.getElementById('bulbasaur');
    const squirtle = document.getElementById('squirtle');
    const arrow = document.querySelector('.arrow');
    const pokemonSelection = document.querySelector('.pokemon-selection');
    const selectionResult = document.getElementById('selection-result');
    const pokemonText = document.getElementById('pokemon-text');
    const executeButton = document.getElementById('executeButton');
    const logro = document.getElementById('shareButton');
    const pokemonTextResult = document.getElementById('pokemon-text-result');

    // Define las imágenes a utilizar
    const gifUrl = "https://www.pokencyclopedia.info/sprites/gen5/ani-b_black-white/a-b_bw_001.gif";
    const firstImageUrl = "https://www.pokencyclopedia.info/sprites/gen4/spr-b_hgss/b_hs_001_1.png";
    const secondImageUrl = "https://www.pokencyclopedia.info/sprites/gen4/spr-b_hgss/b_hs_001_2.png";
    const squirtleGifUrl = "https://www.pokencyclopedia.info/sprites/gen5/ani-b_black-white/a-b_bw_007.gif";
    const bulbaGifUrl = "https://www.pokencyclopedia.info/sprites/gen5/ani-b_black-white/a-b_bw_001.gif";
    
    // Carga el GIF en el contenedor al inicio
    gif.src = gifUrl;

    let isPlaying = false;
    let isSquirtleActive = false;    

    function executeActions() {
        if (isSquirtleActive) {
            setTimeout(function() {
                pokemonText.textContent = "Squirtle uso burbujas";
                gif.src = "https://www.pokencyclopedia.info/sprites/gen4/spr-b_hgss/b_hs_007_1.png";
                setTimeout(function() {
                    gif.src = "https://www.pokencyclopedia.info/sprites/gen4/spr-b_hgss/b_hs_007_2.png";
                    setTimeout(function() {
                        document.querySelector('.gif-enemigo').style.display = 'none';
                        setTimeout(function() {
                            pokemonText.textContent = "Squirtle es el ganador!!";
                            pokemonTextResult.textContent = pokemonText.textContent;
                            logro.style.display = 'block';
                        }, 2000);
                    }, 1000);
                }, 1000);
            }, 2000);
        } else {
            pokemonText.textContent = "Bulbasaur uso Hoja Afilada";
            gif.src = "https://www.pokencyclopedia.info/sprites/gen4/spr-b_hgss/b_hs_001_1.png";
            setTimeout(function() {
                gif.src = "https://www.pokencyclopedia.info/sprites/gen4/spr-b_hgss/b_hs_001_2.png";
            }, 1000);
            document.querySelector('.gif-enemigo').style.display = 'block';
            setTimeout(function() {
                document.querySelector('.gif-container').style.display = 'none';
                setTimeout(function() {
                    pokemonText.textContent = "Bulbasaur ha perdido...";
                    pokemonTextResult.textContent = pokemonText.textContent;
                }, 2000);
            }, 3000);
        }
    }

    function playGif() {
        if (!isPlaying) {
            gif.src = firstImageUrl;
            gif.style.width = '150px';
            gif.style.height = '150px';
            isPlaying = true;
            setTimeout(function() {
                gif.src = secondImageUrl;
                gif.style.width = '150px';
                gif.style.height = '150px';
                setTimeout(function() {
                    gif.src = firstImageUrl;
                    gif.style.width = '150px';
                    gif.style.height = '150px';
                    isPlaying = false;
                }, 1000);
            }, 1000);
        }
    }

    function changeToSquirtle() {
        gif.src = squirtleGifUrl;
        gif.style.width = '100px';
        gif.style.height = '100px';
        isSquirtleActive = true;
        document.querySelector('.gif-container').style.display = 'block';
        document.querySelector('.gif-enemigo').style.display = 'block';
        pokemonText.textContent = "SQUIRTLE HA SIDO ELEGIDO";
        arrow.textContent = "<";
        insertPokemonIcon('https://www.pokencyclopedia.info/sprites/gen4/spr_hgss/spr_hs_007_1.png');
        selectionResult.innerHTML = `<img src="https://www.pokencyclopedia.info/sprites/gen4/spr_hgss/spr_hs_007_1.png" alt="Squirtle" style="width: 50px; height: 50px;"> ${pokemonText.textContent}`;
        // Limpiar el texto anterior
        pokemonTextResult.textContent = "";
    }

    function changeToBulbasaur() {
        gif.src = bulbaGifUrl;
        gif.style.width = '100px';
        gif.style.height = '100px';
        isSquirtleActive = false;
        document.querySelector('.gif-container').style.display = 'block';
        document.querySelector('.gif-enemigo').style.display = 'block';
        insertPokemonIcon('https://www.pokencyclopedia.info/sprites/gen4/spr_hgss/spr_hs_001_1.png');
        arrow.textContent = ">";
        pokemonText.textContent = "BULBASAUR ha sido elegido";
        selectionResult.innerHTML = `<img src="https://www.pokencyclopedia.info/sprites/gen4/spr_hgss/spr_hs_001_1.png" alt="Bulbasaur" style="width: 50px; height: 50px;"> ${pokemonText.textContent}`;
        // Limpiar el texto anterior
        pokemonTextResult.textContent = "";
    }

    function insertPokemonIcon(iconUrl) {
        pokemonSelection.innerHTML = '';
        const pokemonIcon = document.createElement('img');
        pokemonIcon.src = iconUrl;
        pokemonIcon.alt = 'Pokemon';
        pokemonIcon.style.width = '100px';
        pokemonIcon.style.height = '100px';
        pokemonSelection.appendChild(pokemonIcon);
    }

    bulbasaur.addEventListener('click', changeToBulbasaur);
    squirtle.addEventListener('click', changeToSquirtle);

    bulbasaur.addEventListener('click', function() {
        bulbasaur.classList.add('selected');
        squirtle.classList.remove('selected');
    });

    squirtle.addEventListener('click', function() {
        changeToSquirtle();
        squirtle.classList.add('selected');
        bulbasaur.classList.remove('selected');
    });
    
    executeButton.addEventListener('click', executeActions);

    function insertImageIntoGallery() {
        const gallery = document.getElementById('gallery');
        const newImage = document.createElement('img');
        newImage.src = "/Practica06/res/c.png";
        newImage.alt = "Imagen compartida";
        gallery.appendChild(newImage);
    }

    logro.addEventListener('click', function() {
        alert("Se compartió tu foto en la Galería!!");
        insertImageIntoGallery();
    });
});
