🏊‍♂️ swim-scripts

**swim-script** est une collection d’outils et de scripts shell destinés à faciliter la vie des étudiants Epitech (et plus particulièrement pendant la Piscine).  

---

## 📥 Installation

1. Place-toi dans ton dossier de Piscine (là où tu pulls tous tes `dayXX`), par exemple :  
```sh
cd /home/<user>/Epitech/Piscine
```

2. Clone le contenu de ce repo directement dans ce dossier :
```sh
git clone git@github.com:rafmiqgus-epitech/swim-scripts.git 
```
```sh 
git clone https://github.com/rafmiqgus-epitech/swim-scripts.git
```

3. Vérifie que les scripts sont bien présents :
```sh 
ls
```
Tu devrais voir epi-clone.sh, check.sh, etc.


## ⚠️ Configuration

Avant d’utiliser les scripts, assure-toi de définir la variable POOL_DIR dans epi-clone.sh.


## 🚀 Utilisation

1. Alias pratiques

Pour lancer les scripts depuis n’importe où, ajoute des alias à ton shell.
Par exemple dans ~/.bashrc ou ~/.zshrc :
```sh 
alias epi-clone="$HOME/Epitech/Piscine/swim-scripts/epi-clone.sh"
alias epi-check="$HOME/Epitech/Piscine/swim-scripts/check.sh"
```

2. Recharge ton shell :
```sh 
source ~/.bashrc
```

Exemples :

👉 Cloner un repo Piscine avec epi-clone
```sh 
epi-clone git@github.com:EpitechPGE1-2025/G-CPE-100-MPL-1-1-cpoolday09-20.git
```

👉 Lancer check.sh depuis n’importe où
```sh 
epi-check
```
