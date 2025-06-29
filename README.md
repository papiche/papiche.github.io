# Wiki-Ludique UPlanet

> **Réenchantons la coopération – Créez, explorez, enrichissez.**

Ce dépôt contient le Wiki-Ludique UPlanet, un site web construit avec [MkDocs](https://www.mkdocs.org/) et le thème [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/).

## 🌐 Site en ligne

Le site est accessible sur : **https://papiche.github.io/**

## 🚀 Publication avec MkDocs

### Prérequis

- **Python 3.8+** : [python.org](https://python.org)
- **Git** : [git-scm.com](https://git-scm.com)

### Installation

```bash
# Cloner le dépôt
git clone https://github.com/papiche/papiche.github.io.git
cd papiche.github.io

# Installer les dépendances
pip install -r requirements.txt
```

### Développement local

```bash
# Lancer le serveur de développement
mkdocs serve

# Le site sera disponible sur : http://127.0.0.1:8000
```

### Publication

#### Méthode 1 : Script automatique (recommandé)

```bash
# Déploiement avec message par défaut
./deploy.sh

# Déploiement avec message personnalisé
./deploy.sh "Ajout de nouvelles fonctionnalités"
```

#### Méthode 2 : Commandes manuelles

```bash
# Construire le site
mkdocs build

# Déployer sur GitHub Pages
mkdocs gh-deploy --message "Mise à jour de la documentation"

# Ou en une seule commande
mkdocs gh-deploy --clean --message "Mise à jour"
```

### Structure du projet

```
papiche.github.io/
├── docs/                    # Documentation développeur
│   ├── index.md            # Guide du développeur
│   ├── api-reference.md    # Référence API complète
│   └── quickstart.md       # Guide de démarrage rapide
├── regles/                 # Règles du jeu
├── uplanets/              # UPlanets et fiches
├── scenarios/             # Scénarios de jeu
├── personnages/           # Personnages
├── communaute/            # Gouvernance et communauté
├── ressources/            # Outils et ressources
├── mkdocs.yml            # Configuration MkDocs
├── requirements.txt       # Dépendances Python
├── deploy.sh             # Script de déploiement
└── README.md             # Ce fichier
```

## 📚 Documentation

### Pour les joueurs

- **[Règles de base](regles/base.md)** : Règles fondamentales du jeu
- **[UPlanets](uplanets/exemple-uplanet.md)** : Création et gestion d'UPlanets
- **[Scénarios](scenarios/la-revolte-des-nodes.md)** : Scénarios de jeu
- **[Personnages](personnages/ambassadrice-zenitha.md)** : Personnages et fiches

### Pour les développeurs

- **[Guide du développeur](docs/index.md)** : Documentation complète
- **[Référence API](docs/api-reference.md)** : Toutes les APIs disponibles
- **[Guide de démarrage rapide](docs/quickstart.md)** : Démarrage en 5 minutes

## 🔧 Configuration MkDocs

Le site utilise la configuration suivante :

- **Thème** : Material for MkDocs
- **Extensions** : Admonitions, TOC, Footnotes, Code highlighting
- **Plugins** : Search, Git revision dates
- **Déploiement** : GitHub Pages automatique

### Personnalisation

Modifiez `mkdocs.yml` pour :

- Changer le thème ou les couleurs
- Ajouter de nouvelles pages
- Configurer les extensions
- Modifier la navigation

## 🤝 Contribution

1. **Fork** le dépôt
2. **Clone** votre fork
3. **Créez** une branche pour votre fonctionnalité
4. **Modifiez** la documentation
5. **Testez** localement avec `mkdocs serve`
6. **Commitez** et **poussez** vos changements
7. **Créez** une Pull Request

### Standards de contribution

- Utilisez le format Markdown
- Respectez la structure existante
- Testez vos changements localement
- Ajoutez des descriptions claires

## 🐛 Problèmes et support

- **Issues** : [GitHub Issues](https://github.com/papiche/papiche.github.io/issues)
- **Discussions** : [GitHub Discussions](https://github.com/papiche/papiche.github.io/discussions)
- **Documentation** : [Wiki UPlanet](https://papiche.github.io/)

## 📄 Licence

Ce projet est sous licence [AGPL-3.0](LICENSE).

---

*Dernière mise à jour : Janvier 2024*
