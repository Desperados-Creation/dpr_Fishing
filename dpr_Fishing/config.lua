Config = {
    Blip = true, -- Affichage du blip (true = oui, false = non)

    BlipId = 68, -- Id du blip voir: https://wiki.gtanet.work/index.php?title=Blips
    BlipTaille = 0.7, -- Taille du blip
    BlipCouleur = 57, -- Couleur du blip voir: https://wiki.gtanet.work/index.php?title=Blips
    BlipRange = true, -- Garder le blip sur la map (true = désactiver, false = activé)
    BlipName = "Zone de pêche",


    BlipSellFish = true, -- Affichage du blip (true = oui, false = non)

    BlipSellFishId = 267, -- Id du blip voir: https://wiki.gtanet.work/index.php?title=Blips
    BlipSellFishTaille = 0.7, -- Taille du blip
    BlipSellFishCouleur = 57, -- Couleur du blip voir: https://wiki.gtanet.work/index.php?title=Blips
    BlipSellFishRange = true, -- Garder le blip sur la map (true = désactiver, false = activé)
    BlipSellFishName = "Poissonerie",


    MarkerType = 1, -- Pour voir les différents type de marker: https://docs.fivem.net/docs/game-references/markers/
    MarkerSizeLargeur = 15.0, -- Largeur du marker
    MarkerSizeEpaisseur = 15.0, -- Épaisseur du marker
    MarkerSizeHauteur = 0.7, -- Hauteur du marker
    MarkerDistance = 30.0, -- Distane de visibiliter du marker (1.0 = 1 mètre)
    MarkerColorR = 0, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerColorG = 10, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerColorB = 255, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerOpacite = 180, -- Opacité du marker (min: 0, max: 255)
    MarkerSaute = false, -- Si le marker saute (true = oui, false = non)
    MarkerTourne = true, -- Si le marker tourne (true = oui, false = non)

    TextFishing = "Appuyer sur ~b~[E] ~s~pour ~b~pêcher ~s~!",
    TextSellFish = "Appuyer sur ~b~[E] ~s~pour ~b~vendre vos poissons ~s~ !",

    FishingRod = "fishingrod", -- Canne à pêche obligatoire pour pouvoir pêcher

    Fish = { -- Nom des poissons
        "macro",
        "bar",
        "dorade",
        "lieu",
        "raie",
        "sardine",
        "saumon",
        "thon"
    },

    FishButtonMEnu = {
        {Nom = "Macro", Item = "macro", Price = 5},
        {Nom = "Bar", Item = "bar", Price = 5},
        {Nom = "Dorade", Item = "dorade", Price = 5},
        {Nom = "Lieu", Item = "lieu", Price = 5},
        {Nom = "Raie", Item = "raie", Price = 5},
        {Nom = "Sardine", Item = "sardine", Price = 5},
        {Nom = "Saumon", Item = "saumon", Price = 5},
        {Nom = "Thon", Item = "thon", Price = 5}
    },

    MinTime = 1000, -- Temps minimume pour attraper un poisson (1 seconde)
    MaxTime = 25000, -- Temps maximum pour attraper un poisson (25 secondes)

    FishingZone = { -- Zone de pêche
        vector3(1528.6, 3916.14, 30.68),
        vector3(1916.27, 382.08, 160.7),
        vector3(-277.12, 6637.99, 7.51),
        vector3(2837.76, -625.1, 0.7)
    },

    SellFishZone = {
        vector3(-1039.83, -1396.26, 5.5)
    }
}