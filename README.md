🏊‍♂️ swim-scripts

**swim-script** est une collection d’outils et de scripts shell destinés à faciliter la vie des étudiants Epitech (et plus particulièrement pendant la Piscine).  

---

## 📥 Installation

1. Place-toi dans ton dossier de Piscine (là où tu pulls tous tes `dayXX`) :  
```sh
cd /home/<user>/Epitech/Piscine
```
Clone le contenu de ce repo directement dans ce dossier (sans créer de sous-dossier codepool) :
```sh
git clone git@github.com:<ton-user>/codepool.git . 
```
⚠️ Le . à la fin permet de mettre le contenu directement dans le dossier courant.

Vérifie que les scripts sont bien présents :
```sh 
ls
```
Tu devrais voir epi-clone.sh, check.sh, etc.

⚠️ Configuration

Avant d’utiliser les scripts, assure-toi de définir la variable POOL_DIR dans epi-clone.sh.

🚀 Utilisation
1. Alias pratiques

Pour lancer les scripts depuis n’importe où, ajoute des alias à ton shell.
Par exemple dans ~/.bashrc ou ~/.zshrc :
```sh 
alias epi-clone="$HOME/Epitech/Piscine/epi-clone.sh"
alias epi-check="$HOME/Epitech/Piscine/check.sh"
```

Recharge ton shell :
```sh 
source ~/.bashrc
```

2. Exemples

👉 Cloner un repo Piscine avec epi-clone
```sh 
epi-clone git@github.com:EpitechPGE1-2025/G-CPE-100-MPL-1-1-cpoolday09-20.git
```

👉 Lancer check.sh depuis n’importe où
```sh 
epi-check
```
