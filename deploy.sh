#!/bin/bash
# Script de déploiement MkDocs pour papiche.github.io
# Usage: ./deploy.sh [message]

set -e  # Arrêter en cas d'erreur

# Couleurs pour les messages
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Fonction pour afficher les messages
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Vérifier que nous sommes dans le bon répertoire
if [[ ! -f "mkdocs.yml" ]]; then
    print_error "Ce script doit être exécuté depuis le répertoire racine du projet (où se trouve mkdocs.yml)"
    exit 1
fi

# Message de commit par défaut
COMMIT_MESSAGE=${1:-"Mise à jour de la documentation $(date '+%Y-%m-%d %H:%M:%S')"}

print_status "Début du déploiement..."

# 1. Vérifier l'état du git
print_status "Vérification de l'état Git..."
if [[ -n $(git status --porcelain) ]]; then
    print_warning "Il y a des changements non commités. Voulez-vous les ajouter ? (y/N)"
    read -r response
    if [[ "$response" =~ ^[Yy]$ ]]; then
        git add .
        git commit -m "Changements automatiques avant déploiement"
        print_success "Changements ajoutés et commités"
    else
        print_error "Déploiement annulé. Committez vos changements d'abord."
        exit 1
    fi
fi

# 2. Installer/upgrader les dépendances
print_status "Installation des dépendances..."
pip install -r requirements.txt

# 3. Construire le site
print_status "Construction du site..."
mkdocs build --clean

# 4. Vérifier que la construction s'est bien passée
if [[ ! -d "site" ]]; then
    print_error "La construction a échoué. Le dossier 'site' n'existe pas."
    exit 1
fi

print_success "Site construit avec succès"

# 5. Déployer sur GitHub Pages
print_status "Déploiement sur GitHub Pages..."
mkdocs gh-deploy --message "$COMMIT_MESSAGE"

# 6. Vérifier le déploiement
print_status "Vérification du déploiement..."
sleep 5  # Attendre un peu pour que GitHub Pages se mette à jour

# 7. Nettoyer
print_status "Nettoyage..."
rm -rf site/

print_success "Déploiement terminé avec succès !"
print_status "Votre site sera disponible sur https://papiche.github.io/ dans quelques minutes"
print_status "Message de commit: $COMMIT_MESSAGE"

# 8. Afficher les informations utiles
echo ""
print_status "Commandes utiles :"
echo "  mkdocs serve          # Serveur de développement local"
echo "  mkdocs build          # Construire le site localement"
echo "  mkdocs build --clean  # Construire avec nettoyage"
echo "  ./deploy.sh           # Déployer avec message par défaut"
echo "  ./deploy.sh 'Message' # Déployer avec message personnalisé" 