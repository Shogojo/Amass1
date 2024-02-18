/*
 Nom fichier :TP1_PPO
 Description :
 Date :07/09/2020
 version : 1
 Auteur : Louima
 */

#include <iostream>
#include <iomanip>
using namespace std;

int main()
{
    int n;
    std::cout << "Saisir un entier : ";
    std::cin >> n;
    std::cout << "Vous avez saisir: " << std::dec << std::showbase << n << std::endl;
    std::cout << "Saisir un nombre hexadecimal : ";
    std::cin >> std::hex >> n;      //manipilateur
    std::cout << "Sa valeur rn base 10 est : " << std::showbase << n << '\n';
    std::cout << std::hex << std::showbase << n << '\n';
    std::cout << std::hex << std::noshowbase << n << '\n';
    std::cout << std::oct << std::showbase << n << '_n';

    return 0;
}
