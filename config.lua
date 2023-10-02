Config = {

    Price = 1000, --PRIX POUR UNE COUPE OU AUTRE
    DrawDistance = 3.0, --DISTANCE POUR VOIR LE MARKER
    DrawDistanceNotif = 1.0, --DISTANCE POUR VOIR LA NOTIFICATION
    MarkerType = 22, --TYPE DU MARKER
    MarkerSize = vector3(0.5, 0.5, 0.5), --TAILLE DU MARKER
    MarkerColor  = {153, 10, 255}, --COULEUR DU MARKER

    sPosition = { --POSITION DES COIFFEURS
        vector3(-814.3, -183.8, 37.6),
        vector3(136.8, -1708.4, 29.3),
        vector3(-1282.6, -1116.8, 7.0),
        vector3(1931.5, 3729.7, 32.8),
        vector3(1212.8, -472.9, 66.2),
        vector3(-32.9, -152.3, 57.1),
        vector3(-278.1, 6228.5, 31.7)
    },

    BlipsType = 71, --TYPE DU BLIPS
    BlipsColor = 51, --COULEUR DU BLIPS
    BlipsSize = 0.5, --TAILLE DU BLIPS

    --IT IS IN FRENCH, YOU CAN CHANGE IN ENGLISH IF YOU WANT
    --IF YOU WANT TO CHANGE THE TITLE AND SUBTITLE OF THE MENU, GO IN CLIENT→MENU.LUA AND GO TO 24 AND 25 lines.
    Catalog = "Catalogue",
    TurnPed = "Faire tourner son personnage",
    ToPay = "La caisse",
    GotoTheCase = "Passer à la caisse",
    Cancel = "~r~Annuler",
    TotalPrice = "Prix total",
    PayementMethode = "Mode de paiement",
    PayCash = "Payer par cash",
    PayCart = "Payer par carte",

    BarberTitle = "Coiffeur",
    BeardTitle = "Barbe",
    HairTitle = "Cheveux",
    Color = "Couleur",
    Eyebrows = "Sourcils",
    Eyes = "Lentilles",
    Makeup = "Maquillage",
    FirstColor = "Première couleur",
    Colortwo = "Deuxième couleur",
    Lipstick = "Rouge à lèvre",
    Size = "Taille",
    HelpMessage = "Appuyez sur ~INPUT_PICKUP~ pour accéder au coiffeur.",
    ErrorMenuNotif = "~r~Erreur~s~ : \nLe menu est déjà ouvert !",
    SuccesMenuNotif = "Vous venez d'ouvrir le menu !",
    CloseMenuNotif = "Vous venez de fermer le menu !",
    HairDresserPaid = "Vous venez de payer le coiffeur.",
    NotCash = "Vous n'avez pas assez de cash.",
    NotBank = "Vous n'avez pas assez d'argent en banque."
}