# 📉 HR-Data-Analysis-SQL

⎮ Ce projet présente une **analyse de données RH réalisée en SQL**, à partir de données brutes stockées dans une base PostgreSQL, avec une approche structurée et proche des standards professionnels.

Il vise à démontrer la capacité à :

- comprendre des jeux de données métiers,
- construire une base de données exploitable,
- produire des KPI pertinents pour la prise de décision RH.

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
│   └── 03_analysis.sql         # Requêtage SQL
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

2. **Tables analytiques**

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

### 📊 KPI analysés

#### 1️⃣ Taux de conversion des candidats en employés

**Objectif métier :**  
Mesurer l’efficacité du processus de recrutement.

**Logique :**

- Nombre total de candidats (`raw_recruitment_data`)
- Nombre de candidats effectivement embauchés (`raw_employee_data`)
- Calcul d’un taux de conversion en pourcentage

👉 Ce KPI permet d’évaluer la performance globale du pipeline de recrutement.

#### 2️⃣ Engagement des employés selon le niveau d’éducation

**Objectif métier :**  
Analyser le lien entre le niveau d’éducation à l’embauche et l’engagement des employés.

**Logique :**

- Niveau d’éducation issu des données de recrutement
- Score d’engagement issu des enquêtes internes
- Calcul de la moyenne des scores par niveau d’éducation

👉 Ce KPI permet d’identifier d’éventuelles tendances entre profil académique et engagement.

#### 3️⃣ Progression de carrière par niveau d’éducation (proxy formation)

**Objectif métier :**  
Évaluer la progression de carrière des employés en fonction de leur niveau d’éducation.

**Choix méthodologique :**

- En l’absence de données directes sur les promotions ou augmentations,la **participation aux formations** est utilisée comme **proxy de progression de carrière**.

**Logique :**

- Jointure entre recrutement, employés et formations
- Comptage du nombre de formations suivies par niveau d’éducation
- Comparaison entre groupes

👉 Ce KPI permet d’analyser l’équité et la logique des politiques de développement interne.

---

## 📈 Évolutions prévues

* Création de vues analytiques à partir des requêtes
* Export des résultats vers Python
* Analyse statistique et data visualisation
* Enrichissement des KPI selon de nouveaux besoins métiers

