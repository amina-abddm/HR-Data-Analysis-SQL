# 📉 HR-Data-Analysis-SQL

⎮Exploratory and analytical SQL queries on HR datasets using PostgreSQL

## 🧩 Présentation du projet

Ce projet a pour objectif de démontrer une **démarche complète d’analyse de données RH à l’aide de SQL**, depuis la compréhension des fichiers sources jusqu’à la construction d’une base de données exploitable pour l’analyse.

Il s’inscrit dans une logique **professionnelle et reproductible**, proche de ce que l’on retrouve en entreprise :

* données brutes hétérogènes (CSV)
* création de schémas adaptés
* chargement sécurisé des données
* préparation à l’analyse exploratoire

---

## 🎯 Objectifs

* Comprendre la structure de plusieurs jeux de données RH
* Concevoir des **schémas SQL cohérents** à partir de fichiers CSV
* Mettre en place une **pipeline SQL claire et réutilisable**
* Charger les données dans PostgreSQL de manière fiable
* Préparer les données pour des analyses futures (SQL avancé / Python)

---

## 🛠️ Stack technique

* **Base de données** : PostgreSQL
* **Interface graphique** : pgAdmin 4
* **Éditeur de code** : Visual Studio Code
* **Versioning** : Git & GitHub
* **Système** : macOS

---

## 📁 Structure du projet

```text
HR-Data-Analysis-SQL/
│
├── README.md
│
├── sql/
│   ├── 01_init_schema.sql      # Création des schémas (tables RAW)
│   └── 02_load_data.sql        # Chargement des données CSV
│
├── data/
│   └── raw/
│       ├── employee_data.csv
│       ├── employee_engagement_survey_data.csv
│       ├── recruitment_data.csv
│       └── training_and_development_data.csv
│
└── .gitignore
```

---

## 🧱 Modélisation des données

### Principe adopté

Le projet suit une **approche en deux niveaux** :

1. **Tables RAW**

   * Miroir strict des fichiers CSV
   * Aucune transformation métier
   * Noms et types fidèles aux données sources

2. (À venir) **Tables analytiques**

   * Nettoyage
   * Normalisation
   * Jointures métier
   * Agrégations

Cette approche garantit :

* traçabilité des données
* facilité de débogage
* robustesse de la pipeline

---

## 🗄️ Schémas créés

Les tables RAW suivantes sont créées :

* `raw_employee_data`
* `raw_employee_engagement_survey_data`
* `raw_recruitment_data`
* `raw_training_and_development_data`

Chaque table respecte strictement la structure de son CSV correspondant.

---

## 🚀 Exécution du projet

### 1️⃣ Création des tables

Depuis le terminal :

```bash
psql -U postgres -d hr_analytics -f sql/01_init_schema.sql
```

### 2️⃣ Chargement des données

```bash
psql -U postgres -d hr_analytics -f sql/02_load_data.sql
```

Les commandes `\copy` sont utilisées afin de charger les fichiers CSV depuis la machine locale.

---

## 🔍 Vérifications possibles

Exemples de contrôles :

```sql
SELECT COUNT(*) FROM raw_employee_data;
SELECT * FROM raw_employee_data LIMIT 10;
```

Ces requêtes peuvent être exécutées :

* dans **pgAdmin (Query Tool)**
* ou directement via **psql**

---

## 🧠 Philosophie analytique

Ce projet illustre la différence entre :

* **Analyse SQL** :

  * exploration de bases relationnelles
  * compréhension des liens entre tables
  * jointures, regroupements, enrichissement des données

* **Analyse Python** (à venir) :

  * analyse statistique
  * visualisation
  * modélisation

SQL est ici utilisé comme **fondation analytique**.

---

## 📈 Évolutions prévues

* Création de tables analytiques nettoyées
* Jointures métier RH
* Requêtes SQL avancées (CTE, fenêtres, agrégats)
* Connexion Python (pandas / psycopg2)
* Analyse exploratoire et visualisations

---

✨ *Projet en cours — améliorations continues*
