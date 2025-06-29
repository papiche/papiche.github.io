# Guide de Publication - Wiki-Ludique UPlanet

> **Comment publier le site https://papiche.github.io/ avec MkDocs**

## 🎯 Vue d'ensemble

Ce guide explique comment publier le Wiki-Ludique UPlanet sur GitHub Pages en utilisant MkDocs. Le site est automatiquement déployé depuis le dépôt GitHub.

## 📋 Prérequis

### Système requis
- **Linux/macOS/Windows** avec Python 3.8+
- **Git** installé et configuré
- **Compte GitHub** avec accès au dépôt

### Installation des outils

```bash
# 1. Cloner le dépôt
git clone https://github.com/papiche/papiche.github.io.git
cd papiche.github.io

# 2. Installer les dépendances
pip install -r requirements.txt

# 3. Vérifier l'installation
mkdocs --version
```

## 🚀 Méthodes de publication

### Méthode 1 : Script automatique (Recommandée)

Le script `deploy.sh` automatise tout le processus :

```bash
# Déploiement avec message par défaut
./deploy.sh

# Déploiement avec message personnalisé
./deploy.sh "Ajout de la documentation uSPOT API"
```

**Avantages :**
- ✅ Automatique et sécurisé
- ✅ Vérifications intégrées
- ✅ Messages colorés et informatifs
- ✅ Gestion des erreurs

### Méthode 2 : Commandes manuelles

```bash
# 1. Construire le site
mkdocs build --clean

# 2. Déployer sur GitHub Pages
mkdocs gh-deploy --message "Mise à jour de la documentation"

# 3. Nettoyer (optionnel)
rm -rf site/
```

### Méthode 3 : Déploiement en une commande

```bash
# Construction + déploiement en une fois
mkdocs gh-deploy --clean --message "Mise à jour"
```

## 🔧 Développement local

### Serveur de développement

```bash
# Lancer le serveur local
mkdocs serve

# Le site sera disponible sur : http://127.0.0.1:8000
```

**Fonctionnalités du serveur de développement :**
- 🔄 Rechargement automatique
- 🔍 Recherche en temps réel
- 📱 Prévisualisation responsive
- 🐛 Détection d'erreurs

### Construction locale

```bash
# Construire sans déployer
mkdocs build

# Construire avec nettoyage
mkdocs build --clean

# Construire en mode strict (détecte les erreurs)
mkdocs build --strict
```

## 📁 Structure du projet

```
papiche.github.io/
├── docs/                    # 📚 Documentation développeur
│   ├── index.md            # Guide principal
│   ├── api-reference.md    # Référence API complète
│   └── quickstart.md       # Guide de démarrage
├── regles/                 # 📖 Règles du jeu
├── uplanets/              # 🌍 UPlanets
├── scenarios/             # 🎭 Scénarios
├── personnages/           # 👤 Personnages
├── communaute/            # 🤝 Communauté
├── ressources/            # 🛠️ Ressources
├── mkdocs.yml            # ⚙️ Configuration MkDocs
├── requirements.txt       # 📦 Dépendances
├── deploy.sh             # 🚀 Script de déploiement
└── README.md             # 📖 Documentation
```

## ⚙️ Configuration MkDocs

### Fichier `mkdocs.yml`

```yaml
site_name: Wiki-Ludique UPlanet
site_description: Réenchantons la coopération
site_url: https://papiche.github.io/

theme:
  name: material
  palette:
    scheme: slate
    primary: teal
    accent: lime

nav:
  - Accueil: index.md
  - Développement:
      - Guide du développeur: docs/index.md
      - Référence API: docs/api-reference.md
      - Guide de démarrage: docs/quickstart.md
```

### Personnalisation

**Changer le thème :**
```yaml
theme:
  name: material
  palette:
    scheme: default  # ou: slate, dark, light
    primary: indigo  # ou: red, pink, purple, etc.
```

