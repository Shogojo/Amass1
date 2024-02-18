/*
 Nom fichier :TP1_PPO
 Description :
 Date :07/09/2020
 version : 1
 Auteur : Louima
 */

#include <iostream>
#include "celeve.h"
using namespace std;


int main()
{
    CEleve main;
    main.SaisirNom();
    main.SaisirPrenom();
    main.SaisirNotes();
    main.CalculerMoyenne();
    main.AfficherInfos();

    return 0;

}