**Ajouter une page :**
```yaml
nav:
  - Nouvelle section:
      - Ma page: nouvelle-page.md
```

## 🔍 Résolution des problèmes

### Erreurs courantes

**1. Plugin non installé**
```bash
ERROR - Config value 'plugins': The "git-revision-date-localized" plugin is not installed
```
**Solution :** Supprimer le plugin de `mkdocs.yml` ou l'installer avec `pip install mkdocs-git-revision-date-localized-plugin`

**2. Fichier de configuration manquant**
```bash
Error: Config file 'mkdocs.yml' does not exist.
```
**Solution :** S'assurer d'être dans le bon répertoire

**3. Dépendances manquantes**
```bash
ModuleNotFoundError: No module named 'mkdocs'
```
**Solution :** `pip install -r requirements.txt`

### Vérifications pré-déploiement

```bash
# 1. Vérifier la configuration
mkdocs build --strict

# 2. Tester localement
mkdocs serve

# 3. Vérifier les liens
mkdocs build --strict --verbose

# 4. Nettoyer et reconstruire
mkdocs build --clean
```

## 📊 Monitoring et maintenance

### Vérifier le déploiement

1. **Attendre 2-5 minutes** après le déploiement
2. **Vérifier** https://papiche.github.io/
3. **Tester** la navigation et les liens
4. **Vérifier** la recherche

### Logs de déploiement

```bash
# Voir les logs de construction
mkdocs build --verbose

# Voir les logs de déploiement
mkdocs gh-deploy --verbose
```

## 🔄 Workflow recommandé

### Pour les mises à jour mineures

```bash
# 1. Modifier les fichiers
vim docs/api-reference.md

# 2. Tester localement
mkdocs serve

# 3. Déployer
./deploy.sh "Mise à jour de la référence API"
```

### Pour les mises à jour majeures

```bash
# 1. Créer une branche
git checkout -b feature/nouvelle-documentation

# 2. Modifier les fichiers
# ... modifications ...

# 3. Tester
mkdocs build --strict
mkdocs serve

# 4. Commiter
git add .
git commit -m "Ajout de la nouvelle documentation"

# 5. Déployer
./deploy.sh "Nouvelle documentation complète"

# 6. Fusionner
git checkout main
git merge feature/nouvelle-documentation
```

## 🎨 Personnalisation avancée

### Ajouter des extensions

```yaml
markdown_extensions:
  - admonition
  - toc:
      permalink: true
  - footnotes
  - codehilite
  - pymdownx.details
  - pymdownx.superfences
  - pymdownx.tabbed
  - pymdownx.emoji:
      emoji_index: !!python/name:material.extensions.emoji.twemoji
      emoji_generator: !!python/name:material.extensions.emoji.to_svg
```

### Configuration des plugins

```yaml
plugins:
  - search
  - git-revision-date-localized:
      enable_creation_date: true
```

## 📞 Support

### Ressources utiles

- **[Documentation MkDocs](https://www.mkdocs.org/)** : Guide officiel
- **[Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)** : Documentation du thème
- **[GitHub Pages](https://pages.github.com/)** : Documentation du déploiement

### Obtenir de l'aide

- **Issues GitHub** : [Créer une issue](https://github.com/papiche/papiche.github.io/issues)
- **Discussions** : [Forum GitHub](https://github.com/papiche/papiche.github.io/discussions)
- **Documentation** : [Wiki UPlanet](https://papiche.github.io/)

---

## 🎯 Checklist de publication

- [ ] ✅ Tests locaux réussis (`mkdocs serve`)
- [ ] ✅ Construction sans erreurs (`mkdocs build --strict`)
- [ ] ✅ Tous les liens fonctionnent
- [ ] ✅ Navigation correcte
- [ ] ✅ Recherche opérationnelle
- [ ] ✅ Déploiement réussi
- [ ] ✅ Site accessible sur https://papiche.github.io/
- [ ] ✅ Vérification post-déploiement

---

*Dernière mise à jour : Janvier 2024* 