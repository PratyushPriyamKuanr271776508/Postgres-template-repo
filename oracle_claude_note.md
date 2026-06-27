# The Oracle Database Complete Reference

### A deeply descriptive, code-rich reference covering the full Oracle curriculum — from RDBMS foundations through SQL, PL/SQL, architecture, administration, performance, and the modern Oracle (12c → 23ai) — built from the classic Oracle 11g training syllabus and extended with newer-version features, missing concepts, and practical engineering commentary.

> **Compiled for Pratyush Priyam Kuanr.**
>
> **About this document.** This is a *living* reference, intentionally enormous. It is written to be read linearly as a course *or* dipped into as an encyclopedia. It expands on the three scanned Oracle 11g training-note sets (Krishna Reddy, Satish Yellanki, Durga Soft) — which are image-based and not machine-readable — by reconstructing and going far beyond their standard syllabus. Wherever the original 11g material is dated, this document marks **what changed in 12c, 18c, 19c, 21c, and 23ai**, fills in **concepts those notes omit**, and adds **engineering commentary** (best practices, anti-patterns, gotchas, and how each Oracle concept maps to the modern data stack you work in: PostgreSQL, Snowflake, Databricks/Spark).
>
> **How it is organized.** Five parts: **I Foundations**, **II SQL**, **III PL/SQL**, **IV Architecture & Administration**, **V Modern Oracle & Beyond**. Each chapter is broken into many sections; each section explains the *what*, the *why*, the *how* (with runnable SQL/PL-SQL), the *common mistakes*, and — where relevant — the *modern equivalent*.
>
> **Conventions.**
> - Runnable code is in fenced blocks. SQL is uppercase-keyword by convention; identifiers lowercase.
> - `>` blockquotes flag **commentary, gotchas, and version notes**.
> - "**11g**", "**12c**", "**19c**", "**21c**", "**23ai**" tags mark version-specific behavior.
> - "**DE NOTE**" marks a bridge to modern data engineering.
> - To practice, use Oracle Database Free (formerly XE) or an Autonomous Database Always-Free instance; tools are SQL\*Plus, SQL Developer, or SQLcl.

---

## Master table of contents

### PART I — FOUNDATIONS
- **Ch 1 — Data, Databases, DBMS, and the Oracle Product**
  - 1.1 Data vs information · 1.2 File systems vs databases · 1.3 What a DBMS does · 1.4 Database models through history · 1.5 The RDBMS · 1.6 ACID and the transactional promise · 1.7 OLTP vs OLAP · 1.8 The Oracle product family and editions · 1.9 Oracle versions at a glance
- **Ch 2 — The Relational Model**
  - 2.1 Relations, tuples, attributes, domains · 2.2 Codd's 12 rules · 2.3 Keys (super, candidate, primary, alternate, foreign, composite, surrogate) · 2.4 Integrity rules · 2.5 Relational algebra · 2.6 NULL and three-valued logic
- **Ch 3 — Data Modeling: ER & Normalization**
  - 3.1 Conceptual/logical/physical models · 3.2 Entities, attributes, relationships · 3.3 Cardinality & participation · 3.4 ERD notations · 3.5 Functional dependencies · 3.6 1NF–5NF and BCNF, step by step · 3.7 Denormalization · 3.8 Dimensional modeling primer
- **Ch 4 — Getting Started: Tools, Connecting, Sample Schemas**
  - 4.1 Editions & installation options · 4.2 SQL\*Plus, SQL Developer, SQLcl · 4.3 Connecting (easy connect, tnsnames, services) · 4.4 The HR/OE/SH sample schemas · 4.5 SQL\*Plus environment & formatting · 4.6 The data dictionary as your map

### PART II — SQL IN ORACLE
- **Ch 5 — SQL Overview & Datatypes**
  - 5.1 The sublanguages (DRL/DML/DDL/TCL/DCL) · 5.2 Character types · 5.3 Numeric types · 5.4 Datetime & interval types · 5.5 LOBs · 5.6 ROWID/UROWID · 5.7 BOOLEAN (**23ai**) · 5.8 JSON type (**21c**) · 5.9 Type conversion rules
- **Ch 6 — SELECT: The DRL in Depth**
  - 6.1 Anatomy & logical evaluation order · 6.2 Projection & expressions · 6.3 Column aliases · 6.4 DISTINCT · 6.5 Concatenation & literals · 6.6 DUAL · 6.7 ORDER BY (collation, NULLS FIRST/LAST) · 6.8 Row limiting (ROWNUM, FETCH FIRST) · 6.9 Operator precedence
- **Ch 7 — WHERE & Single-Row Functions**
  - 7.1 Predicates & operators · 7.2 BETWEEN/IN/LIKE/escape · 7.3 NULL handling & the NOT IN trap · 7.4 Character functions · 7.5 Number functions · 7.6 Date functions & arithmetic · 7.7 Conversion functions & format models · 7.8 General/NULL functions (NVL, NVL2, COALESCE, NULLIF, DECODE, CASE)
- **Ch 8 — Joins**
  - 8.1 Cartesian/cross · 8.2 ANSI inner joins (ON/USING/NATURAL) · 8.3 Outer joins (ANSI + legacy `(+)`) · 8.4 Self joins · 8.5 Non-equijoins · 8.6 Multi-table joins · 8.7 Join performance & the fan-out trap
- **Ch 9 — Aggregation & Grouping**
  - 9.1 Group functions & NULLs · 9.2 GROUP BY rules · 9.3 HAVING vs WHERE · 9.4 ROLLUP, CUBE, GROUPING SETS · 9.5 GROUPING/GROUPING_ID · 9.6 LISTAGG · 9.7 Conditional aggregation/pivot idiom
- **Ch 10 — Subqueries & CTEs**
  - 10.1 Scalar, single-row, multi-row · 10.2 IN/ANY/ALL · 10.3 Correlated subqueries · 10.4 EXISTS/NOT EXISTS · 10.5 Inline views · 10.6 WITH (CTE) & recursive WITH · 10.7 Subquery vs join vs CTE
- **Ch 11 — Set Operators**
  - 11.1 UNION / UNION ALL · 11.2 INTERSECT · 11.3 MINUS (vs EXCEPT) · 11.4 Rules & column matching · 11.5 Ordering combined results
- **Ch 12 — DDL: Defining the Schema**
  - 12.1 CREATE TABLE · 12.2 Constraints (PK/FK/UNIQUE/CHECK/NOT NULL/DEFAULT) · 12.3 Constraint states (DEFERRABLE, NOVALIDATE) · 12.4 ALTER TABLE · 12.5 DROP/TRUNCATE/RENAME · 12.6 Virtual & identity columns · 12.7 Invisible columns (**12c**) · 12.8 Comments · 12.9 The data dictionary for DDL
- **Ch 13 — DML & Transaction-Bound Data Changes**
  - 13.1 INSERT (single/multi-row) · 13.2 INSERT … SELECT · 13.3 Multi-table INSERT · 13.4 UPDATE (incl. correlated) · 13.5 DELETE vs TRUNCATE · 13.6 MERGE (upsert) · 13.7 RETURNING INTO · 13.8 Error logging (DML error logging) · 13.9 Idempotency patterns
- **Ch 14 — TCL: Transactions & Concurrency**
  - 14.1 COMMIT/ROLLBACK/SAVEPOINT · 14.2 Read consistency & MVCC · 14.3 Locking (row/table, modes) · 14.4 SELECT … FOR UPDATE · 14.5 Isolation levels in Oracle · 14.6 Deadlocks · 14.7 Autonomous transactions (preview)
- **Ch 15 — DCL & Security Basics**
  - 15.1 Users & schemas · 15.2 System vs object privileges · 15.3 GRANT/REVOKE · 15.4 Roles · 15.5 PUBLIC · 15.6 Profiles & password policy
- **Ch 16 — Other Schema Objects**
  - 16.1 Views (simple/complex/updatable/WITH CHECK/READ ONLY) · 16.2 Sequences (incl. identity, 12c gap-free notes) · 16.3 Synonyms (private/public) · 16.4 Indexes (intro) · 16.5 Materialized views (intro)
- **Ch 17 — Advanced SQL**
  - 17.1 Analytic/window functions (full) · 17.2 Hierarchical queries (CONNECT BY, recursive WITH) · 17.3 PIVOT/UNPIVOT · 17.4 Regular expressions · 17.5 Pattern matching MATCH_RECOGNIZE (**12c**) · 17.6 Flashback query · 17.7 Approximate query (**12c**) · 17.8 Polymorphic table functions (**18c**)

### PART III — PL/SQL
- **Ch 18 — PL/SQL Fundamentals** · blocks, variables, %TYPE/%ROWTYPE, scope, literals
- **Ch 19 — Control Structures** · IF/CASE, loops (LOOP/WHILE/FOR), CONTINUE, GOTO
- **Ch 20 — SQL inside PL/SQL** · SELECT INTO, DML, implicit cursor attributes, transaction control
- **Ch 21 — Cursors** · explicit lifecycle, cursor FOR loops, parameterized, FOR UPDATE/WHERE CURRENT OF, REF cursors, cursor variables
- **Ch 22 — Exception Handling** · predefined, non-predefined (PRAGMA EXCEPTION_INIT), user-defined, SQLCODE/SQLERRM, RAISE_APPLICATION_ERROR, propagation
- **Ch 23 — Composite Types & Bulk Processing** · records, %ROWTYPE records, associative arrays, nested tables, VARRAYs, collection methods, BULK COLLECT, FORALL, SAVE EXCEPTIONS
- **Ch 24 — Procedures & Functions** · creation, parameter modes (IN/OUT/IN OUT, NOCOPY), default args, named notation, deterministic, purity, invoker vs definer rights
- **Ch 25 — Packages** · spec/body, public vs private, overloading, forward declaration, package state & initialization, SERIALLY_REUSABLE, key built-in packages
- **Ch 26 — Triggers** · DML (BEFORE/AFTER, row/statement), :OLD/:NEW, WHEN, INSTEAD OF, compound triggers, the mutating-table problem, DDL & database-event triggers, follows/precedes
- **Ch 27 — Dynamic SQL** · EXECUTE IMMEDIATE, bind variables, USING/RETURNING, DBMS_SQL, SQL injection & defenses
- **Ch 28 — Advanced PL/SQL** · native compilation, autonomous transactions (full), pipelined table functions, result cache, PL/SQL function in WITH, conditional compilation, edition-based redefinition, UTL_FILE/DBMS_SCHEDULER overview

### PART IV — ARCHITECTURE & ADMINISTRATION
- **Ch 29 — Oracle Architecture** · instance vs database, SGA components, PGA, background processes (SMON/PMON/DBWn/LGWR/CKPT/ARCn…), the connection/server-process model
- **Ch 30 — Physical & Logical Storage** · datafiles, control files, redo log files; tablespaces, segments, extents, data blocks; the logical-physical mapping
- **Ch 31 — Memory & Process Management** · buffer cache, shared pool (library + dictionary cache), redo log buffer, large/Java/Streams pools, AMM/ASMM, parsing (hard vs soft), the cursor lifecycle
- **Ch 32 — Redo, Undo, Checkpoints & Recovery** · redo stream, undo segments & retention, read consistency mechanics, checkpoints, instance recovery, the role of the WAL
- **Ch 33 — Transactions & Concurrency (Deep)** · MVCC internals, lock types & queues, latches, deadlock detection, isolation levels, ORA-01555
- **Ch 34 — Multitenant (CDB/PDB)** (**12c+**) · container architecture, root/seed/PDBs, common vs local users, plugging/unplugging, application containers, why it exists
- **Ch 35 — The Optimizer & Performance** · CBO, statistics & histograms, cardinality, EXPLAIN PLAN/AUTOTRACE, the plan operators, hints, adaptive plans (**12c**), SQL Plan Management, AWR/ASH/ADDM, bind peeking, cursor sharing
- **Ch 36 — Indexing (Deep)** · B-tree internals, bitmap, composite, function-based, reverse-key, IOT, invisible indexes (**11g**), index monitoring, when indexes hurt
- **Ch 37 — Partitioning** · range/list/hash/composite, interval (**11g**), reference, system, partition pruning, partition-wise joins, local vs global indexes, partition maintenance
- **Ch 38 — Backup, Recovery & Data Movement** · RMAN concepts, backup types, Flashback technologies (query/table/drop/database/Data Archive), Data Pump (expdp/impdp), external tables, SQL\*Loader
- **Ch 39 — Security (Deep)** · authentication methods, privilege analysis, roles & secure application roles, Virtual Private Database (VPD), Data Redaction, Transparent Data Encryption (TDE), unified auditing, least privilege

### PART V — MODERN ORACLE & BEYOND
- **Ch 40 — What Changed, Version by Version** · 11g→12c→18c→19c→21c→23ai feature-by-feature, deprecations & desupports, the release model (LTS vs Innovation)
- **Ch 41 — JSON & Document Data in Oracle** · storing JSON, SQL/JSON functions, JSON dot-notation, JSON data type (**21c**), JSON Relational Duality Views (**23ai**), SODA
- **Ch 42 — Analytics & Data Warehousing in Oracle** · star schemas, materialized views & query rewrite, analytic views, bitmap join indexes, parallel execution, In-Memory Column Store (**12c**)
- **Ch 43 — Oracle in the Cloud & the Converged Database** · Autonomous Database (ADW/ATP), OCI essentials, the converged-database philosophy, Oracle vs single-purpose engines
- **Ch 44 — Oracle and the Modern Data Stack** · how Oracle maps to PostgreSQL, Snowflake, Spark; CDC out of Oracle (GoldenGate/LogMiner); migration patterns; when Oracle is/ isn't the right tool
- **Ch 45 — Best Practices, Anti-Patterns & Gotchas (My Inputs)** · naming, schema design, SQL & PL/SQL style, performance habits, security defaults, the mistakes that bite everyone

---

> **Status (build progress):** This reference is built incrementally to full depth, chapter by chapter.
> - ✅ **Part I — Foundations: COMPLETE** (Ch 1–4).
> - ✅ **Part II — SQL: COMPLETE** (Ch 5–17).
> - ✅ **Part III — PL/SQL: COMPLETE** (Ch 18–28).
> - ✅ **Part IV — Architecture & Administration: COMPLETE** (Ch 29–39: instance/SGA/PGA/background processes; physical & logical storage; parsing & the library cache & hard-vs-soft parse; redo/undo/checkpoints/recovery; MVCC & concurrency internals; multitenant CDB/PDB; the cost-based optimizer, statistics, execution plans, hints, AWR/ASH; indexing in depth incl. bitmap/IOT/function-based/invisible; partitioning & pruning; backup/recovery/RMAN, Flashback, Data Pump/external tables; security in depth — VPD, redaction, TDE, unified auditing).
> - ⏳ **Part V — Modern Oracle & Beyond: pending** (Ch 40–45: version-by-version changes 11g→23ai; JSON & duality views & SODA; analytics/DW, materialized views & In-Memory; cloud/Autonomous/converged database; Oracle vs the modern data stack & migration/CDC; best practices, anti-patterns & gotchas).
>
> **Current size: ~144 printed pages.** To extend, say **"continue the Oracle reference"** and the final part (Part V, Modern Oracle & Beyond) will be written to the same depth and appended, completing the document. The master table of contents above shows the complete intended scope.

---

# PART I — FOUNDATIONS

---

## Chapter 1 — Data, Databases, DBMS, and the Oracle Product

This chapter establishes the vocabulary and mental model that everything else depends on. The classic training notes open here, and for good reason: if you are fuzzy about what a database *is*, what problem a DBMS *solves*, and where Oracle *sits*, every later topic floats free of its foundation. We will move from the most basic distinction — data versus information — up to the architecture of the relational database and Oracle's place in it.

### 1.1 Data versus information

**Data** is raw, unprocessed facts with no inherent meaning on their own: the number `42`, the string `Pune`, the date `2026-06-24`. **Information** is data placed in context so that it answers a question or supports a decision: "*Asha's account balance is ₹42,000*", "*the Pune warehouse shipped 1,240 orders yesterday*". The transformation from data to information is the entire purpose of a database system — to store raw facts reliably and let you combine, filter, and aggregate them into answers.

This distinction matters more than it first appears. A database does not store information; it stores data and the *relationships* among data, and it gives you a language (SQL) to derive information on demand. The same stored fact — a row in an `orders` table — becomes "yesterday's revenue", "this customer's lifetime value", or "the worst-performing region" depending on the query you ask. The data is fixed; the information is generated.

> **DE NOTE.** This is exactly the principle behind the modern analytics stack: you land raw data (bronze), and you derive information through transformation (silver/gold). The data/information distinction from a 1970s database textbook is the same idea as the medallion architecture you use on Databricks.

### 1.2 File systems versus databases — the problem a DBMS solves

Before databases, applications stored data in flat files (text files, spreadsheets, custom binary formats). This works for trivial cases and fails badly at scale. The classic training notes enumerate the problems of the **file-processing approach**, and they are worth understanding because every feature of a DBMS exists to solve one of them:

1. **Data redundancy and inconsistency.** The same fact gets stored in many files (a customer's address in the billing file, the shipping file, the marketing file). When it changes, you must update every copy, and inevitably some are missed, so the copies disagree. Which one is true? The file system cannot say.
2. **Difficulty accessing data.** Each new question ("list customers in Pune who ordered last month") requires writing a new program to walk the files. There is no general query capability.
3. **Data isolation.** Data scattered across many files in many formats is hard to combine.
4. **Integrity problems.** Business rules ("a balance cannot be negative", "every order must reference a real customer") live in application code, if anywhere, and are enforced inconsistently or not at all.
5. **Atomicity problems.** A logical operation that spans several updates (transfer money: debit one account, credit another) can fail halfway, leaving the data corrupt, with no built-in way to undo the partial change.
6. **Concurrent-access anomalies.** When multiple users read and write the same files at once, their operations interleave and corrupt each other's results, and the file system offers no coordination.
7. **Security problems.** Restricting who can see or change which data is crude or impossible at the file level.

A **Database Management System (DBMS)** is software built specifically to solve all of these: it centralizes data to eliminate redundancy, provides a query language for arbitrary access, enforces integrity and security centrally, guarantees atomicity through transactions, and coordinates concurrent access so users do not corrupt each other. Oracle Database is one such DBMS — among the most capable ever built.

### 1.3 What a DBMS does — the core services

A full DBMS provides a layered set of services. Naming them now gives you the map for Parts II–IV:

- **Data definition** — a language (DDL) to define the structure: tables, columns, types, constraints. (Part II, Ch 12.)
- **Data manipulation** — a language (DML/DRL) to insert, update, delete, and query data. (Part II, Ch 5–13.)
- **Transaction management** — guaranteeing **ACID** properties so multi-step changes are all-or-nothing and survive failures. (Ch 14, 32–33.)
- **Concurrency control** — letting many users work simultaneously without corrupting each other's data, via locking and multi-version read consistency. (Ch 14, 33.)
- **Recovery management** — restoring the database to a consistent state after a crash, using redo and undo. (Ch 32, 38.)
- **Security and authorization** — controlling who can do what, via users, privileges, and roles. (Ch 15, 39.)
- **Storage management** — efficiently mapping logical structures to physical storage. (Ch 30.)
- **Query optimization** — automatically finding an efficient way to execute each query. (Ch 35.)
- **A data dictionary (catalog)** — metadata describing the database to itself. (§1.x, Ch 4.)

Oracle implements every one of these, and most of this reference is, at bottom, a tour of how.

### 1.4 Database models through history

Understanding why the relational model won requires knowing what came before. The notes typically sketch this lineage:

- **Hierarchical model (1960s, e.g. IBM IMS).** Data organized as a tree of parent–child records. Fast for tree-shaped queries, rigid and redundant for everything else; many-to-many relationships are awkward, and the access path is hard-wired into the structure.
- **Network model (CODASYL).** A generalization allowing a record to have multiple parents (a graph of sets). More flexible than hierarchical but extremely complex to program, with navigation logic baked into applications.
- **Relational model (Edgar F. Codd, 1970).** Data represented purely as **relations** (tables) of **tuples** (rows), with operations defined mathematically (relational algebra/calculus). The revolutionary idea was **data independence**: you describe *what* you want declaratively, and the system figures out *how* to get it — no navigation logic in the application. This is the model Oracle implements, and the foundation of SQL.
- **Object-oriented and object-relational (1990s).** Attempts to store objects directly; Oracle absorbed the useful parts as **object-relational** features (object types, nested tables) layered on the relational core.
- **NoSQL (2000s+).** Key-value, document, wide-column, and graph databases that relax relational guarantees (fixed schema, strong consistency) for scale or flexibility. Not a replacement for relational systems but a complement — and, notably, Oracle has absorbed much of this too (JSON, the "converged database" of Ch 43).

> **Commentary.** The relational model has now dominated for over fifty years. Its longevity comes from the separation of the logical model (tables and SQL) from the physical implementation (how Oracle actually stores and finds data), which lets the implementation be reinvented repeatedly — indexes, columnar storage, in-memory, cloud — without changing the queries you write. That separation is the single most important idea in this entire document.

### 1.5 The relational database management system (RDBMS)

An **RDBMS** is a DBMS that implements the relational model. Its defining characteristics:

- Data is stored in **tables** (relations): named, two-dimensional structures of rows and columns.
- Each **column** has a name and a **datatype** (its domain of allowed values).
- Each **row** is a single record — one instance of the entity the table represents.
- Relationships between tables are expressed by **values**, not pointers: a foreign-key column in one table holds values that match a primary-key column in another. (Contrast the network model's physical pointers.)
- A declarative language, **SQL**, defines, manipulates, and queries the data.
- The system enforces **integrity constraints** and provides **transactions**, **concurrency control**, and **recovery**.

Oracle is a full RDBMS (and more — it is "object-relational" and, in modern versions, "converged"). When you create a table in Oracle, you are creating a relation; when you write a `SELECT`, you are applying relational operations; when Oracle enforces a foreign key, it is enforcing relational referential integrity. Part I, Ch 2 makes the relational model precise.

### 1.6 ACID and the transactional promise

The single most important guarantee an RDBMS makes — and a defining reason to use one — is summarized by **ACID**. A **transaction** is a logical unit of work (one or more SQL statements) that the database treats as indivisible. ACID describes the four properties it guarantees. (Ch 14 and 32–33 cover the mechanics; here is the conceptual core, because it underlies everything.)

- **Atomicity** — all statements in the transaction complete, or none do. A transfer that debits account A and credits account B either does both or, on any failure, does neither. There is no partial result.
- **Consistency** — a transaction moves the database from one valid state to another, never violating defined constraints (keys, checks, referential integrity). What counts as "valid" is exactly the rules you declared.
- **Isolation** — concurrent transactions do not interfere; each behaves as though it ran alone, even when many run at once. *How completely* they are isolated is governed by isolation levels (Ch 33).
- **Durability** — once a transaction **commits**, its effects survive crashes, power loss, and restarts, guaranteed by Oracle writing a redo record before acknowledging the commit (the write-ahead principle, Ch 32).

> **Why this matters.** ACID is the bedrock that lets you trust a database with money, inventory, and identity. It is also exactly what many NoSQL systems relax for scale — and what the modern lakehouse re-introduces via transaction logs (Delta/Iceberg). When you understand ACID here, you understand both why Oracle is trusted for transactional systems and what the lakehouse is trying to recover for analytics.

### 1.7 OLTP versus OLAP — two workloads, two designs

A distinction that shapes the entire field. Databases serve two broad workload types, and the right design for one is wrong for the other:

| Aspect | **OLTP** (Online Transaction Processing) | **OLAP** (Online Analytical Processing) |
|---|---|---|
| Purpose | Run the business: orders, payments, bookings | Analyze the business: reports, dashboards, trends |
| Typical operation | Read/write a few rows by key | Scan/aggregate millions of rows over few columns |
| Queries | Many, short, predictable | Fewer, complex, ad-hoc |
| Data volume per op | Tiny | Huge |
| Design goal | Fast writes, integrity, concurrency | Fast large reads, aggregation |
| Schema | Highly **normalized** | Often **denormalized** (star schemas) |
| Example | "Insert this order; fetch this account" | "Sum revenue by region by month for 3 years" |

Classic Oracle is an OLTP powerhouse (and does OLAP too, especially with the features in Ch 42). The reason this distinction matters so much is that it explains *normalization vs denormalization* (Ch 3), *row vs columnar storage* (a Part IV / modern theme), and the entire existence of the data warehouse. Oracle's modern "converged" and In-Memory features (Ch 42) aim to serve both workloads from one engine.

> **DE NOTE.** Your operational sources (the Oracle/Postgres/MySQL systems you ingest from) are OLTP; your Snowflake/Databricks warehouse is OLAP. This row is the dividing line of your entire profession.

### 1.8 The Oracle product family and editions

"Oracle" can mean many things. The core product is **Oracle Database**, the RDBMS. Knowing the editions matters for what features you can use and for interviews:

- **Oracle Database Enterprise Edition (EE).** The full product, with all the advanced features (partitioning, advanced compression, advanced security, In-Memory, RAC, Data Guard) available — many as separately licensed *options*.
- **Oracle Database Standard Edition 2 (SE2).** A lower-cost edition with core RDBMS capability but limits (capped CPU/sockets) and without most EE options.
- **Oracle Database Free** (formerly **Express Edition / XE**). A free, resource-limited edition (historically capped at a small amount of data, CPU, and memory) intended for learning, prototyping, and small apps. **This is what you should install to practice everything in this document.** Modern "Oracle Database 23ai Free" is the current incarnation.
- **Oracle Autonomous Database** (cloud). A fully managed, self-tuning, self-patching cloud database (variants: **ADW** for warehousing, **ATP** for transaction processing). An **Always Free** tier exists — also excellent for practice without any install. (Ch 43.)

Beyond the database itself, the Oracle ecosystem includes tools and adjacent products you may meet: **SQL Developer** and **SQLcl** (development tools), **APEX** (low-code app platform built on the DB), **GoldenGate** (replication/CDC), **Data Pump** (logical export/import), **RMAN** (backup/recovery), **Enterprise Manager** (administration), and **Oracle Cloud Infrastructure (OCI)** (the cloud platform). We touch the relevant ones in Part IV–V.

> **Commentary / gotcha.** Many powerful Oracle features are **separately licensed options** on top of Enterprise Edition (Partitioning, In-Memory, Advanced Security, RAC, etc.). In a real job this matters enormously: using a feature you are not licensed for is a compliance and cost problem. When this document describes such a feature, assume it may require EE plus an option unless noted as free/core.

### 1.9 Oracle versions at a glance (and why your notes are "11g")

Your source notes are for **Oracle 11g**, released around 2007–2009. Oracle has advanced enormously since, and a major purpose of this document is to bridge that gap. The lineage, with the headline theme of each release (full feature-by-feature detail is in Ch 40):

- **Oracle 8i / 9i (late 1990s–2001).** "i" for *internet*; introduced Java in the DB, early OLAP/partitioning maturity.
- **Oracle 10g (2003).** "g" for *grid*; Automatic Storage Management (ASM), Automatic Workload Repository (AWR), the move toward self-management.
- **Oracle 11g (2007).** Your notes' version. Result cache, invisible indexes, interval partitioning, Active Data Guard, advanced compression, Flashback Data Archive, edition-based redefinition (11gR2).
- **Oracle 12c (2013).** "c" for *cloud*; the landmark **multitenant (CDB/PDB)** architecture, the **In-Memory Column Store**, adaptive query optimization, `FETCH FIRST` row limiting, identity columns, vastly improved JSON support, pluggable databases.
- **Oracle 18c (2018).** First of the yearly "version = year" naming; polymorphic table functions, private temporary tables, incremental refinements.
- **Oracle 19c (2019).** The **long-term-support (LTS)** release of the 12.2 family — the production standard for years; automatic indexing, SQL quarantine, JSON improvements, real-time statistics.
- **Oracle 21c (2021).** An *innovation* release; **native JSON datatype**, blockchain tables, in-database JavaScript (via MLE), immutable tables.
- **Oracle 23ai (2023/2024).** "ai" appended; the current major LTS-track release. **JSON Relational Duality Views**, **native AI Vector Search**, a real **BOOLEAN** SQL type, schema-level privileges, `IF [NOT] EXISTS` DDL, table value constructor improvements, SQL macros, and many developer-experience features. This is the version whose new ideas you most need to know on top of 11g.

> **Release-model note (19c+).** Oracle now ships *Long-Term Support* releases (e.g. 19c, 23ai) with many years of support, and *Innovation* releases (e.g. 21c) with newer features but shorter support. For production, organizations standardize on LTS releases; for learning the newest capabilities, the Innovation and latest LTS releases matter. 19c was the workhorse of the late 2010s/early 2020s; 23ai is the modern target.

> **How to use the version tags in this document.** Where a concept exists unchanged since 11g, no tag appears. Where behavior or syntax is newer, you will see **12c**/**19c**/**21c**/**23ai** so you know what your 11g notes could not have covered. Ch 40 collects all the version deltas in one place.


---

## Chapter 2 — The Relational Model

Oracle is a relational database, so to understand Oracle deeply you must understand the relational model precisely — not just "data goes in tables", but the formal structure that gives SQL its power and its rules. This chapter makes the model exact. It is the theory beneath every `SELECT` you will ever write.

### 2.1 Relations, tuples, attributes, and domains

The relational model, as Codd defined it, represents all data as **relations**. The formal vocabulary maps onto everyday SQL terms:

| Formal term | SQL/Oracle term | Meaning |
|---|---|---|
| Relation | Table | A set of tuples sharing the same attributes |
| Tuple | Row | One record — a single instance of the entity |
| Attribute | Column | A named property, with a domain |
| Domain | Datatype (+ constraints) | The set of legal values for an attribute |
| Cardinality | Row count | Number of tuples in the relation |
| Degree (arity) | Column count | Number of attributes in the relation |

Several properties follow from "a relation is a **set** of tuples", and they are subtly important:

- **No duplicate tuples.** A true relation is a set, so it contains no two identical rows. (In practice, SQL tables *can* contain duplicate rows unless a key or unique constraint forbids it — a place where SQL diverges from pure relational theory. This is why `SELECT DISTINCT` exists and why every table should have a primary key.)
- **No inherent row order.** A set is unordered, so rows have no intrinsic sequence. If you want a particular order in a result, you must specify `ORDER BY`. *Never* assume rows come back in insertion order, or any order, without it — a rule violated constantly by beginners and a real source of flaky behavior.
- **No inherent column order (theoretically).** Attributes are identified by name, not position. SQL does assign columns a defined order (so `SELECT *` and positional references work), but you should reference columns by name; relying on position is fragile.
- **Atomic attribute values (First Normal Form).** Each cell holds a single, indivisible value from its domain — not a list, not a nested record. (Modern Oracle deliberately bends this with collections and JSON for practical reasons — Ch 17, 41 — but the default relational discipline is one atomic value per cell.)

A **domain** is the most under-appreciated concept here: it is the set of permitted values for an attribute, realized in Oracle as a **datatype** plus any **constraints**. Declaring `salary NUMBER(8,2) CHECK (salary >= 0)` defines a domain: non-negative numbers with up to eight digits and two decimals. Choosing domains well (Ch 5, 12) is your first and cheapest line of defense against bad data.

### 2.2 Codd's twelve rules

Edgar Codd, who invented the relational model, later published **twelve rules** (numbered 0–12, so thirteen) defining what it means for a system to be genuinely relational. No commercial system satisfies all of them perfectly, but they articulate the ideals, and they are a classic interview and exam topic. Summarized:

- **Rule 0 — Foundation rule.** The system must manage data entirely through its relational capabilities.
- **Rule 1 — Information rule.** All data is represented as values in tables — and *only* so. (No hidden pointers or special structures exposed to the user.)
- **Rule 2 — Guaranteed access rule.** Every value is accessible by the combination of table name + primary-key value + column name. No navigation required.
- **Rule 3 — Systematic treatment of NULLs.** NULL must represent missing/inapplicable information uniformly, distinct from any actual value (including zero or empty string), for all datatypes.
- **Rule 4 — Active online catalog.** The database's metadata (the data dictionary) is itself stored as relations and queryable with the same language. (Oracle: the `DBA_/ALL_/USER_` views — §2.x, Ch 4.)
- **Rule 5 — Comprehensive data sublanguage.** There must be at least one language that handles definition, manipulation, integrity, authorization, and transactions — i.e. SQL.
- **Rule 6 — View updating rule.** All views that are theoretically updatable must be updatable by the system. (No system fully achieves this; Oracle updates simple views and offers `INSTEAD OF` triggers for complex ones — Ch 16, 26.)
- **Rule 7 — High-level insert/update/delete.** Set-at-a-time operations, not just row-at-a-time. (One `UPDATE` can change many rows.)
- **Rule 8 — Physical data independence.** Changes to physical storage (indexes, file layout) must not require changes to applications. (The cornerstone idea from Ch 1.)
- **Rule 9 — Logical data independence.** Changes to the logical schema (that preserve information) should not break applications — achieved largely through views.
- **Rule 10 — Integrity independence.** Integrity constraints must be definable in the data sublanguage and stored in the catalog, not buried in applications.
- **Rule 11 — Distribution independence.** Applications should not change when data is distributed across locations.
- **Rule 12 — Nonsubversion rule.** If the system has a low-level (row-at-a-time) interface, it must not be usable to bypass the relational security and integrity rules.

> **Why study these?** They crystallize *why* the relational model is powerful: data as values only, access by value, a self-describing catalog, set-based operations, and independence of the logical model from physical storage. Rules 8 and 9 (physical and logical data independence) are the practical heart — they are what let Oracle re-engineer its internals for decades while your SQL keeps working.

### 2.3 Keys — the heart of relational integrity

Keys are how the relational model identifies rows and relates tables. Getting key vocabulary exact is essential; these terms recur throughout the document and in every interview.

- **Superkey.** Any set of one or more columns whose values uniquely identify a row. (May contain unnecessary columns.)
- **Candidate key.** A *minimal* superkey — a superkey with no extraneous column; removing any column would destroy uniqueness. A table can have several candidate keys.
- **Primary key (PK).** The candidate key chosen as the principal identifier of the table. It is **unique** and **not null** (entity integrity, §2.4). A table has at most one primary key, which may be a single column or a **composite** of several.
- **Alternate key.** A candidate key *not* chosen as the primary key. Enforced with a `UNIQUE` constraint.
- **Composite (compound) key.** A key consisting of more than one column, where the combination is unique though individual columns may not be (e.g. `(order_id, line_no)` in an order-lines table).
- **Foreign key (FK).** One or more columns in a *child* table whose values must match a primary (or unique) key value in a *parent* table, or be null. This is how relationships are represented and **referential integrity** enforced.
- **Natural key.** A key drawn from real-world business attributes (a national ID number, an email, a product SKU).
- **Surrogate key.** An artificial, system-generated identifier with no business meaning (a sequence-generated integer, an identity column), used as the primary key instead of a natural key.

> **Commentary — natural vs surrogate keys.** A perennial design debate. Natural keys are meaningful and avoid an extra column, but they can change (people change email, products get re-SKU'd), they can be large, and they may not be truly unique or stable. Surrogate keys are stable, compact, and meaningless (so they never need to change), at the cost of an extra column and a join to recover the natural value. The dominant modern practice — and the one dimensional modeling *requires* for slowly changing dimensions (Ch 3, and Vol 3 of your DE series) — is to use a surrogate primary key while *also* keeping the natural/business key with a unique constraint. Oracle generates surrogates via **sequences** (Ch 16) or **identity columns** (**12c**, Ch 12).

### 2.4 Integrity rules

The relational model defines integrity rules the database must enforce so that data stays meaningful. Oracle enforces these through constraints (Ch 12).

- **Domain integrity.** Every attribute value must come from its domain — the right datatype, within any `CHECK` conditions, honoring `NOT NULL`. Enforced by datatypes and column constraints.
- **Entity integrity.** Every table must have a primary key, and **no part of a primary key may be null**. Rationale: if the identifier could be null, you could not reliably distinguish or reference rows. Enforced by the `PRIMARY KEY` constraint (which implies `UNIQUE` + `NOT NULL` on every PK column).
- **Referential integrity.** A foreign-key value must either match an existing primary/unique key value in the referenced table or be entirely null. Rationale: a child row must not reference a parent that does not exist (no "orphan" orders pointing at a nonexistent customer). Enforced by the `FOREIGN KEY` constraint, with configurable behavior on parent deletion (`ON DELETE CASCADE` / `SET NULL` / restrict — Ch 12).
- **Key/uniqueness integrity.** Candidate keys must remain unique. Enforced by `PRIMARY KEY` and `UNIQUE` constraints.
- **User-defined (business) integrity.** Arbitrary rules specific to the business ("ship date ≥ order date", "status in a fixed set"). Enforced by `CHECK` constraints and, for rules beyond a single row, by triggers (Ch 26) or application logic.

> **DE NOTE — the warehouse twist.** Classic Oracle *enforces* all of these for you. Cloud data warehouses (Snowflake, BigQuery) famously *do not* enforce primary/foreign keys — they accept the definitions as optimizer hints but allow violations. So in the warehouse world, the referential and uniqueness integrity Oracle gives you for free becomes *your* responsibility, enforced through pipeline tests (dbt) rather than the engine. Understanding what Oracle enforces here is exactly what tells you what you must re-create yourself downstream.

### 2.5 Relational algebra — the operations beneath SQL

SQL is a declarative language, but it rests on **relational algebra**: a small set of operations that take relations as input and produce relations as output. Knowing the algebra demystifies what SQL actually does, and the operators map directly onto SQL constructs. The fundamental operators:

- **Selection (σ).** Choose *rows* matching a predicate. → SQL `WHERE`. `σ_{salary>50000}(employees)`.
- **Projection (π).** Choose *columns*. → SQL `SELECT` list. `π_{name,salary}(employees)`.
- **Union (∪).** All tuples in either of two union-compatible relations (duplicates removed). → SQL `UNION`.
- **Intersection (∩).** Tuples in *both* relations. → SQL `INTERSECT`.
- **Set difference (−).** Tuples in the first relation but not the second. → SQL `MINUS` (Oracle) / `EXCEPT` (standard).
- **Cartesian product (×).** Every tuple of one relation paired with every tuple of the other. → SQL `CROSS JOIN` (or a join with no condition). The raw material of all joins.
- **Rename (ρ).** Rename a relation or its attributes. → SQL aliases (`AS`).

From these, derived operators are defined, the most important being the **join (⋈)**: a Cartesian product followed by a selection on a join condition — formally `R ⋈_θ S = σ_θ(R × S)`. *This definition is the key to understanding both how joins work and why they go wrong:* a join is "pair everything, then keep the matches", which is exactly why an incorrect or missing join condition produces an explosion of rows, and why joining along a one-to-many relationship multiplies rows (the **fan-out trap**, Ch 8). Other derived operators include the **division (÷)** operator (for "find rows related to *all* of a set" queries) and the various outer joins.

> **Why this helps.** When a query returns too many rows, thinking "join = product + filter" tells you the filter is too weak or the relationship is one-to-many. When you reason about query equivalence and optimization (Ch 35), you are reasoning about algebraic rewrites the optimizer performs (push selections before joins, etc.). The algebra is the optimizer's playground and your debugging lens.

### 2.6 NULL and three-valued logic — the model's sharpest edge

No topic causes more silent bugs than **NULL**, so the relational model — and this document — treats it with special care. (We return to NULL operationally in Ch 7; here is the conceptual foundation.)

**NULL represents the absence of a value** — unknown or not applicable. Crucially, NULL is **not** zero, **not** an empty string, and **not** "blank"; it is the *absence* of any value. Two NULLs are not equal to each other, because two unknowns cannot be known to be the same.

This forces SQL into **three-valued logic (3VL)**: a condition evaluates not to just TRUE or FALSE but to **TRUE, FALSE, or UNKNOWN**. Any comparison involving NULL yields UNKNOWN:

- `NULL = 5` → UNKNOWN
- `NULL = NULL` → UNKNOWN (not TRUE!)
- `NULL <> 5` → UNKNOWN
- `5 > NULL` → UNKNOWN

The truth tables for the connectives extend accordingly (writing T/F/U):

```
AND     T    F    U          OR      T    F    U          NOT
T       T    F    U          T       T    T    T          T -> F
F       F    F    F          F       T    F    U          F -> T
U       U    F    U          U       T    U    U          U -> U
```

Two practical consequences follow, and they are the source of countless real bugs:

1. **`WHERE` keeps only rows where the predicate is TRUE.** Rows for which it is UNKNOWN (because of a NULL) are *discarded* — even by a negative condition. So `WHERE commission <> 0` silently omits employees whose `commission` is NULL, because `NULL <> 0` is UNKNOWN, not TRUE. If you meant "everyone whose commission is not exactly zero, including the unknowns", you must write `WHERE commission <> 0 OR commission IS NULL`.
2. **You cannot test for NULL with `=`.** `x = NULL` is always UNKNOWN and therefore never matches. The *only* correct tests are the special operators **`IS NULL`** and **`IS NOT NULL`**.

> **Oracle-specific gotcha — the empty-string quirk.** Oracle has a notorious, non-standard behavior: it treats an **empty string `''` as NULL** for `VARCHAR2`. So `WHERE name = ''` finds nothing (it becomes `WHERE name = NULL` → UNKNOWN), and inserting `''` into a `VARCHAR2` column stores NULL. This differs from the SQL standard and from PostgreSQL (where `''` is a distinct, valid empty string). It is a frequent source of confusion when moving between Oracle and other databases — and a reason to always use `IS NULL`, never `= ''`, in Oracle.

> **The NOT IN landmine (full treatment in Ch 7/10).** Because of 3VL, `x NOT IN (subquery)` returns *no rows at all* if the subquery yields even one NULL — a catastrophic, silent failure. Prefer `NOT EXISTS`, which is null-safe. This single rule prevents a whole category of production incidents, and it is a direct consequence of the three-valued logic introduced here.

> **Commentary.** Some theorists argue NULL was a mistake and that the absence of a value should be modeled differently. Whatever the merits, NULL is deeply embedded in SQL and Oracle, so the practical stance is: understand 3VL cold, always handle NULL explicitly (`IS NULL`, `NVL`/`COALESCE`, `NOT EXISTS`), and never assume a comparison with a possibly-null column behaves the way two-valued intuition expects. More careers' worth of subtle data bugs trace to NULL than to any other single feature of SQL.


---

## Chapter 3 — Data Modeling: ER & Normalization

Before you create a single table, you should design the schema, and the two classic disciplines for that are **Entity-Relationship (ER) modeling** (capturing the structure of the business) and **normalization** (organizing tables to eliminate redundancy and anomalies). The 11g notes cover both; this chapter treats them in depth and connects them to the dimensional modeling you use in analytics.

### 3.1 Conceptual, logical, and physical models

Schema design proceeds through three levels of abstraction, moving from business meaning to Oracle specifics:

- **Conceptual model.** The highest level — entities and relationships in business terms, independent of any database. "Customers place Orders; Orders contain Products." No datatypes, no keys, just meaning. Often an ERD drawn with stakeholders.
- **Logical model.** Refines the conceptual model into a relational structure: tables, columns, primary and foreign keys, normalization applied — but still independent of a specific DBMS. Datatypes are generic.
- **Physical model.** The logical model realized in **Oracle specifically**: exact Oracle datatypes (`VARCHAR2`, `NUMBER`), tablespaces, indexes, partitioning, storage parameters, naming conventions. This is what becomes your `CREATE TABLE` scripts.

> **Why three levels?** Separating them lets business people validate the conceptual model without drowning in technical detail, lets data architects design a sound logical structure without committing to a vendor, and lets DBAs optimize the physical implementation without changing the meaning. It is the design-time expression of the data-independence principle.

### 3.2 Entities, attributes, and relationships

The building blocks of an ER model:

- **Entity.** A thing of interest about which we store data — `CUSTOMER`, `ORDER`, `PRODUCT`. Becomes a **table**. An **entity instance** is one occurrence (one specific customer) and becomes a **row**.
- **Attribute.** A property of an entity — a customer's `name`, `email`, `city`. Becomes a **column**. Attributes have types:
  - **Simple vs composite** — `age` is simple; `address` may be composite (street, city, zip), often split into separate columns.
  - **Single-valued vs multi-valued** — `birth_date` is single-valued; `phone_numbers` may be multi-valued (a customer with several phones). The relational model forbids storing multiple values in one cell (1NF), so multi-valued attributes become a separate related table.
  - **Stored vs derived** — `birth_date` is stored; `age` is derived (computed from birth date and today). Derived attributes are usually *not* stored (to avoid them going stale) but computed on read or via virtual columns (Ch 12).
  - **Key attribute** — an attribute (or set) that uniquely identifies the entity → the primary key.
- **Relationship.** An association between entities — a customer *places* an order, an order *contains* products. Becomes a **foreign key** (for one-to-many) or a **junction/bridge table** (for many-to-many).

### 3.3 Cardinality and participation

Relationships are characterized by **cardinality** (how many) and **participation** (whether mandatory). These determine how the relationship is implemented.

- **Cardinality ratios:**
  - **One-to-one (1:1).** Each instance of A relates to at most one of B, and vice versa (a person and their unique passport). Often modeled as one table, or two tables sharing a key.
  - **One-to-many (1:N).** One instance of A relates to many of B, but each B to one A (one customer, many orders). The *most common* relationship. Implemented by a **foreign key on the "many" side** pointing to the "one" side.
  - **Many-to-many (M:N).** Instances of A relate to many of B and vice versa (students and courses; orders and products). **Cannot** be implemented with a single foreign key; requires a **junction (bridge, associative) table** holding foreign keys to both, whose combination is the primary key.
- **Participation (optionality):**
  - **Total (mandatory).** Every instance must participate — every order must have a customer.
  - **Partial (optional).** An instance may or may not participate — a customer may have zero orders.
  Implemented via `NOT NULL` (mandatory) or nullable (optional) foreign keys, and via business rules.

> **Resolving M:N — the junction table.** Because relational tables cannot directly express many-to-many, you decompose it: `STUDENT (M) — ENROLLMENT — (N) COURSE`, where `ENROLLMENT` has `(student_id, course_id)` as a composite primary key plus foreign keys to each side, and can carry relationship attributes (enrollment date, grade). Recognizing that *every* M:N relationship needs such a table is fundamental modeling skill.

### 3.4 ERD notations

Entity-Relationship Diagrams are drawn in several notations; you should recognize the common ones:

- **Chen notation** — entities as rectangles, attributes as ovals, relationships as diamonds. Verbose but explicit; common in textbooks.
- **Crow's foot (Information Engineering)** — entities as boxes listing attributes; relationships as lines whose endpoints encode cardinality: a "crow's foot" (three prongs) means "many", a single bar means "one", a circle means "optional (zero)". The most widely used notation in practice, and the one Oracle SQL Developer Data Modeler and most tools use.
- **Barker notation** — Oracle's own classic notation (from Oracle's CASE tools), similar in spirit to crow's foot.
- **UML class diagrams** — sometimes used; classes as entities, associations with multiplicities.

In crow's foot, a one-to-many is read as: a bar (one) on the parent end, a crow's foot (many) on the child end; optionality shown by an added circle. You will see these constantly; being able to read cardinality off the line endpoints is the practical skill.

### 3.5 Functional dependencies — the basis of normalization

Normalization is built on **functional dependencies (FDs)**. An FD, written `X → Y` ("X determines Y"), means: for any two rows with the same value of X, they must have the same value of Y. X *functionally determines* Y. Examples in an `employees` table:

- `emp_id → name, salary, dept_id` — the employee id determines everything about the employee (emp_id is a key).
- `dept_id → dept_name` — if `dept_name` were stored in the employees table, the department id would determine the department name (a dependency on a non-key column — a normalization problem).

Key kinds of dependency that the normal forms address:

- **Partial dependency.** A non-key attribute depends on *part* of a composite key, not the whole key. (Violates 2NF.)
- **Transitive dependency.** A non-key attribute depends on another non-key attribute (which depends on the key). `emp_id → dept_id → dept_name`: `dept_name` depends transitively on `emp_id` via `dept_id`. (Violates 3NF.)

Normalization is, formally, the process of decomposing tables to eliminate undesirable functional dependencies, thereby removing redundancy and the **anomalies** it causes.

### 3.6 The normal forms, step by step

The classic notes walk through the normal forms; here is each with its rule, the anomaly it removes, and a worked decomposition. The **anomalies** that motivate the whole exercise:

- **Insertion anomaly.** You cannot record one fact without another. (Cannot add a new department until an employee is assigned to it, if department data lives only in the employees table.)
- **Update anomaly.** A fact stored redundantly must be updated in many places; miss one and the data becomes inconsistent. (A department's name stored on every employee row — rename the department and you must update every such row.)
- **Deletion anomaly.** Deleting one fact unintentionally deletes another. (Delete the last employee in a department and you lose the department's existence entirely.)

Normalization removes redundancy, and with it these anomalies.

**Unnormalized (UNF).** A table with repeating groups or multi-valued cells. Example — an `orders` table that crams everything in, with multiple products per order stuffed into one row. Not even relational.

**First Normal Form (1NF).** *Rule:* each cell holds a single atomic value; no repeating groups; each row is unique (a primary key exists). *Fix:* eliminate multi-valued attributes and repeating groups by giving each value its own row.

```
-- NOT 1NF (products multi-valued in one cell):
-- order_id | customer | products
-- 1001     | Asha     | pen, pencil, eraser

-- 1NF (atomic values; one product per row):
-- order_id | customer | product
-- 1001     | Asha     | pen
-- 1001     | Asha     | pencil
-- 1001     | Asha     | eraser
```

**Second Normal Form (2NF).** *Rule:* be in 1NF **and** have no **partial dependencies** — every non-key attribute depends on the *whole* primary key, not just part of a composite key. (2NF only has teeth when the PK is composite.) *Fix:* move partially-dependent attributes to a table keyed by the part they depend on.

```
-- 1NF but NOT 2NF. PK = (order_id, product_id).
-- customer_name depends only on order_id (partial dependency).
-- product_name depends only on product_id (partial dependency).
-- order_id | product_id | customer_name | product_name | qty

-- 2NF: split out the partial dependencies.
-- ORDERS(order_id PK, customer_name)
-- PRODUCTS(product_id PK, product_name)
-- ORDER_LINES(order_id, product_id PK, qty)   -- qty depends on the whole key
```

**Third Normal Form (3NF).** *Rule:* be in 2NF **and** have no **transitive dependencies** — no non-key attribute depends on another non-key attribute. Every non-key attribute must depend on "the key, the whole key, and nothing but the key." *Fix:* move transitively-dependent attributes to their own table.

```
-- 2NF but NOT 3NF. PK = emp_id.
-- emp_id -> dept_id -> dept_name  (dept_name transitively depends on emp_id)
-- emp_id | name | dept_id | dept_name

-- 3NF: separate the department.
-- EMPLOYEES(emp_id PK, name, dept_id FK)
-- DEPARTMENTS(dept_id PK, dept_name)
```

> 3NF is the practical target for most OLTP schemas: it removes the great majority of redundancy and anomalies while keeping the design simple. The mnemonic — *"every non-key attribute depends on the key, the whole key, and nothing but the key"* — captures 1NF→2NF→3NF in one line (the key = 1NF's requirement of a key; the whole key = 2NF; nothing but the key = 3NF).

**Boyce-Codd Normal Form (BCNF).** *Rule:* a stricter 3NF — for *every* functional dependency `X → Y`, X must be a superkey. 3NF permits a rare case (a non-key attribute determining part of a candidate key) that BCNF forbids. *Fix:* decompose so every determinant is a candidate key. BCNF matters when a table has multiple overlapping candidate keys; for most schemas 3NF and BCNF coincide.

**Fourth Normal Form (4NF).** Removes **multi-valued dependencies** — independent multi-valued facts about the same key stored together, causing a combinatorial explosion of rows. *Fix:* separate independent multi-valued attributes into their own tables. (Rarely an issue if you modeled M:N relationships correctly.)

**Fifth Normal Form (5NF / Project-Join NF).** Removes **join dependencies** — cases where a table can be losslessly decomposed into three or more tables but not two. Highly theoretical; almost never a practical concern.

> **Commentary — how far to normalize.** For OLTP, normalize to **3NF (or BCNF)**: it eliminates the anomalies that corrupt transactional data and keeps writes clean and unambiguous. Going to 4NF/5NF is rarely worth it and usually implies you mis-modeled relationships. The discipline is: *normalize until it hurts, then denormalize until it works* — design in 3NF, then selectively denormalize only where measured read performance demands it (next section).

### 3.7 Denormalization

**Denormalization** is the deliberate introduction of redundancy into a normalized design to improve read performance, accepting the maintenance burden that redundancy creates. It is not "failing to normalize" — it is a conscious trade-off made *after* a normalized design, for specific, measured reasons.

Why denormalize? Normalized schemas spread data across many tables, so answering a question requires joins, and many joins can be slow, especially for analytics over huge tables. Denormalizing — storing a department name redundantly on the employees table, pre-joining tables, pre-computing aggregates — reduces joins and speeds reads. The costs are exactly the anomalies normalization removed: redundant data must be kept consistent (every copy updated together), which is now *your* responsibility (via triggers, application logic, or pipeline jobs) rather than guaranteed by the structure.

When is it justified?

- **Read-heavy, write-light data** where read speed dominates and updates are rare.
- **Analytical/reporting schemas** (the data warehouse), where the entire design philosophy inverts toward denormalization (next section).
- **Specific hot paths** where profiling shows a join is the bottleneck and the redundancy is manageable.

> **DE NOTE.** The OLTP/OLAP split (Ch 1) *is* the normalize/denormalize split. Your operational Oracle/Postgres sources are normalized (3NF) for write integrity; your Snowflake/Databricks gold layer is denormalized (star schemas, wide tables) for read speed. Columnar storage makes denormalization even more attractive in the warehouse (you read only the columns you need regardless of table width). The pipeline you build is, in large part, the controlled denormalization of normalized source data — and *you* now own the consistency that the source's normalization guaranteed.

### 3.8 Dimensional modeling — a primer

Because analytics inverts the design priorities, it uses a different modeling style: **dimensional modeling** (Ralph Kimball). The 11g notes predate its dominance, so this is an addition worth making here (full treatment in Ch 42 and in your DE series Vol 3).

Dimensional modeling splits data into:

- **Fact tables** — the measurable business events (a sale, a shipment), storing numeric **measures** (amount, quantity) and **foreign keys** to dimensions. Fact tables are long and narrow-ish but huge in row count.
- **Dimension tables** — the descriptive context (customer, product, date, store), with many descriptive attributes you filter and group by. Dimensions are wide (many columns) but smaller in row count, and **denormalized** (a star schema) so that querying needs only a single join from fact to each dimension.

Arranged with one fact in the center and dimensions around it, this is a **star schema**. The key decision is the **grain** (what one fact row represents — declare it first, make it atomic), and the key technique for history is the **slowly changing dimension** (SCD), especially **Type 2**, which keeps a new row per version so facts join to the dimension *as it was at the time of the event*. All of this is the analytics counterpart to the OLTP normalization in this chapter, and it is covered fully in Ch 42.

> **Bridge to your work.** Everything in §3.6 (normalization) governs the *sources* you ingest; everything in §3.8 (dimensional) governs the *gold layer* you build. A data engineer must be fluent in both: normalize to understand and extract from sources, dimensionalize to model for consumers.


---

## Chapter 4 — Getting Started: Tools, Connecting, and the Sample Schemas

Theory is necessary but insufficient; you learn Oracle by running statements against a live database. This chapter gets you connected and oriented so that every code example in Parts II–V is something you can actually execute. It covers the editions to install, the client tools, how connections work, the standard practice schemas, and the data dictionary that lets the database describe itself to you.

### 4.1 Editions and installation options for practice

For learning, you do not need (and should not buy) Enterprise Edition. Your realistic options:

- **Oracle Database 23ai Free** — the free, locally-installable edition (successor to Express Edition/XE). Resource-limited but fully featured for learning, including the modern 23ai features. Install it on a VM, a container, or directly. The container route is easiest: Oracle publishes official images, so `docker`/`podman run` of the free image gives you a working database in minutes. This is the recommended path to follow this document hands-on.
- **Oracle Autonomous Database — Always Free.** A cloud database in Oracle Cloud Infrastructure (OCI) with a perpetual free tier (two Always Free Autonomous databases). Nothing to install; you get a fully managed 19c/23ai-class database and a web-based SQL worksheet. Excellent if you prefer not to install anything locally. (Ch 43.)
- **LiveSQL (livesql.oracle.com).** Oracle's free browser-based SQL playground, preloaded with sample schemas and thousands of example scripts. Zero setup; perfect for trying a single statement. Limited for long sessions or administration, but ideal for quick SQL/PL-SQL practice.

> **Recommendation for you.** Use **Oracle Database 23ai Free in a container** for full control (and to practice administration concepts from Part IV), and keep **LiveSQL** open for quick experiments. Both are free and current.

### 4.2 The client tools: SQL*Plus, SQL Developer, SQLcl

You interact with Oracle through a client tool that sends SQL/PL-SQL to the server and shows results. The three you should know:

- **SQL\*Plus.** The original command-line client, present in every Oracle installation. Minimal, scriptable, fast, ubiquitous — and the tool the classic notes assume. You type SQL terminated by `;` (or `/` for PL/SQL blocks), and SQL\*Plus has its own *commands* (not SQL) for formatting and environment control (`SET`, `COLUMN`, `DESCRIBE`, `SPOOL`, etc.). Essential to know because it is always available, especially on servers.
- **SQL Developer.** Oracle's free graphical IDE: a tree of schema objects, a worksheet for running SQL with grid results, visual tools for building queries, debugging PL/SQL, viewing plans, data modeling (Data Modeler), and DBA tasks. The most comfortable environment for development and the one most developers use day to day.
- **SQLcl** ("SQL command line"). A modern command-line client that is essentially SQL\*Plus reimagined — backward-compatible with SQL\*Plus commands but adding niceties: command history, in-line editing, output formats (`SET SQLFORMAT JSON/CSV/...`), built-in commands, and scripting via JavaScript. The modern recommendation for command-line work.

> **Practical note.** Learn enough **SQL\*Plus** to be dangerous (it is always there on a server when nothing else is), do daily development in **SQL Developer** or **SQLcl**, and remember that the *SQL itself* is identical across all of them — the differences are in the surrounding commands and conveniences.

### 4.3 How connecting works: services, easy connect, tnsnames

To connect, a client must locate the database over the network and identify which database/service it wants. Oracle's networking (historically "Oracle Net" / "SQL\*Net") supports several ways to specify this:

- **A connect identifier** names *what* you want to connect to. The user supplies credentials plus a connect identifier, e.g. `username/password@connect_identifier`.
- **Easy Connect** — the simplest form, a literal `host:port/service_name` string, needing no configuration files:
  ```
  sqlplus hr/your_password@//localhost:1521/FREEPDB1
  -- form:  user/pass@//host:port/service_name
  ```
- **tnsnames.ora** — a local file mapping a short **net service name** (alias) to the full connection details, so users type the alias instead of the long descriptor:
  ```
  -- tnsnames.ora entry
  ORCLPDB1 =
    (DESCRIPTION =
      (ADDRESS = (PROTOCOL = TCP)(HOST = localhost)(PORT = 1521))
      (CONNECT_DATA = (SERVICE_NAME = FREEPDB1)))
  -- then: sqlplus hr/your_password@ORCLPDB1
  ```
- **The listener.** A server-side process (the **Oracle Net Listener**) listens on a port (default **1521**), receives incoming connection requests, and hands them to the database. (Ch 29.)
- **Service names vs SIDs.** Older connections used a **SID** (system identifier) naming a specific instance; modern connections use a **service name**, which is more flexible (multiple instances can offer the same service, as in RAC). In multitenant (Ch 34), you connect to a **pluggable database (PDB)** by its service name (e.g. `FREEPDB1` in Oracle Free).

> **Multitenant connection gotcha (12c+).** In modern Oracle, the database is a **container database (CDB)** holding **pluggable databases (PDBs)**. You almost always want to connect to a *PDB* (where user schemas and application data live), not the CDB root. In Oracle Free the default PDB is typically `FREEPDB1`. Connecting to the wrong container is a common early stumbling block — if your tables "disappear", check which container you are in (`SHOW CON_NAME` in SQL\*Plus).

### 4.4 The sample schemas: HR, OE, SH (and more)

Oracle ships standard **sample schemas** used throughout its documentation, training, and this document's examples. Installing them gives you realistic data to query immediately:

- **HR (Human Resources).** The most-used learning schema: `EMPLOYEES`, `DEPARTMENTS`, `JOBS`, `JOB_HISTORY`, `LOCATIONS`, `COUNTRIES`, `REGIONS`. Small, clean, with the relationships (employees→departments, employees→manager via a self-reference, departments→locations) that illustrate joins, hierarchies, and constraints perfectly. Most SQL examples in the classic notes — and many here — use HR.
- **OE (Order Entry).** A richer schema with orders, customers, products, and order items, plus object-relational and XML/JSON features. Good for joins, aggregation, and semi-structured examples.
- **SH (Sales History).** A **star-schema** data-warehouse sample: a large `SALES` fact table with `CUSTOMERS`, `PRODUCTS`, `TIMES`, `CHANNELS`, `PROMOTIONS` dimensions. Ideal for analytic functions, dimensional modeling, partitioning, and materialized views (Ch 17, 37, 42).
- **PM, IX, BI** and others — multimedia, information exchange, and business-intelligence samples, less commonly needed.
- **CO (Customer Orders)** — a newer, simpler sample introduced for modern Oracle, sometimes used in current docs.

In modern Oracle, the sample schemas are distributed via Oracle's GitHub (`oracle-samples/db-sample-schemas`) and can be installed into your Free database. LiveSQL and Autonomous come with samples preloaded.

> **Throughout this document**, when an example references `employees`, `departments`, `orders`, `customers`, or `sales`, assume the HR/OE/SH sample structures (or the small generic schema from your DE study guide). Install HR at minimum so you can run the SQL examples verbatim.

### 4.5 SQL*Plus environment and formatting essentials

When you do use the command line, a handful of SQL\*Plus/SQLcl commands make output readable. These are *client commands*, not SQL — they are not sent to the server:

```sql
-- Describe a table's structure (columns, types, nullability)
DESCRIBE employees;        -- or DESC employees;

-- Control output formatting
SET LINESIZE 200           -- max characters per line before wrapping
SET PAGESIZE 50            -- rows between column-heading repeats
SET PAGESIZE 0             -- suppress headings/page breaks entirely
COLUMN salary FORMAT 999,999.99    -- numeric display format for a column
COLUMN last_name FORMAT A20         -- character column width 20

-- Useful toggles
SET FEEDBACK OFF           -- suppress "N rows selected"
SET TIMING ON              -- show elapsed time per statement
SET AUTOTRACE ON           -- show execution plan + statistics (great for tuning, Ch 35)
SET SERVEROUTPUT ON        -- display DBMS_OUTPUT.PUT_LINE messages (essential for PL/SQL, Part III)

-- Save output to a file
SPOOL results.txt          -- start capturing
-- ... run queries ...
SPOOL OFF                  -- stop capturing

-- Run a script file
@my_script.sql             -- execute SQL/PL-SQL from a file

-- Show / change current container (multitenant)
SHOW CON_NAME              -- which PDB/CDB am I in?
ALTER SESSION SET CONTAINER = FREEPDB1;
```

> **The one you must remember for Part III:** `SET SERVEROUTPUT ON`. Without it, `DBMS_OUTPUT.PUT_LINE` produces nothing visible, and every PL/SQL "hello world" silently does nothing — a classic beginner trap. Turn it on at the start of any PL/SQL session.

### 4.6 The data dictionary — how the database describes itself

Codd's Rule 4 (Ch 2) requires the catalog to be queryable as ordinary tables. Oracle implements this as the **data dictionary**: a vast set of read-only **views** exposing metadata about every object, user, privilege, and structure in the database. Mastering the dictionary is what lets you explore *any* Oracle database, and it is indispensable in real work and interviews.

The dictionary views follow a three-tier naming convention by scope:

- **`USER_*`** — objects owned by *you* (the current schema). `USER_TABLES`, `USER_TAB_COLUMNS`, `USER_CONSTRAINTS`, `USER_INDEXES`, `USER_OBJECTS`, `USER_SOURCE` (your PL/SQL source).
- **`ALL_*`** — objects you can *access* (yours plus those others have granted you). `ALL_TABLES`, `ALL_TAB_COLUMNS`, etc.
- **`DBA_*`** — *every* object in the database, regardless of owner. Requires DBA-level privilege. `DBA_TABLES`, `DBA_USERS`, `DBA_DATA_FILES`, etc.

There are also dynamic performance views, prefixed **`V$`** (and `GV$` in clustered databases), exposing real-time instance state — `V$SESSION` (current sessions), `V$SQL` (cached SQL), `V$INSTANCE`, `V$DATABASE`, `V$LOCK`. These are central to performance work (Ch 35) and administration (Part IV).

```sql
-- What tables do I own?
SELECT table_name FROM user_tables ORDER BY table_name;

-- What columns, types, and nullability does EMPLOYEES have?
SELECT column_name, data_type, data_length, nullable
FROM   user_tab_columns
WHERE  table_name = 'EMPLOYEES'      -- note: stored UPPERCASE by default
ORDER  BY column_id;

-- What constraints are on EMPLOYEES?
SELECT constraint_name, constraint_type, search_condition
FROM   user_constraints
WHERE  table_name = 'EMPLOYEES';
-- constraint_type: P=primary key, R=foreign key (referential),
--                  U=unique, C=check (incl. NOT NULL)

-- Which columns make up each constraint?
SELECT constraint_name, column_name, position
FROM   user_cons_columns
WHERE  table_name = 'EMPLOYEES'
ORDER  BY constraint_name, position;

-- A master index of dictionary views themselves (the dictionary about the dictionary):
SELECT table_name, comments FROM dictionary ORDER BY table_name;     -- DICT for short
SELECT * FROM dict_columns WHERE table_name = 'USER_TABLES';
```

> **Gotcha — identifier case.** By default Oracle stores unquoted identifiers in **UPPERCASE**. So `CREATE TABLE Employees (...)` creates a table whose name is stored as `EMPLOYEES`, and dictionary queries must match `WHERE table_name = 'EMPLOYEES'`. If you create an object with a *quoted* mixed-case name (`CREATE TABLE "Employees"`), it is stored exactly as written and must always be referenced quoted thereafter — a source of endless pain. **Best practice: never quote identifiers; let Oracle uppercase them, and write SQL in any case you like (it is case-insensitive for unquoted identifiers).**

> **Why the dictionary matters so much.** When you join a new team and inherit an undocumented Oracle database, the data dictionary *is* the documentation. "What tables exist, what are their columns and keys, what depends on what, which indexes exist, who has what privilege, what is running right now" — every one of these is a dictionary or `V$` query. Fluency here is a mark of an experienced Oracle practitioner, and it is the practical realization of Codd's self-describing-catalog ideal.

---

> **End of Part I.** You now have the conceptual foundation: what a database and DBMS are, where Oracle sits and how its versions evolved, the precise relational model (relations, keys, integrity, algebra, and the critical NULL/3VL behavior), how to design schemas with ER modeling and normalization (and when to denormalize), and how to connect to Oracle and explore it via the data dictionary. **Part II** now builds SQL on this foundation, in depth and with runnable code — beginning with the sublanguages and Oracle's complete datatype system.


# PART II — SQL IN ORACLE

---

## Chapter 5 — SQL Overview & the Oracle Datatype System

SQL is the language you use to define, change, and query data in Oracle. This chapter frames SQL's sublanguages and then covers Oracle's complete datatype system in detail — because the type you assign each column is your first design decision, your first integrity control, and a frequent source of subtle bugs when chosen carelessly.

### 5.1 The sublanguages of SQL

SQL is conventionally divided into sublanguages by purpose. Knowing which category a statement belongs to matters because they behave differently with respect to transactions (some auto-commit, some do not):

- **DRL — Data Retrieval Language.** `SELECT`. (Sometimes folded into DML.) Reads data; changes nothing. Covered in Ch 6–11, 17.
- **DML — Data Manipulation Language.** `INSERT`, `UPDATE`, `DELETE`, `MERGE`. Changes *data* (rows). Transaction-bound: changes are pending until `COMMIT`. Ch 13.
- **DDL — Data Definition Language.** `CREATE`, `ALTER`, `DROP`, `TRUNCATE`, `RENAME`. Changes *structure* (objects). **In Oracle, DDL auto-commits** — it issues an implicit `COMMIT` before and after, so you cannot roll it back. Ch 12.
- **TCL — Transaction Control Language.** `COMMIT`, `ROLLBACK`, `SAVEPOINT`, `SET TRANSACTION`. Controls transaction boundaries. Ch 14.
- **DCL — Data Control Language.** `GRANT`, `REVOKE`. Controls privileges. (Also auto-commits.) Ch 15.

> **Critical Oracle behavior.** DDL and DCL **auto-commit**; DML does **not**. This means: (1) you cannot undo a `DROP TABLE` or `TRUNCATE` with `ROLLBACK` (though Flashback may save you — Ch 38); (2) issuing any DDL silently commits any pending DML you had not yet committed. Interleaving DDL with delicate multi-step DML is therefore dangerous. PostgreSQL, by contrast, has transactional DDL — a key portability difference (Ch 44).

### 5.2 Character datatypes

Oracle's string types, with their important distinctions:

- **`VARCHAR2(n [CHAR|BYTE])`** — variable-length string up to `n` (max 4000 bytes by default; up to 32767 with extended types — see note). The workhorse string type; use it for almost all text. Stores only the characters present, plus a length. The `CHAR`/`BYTE` qualifier sets whether `n` counts characters or bytes (matters for multibyte character sets — prefer `CHAR` semantics).
- **`CHAR(n)`** — *fixed*-length, blank-padded to exactly `n` (max 2000 bytes). Every value is padded with trailing spaces to the full length. Almost never what you want; use it only for genuinely fixed-width codes. Padding causes subtle comparison surprises.
- **`NVARCHAR2(n)` / `NCHAR(n)`** — the National Character Set variants, for storing Unicode in databases whose main character set is not Unicode. Less needed now that databases commonly use `AL32UTF8` (UTF-8) as the main set.
- **`VARCHAR`** — currently a synonym for `VARCHAR2`, but Oracle warns it may change semantics in future; **always use `VARCHAR2`**, never `VARCHAR`, in Oracle. (This is the opposite advice from PostgreSQL, where `VARCHAR` is standard.)
- **`LONG`** — a legacy type for long text (up to 2GB), deprecated in favor of `CLOB`. Do not use in new designs; you will only meet it in old schemas.

> **Why `VARCHAR2` over `CHAR`.** `CHAR(10)` storing `'PUNE'` actually stores `'PUNE      '` (six trailing spaces). Comparisons get confusing (blank-padded vs non-padded comparison semantics differ), storage is wasted, and bugs creep in. Reserve `CHAR` for true fixed-width codes (a 2-letter state code, perhaps) and use `VARCHAR2` everywhere else.

> **Extended data types (12c+).** From 12c, with `MAX_STRING_SIZE=EXTENDED`, `VARCHAR2`/`NVARCHAR2`/`RAW` can hold up to **32767 bytes** instead of 4000. Useful, but it is a database-level setting with implications; know it exists.

### 5.3 Numeric datatypes

- **`NUMBER(p, s)`** — Oracle's universal exact numeric type. `p` (precision) is total significant digits (1–38); `s` (scale) is digits to the right of the decimal point. `NUMBER(8,2)` holds up to 999,999.99. `NUMBER(5)` holds integers up to 99,999. `NUMBER` with no precision/scale holds any number up to 38 digits with full range. Because it is exact (decimal, not binary floating point), `NUMBER` is the correct type for **money** and any value needing exact arithmetic.
- **`NUMBER` scale tricks.** A negative scale rounds to the left of the decimal: `NUMBER(5,-2)` rounds to hundreds. Scale can exceed precision for small fractions.
- **`FLOAT(p)`** — a subtype of `NUMBER` (binary precision); rarely used; not the same as the binary floats below.
- **`BINARY_FLOAT` / `BINARY_DOUBLE`** (since 10g) — true IEEE 754 single- and double-precision *binary* floating-point types. Faster for heavy scientific computation and support special values (infinity, NaN), but **inexact** — they cannot represent values like 0.1 exactly. **Never use them for money.**
- **Integers.** Oracle has no separate `INT` storage type in the engine; `INTEGER`, `INT`, `SMALLINT` are all mapped to `NUMBER(38)` (an integer subtype). You can write `INTEGER` for clarity; it is stored as `NUMBER`.

> **The money rule (restated, because it bites everyone).** Use `NUMBER(p,s)` for currency and any exact decimal. `BINARY_FLOAT`/`BINARY_DOUBLE` accumulate tiny rounding errors that wreck financial reconciliation. This mirrors the universal rule across all databases: exact decimal types for money, binary floats only for scientific approximation.

### 5.4 Datetime and interval datatypes

Date/time handling is rich in Oracle and a frequent source of confusion; know these precisely:

- **`DATE`** — despite the name, stores **date *and* time** to the second (century, year, month, day, hour, minute, second). It does **not** store fractional seconds or time zone. This surprises people: an Oracle `DATE` always has a time component (defaulting to midnight if you do not specify one).
- **`TIMESTAMP [(fractional_seconds_precision)]`** — date and time *with* fractional seconds (up to 9 digits). Use when sub-second precision matters.
- **`TIMESTAMP WITH TIME ZONE`** — a timestamp that also stores a time-zone offset/region, so it represents an absolute instant unambiguously across zones.
- **`TIMESTAMP WITH LOCAL TIME ZONE`** — stored normalized to the database time zone, and *displayed* converted to the session's time zone. Useful for global applications that want each user to see local time while storage is consistent.
- **`INTERVAL YEAR TO MONTH`** — a span of years and months (e.g. "2 years 3 months"). For age/duration arithmetic in months/years.
- **`INTERVAL DAY TO SECOND`** — a span of days, hours, minutes, seconds (and fractional seconds). For fine-grained durations (e.g. "3 days 4:30:00").

Key date facts and operations (full functions in Ch 7):

```sql
SELECT SYSDATE FROM dual;            -- current date+time of the DATABASE server (DATE)
SELECT SYSTIMESTAMP FROM dual;       -- current TIMESTAMP WITH TIME ZONE of the server
SELECT CURRENT_DATE FROM dual;       -- current date+time in the SESSION's time zone
SELECT CURRENT_TIMESTAMP FROM dual;  -- session-time-zone TIMESTAMP WITH TIME ZONE

-- Date arithmetic: adding a number to a DATE adds DAYS
SELECT SYSDATE + 7  AS next_week  FROM dual;     -- 7 days from now
SELECT SYSDATE + 1/24 AS in_an_hour FROM dual;   -- 1/24 of a day = 1 hour
-- Subtracting two DATEs yields a NUMBER of days (with fractional part for time):
SELECT (SYSDATE - hire_date) AS days_employed FROM employees;
```

> **The date-literal trap.** A string like `'2026-06-24'` is *not* a date — it is a string that Oracle must convert. Relying on implicit conversion with the session's `NLS_DATE_FORMAT` is fragile (it varies by session/locale). Always use an explicit **date literal** `DATE '2026-06-24'` (ANSI, always `YYYY-MM-DD`) or `TO_DATE('24-06-2026','DD-MM-YYYY')` with an explicit format mask. Implicit date conversion is a classic source of `ORA-01843: not a valid month` errors and locale-dependent bugs.

> **DE NOTE — time zones.** As in any system, store instants in a zone-aware type (`TIMESTAMP WITH TIME ZONE` or `WITH LOCAL TIME ZONE`) and convert to local only for display. Plain `DATE`/`TIMESTAMP` (no zone) is a "wall clock" value that becomes ambiguous the moment data crosses regions — the same lesson as in your warehouse work.

### 5.5 Large objects (LOBs)

For data too large for the scalar types, Oracle provides **LOBs**:

- **`CLOB`** — Character LOB; large text up to (4GB × block size). For documents, large JSON/XML-as-text, big descriptions.
- **`NCLOB`** — National-character-set CLOB (Unicode large text).
- **`BLOB`** — Binary LOB; large binary data (images, PDFs, audio) up to (4GB × block size).
- **`BFILE`** — a pointer to a binary file stored *outside* the database in the server's filesystem (read-only from Oracle). The data is not in the DB; only the locator is.

LOBs are stored and accessed specially (often out-of-line, with their own storage settings) and manipulated via the `DBMS_LOB` package in PL/SQL. They replace the deprecated `LONG`/`LONG RAW`.

> **Design note.** Just because you *can* store a 2GB video as a `BLOB` does not mean you should. Large binaries often belong in object storage (or `BFILE`/external storage) with only metadata and a path in the database — exactly the pattern you use with ADLS/S3. Putting huge LOBs inline bloats the database and backups.

### 5.6 ROWID and UROWID

- **`ROWID`** — a pseudo-column (and type) giving the *physical address* of a row: which data file, block, and row within the block. It is the fastest possible way to fetch a specific row (Oracle goes straight to it). You can `SELECT ROWID, ... FROM t` and even use it in a `WHERE` for a re-fetch within a transaction. Used internally by indexes (an index entry maps a key to a ROWID).
- **`UROWID`** — a "universal" ROWID that can also address rows in index-organized tables and foreign tables, where the physical-address concept differs.

> **Gotcha.** A row's `ROWID` can change (e.g. after certain table reorganizations, row movement, or in IOTs), so never store it as a permanent key — it is a transient physical locator, not a logical identifier. Its legitimate uses are short-lived (re-fetch the row I just read) and internal (index→row mapping).

### 5.7 BOOLEAN — finally native (23ai)

**23ai** — Historically, Oracle SQL had **no boolean datatype** (PL/SQL did, but you could not create a `BOOLEAN` *column* in a table). Developers faked it with `CHAR(1)` holding `'Y'`/`'N'` or `NUMBER(1)` holding `0`/`1`, plus a check constraint. **Oracle 23ai finally adds a true SQL `BOOLEAN` type**, so you can now declare `is_active BOOLEAN` and store `TRUE`/`FALSE` directly, and use boolean expressions in SQL.

```sql
-- 23ai: native boolean column
CREATE TABLE feature_flags (
  flag_name VARCHAR2(50) PRIMARY KEY,
  enabled   BOOLEAN DEFAULT FALSE NOT NULL
);
INSERT INTO feature_flags VALUES ('dark_mode', TRUE);
SELECT * FROM feature_flags WHERE enabled;     -- boolean used directly

-- Pre-23ai pattern you will still see everywhere (CHAR flag + check):
CREATE TABLE feature_flags_old (
  flag_name VARCHAR2(50) PRIMARY KEY,
  enabled   CHAR(1) DEFAULT 'N' NOT NULL CHECK (enabled IN ('Y','N'))
);
```

> **Version note.** Because this is brand new, the vast majority of existing Oracle schemas (and your 11g notes) use the `CHAR(1)`/`NUMBER(1)` workaround. Recognize both; use native `BOOLEAN` only when you know you are on 23ai+.

### 5.8 The JSON datatype (21c) and JSON storage

**21c** — Oracle added a **native `JSON` datatype** that stores JSON in an optimized binary format (OSON) for fast querying. Before 21c (including your 11g notes' era and 12c), JSON was stored in `VARCHAR2`/`CLOB`/`BLOB` columns marked with an `IS JSON` check constraint, and queried with SQL/JSON functions. (Full treatment in Ch 41.)

```sql
-- 21c+: native JSON column
CREATE TABLE events (
  event_id NUMBER PRIMARY KEY,
  payload  JSON
);
INSERT INTO events VALUES (1, JSON('{"user": {"id": 42, "city": "Pune"}, "amount": 100}'));
-- query with dot notation:
SELECT e.payload.user.city AS city, e.payload.amount AS amount FROM events e;

-- Pre-21c: store as VARCHAR2/CLOB with an IS JSON constraint
CREATE TABLE events_old (
  event_id NUMBER PRIMARY KEY,
  payload  CLOB CHECK (payload IS JSON)
);
```

> **DE NOTE.** This is Oracle absorbing the semi-structured world — the same move every major database made (Postgres `jsonb`, Snowflake `VARIANT`). It is what makes Oracle a "converged" database (Ch 43): relational *and* document in one engine. The 23ai **JSON Relational Duality Views** push this further (Ch 41).

### 5.9 Type conversion: implicit and explicit

Oracle converts between types in two ways:

- **Implicit conversion** — Oracle automatically converts when it can (a number where a string is expected, a string that looks like a date where a date is expected). Convenient but **dangerous**: it depends on session settings (`NLS_*`), can silently produce wrong results or runtime errors, and can prevent index use (Ch 24). 
- **Explicit conversion** — *you* convert with the conversion functions, making intent and format explicit and behavior deterministic:
  - `TO_CHAR(value, format)` — number/date → string with a format mask.
  - `TO_NUMBER(string, format)` — string → number.
  - `TO_DATE(string, format)` — string → DATE with a format mask.
  - `TO_TIMESTAMP(string, format)` — string → TIMESTAMP.
  - `CAST(value AS type)` — ANSI-standard general conversion.

```sql
-- Explicit, deterministic, locale-independent:
SELECT TO_CHAR(SYSDATE, 'DD-Mon-YYYY HH24:MI:SS') AS formatted FROM dual;
SELECT TO_DATE('24/06/2026', 'DD/MM/YYYY')               FROM dual;
SELECT TO_NUMBER('1.234,56', '9G999D99',
                 'NLS_NUMERIC_CHARACTERS='',.''')         FROM dual;  -- European format
SELECT CAST('42' AS NUMBER), CAST(SYSDATE AS TIMESTAMP)  FROM dual;
```

> **Best practice — never rely on implicit conversion.** Always convert explicitly with an explicit format mask. Implicit conversion is the cause of a huge share of `ORA-01722: invalid number` and `ORA-01843: not a valid month` errors, of locale-dependent bugs that appear only on some servers, and of silently non-sargable predicates (a function Oracle injects around your column to convert it can disable an index — Ch 24). Explicit conversion is self-documenting and deterministic.

> **23ai validation functions.** Modern Oracle adds safer conversion/validation helpers (e.g. `CAST ... DEFAULT ... ON CONVERSION ERROR`, and validation functions) so a bad value yields a default or NULL instead of aborting — analogous to `TRY_CAST`/`SAFE_CAST` in warehouses. `CAST('x' AS NUMBER DEFAULT -1 ON CONVERSION ERROR)` returns -1 instead of raising. Invaluable when loading dirty data.


---

## Chapter 6 — SELECT: The Data Retrieval Language in Depth

`SELECT` is the statement you will write more than any other, and understanding it precisely — especially the *order in which Oracle logically evaluates its clauses* — explains a whole category of behavior and errors. This chapter dissects `SELECT` from its anatomy through projection, aliases, duplicates, ordering, and Oracle's two row-limiting mechanisms.

### 6.1 Anatomy of a SELECT and the logical order of evaluation

A full `SELECT` is built from clauses written in a fixed *syntactic* order — but Oracle evaluates them in a different *logical* order, and that mismatch is the single most clarifying fact about SQL:

```sql
SELECT   department_id, COUNT(*) AS headcount   -- 5. projection (what to return)
FROM     employees                              -- 1. source (which table[s])
WHERE    salary > 5000                          -- 2. row filter (pre-grouping)
GROUP BY department_id                          -- 3. grouping
HAVING   COUNT(*) > 3                            -- 4. group filter (post-grouping)
ORDER BY headcount DESC                          -- 6. ordering
FETCH FIRST 10 ROWS ONLY;                        -- 7. row limiting
```

**Logical evaluation order:** `FROM` → `WHERE` → `GROUP BY` → `HAVING` → `SELECT` → `ORDER BY` → row-limit. Read those numbers: the `SELECT` list you write *first* is evaluated almost *last* (step 5), after rows have been filtered and grouped.

Two consequences fall directly out of this, and both are constant interview questions and beginner errors:

1. **A column alias defined in `SELECT` cannot be used in `WHERE`, `GROUP BY`, or `HAVING`** — because those run *before* `SELECT` computes the alias. But the alias *can* be used in `ORDER BY`, which runs *after* `SELECT`.
2. **`WHERE` filters individual rows before grouping; `HAVING` filters groups after.** That is precisely why a condition on a raw column goes in `WHERE` and a condition on an aggregate goes in `HAVING` (Ch 9).

```sql
-- FAILS: alias 'annual' not yet defined when WHERE runs (ORA-00904)
SELECT salary * 12 AS annual FROM employees WHERE annual > 60000;

-- Works: repeat the expression in WHERE (WHERE sees raw columns/expressions)
SELECT salary * 12 AS annual FROM employees WHERE salary * 12 > 60000;

-- Works: ORDER BY runs after SELECT, so the alias is visible
SELECT salary * 12 AS annual FROM employees ORDER BY annual DESC;
```

> **Hold this order in your head and SQL stops being a list of arbitrary rules.** Why aliases work in `ORDER BY` but not `WHERE`, why you cannot put an aggregate in `WHERE`, why `WHERE` and `HAVING` are different — all are *derived* from the evaluation order, not memorized separately.

### 6.2 Projection and expressions

**Projection** is choosing which columns/expressions to return — the `SELECT` list (relational π, Ch 2). It is not limited to bare columns; each item can be an expression:

```sql
SELECT employee_id,                          -- a column
       first_name || ' ' || last_name,       -- concatenation expression
       salary * 12,                          -- arithmetic
       UPPER(email),                         -- a function call
       CASE WHEN salary > 10000 THEN 'high' ELSE 'std' END,   -- CASE
       100                                   -- a literal (same value every row)
FROM   employees;

SELECT * FROM employees;     -- all columns, in defined order (avoid in production code)
SELECT e.* FROM employees e; -- all columns of a specific table (useful in joins)
```

> **Avoid `SELECT *` in production code.** It reads and transfers columns you may not need (costly, especially on wide tables and *very* costly on columnar stores), breaks if the table's columns change, and obscures intent. Fine for ad-hoc exploration; in saved queries, views, and application code, list the columns you actually use. (This recurs as a performance anti-pattern in Ch 35.)

Arithmetic operators are `+ - * /` with standard precedence (`*`,`/` before `+`,`-`; parentheses to override). Remember NULL arithmetic: **any arithmetic with NULL yields NULL** (`salary + NULL` is NULL), which is why you often wrap nullable columns in `NVL`/`COALESCE` (Ch 7).

### 6.3 Column aliases

An **alias** renames a column/expression in the output. It is essential for readability and *required* in practice for expressions (so downstream consumers, views, and CTEs have a stable name):

```sql
SELECT salary * 12 AS annual_salary,         -- AS is optional but clearer
       first_name || ' ' || last_name "Full Name"   -- quotes needed for spaces/case
FROM   employees;
```

Rules and gotchas: `AS` is optional (a space suffices) but improves clarity. An alias with spaces, special characters, or that you want case-preserved must be **double-quoted** (`"Full Name"`), and then it is displayed exactly so. Without quotes, the alias is uppercased like any identifier. Aliases are usable in `ORDER BY` but not in `WHERE`/`GROUP BY`/`HAVING` (§6.1).

### 6.4 DISTINCT — removing duplicate rows

`DISTINCT` removes duplicate rows from the result, comparing across **all** columns in the `SELECT` list:

```sql
SELECT DISTINCT department_id FROM employees;             -- distinct departments
SELECT DISTINCT department_id, job_id FROM employees;     -- distinct COMBINATIONS
```

> **`DISTINCT` is often a symptom, not a cure.** Unexpected duplicates usually mean a join is multiplying rows (the fan-out trap, Ch 8). Slapping `DISTINCT` on to "fix" them hides the real cause and is expensive — to remove duplicates Oracle must sort or hash the entire result. Before reaching for `DISTINCT`, ask *why* there are duplicates; if a join is fanning out, fix the join. Legitimate uses (genuinely listing distinct values) are fine; reflexive use to paper over a modeling error is a smell. (`UNIQUE` is an Oracle synonym for `DISTINCT` here, but use `DISTINCT`.)

### 6.5 Concatenation, literals, and the concatenation operator

Oracle concatenates strings with the **`||`** operator (and the `CONCAT(a,b)` function, which takes exactly two arguments):

```sql
SELECT first_name || ' ' || last_name AS full_name,
       'Employee ' || employee_id || ' earns ' || salary AS sentence
FROM   employees;
SELECT CONCAT(CONCAT(first_name, ' '), last_name) FROM employees;  -- CONCAT is binary
```

Note: concatenating a NULL with `||` treats the NULL as an empty string (Oracle quirk — `'a' || NULL` is `'a'`, not NULL), which differs from arithmetic. Literals (`'text'`, numbers) in the select list produce the same value on every row.

### 6.6 The DUAL table

**`DUAL`** is a special one-row, one-column table Oracle provides so you can `SELECT` expressions that are not tied to any real table — function calls, calculations, sequence values, the current date:

```sql
SELECT SYSDATE FROM dual;
SELECT 7 * 6 AS answer FROM dual;
SELECT UPPER('pune'), LENGTH('hyderabad') FROM dual;
SELECT employees_seq.NEXTVAL FROM dual;     -- next sequence value (Ch 16)
```

`DUAL` has exactly one row, so any expression selected from it returns exactly one row. It is an Oracle institution (other databases let you `SELECT` without a `FROM`; Oracle traditionally required one, hence `DUAL` — though modern Oracle also allows `SELECT`-without-`FROM` in 23ai). You will see `FROM dual` constantly in Oracle code.

> **23ai note.** Oracle 23ai finally allows `SELECT 7*6;` with **no `FROM` clause** (like PostgreSQL/MySQL). But `DUAL` remains everywhere in existing code, so know it well.

### 6.7 ORDER BY — sorting the result

A relation has no inherent row order (Ch 2), so to get results in a particular sequence you **must** use `ORDER BY`. It is the last clause evaluated, so it can reference column aliases:

```sql
SELECT first_name, last_name, salary, hire_date
FROM   employees
ORDER BY salary DESC,            -- primary sort: highest salary first
         last_name ASC;          -- tie-breaker: alphabetical (ASC is the default)

-- Sort by an alias, an expression, or a column position (position is discouraged):
ORDER BY annual_salary DESC;     -- alias
ORDER BY salary * 12 DESC;       -- expression
ORDER BY 3 DESC;                 -- the 3rd select-list column (fragile; avoid)
```

Important details:

- **`ASC`** (ascending, the default) or **`DESC`** (descending) per column.
- **NULL ordering.** By default Oracle sorts **NULLs *last* for ascending** and *first* for descending. Override explicitly with **`NULLS FIRST`** / **`NULLS LAST`**: `ORDER BY commission_pct DESC NULLS LAST`. State it whenever NULL placement matters — defaults differ across databases.
- **Collation / case.** Sorting of text depends on the character set and `NLS_SORT` setting; by default it is binary (so uppercase sorts before lowercase). Linguistic sorts are available via `NLS_SORT`. (23ai adds column-level collation.)
- `ORDER BY` can sort by columns *not* in the `SELECT` list (since it runs after the row set is built) — except when `DISTINCT` or set operators constrain it.

> **The cardinal rule:** if order matters, specify `ORDER BY`. Never rely on the order rows "happen" to come back in — it depends on the execution plan, indexes, and storage, and can change without warning. Assuming insertion order without `ORDER BY` is a classic source of intermittent, hard-to-reproduce bugs.

### 6.8 Row limiting: ROWNUM vs FETCH FIRST

Returning only the first *n* rows (top-N, pagination) has two mechanisms in Oracle, and the distinction is important because your **11g** notes only have the older one.

**The classic way — `ROWNUM`** (all versions). `ROWNUM` is a pseudo-column assigning 1, 2, 3… to rows *as they are produced*. The subtlety that trips everyone: `ROWNUM` is assigned **before `ORDER BY`**, so you cannot simply write `WHERE ROWNUM <= 10 ORDER BY salary DESC` and get the top 10 salaries — you get 10 arbitrary rows, then sorted. You must sort in a subquery (inline view) first, then apply `ROWNUM` outside:

```sql
-- WRONG: ROWNUM applied before the sort -> 10 arbitrary rows, then sorted
SELECT employee_id, salary FROM employees WHERE ROWNUM <= 10 ORDER BY salary DESC;

-- RIGHT (classic): sort in an inline view, then limit with ROWNUM outside
SELECT * FROM (
  SELECT employee_id, salary FROM employees ORDER BY salary DESC
) WHERE ROWNUM <= 10;

-- Pagination with ROWNUM (the classic, verbose idiom) — rows 11-20:
SELECT * FROM (
  SELECT inner_.*, ROWNUM rn FROM (
    SELECT employee_id, salary FROM employees ORDER BY salary DESC
  ) inner_ WHERE ROWNUM <= 20
) WHERE rn > 10;
```

**The modern way — `FETCH FIRST` / `OFFSET`** (**12c+**, ANSI row-limiting). Far cleaner and what you should use on 12c and later:

```sql
-- Top 10 by salary
SELECT employee_id, salary FROM employees
ORDER BY salary DESC
FETCH FIRST 10 ROWS ONLY;

-- Top 10 PERCENT
SELECT employee_id, salary FROM employees
ORDER BY salary DESC
FETCH FIRST 10 PERCENT ROWS ONLY;

-- WITH TIES: include rows tied with the last one (so you might get >10)
SELECT employee_id, salary FROM employees
ORDER BY salary DESC
FETCH FIRST 10 ROWS WITH TIES;

-- Pagination: skip 10, take 10 (page 2) — clean OFFSET/FETCH
SELECT employee_id, salary FROM employees
ORDER BY salary DESC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;
```

> **The OFFSET pagination trap (same as everywhere).** `OFFSET 1000000 ROWS FETCH NEXT 10` makes Oracle generate, sort, and *discard* a million rows before returning ten — increasingly slow as you page deeper. For large/deep pagination, prefer **keyset (seek) pagination**: remember the last value seen and use `WHERE (sort_key) > (:last_value) ... FETCH FIRST 10`, which an index can satisfy directly. (This is the identical lesson from your DE study guide; it applies in Oracle exactly the same way.)

> **Why know both?** Your 11g notes only have `ROWNUM`; production 11g code is full of the verbose `ROWNUM` pagination idiom, so you must read it. New code on 12c+ should use `FETCH FIRST`/`OFFSET`. Recognize both, write the modern one.

### 6.9 Operator precedence in expressions

When an expression mixes operators, Oracle applies a defined precedence; parenthesize when in doubt. Roughly, from highest to lowest in the parts that bite: arithmetic (`* /` before `+ -`), then concatenation `||`, then comparison (`= != < > <= >= <> IS NULL LIKE IN BETWEEN`), then `NOT`, then `AND`, then `OR`. The two that cause real bugs:

- **`AND` binds tighter than `OR`.** `WHERE a OR b AND c` means `WHERE a OR (b AND c)`, not `(a OR b) AND c`. This silently changes which rows return. **Always parenthesize mixed `AND`/`OR`.**
- Arithmetic before concatenation: `'x' || 1 + 1` is `'x' || (1+1)` = `'x2'`.

```sql
-- Bug: precedence makes this "dept 10, OR (dept 20 AND salary>5000)"
WHERE department_id = 10 OR department_id = 20 AND salary > 5000;
-- Intended (parenthesized): either department, but only well-paid ones
WHERE (department_id = 10 OR department_id = 20) AND salary > 5000;
```

> **Habit:** parenthesize every mixed `AND`/`OR` condition, even when precedence would give the right answer. It costs nothing, documents intent, and prevents a subtle, common class of logic bug that is very hard to spot in review.


---

## Chapter 7 — WHERE & Single-Row Functions

This chapter covers filtering rows (`WHERE` and its predicates, including the critical NULL behaviors) and the **single-row functions** — functions that operate on one value per row and return one value per row. Oracle's function library is large; this is a working reference to the ones you use constantly, grouped by category, each with runnable examples.

### 7.1 The WHERE clause and predicates

`WHERE` filters rows, keeping only those for which its predicate evaluates to **TRUE** (recall 3VL, Ch 2: rows yielding FALSE *or UNKNOWN* are discarded). Predicates use comparison operators combined with `AND`/`OR`/`NOT`:

```sql
SELECT * FROM employees WHERE salary > 5000;
SELECT * FROM employees WHERE department_id = 10 AND salary >= 6000;
SELECT * FROM employees WHERE job_id = 'IT_PROG' OR job_id = 'ST_CLERK';
SELECT * FROM employees WHERE NOT (department_id = 10);
```

Comparison operators: `=`, `!=` (or `<>` or `^=`), `<`, `>`, `<=`, `>=`. Remember operator precedence (Ch 6.9): parenthesize mixed `AND`/`OR`.

### 7.2 Range, membership, and pattern operators

Three operators make common filters concise:

```sql
-- BETWEEN: inclusive of BOTH endpoints (a frequent off-by-one surprise)
SELECT * FROM employees WHERE salary BETWEEN 5000 AND 10000;   -- includes 5000 and 10000
-- equivalent to: salary >= 5000 AND salary <= 10000

-- IN: membership in a list (cleaner than chained ORs)
SELECT * FROM employees WHERE department_id IN (10, 20, 30);
-- NOT IN: see the critical NULL trap in 7.3

-- LIKE: pattern matching. % = any sequence of chars; _ = exactly one char
SELECT * FROM employees WHERE last_name LIKE 'S%';      -- starts with S
SELECT * FROM employees WHERE last_name LIKE '%son';    -- ends with son
SELECT * FROM employees WHERE last_name LIKE '_a%';     -- 2nd char is 'a'
SELECT * FROM employees WHERE phone_number LIKE '%515%';-- contains 515

-- Escaping a literal % or _ in a LIKE pattern:
SELECT * FROM t WHERE code LIKE 'A\_%' ESCAPE '\';      -- code starting "A_"
```

> **`BETWEEN` and dates/timestamps.** `WHERE event_ts BETWEEN DATE '2026-01-01' AND DATE '2026-12-31'` on a column with a *time* component silently *misses* events on Dec 31 after midnight, because the upper bound is `2026-12-31 00:00:00`. Use a **half-open range** instead: `WHERE event_ts >= DATE '2026-01-01' AND event_ts < DATE '2027-01-01'`. This handles every boundary correctly and never loses or double-counts a row — the same rule as in your DE work, applied to Oracle `DATE`/`TIMESTAMP`.

> **`LIKE` and performance.** A leading wildcard (`LIKE '%son'`) cannot use a normal index — Oracle must scan. A trailing wildcard (`LIKE 'S%'`) *can* use an index. For frequent substring/contains search, consider Oracle Text indexes rather than `LIKE '%x%'`. (Sargability, Ch 24.)

### 7.3 NULL in the WHERE clause — the operational rules

This is where the three-valued logic from Ch 2 produces real bugs. The operational rules:

```sql
-- Test for NULL ONLY with IS NULL / IS NOT NULL. Never = NULL (always UNKNOWN).
SELECT * FROM employees WHERE commission_pct IS NULL;       -- correct
SELECT * FROM employees WHERE commission_pct IS NOT NULL;   -- correct
SELECT * FROM employees WHERE commission_pct = NULL;        -- WRONG: returns nothing

-- Negative conditions silently drop NULL rows:
SELECT * FROM employees WHERE commission_pct <> 0;
-- ^ omits employees whose commission_pct is NULL (NULL <> 0 is UNKNOWN, not TRUE)
-- If you want them too:
SELECT * FROM employees WHERE commission_pct <> 0 OR commission_pct IS NULL;
```

**The NOT IN landmine (full treatment).** `x NOT IN (subquery)` returns **no rows at all** if the subquery yields even one NULL, because `x NOT IN (a, b, NULL)` expands to `x<>a AND x<>b AND x<>NULL`, and that last term is UNKNOWN, dragging the whole condition to UNKNOWN for every row. This is a silent, catastrophic failure:

```sql
-- DANGER: if any manager_id in the subquery is NULL, this returns NOTHING
SELECT * FROM employees
WHERE  employee_id NOT IN (SELECT manager_id FROM employees);
-- (manager_id IS NULL for top-level employees, so this subquery DOES return NULL!)

-- SAFE: NOT EXISTS is null-safe and usually as fast or faster
SELECT e.* FROM employees e
WHERE  NOT EXISTS (SELECT 1 FROM employees m WHERE m.manager_id = e.employee_id);

-- Also safe: exclude NULLs from the subquery
SELECT * FROM employees
WHERE  employee_id NOT IN (SELECT manager_id FROM employees WHERE manager_id IS NOT NULL);
```

> **Default to `NOT EXISTS` for anti-joins.** This single habit prevents one of the most common and damaging silent bugs in SQL. The `employees`/`manager_id` example above is the textbook case precisely because top-level employees have a NULL manager — so the naive `NOT IN` really does break on the sample schema. Internalize: `NOT IN` only with a list you *know* has no NULLs; otherwise `NOT EXISTS`.

### 7.4 Character (string) functions

Single-row functions on text. The ones you use constantly:

```sql
-- Case
UPPER('pune')                 -- 'PUNE'
LOWER('PUNE')                 -- 'pune'
INITCAP('john doe')           -- 'John Doe'  (capitalize each word)

-- Length & position
LENGTH('hyderabad')           -- 9
INSTR('hyderabad', 'a')       -- 7  (position of first 'a'; 0 if not found)
INSTR('a.b.c', '.', 1, 2)     -- 4  (2nd occurrence of '.', starting at pos 1)

-- Extract & pad
SUBSTR('hyderabad', 1, 4)     -- 'hyde'  (from position 1, length 4; 1-BASED!)
SUBSTR('hyderabad', -3)       -- 'bad'   (negative start = from the end)
LPAD('42', 5, '0')            -- '00042' (left-pad to width 5 with '0')
RPAD('42', 5, '*')            -- '42***'

-- Trim
TRIM('  hi  ')                -- 'hi'   (both ends)
LTRIM('xxabc', 'x')           -- 'abc'  (strip leading 'x')
RTRIM('abcxx', 'x')           -- 'abc'
TRIM(BOTH '*' FROM '**hi**')  -- 'hi'

-- Replace & translate
REPLACE('a-b-c', '-', '')     -- 'abc'  (replace all occurrences of a substring)
TRANSLATE('abc', 'abc', '123')-- '123'  (char-by-char mapping)

-- Misc
CONCAT('a', 'b')              -- 'ab'  (exactly two args; use || for more)
REVERSE('abc')                -- 'cba'
ASCII('A')                    -- 65
CHR(65)                       -- 'A'
SOUNDEX('Smith')              -- phonetic code (Smith/Smyth match) — fuzzy matching
```

> **1-based positions.** Oracle string positions are **1-based**: the first character is position 1 (not 0 as in most programming languages). `SUBSTR(s, 1, 3)` gets the first three characters. Forgetting this is a constant off-by-one source when porting code from Python/Java.

### 7.5 Number functions

```sql
ROUND(123.456, 2)     -- 123.46  (round to 2 decimals)
ROUND(123.456, -1)    -- 120     (round to tens; negative = left of decimal)
ROUND(123.456)        -- 123     (no precision = round to integer)
TRUNC(123.456, 2)     -- 123.45  (truncate, no rounding)
TRUNC(123.456)        -- 123
CEIL(123.1)           -- 124     (round up to integer)
FLOOR(123.9)          -- 123     (round down to integer)
MOD(17, 5)            -- 2       (remainder)
REMAINDER(17, 5)      -- 2       (like MOD but uses ROUND not FLOOR — differs for negatives)
ABS(-42)              -- 42
SIGN(-42)             -- -1      (-1, 0, or 1)
POWER(2, 10)          -- 1024
SQRT(144)             -- 12
EXP(1)                -- 2.718...
LN(2.718281828)       -- ~1      (natural log)
LOG(10, 1000)         -- 3       (log base 10)
GREATEST(3, 7, 2)     -- 7       (also works on dates/strings)
LEAST(3, 7, 2)        -- 2
```

> **Number vs binary float in division.** Unlike some databases, Oracle's `NUMBER` division does *not* truncate (`7/2` = 3.5, not 3), because `NUMBER` is a single exact decimal type — Oracle has no separate integer storage type. This is a nice difference from PostgreSQL/MySQL, where `7/2` integer division gives 3. But guard against **divide-by-zero** (which *does* error in Oracle): wrap denominators in `NULLIF(denominator, 0)` to get NULL instead of `ORA-01476`.

```sql
SELECT revenue / NULLIF(order_count, 0) AS revenue_per_order FROM daily;  -- null-safe
```

### 7.6 Date functions and date arithmetic

Date handling is rich; these are the essentials (recall: `DATE` includes a time component, Ch 5):

```sql
-- "Now"
SYSDATE                        -- server date+time (DATE)
SYSTIMESTAMP                   -- server TIMESTAMP WITH TIME ZONE
CURRENT_DATE, CURRENT_TIMESTAMP-- in the SESSION's time zone

-- Arithmetic (number added to DATE = DAYS)
SYSDATE + 7                    -- 7 days later
SYSDATE - 1/24                 -- 1 hour ago (1/24 of a day)
hire_date + 90                 -- 90 days after hire

-- Differences
SYSDATE - hire_date            -- NUMBER of days between (fractional)
MONTHS_BETWEEN(SYSDATE, hire_date)   -- number of months (fractional)

-- Adding months/years correctly (handles month lengths)
ADD_MONTHS(hire_date, 6)       -- 6 months after (Oracle's month-aware add)
ADD_MONTHS(DATE '2026-01-31', 1)  -- 2026-02-28 (clamps to end of month)

-- Useful date functions
LAST_DAY(SYSDATE)              -- last day of the current month
NEXT_DAY(SYSDATE, 'MONDAY')    -- next Monday after today
ROUND(SYSDATE, 'MM')           -- round to nearest month start
TRUNC(SYSDATE)                 -- midnight today (strips the time component!)
TRUNC(SYSDATE, 'MM')           -- first day of the current month
TRUNC(SYSDATE, 'YYYY')         -- first day of the current year
TRUNC(SYSDATE, 'DD')           -- midnight (same as TRUNC(SYSDATE))
EXTRACT(YEAR FROM SYSDATE)     -- the year as a number
EXTRACT(MONTH FROM hire_date)  -- the month number
```

> **`TRUNC` on dates is the workhorse of time-series grouping.** `TRUNC(order_date, 'MM')` gives the first of the month, so `GROUP BY TRUNC(order_date,'MM')` produces monthly rollups — the Oracle equivalent of `DATE_TRUNC('month', ...)` in Postgres/warehouses. `TRUNC(date)` with no format strips the time to midnight, which is how you group by *day* despite `DATE` carrying a time. Master `TRUNC` and `EXTRACT`; they cover most date-grouping needs.

> **Common gotcha:** because `DATE` carries time, `WHERE order_date = DATE '2026-06-24'` matches only rows at *exactly* midnight on that date — usually nothing. To match the whole day, use `WHERE order_date >= DATE '2026-06-24' AND order_date < DATE '2026-06-25'` (half-open), or `WHERE TRUNC(order_date) = DATE '2026-06-24'` (but the function on the column disables an index — prefer the range form for performance).

### 7.7 Conversion functions and format models

Convert between strings, numbers, and dates explicitly (never rely on implicit conversion — Ch 5.9):

```sql
-- TO_CHAR: number/date -> formatted string
TO_CHAR(SYSDATE, 'DD-Mon-YYYY')            -- '24-Jun-2026'
TO_CHAR(SYSDATE, 'Day, DD Month YYYY')     -- 'Wednesday, 24 June 2026'
TO_CHAR(SYSDATE, 'HH24:MI:SS')             -- '14:30:05' (24-hour)
TO_CHAR(SYSDATE, 'HH:MI:SS AM')            -- '02:30:05 PM'
TO_CHAR(1234567.89, '9,999,999.99')        -- ' 1,234,567.89'
TO_CHAR(1234.5, 'L99,999.99')              -- currency w/ local symbol, e.g. '   ₹1,234.50'
TO_CHAR(0.25, '90D99')                     -- '0.25' (D=decimal sep, 9=digit, 0=leading zero)
TO_CHAR(255, 'XXX')                        -- 'FF' (hexadecimal)

-- TO_DATE: string -> DATE with an explicit mask
TO_DATE('24-06-2026', 'DD-MM-YYYY')
TO_DATE('2026/06/24 14:30', 'YYYY/MM/DD HH24:MI')

-- TO_NUMBER: string -> number with a mask
TO_NUMBER('1,234.56', '9,999.99')          -- 1234.56
TO_NUMBER('$1,234', 'L9,999')

-- TO_TIMESTAMP for fractional seconds
TO_TIMESTAMP('2026-06-24 14:30:05.123', 'YYYY-MM-DD HH24:MI:SS.FF3')
```

Common **date format model** elements: `YYYY` (4-digit year), `YY` (2-digit), `MM` (month number), `MON` (abbreviated month, 'JUN'), `MONTH` (full, padded), `DD` (day of month), `DY`/`DAY` (weekday), `HH24`/`HH` (24-/12-hour), `MI` (minutes), `SS` (seconds), `FF[1-9]` (fractional seconds), `AM`/`PM`, `D` (day of week), `DDD` (day of year), `WW`/`IW` (week), `Q` (quarter). Number model elements: `9` (digit, suppress leading zeros), `0` (digit, keep zeros), `.`/`D` (decimal), `,`/`G` (group separator), `$`/`L` (currency), `FM` (strip padding).

> **Always pass an explicit format mask.** `TO_DATE('06/07/2026')` is ambiguous (June 7 or July 6?) and depends on the session's `NLS_DATE_FORMAT`, so the same code can behave differently on different servers. `TO_DATE('06/07/2026','DD/MM/YYYY')` is unambiguous and portable. Implicit/locale-dependent date conversion is one of the most common production bugs in Oracle systems.

### 7.8 General and NULL-handling functions

These handle NULLs and conditional logic inline — used constantly:

```sql
-- NVL(a, b): if a is NULL, return b; else a  (Oracle's classic null-default)
NVL(commission_pct, 0)                      -- 0 when commission is NULL
NVL(salary + commission_pct, salary)        -- guard arithmetic against NULL

-- NVL2(a, b, c): if a is NOT NULL return b, else c
NVL2(commission_pct, 'has commission', 'none')

-- COALESCE(a, b, c, ...): first non-NULL argument (ANSI-standard; prefer over NVL)
COALESCE(mobile_phone, home_phone, work_phone, 'no phone')

-- NULLIF(a, b): NULL if a = b, else a  (the divide-by-zero guard)
NULLIF(denominator, 0)

-- DECODE(expr, s1,r1, s2,r2, ..., default): Oracle's old if/else (value-by-value)
DECODE(department_id, 10,'Admin', 20,'Marketing', 30,'Purchasing', 'Other')

-- CASE: ANSI conditional (prefer over DECODE — more readable & flexible)
CASE WHEN salary >= 10000 THEN 'high'
     WHEN salary >= 5000  THEN 'medium'
     ELSE 'low' END                          -- searched CASE (full conditions)

CASE department_id WHEN 10 THEN 'Admin'
                   WHEN 20 THEN 'Marketing'
                   ELSE 'Other' END           -- simple CASE (compare one expr to values)
```

> **`NVL` vs `COALESCE`.** `NVL(a,b)` is Oracle-specific and takes exactly two arguments and *always evaluates both* (so `NVL(x, expensive_function())` runs the function even when x is not null). `COALESCE` is ANSI-standard, takes any number of arguments, returns the first non-NULL, and *short-circuits* (stops at the first non-NULL, so it won't evaluate later expensive arguments). **Prefer `COALESCE`** for portability and short-circuit behavior; `NVL` is fine for simple two-argument defaults and is ubiquitous in existing Oracle code.

> **`DECODE` vs `CASE`.** `DECODE` is an old Oracle-only function doing equality-based value substitution; `CASE` is the ANSI-standard conditional and is more powerful (supports ranges, `AND`/`OR`, any comparison) and more readable. **Prefer `CASE`** in new code; recognize `DECODE` because it pervades older Oracle systems. `CASE` is also the foundation of conditional aggregation and the pivot idiom (Ch 9).


---

## Chapter 8 — Joins

Normalization (Ch 3) deliberately scatters related facts across many tables so each fact lives in one place. **Joins** put them back together: they match rows from one table with rows from another and produce combined rows. Joins are the operation you will use most after `SELECT` itself, and the single most important hazard in all of analytical SQL — the **fan-out trap** — lives here. Oracle supports both the modern **ANSI join syntax** and its own older **legacy `(+)` syntax**, and you must read both because production Oracle code is full of the legacy form.

Recall the formal definition from Ch 2: a join is a Cartesian product followed by a selection on the join condition (`R ⋈_θ S = σ_θ(R × S)`) — "pair everything, then keep the matches." Keep that in mind; it explains every join behavior, including the failures.

### 8.1 Cartesian product / cross join

A **cross join** pairs every row of one table with every row of another, with no join condition — the raw Cartesian product. With 100 rows on each side you get 10,000 rows. Deliberately, it has uses (generate every date × every store for a calendar spine); accidentally, it is a disaster, and it usually happens when you forget or mistype a join condition.

```sql
-- ANSI cross join (explicit and intentional)
SELECT e.last_name, d.department_name
FROM   employees e CROSS JOIN departments d;

-- Legacy / accidental cross join: comma-separated tables with NO join condition
SELECT e.last_name, d.department_name
FROM   employees e, departments d;          -- every employee × every department!
```

> **Gotcha.** The legacy comma syntax `FROM a, b` with the join condition placed (or forgotten) in `WHERE` is exactly how accidental Cartesian products happen: omit the `WHERE e.department_id = d.department_id` and you silently get the full product. If a query suddenly returns a huge number of rows, a missing join condition is the first suspect. The ANSI `JOIN ... ON` syntax makes this far less likely because the condition sits structurally with the join.

### 8.2 Inner joins (ANSI: ON, USING, NATURAL)

An **inner join** returns only rows that have a match on *both* sides. If an employee has no department, an inner join of employees to departments drops that employee. There are three ways to express the join condition in ANSI syntax, and the differences matter:

```sql
-- ON: the general form — write the full join predicate (handles anything)
SELECT e.last_name, d.department_name
FROM   employees e
JOIN   departments d ON e.department_id = d.department_id;
-- (JOIN and INNER JOIN are identical; INNER is optional but explicit)

-- USING: shorthand when the join columns share the SAME name in both tables
SELECT e.last_name, d.department_name, department_id   -- note: no alias on department_id!
FROM   employees e
JOIN   departments d USING (department_id);
-- USING joins on equality of department_id AND collapses the two into ONE column.
-- A column used in USING must NOT be qualified with a table alias (a quirk).

-- NATURAL JOIN: auto-joins on ALL columns the two tables share by name
SELECT last_name, department_name
FROM   employees NATURAL JOIN departments;     -- DANGEROUS — see warning
```

> **Avoid `NATURAL JOIN`.** It joins on *every* identically-named column automatically, so its behavior depends on the table structure. Add an innocuous column with a coincidentally matching name to either table (say both gain a `created_at` or `manager_id`), and the join condition silently changes, corrupting results. It is convenient in a textbook and a liability in production. **Be explicit: use `ON` (always safe), or `USING` when names align and you want the column collapsed.**

> **Legacy inner join (pre-9i style, still everywhere).** Before ANSI joins arrived in Oracle 9i, inner joins were written with comma-separated tables and the condition in `WHERE`:
> ```sql
> SELECT e.last_name, d.department_name
> FROM   employees e, departments d
> WHERE  e.department_id = d.department_id;     -- the legacy inner join
> ```
> This is functionally identical to the ANSI `JOIN ... ON` but mixes join logic with filter logic in `WHERE`, which is harder to read and easier to get wrong (a forgotten condition becomes a cross join). **Prefer ANSI `JOIN ... ON` in new code**; recognize the comma form in old code.

### 8.3 Outer joins (ANSI and Oracle's legacy `(+)`)

An **outer join** keeps unmatched rows from one or both sides, filling the missing side with NULLs. This answers "all employees, *with* their department if they have one" — keeping the departmentless employee instead of dropping them.

```sql
-- LEFT OUTER JOIN: keep ALL rows from the left table (employees),
-- NULLs for department columns where there's no match
SELECT e.last_name, d.department_name
FROM   employees e
LEFT JOIN departments d ON e.department_id = d.department_id;
-- (OUTER is optional: LEFT JOIN == LEFT OUTER JOIN)

-- RIGHT OUTER JOIN: keep ALL rows from the right table (departments),
-- including departments that have no employees
SELECT e.last_name, d.department_name
FROM   employees e
RIGHT JOIN departments d ON e.department_id = d.department_id;

-- FULL OUTER JOIN: keep unmatched rows from BOTH sides
SELECT e.last_name, d.department_name
FROM   employees e
FULL JOIN departments d ON e.department_id = d.department_id;
```

**Oracle's legacy outer-join operator `(+)`.** Before ANSI syntax, Oracle expressed outer joins by placing `(+)` on the side that is allowed to be "missing" (the side that gets NULLs supplied). It appears in `WHERE`:

```sql
-- Legacy LEFT outer join: (+) on the RIGHT side means "supply NULLs on the right
-- so that ALL left rows are kept" — i.e. keep all employees
SELECT e.last_name, d.department_name
FROM   employees e, departments d
WHERE  e.department_id = d.department_id (+);     -- == LEFT JOIN in ANSI

-- Legacy RIGHT outer join: (+) on the LEFT side -> keep all departments
SELECT e.last_name, d.department_name
FROM   employees e, departments d
WHERE  e.department_id (+) = d.department_id;     -- == RIGHT JOIN in ANSI
```

The mnemonic: **`(+)` marks the *deficient* side** — the table that may lack matching rows and will have NULLs invented for it. So `(+)` on the right keeps all left rows (a left join).

> **Legacy `(+)` limitations and why ANSI won.** The `(+)` operator cannot express a **full** outer join (you cannot put `(+)` on both sides), it interacts confusingly with other `WHERE` conditions, it cannot be used with `OR` or `IN`, and it is easy to apply to the wrong side. ANSI outer joins are clearer, more powerful (full joins, complex `ON` conditions), and portable. **Use ANSI `LEFT/RIGHT/FULL JOIN` in all new code.** You must still *read* `(+)` because it saturates older Oracle codebases — a frequent reason engineers struggle with inherited Oracle SQL.

**The anti-join idiom (a left join filtered to non-matches).** A left join plus `WHERE matched_key IS NULL` returns rows that have *no* match — "employees with no department", "customers with no orders":

```sql
-- Employees whose department_id matches no department (orphans / unassigned)
SELECT e.last_name
FROM   employees e
LEFT JOIN departments d ON e.department_id = d.department_id
WHERE  d.department_id IS NULL;        -- keep only the non-matches
```

(This is one way to write an anti-join; `NOT EXISTS` is usually clearer and is null-safe — Ch 10.)

### 8.4 Self-joins

A **self-join** joins a table to itself, which you need to relate rows *within* one table. The classic case in the HR schema: each employee's `manager_id` points to another employee's `employee_id`, so to list each employee beside their manager's name you join `employees` to `employees`, with two different aliases:

```sql
-- Each employee with their manager's name (self-join)
SELECT e.last_name        AS employee,
       m.last_name        AS manager
FROM   employees e
JOIN   employees m ON e.manager_id = m.employee_id;
-- inner join: employees WITHOUT a manager (the top boss) are dropped

-- Keep everyone, showing NULL manager for the top of the hierarchy:
SELECT e.last_name AS employee, m.last_name AS manager
FROM   employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;
```

The two aliases (`e` and `m`) make Oracle treat the one physical table as two logical role-players. Self-joins handle any "rows related to other rows in the same table" question; for walking an arbitrary-depth hierarchy (the whole org chart, any number of levels), you use **hierarchical queries** (`CONNECT BY` / recursive `WITH`, Ch 17) instead.

### 8.5 Non-equijoins

Most joins match on equality (`=`), but a **non-equijoin** matches on a range or other comparison. The classic example: a `job_grades` table with `lowest_sal`/`highest_sal` bounds, joined to employees to find each employee's grade by *where their salary falls*:

```sql
-- Assign each employee a grade by salary range (a BETWEEN join condition)
SELECT e.last_name, e.salary, g.grade_level
FROM   employees e
JOIN   job_grades g ON e.salary BETWEEN g.lowest_sal AND g.highest_sal;
```

The join condition is a range test, not an equality. Non-equijoins are powerful for banding, ranges, and temporal "as-of" joins (matching a fact to the dimension version valid at its time — relevant to slowly changing dimensions, Ch 42).

### 8.6 Multi-table joins

Real queries join several tables. Each additional table needs its own join condition; chain them. With *n* tables you generally need *n−1* join conditions (missing one risks a partial Cartesian product):

```sql
-- employees -> departments -> locations -> countries (4 tables, 3 join conditions)
SELECT e.last_name, d.department_name, l.city, c.country_name
FROM   employees e
JOIN   departments d ON e.department_id = d.department_id
JOIN   locations   l ON d.location_id   = l.location_id
JOIN   countries   c ON l.country_id    = c.country_id
WHERE  e.salary > 5000
ORDER  BY c.country_name, l.city;
```

The optimizer decides the physical **join order** and **algorithm** for you (Ch 35); you just declare the relationships. Readability tip: keep each `JOIN ... ON` on its own line, align the conditions, and qualify every column with its table alias so it is obvious where each comes from.

### 8.7 Join performance and the fan-out trap

Two performance themes, the second of which is the most important single pitfall in this entire chapter.

**Join algorithms (preview of Ch 35).** Oracle physically executes a join with one of three algorithms, chosen by the optimizer: **nested loops** (for each row of A, look up matches in B via an index — great when one side is small or an index exists on the join key), **hash join** (build a hash table on the smaller side, probe with the larger — the workhorse for large equality joins), and **sort-merge join** (sort both inputs on the key, then merge — good when inputs are already sorted). You read which one was chosen in the execution plan (Ch 35); the join condition and available indexes (Ch 24) strongly influence the choice.

**The fan-out trap (the silent killer of analytical SQL).** Recall a join along a one-to-many relationship *repeats* the "one" side once for every matching "many" row. If a department has 50 employees, joining `departments` to `employees` produces 50 rows for that department. That is correct — *until you aggregate*. If you then `SUM` a department-level value (a budget, a headcount target stored on the department), you sum it 50 times, inflating the total fiftyfold. The join *fanned out*, and the aggregate silently over-counted. **No error is raised** — the query runs and returns a plausible but wrong number.

```sql
-- WRONG: department budget counted once PER EMPLOYEE (fan-out over-counts the budget)
SELECT d.location_id, SUM(d.dept_budget) AS total_budget
FROM   departments d
JOIN   employees e ON e.department_id = d.department_id   -- one dept -> many employees
GROUP  BY d.location_id;
-- ^ each department's budget is added once for every employee in it -> inflated

-- RIGHT: pre-aggregate the "many" side, or aggregate budgets without the fan-out.
-- Option A: don't join employees at all if you only need budgets:
SELECT location_id, SUM(dept_budget) AS total_budget
FROM   departments
GROUP  BY location_id;

-- Option B: if you need both budget and a per-employee metric, pre-aggregate employees
-- to ONE row per department before joining:
SELECT d.location_id,
       SUM(d.dept_budget)        AS total_budget,
       SUM(emp.headcount)        AS total_headcount
FROM   departments d
LEFT JOIN (SELECT department_id, COUNT(*) AS headcount
           FROM   employees
           GROUP  BY department_id) emp
       ON emp.department_id = d.department_id
GROUP  BY d.location_id;
```

> **Burn this in.** Whenever you `SUM`, `AVG`, or `COUNT` *after* a join, stop and ask: **did this join multiply my rows?** If it joined along a one-to-many (or many-to-many) relationship, then summing a value from the "one" side over-counts. The fix is to aggregate the many-side to one row per key *before* joining, or to use `COUNT(DISTINCT ...)`. This trap causes more wrong dashboards and failed reconciliations than any other single SQL mistake, and top-tier interviewers probe it directly because catching it marks someone who has been burned in production. It is the same trap described in your DE study guide — it lives in Oracle SQL exactly as it does everywhere.

> **`DISTINCT` is not the fix.** Reaching for `SELECT DISTINCT` to remove fan-out duplicates papers over the symptom, is expensive (a full sort/hash), and still gives wrong aggregates. Fix the *cardinality* of the join (pre-aggregate), don't deduplicate after the fact.


---

## Chapter 9 — Aggregation & Grouping

Aggregation turns many rows into summary numbers — totals, averages, counts per category. This chapter covers the group functions, the mechanics and rules of `GROUP BY`, the crucial `WHERE`-vs-`HAVING` distinction, Oracle's advanced grouping extensions (`ROLLUP`, `CUBE`, `GROUPING SETS`), string aggregation with `LISTAGG`, and the conditional-aggregation/pivot idiom.

### 9.1 Group (aggregate) functions and how they treat NULLs

A **group function** takes many rows and returns a single value. The core ones:

```sql
SELECT COUNT(*)            AS num_rows,         -- count of rows
       COUNT(commission_pct) AS num_with_comm,  -- count of NON-NULL commission values
       COUNT(DISTINCT department_id) AS num_depts, -- count of distinct non-null values
       SUM(salary)         AS total_salary,
       AVG(salary)         AS avg_salary,
       MIN(salary)         AS lowest,
       MAX(salary)         AS highest,
       MEDIAN(salary)      AS median_salary,     -- Oracle has MEDIAN
       STDDEV(salary)      AS sd,
       VARIANCE(salary)    AS var
FROM   employees;
```

**The NULL rule (consistent and critical):** every aggregate **except `COUNT(*)` ignores NULLs**. So:

- `SUM(commission_pct)` adds only the non-null commissions.
- `AVG(commission_pct)` divides the sum by the count of **non-null** values, *not* by the total row count. If 80% of employees have NULL commission, `AVG` averages over only the 20% who have one — which is usually *not* what people assume. If you want NULL treated as zero, average `NVL(commission_pct, 0)` instead.
- `COUNT(column)` counts only rows where that column is non-null; `COUNT(*)` counts all rows including all-NULL ones.

```sql
-- These answer DIFFERENT questions — confusing them gives wrong totals:
SELECT COUNT(*)                      AS all_employees,        -- every employee
       COUNT(commission_pct)         AS employees_with_comm,  -- non-null commission
       AVG(commission_pct)           AS avg_over_earners,     -- ÷ count of non-null
       AVG(NVL(commission_pct, 0))   AS avg_over_everyone     -- ÷ all employees
FROM   employees;
```

> **The `AVG` + NULL gotcha is a classic source of subtly wrong analytics.** "Average commission" can mean two very different numbers depending on whether NULLs count as zero. Decide deliberately and write `AVG(NVL(col,0))` when missing should mean zero. Likewise, know whether you want `COUNT(*)`, `COUNT(col)`, or `COUNT(DISTINCT col)` — three different counts.

### 9.2 GROUP BY and its rules

Used alone, an aggregate collapses the whole table to one row. `GROUP BY` partitions the rows into groups sharing the same value(s) in the grouping column(s) and computes the aggregate once per group:

```sql
-- One row per department, with that department's count and average salary
SELECT department_id,
       COUNT(*)     AS headcount,
       AVG(salary)  AS avg_salary
FROM   employees
GROUP  BY department_id
ORDER  BY department_id;

-- Group by multiple columns: one row per (department, job) combination
SELECT department_id, job_id, COUNT(*) AS n, SUM(salary) AS total
FROM   employees
GROUP  BY department_id, job_id;
```

**The strict rule:** every column in the `SELECT` list must either appear in the `GROUP BY` clause **or** be wrapped in an aggregate function. Anything else is an error in Oracle:

```sql
-- ERROR: last_name is neither grouped nor aggregated (ORA-00979: not a GROUP BY expression)
SELECT department_id, last_name, COUNT(*)
FROM   employees
GROUP  BY department_id;
```

The reason is logical: if you group by `department_id`, each group contains many different `last_name` values — Oracle cannot know *which one* to show, so it refuses. (Some databases, like older MySQL, silently picked an arbitrary value — a notorious source of wrong results. Oracle is strict, which is correct.)

> **Mental model:** after `GROUP BY department_id`, each output row *is* a department, not an employee — so it can only show department-level facts (the grouping column) or summaries of its employees (aggregates). Individual employee attributes no longer make sense at that grain.

### 9.3 WHERE vs HAVING

This distinction follows directly from the logical evaluation order (Ch 6.1): **`WHERE` runs before grouping and filters individual rows; `HAVING` runs after grouping and filters whole groups.** Therefore:

- A condition on a **raw column value** → `WHERE` (applied before grouping).
- A condition on an **aggregate** → `HAVING` (applied after grouping; the aggregate does not exist until then).

```sql
SELECT   department_id, COUNT(*) AS headcount, AVG(salary) AS avg_sal
FROM     employees
WHERE    hire_date >= DATE '2020-01-01'   -- row filter: only employees hired since 2020
GROUP BY department_id
HAVING   COUNT(*) > 3                       -- group filter: only departments with >3 such
ORDER BY headcount DESC;
```

```sql
-- ERROR: can't put an aggregate in WHERE — it doesn't exist yet (ORA-00934)
SELECT department_id FROM employees WHERE COUNT(*) > 3 GROUP BY department_id;
-- Correct: that condition belongs in HAVING.
```

> **Filter early for performance.** Whenever a condition *can* be expressed on raw rows, put it in `WHERE`, not `HAVING` — filtering before grouping means Oracle aggregates fewer rows, which is strictly less work. Reserve `HAVING` for genuine conditions on aggregates. "Push filters as early as possible" is one of the most general performance principles in databases, and it reappears as predicate pushdown in the optimizer (Ch 35) and in Spark/warehouses.

### 9.4 ROLLUP, CUBE, and GROUPING SETS

Sometimes you need totals at *several levels at once* — sales by region *and* product, plus subtotals per region, plus a grand total. Writing that as separate `UNION`ed queries is tedious and slow. Oracle's grouping extensions do it in one pass.

**`ROLLUP`** produces a hierarchy of subtotals, rolling up from the most detailed level to a grand total. `GROUP BY ROLLUP(a, b)` produces: every `(a,b)` combination, plus subtotals per `a` (with `b` NULL), plus one grand total (both NULL):

```sql
SELECT department_id, job_id, SUM(salary) AS total_sal
FROM   employees
GROUP  BY ROLLUP (department_id, job_id)
ORDER  BY department_id, job_id;
-- Rows produced:
--   (dept, job)  -> detail: each job within each department
--   (dept, NULL) -> subtotal: total per department across all jobs
--   (NULL, NULL) -> grand total across everything
```

**`CUBE`** produces *every combination* of the grouping columns — all subtotals across all dimensions, suited to cross-tabulations. `GROUP BY CUBE(a, b)` gives `(a,b)`, `(a,NULL)`, `(NULL,b)`, and `(NULL,NULL)`:

```sql
SELECT department_id, job_id, SUM(salary) AS total_sal
FROM   employees
GROUP  BY CUBE (department_id, job_id);
-- Adds, beyond ROLLUP's output, subtotals per JOB across all departments (NULL, job)
```

**`GROUPING SETS`** lets you specify *exactly* which groupings you want, avoiding combinations you do not need:

```sql
SELECT department_id, job_id, SUM(salary) AS total_sal
FROM   employees
GROUP  BY GROUPING SETS ( (department_id, job_id),  -- detail
                          (department_id),          -- per-department subtotal
                          () );                     -- grand total
```

### 9.5 GROUPING and GROUPING_ID — telling subtotals apart

A practical problem with `ROLLUP`/`CUBE`: a subtotal row has NULL in the rolled-up column — but how do you distinguish *that* NULL ("this is a subtotal across all jobs") from a genuine NULL data value ("job is actually unknown")? The **`GROUPING(col)`** function returns **1** if the column is NULL because it was rolled up (a subtotal), **0** otherwise. **`GROUPING_ID(cols...)`** returns a single number encoding which columns are aggregated, handy for labeling and ordering:

```sql
SELECT
  CASE WHEN GROUPING(department_id) = 1 THEN 'ALL DEPTS' ELSE TO_CHAR(department_id) END AS dept,
  CASE WHEN GROUPING(job_id) = 1 THEN 'ALL JOBS' ELSE job_id END AS job,
  SUM(salary) AS total_sal,
  GROUPING_ID(department_id, job_id) AS gid     -- 0=detail,1/2=subtotal,3=grand total
FROM   employees
GROUP  BY ROLLUP (department_id, job_id)
ORDER  BY GROUPING_ID(department_id, job_id), department_id, job_id;
```

> These extensions are staples of reporting/BI SQL and were largely outside the basic 11g course. They produce, in one efficient pass, the multi-level subtotals that a report needs — far better than self-`UNION`ing several aggregate queries.

### 9.6 LISTAGG — aggregating strings into a list

`LISTAGG` (since 11gR2) concatenates a column's values across a group into a single delimited string — the inverse of splitting, and extremely useful for producing comma-separated lists per group:

```sql
-- One row per department, listing its employees as a comma-separated string
SELECT department_id,
       LISTAGG(last_name, ', ') WITHIN GROUP (ORDER BY last_name) AS employees
FROM   employees
GROUP  BY department_id;
-- e.g.  10 | Whalen
--       20 | Fay, Hartstein

-- 19c+: handle overflow gracefully instead of erroring when the result is too long
SELECT department_id,
       LISTAGG(last_name, ', ' ON OVERFLOW TRUNCATE '...') WITHIN GROUP (ORDER BY last_name)
FROM   employees
GROUP  BY department_id;

-- 19c+: DISTINCT inside LISTAGG to dedupe values
SELECT LISTAGG(DISTINCT job_id, ', ') WITHIN GROUP (ORDER BY job_id) FROM employees;
```

> **Gotcha.** Classic `LISTAGG` raises `ORA-01489` if the concatenated result exceeds the maximum string length (4000 bytes, or 32767 with extended types). The **`ON OVERFLOW TRUNCATE`** clause (12c+) fixes this by truncating gracefully. The **`DISTINCT`** option (19c+) removes the old need to pre-deduplicate in a subquery. Both are modern additions your 11g notes won't mention.

### 9.7 Conditional aggregation and the pivot idiom

One technique deserves singling out because it elegantly solves a whole class of problems: combining `CASE` (Ch 7) with an aggregate to count or sum *only the rows meeting a condition*, all within one grouped query. This computes many segmented metrics in a single pass, and it is how you **pivot** rows into columns without the `PIVOT` operator (Ch 17).

```sql
-- Per department: total count, plus counts of high vs standard earners — in ONE pass
SELECT department_id,
       COUNT(*)                                              AS total,
       COUNT(CASE WHEN salary >= 10000 THEN 1 END)           AS high_earners,
       COUNT(CASE WHEN salary <  10000 THEN 1 END)           AS standard_earners,
       SUM(CASE WHEN commission_pct IS NOT NULL THEN salary ELSE 0 END) AS commissioned_pay,
       AVG(CASE WHEN hire_date >= DATE '2020-01-01' THEN salary END)    AS avg_new_hire_sal
FROM   employees
GROUP  BY department_id;
```

The pattern: an aggregate wraps a `CASE` that "selects" only the rows you want to count or sum for that output column. `COUNT(CASE WHEN cond THEN 1 END)` counts matches (because `CASE` returns NULL when the condition is false, and `COUNT` ignores NULLs); `SUM(CASE WHEN cond THEN value ELSE 0 END)` sums conditionally. Turning this sideways — one `CASE`-aggregate per target column — pivots rows into columns:

```sql
-- Pivot: one row per department, with a salary-total column per job category
SELECT department_id,
       SUM(CASE WHEN job_id = 'IT_PROG'  THEN salary ELSE 0 END) AS it_total,
       SUM(CASE WHEN job_id = 'SA_REP'   THEN salary ELSE 0 END) AS sales_total,
       SUM(CASE WHEN job_id = 'ST_CLERK' THEN salary ELSE 0 END) AS clerk_total
FROM   employees
GROUP  BY department_id;
```

> **This single idiom underlies a huge share of real analytics SQL** — computing many segmented metrics efficiently, and pivoting rows to columns for reports. A dashboard showing, per day, counts of new / active / churned users is almost always conditional aggregation underneath. Master the `CASE`-inside-aggregate pattern; it does more for day-to-day analytical work than almost any other intermediate SQL skill, and it works identically across Oracle, Postgres, and every warehouse. Oracle also has a dedicated `PIVOT` operator (Ch 17) for the common case, but the `CASE` form is universal and more flexible.

---

## Chapter 10 — Subqueries & Common Table Expressions

Real questions are rarely answered by a single flat query. **Subqueries** (queries nested inside other queries) and **common table expressions** (named subqueries via `WITH`) let you build a result from intermediate steps. This chapter covers every kind of subquery, the special behavior of correlated subqueries, inline views, CTEs (including recursive ones), and how to choose among subquery, join, and CTE.

### 10.1 Subqueries by shape: scalar, single-row, multi-row

A **subquery** is a `SELECT` nested inside another statement. Classified by what they return:

- **Scalar subquery** — returns exactly **one row, one column** (a single value), usable anywhere a value is expected.
- **Single-row subquery** — returns one row (possibly several columns); compared with single-row operators (`=`, `>`, `<`, etc.).
- **Multi-row subquery** — returns many rows; compared with multi-row operators (`IN`, `ANY`, `ALL`, `EXISTS`).

```sql
-- Scalar subquery in WHERE: compare each employee to the company-wide average
SELECT last_name, salary
FROM   employees
WHERE  salary > (SELECT AVG(salary) FROM employees);   -- subquery returns ONE value

-- Scalar subquery in the SELECT list (computes a value per row — often better as a join)
SELECT e.last_name, e.salary,
       (SELECT d.department_name FROM departments d
        WHERE d.department_id = e.department_id) AS dept_name
FROM   employees e;

-- Single-row subquery with = (errors if the subquery returns >1 row!)
SELECT last_name, salary FROM employees
WHERE  department_id = (SELECT department_id FROM departments
                        WHERE department_name = 'Executive');
```

> **`ORA-01427: single-row subquery returns more than one row.`** A `=` (or `>`, `<`) comparison requires the subquery to return at most one row. If it might return several, either use a multi-row operator (`IN`) or constrain the subquery to one row. This is among the most common subquery errors.

### 10.2 Multi-row operators: IN, ANY, ALL

When a subquery returns many rows, compare with these:

```sql
-- IN: matches any value in the set (most common)
SELECT last_name FROM employees
WHERE  department_id IN (SELECT department_id FROM departments
                         WHERE location_id = 1700);

-- ANY / SOME: true if the comparison holds for AT LEAST ONE returned value
SELECT last_name, salary FROM employees
WHERE  salary > ANY (SELECT salary FROM employees WHERE department_id = 10);
-- "> ANY(...)" means "> the minimum of the set" (greater than at least one)

-- ALL: true if the comparison holds for EVERY returned value
SELECT last_name, salary FROM employees
WHERE  salary > ALL (SELECT salary FROM employees WHERE department_id = 10);
-- "> ALL(...)" means "> the maximum of the set" (greater than all of them)
```

Useful identities: `> ANY` ≡ greater than the minimum; `> ALL` ≡ greater than the maximum; `< ANY` ≡ less than the maximum; `< ALL` ≡ less than the minimum; `= ANY` ≡ `IN`; `<> ALL` ≡ `NOT IN` (with the same NULL caveats — §10.4).

> **NULL caveat (again).** `IN`/`ANY`/`ALL` inherit three-valued-logic behavior. In particular `<> ALL (subquery)` (equivalent to `NOT IN`) breaks if the subquery returns a NULL — same landmine as Ch 7. Prefer `NOT EXISTS` for "none of" logic.

### 10.3 Correlated subqueries

Most subqueries are **independent** — they could run on their own, and the outer query just uses the result. A **correlated subquery** references a column from the *outer* query, so it cannot run alone and is conceptually re-evaluated for each outer row:

```sql
-- Employees who earn more than their OWN department's average.
-- The inner query references the outer row's department_id (the correlation).
SELECT e.last_name, e.salary, e.department_id
FROM   employees e
WHERE  e.salary > (SELECT AVG(e2.salary)
                   FROM   employees e2
                   WHERE  e2.department_id = e.department_id);  -- correlation here
```

The inner query's `e.department_id` reaches out to the current outer row, so it computes a *different* average for each department. Correlated subqueries read naturally for "compare each row to a group it belongs to" questions, but the "evaluated once per outer row" mental model warns of their cost: over a large outer table they can be slow if the optimizer cannot rewrite them into a join. Good optimizers often do rewrite them, but recognize the pattern and know an equivalent join (or a window function, Ch 17) is sometimes faster.

### 10.4 EXISTS and NOT EXISTS — semi-joins and anti-joins

`EXISTS (subquery)` is TRUE if the subquery returns **at least one row** (it doesn't matter *what* the row contains, so convention is `SELECT 1`). It expresses "are there any matching rows?" — a **semi-join** — without duplicating outer rows or returning inner columns. `NOT EXISTS` is its opposite — an **anti-join** — and is **null-safe**, unlike `NOT IN`.

```sql
-- SEMI-JOIN: departments that HAVE at least one employee (no duplication of departments)
SELECT d.department_name
FROM   departments d
WHERE  EXISTS (SELECT 1 FROM employees e WHERE e.department_id = d.department_id);

-- ANTI-JOIN: departments with NO employees (null-safe, unlike NOT IN)
SELECT d.department_name
FROM   departments d
WHERE  NOT EXISTS (SELECT 1 FROM employees e WHERE e.department_id = d.department_id);
```

> **`NOT EXISTS` vs `NOT IN` — the decisive guidance.** `NOT EXISTS` is null-safe by construction: it simply checks for the absence of matching rows, and a NULL in the inner query cannot silently nullify the whole condition the way it does with `NOT IN` (Ch 7). On most queries the optimizer executes `NOT EXISTS` at least as efficiently. **Make `NOT EXISTS` your default for "rows with no match" queries**; reserve `NOT IN` for hard-coded literal lists you know contain no NULLs. This single habit eliminates one of SQL's most damaging silent bugs.

### 10.5 Inline views (subquery in the FROM clause)

A subquery in the `FROM` clause is an **inline view** (a "derived table"): a virtual table the outer query reads from. This is one of the most important patterns in analytical SQL, because building a query as *layers* of inline views lets you compute step by step — and it is exactly the **pre-aggregation** that defeats the fan-out trap (Ch 8):

```sql
-- Pre-aggregate employees to one row per department, THEN join to departments
-- (the anti-fan-out pattern): the join is now one-to-one, so nothing multiplies.
SELECT d.department_name, stats.headcount, stats.avg_salary
FROM   departments d
JOIN   (SELECT department_id,
               COUNT(*)    AS headcount,
               AVG(salary) AS avg_salary
        FROM   employees
        GROUP  BY department_id) stats          -- <- inline view (derived table)
       ON stats.department_id = d.department_id;

-- Inline views also enable top-N / pagination with ROWNUM (Ch 6):
SELECT * FROM (SELECT employee_id, salary FROM employees ORDER BY salary DESC)
WHERE  ROWNUM <= 5;
```

The inline view must be given an alias (a name) so the outer query can reference its columns. Layering inline views is how complex analytical queries are built — though for readability, named CTEs (next) are usually better.

### 10.6 Common Table Expressions: WITH

A **Common Table Expression (CTE)**, introduced with `WITH`, is a *named* subquery defined at the top of a statement and referenced in the main query as if it were a table. Functionally a CTE often resembles an inline view, but it transforms readability: instead of nesting derived tables inside derived tables (which forces the reader to unwind from the inside out), you define each step as a named CTE and compose them top to bottom, in the order a human thinks.

```sql
-- The same logic as nested inline views, but readable top-to-bottom and self-documenting
WITH dept_avg AS (
    SELECT department_id, AVG(salary) AS avg_sal
    FROM   employees
    GROUP  BY department_id
),
above_avg AS (
    SELECT e.employee_id, e.last_name, e.department_id, e.salary, d.avg_sal
    FROM   employees e
    JOIN   dept_avg d ON d.department_id = e.department_id
    WHERE  e.salary > d.avg_sal           -- earns above their department's average
)
SELECT department_id, COUNT(*) AS num_above_avg
FROM   above_avg
GROUP  BY department_id
ORDER  BY num_above_avg DESC;
```

You can define several CTEs in one `WITH` clause (comma-separated), and later ones can reference earlier ones, building a pipeline of named transformations. CTEs can be referenced multiple times in the main query.

> **CTEs are how production analytical SQL stays maintainable.** A real transformation query might involve a dozen steps; written as nested subqueries it becomes unreadable, but written as a sequence of well-named CTEs it reads like a documented pipeline, and each step can be tested in isolation by selecting from it. This is exactly the style dbt encourages (your DE work). **Oracle-specific note:** Oracle may *materialize* a CTE (compute it once into a temporary result) or *inline* it; you can hint `/*+ MATERIALIZE */` or `/*+ INLINE */` to influence this when it matters for performance.

### 10.7 Recursive WITH — hierarchies in standard SQL

A **recursive CTE** references itself, letting standard SQL walk a hierarchy or graph of arbitrary depth — an organization chart, a bill of materials, a folder tree. (Oracle also has its own older `CONNECT BY` syntax for this, covered in Ch 17; recursive `WITH` is the ANSI-standard, portable approach, supported in Oracle since 11gR2.) A recursive CTE has two parts joined by `UNION ALL`: an **anchor** member (the starting rows) and a **recursive** member that joins the CTE back to the table to find the next level, repeating until no new rows are produced.

```sql
-- Walk the org chart from the top down, numbering each level (recursive WITH)
WITH org (employee_id, last_name, manager_id, lvl) AS (
    -- ANCHOR: the top of the hierarchy (no manager)
    SELECT employee_id, last_name, manager_id, 1
    FROM   employees
    WHERE  manager_id IS NULL
    UNION ALL
    -- RECURSIVE: everyone reporting to someone already in 'org'
    SELECT e.employee_id, e.last_name, e.manager_id, o.lvl + 1
    FROM   employees e
    JOIN   org o ON e.manager_id = o.employee_id
)
SELECT lvl, employee_id, LPAD(' ', (lvl-1)*3) || last_name AS indented_name
FROM   org
ORDER  BY lvl, last_name;
```

> **Always guarantee termination.** A recursive CTE keeps iterating until the recursive part returns no new rows. If the data contains a **cycle** (A reports to B who reports back to A, perhaps from a data-quality problem), a naive recursion loops until it errors or exhausts memory. Defend with a depth cap (`WHERE o.lvl < 100`) or, in Oracle, the `CYCLE` clause that marks and stops cycles. Never run unbounded recursion over data you do not fully trust — a real risk when ingesting imperfect source data.

> **Recursive `WITH` vs `CONNECT BY`.** Oracle's proprietary `CONNECT BY` (Ch 17) is more concise for hierarchies and has handy pseudo-columns (`LEVEL`, `SYS_CONNECT_BY_PATH`, `CONNECT_BY_ISLEAF`), and it pervades Oracle codebases. Recursive `WITH` is ANSI-standard and portable (works in Postgres, SQL Server, etc.) and handles general graphs more naturally. Know both; prefer recursive `WITH` for portability, `CONNECT BY` when working in Oracle-only code or when its pseudo-columns are convenient.

### 10.8 Choosing: subquery vs join vs CTE

These tools overlap; the same question can often be answered several ways. Practical guidance:

- Use a **join** when you genuinely need columns from multiple tables combined into wider rows — the natural, usually most efficient choice.
- Use a **subquery** (scalar or in `WHERE`) for a quick filter or a single computed value, where introducing a named step would be overkill — e.g. `WHERE salary > (SELECT AVG(salary) ...)`.
- Use an **inline view** when a step must be pre-aggregated before joining (the anti-fan-out pattern), or when you need a derived table inline.
- Use a **CTE (`WITH`)** when the logic has multiple steps, a step is reused, or naming intermediate results makes the query dramatically easier to read and maintain — which, for any non-trivial analytical query, it almost always does.
- Use **`EXISTS`/`NOT EXISTS`** for "has any match" / "has no match" (semi-/anti-joins), preferring them over `IN`/`NOT IN` for null-safety.

> **Favor clarity first.** In modern Oracle's optimizer, the performance difference between an equivalent join, inline view, and (inlined) CTE is frequently negligible, so write the version a future colleague can understand and only restructure for performance if profiling (Ch 35) demands it. Readability is a real, lasting cost saving on any query that lives longer than a day.

---

## Chapter 11 — Set Operators

Set operators combine the results of two queries **vertically** — stacking or comparing whole result sets rather than joining columns side by side (which is what joins do). They correspond directly to the relational-algebra operators from Ch 2: `UNION` is set union, `INTERSECT` is intersection, and `MINUS` is set difference. This is a short but important chapter.

### 11.1 UNION and UNION ALL

`UNION` combines the rows of two queries and **removes duplicate rows** from the combined result. `UNION ALL` combines them and **keeps every row**, duplicates included. This is not merely a cosmetic difference — it is a significant performance distinction:

```sql
-- UNION ALL: keep everything (fast — no de-duplication pass). Usually what you want.
SELECT employee_id, last_name FROM employees_india
UNION ALL
SELECT employee_id, last_name FROM employees_us;

-- UNION: removes duplicates across the combined result (sorts/hashes — slower)
SELECT city FROM customers
UNION
SELECT city FROM suppliers;          -- each distinct city appears once
```

> **Use `UNION ALL` by default.** To eliminate duplicates, `UNION` must sort or hash the entire combined result, which on large inputs is expensive. `UNION ALL` simply concatenates and does no such work. Reach for plain `UNION` only when you genuinely need duplicate elimination *and* cannot guarantee the inputs are already disjoint. A great many queries use `UNION` out of habit when `UNION ALL` would be correct and faster — paying for a de-duplication that removes nothing.

### 11.2 INTERSECT

`INTERSECT` returns only rows that appear in **both** queries:

```sql
-- Customers who are ALSO suppliers (same id in both)
SELECT customer_id FROM customers
INTERSECT
SELECT supplier_id FROM suppliers;
```

Like `UNION`, `INTERSECT` removes duplicates by default. It expresses "in both sets" far more clearly than the join-based equivalent, and it treats NULLs as matching across all selected columns at once — sidestepping the `NOT IN` NULL trap.

> **23ai addition.** Oracle 23ai adds **`INTERSECT ALL`** (and `MINUS ALL`, `EXCEPT ALL`) that retain duplicates with multiset semantics, plus the ANSI keyword **`EXCEPT`** as a synonym for `MINUS` (see §11.3). Your 11g notes have only the duplicate-removing `INTERSECT`/`MINUS`.

### 11.3 MINUS (and EXCEPT)

`MINUS` returns rows from the **first** query that do **not** appear in the second — set difference:

```sql
-- Customers who have NEVER placed an order
SELECT customer_id FROM customers
MINUS
SELECT customer_id FROM orders;
```

> **`MINUS` vs `EXCEPT` — a portability note.** Oracle historically uses the keyword **`MINUS`**; the SQL standard (and PostgreSQL, SQL Server) uses **`EXCEPT`** for the identical operation. **Oracle 23ai now also accepts `EXCEPT`** as a synonym. So on 11g–21c use `MINUS`; on 23ai either works; when porting to other databases, `MINUS` becomes `EXCEPT`. This is one of the most common keyword differences encountered when moving SQL between Oracle and other engines (Ch 44).

`MINUS` is the clean way to express anti-join-style "in A but not B" questions across whole rows, and (like `INTERSECT`) it handles NULLs safely, unlike `NOT IN`.

### 11.4 Rules for combining queries

Set operators impose three requirements that follow from the idea of stacking rows:

1. **Same number of columns.** Both queries must select the same number of columns — you cannot stack a 3-column result on a 4-column one.
2. **Compatible datatypes by position.** Corresponding columns (matched **by position**, not name) must have compatible types — a text column does not stack under a numeric one.
3. **Column names come from the first query.** The result's column headings are taken from the *first* query; the second query's names are ignored.

```sql
-- Columns are matched BY POSITION. This compiles but is NONSENSE if the lists differ:
SELECT employee_id, last_name FROM employees      -- (number, text)
UNION ALL
SELECT last_name, employee_id FROM employees;     -- (text, number) -> type mismatch error
-- ^ position 1 must be type-compatible with position 1, etc.
```

> **Match columns by position, not name — a real hazard.** Set operators align columns purely by their position in each `SELECT` list. If the two queries are maintained separately and someone reorders one, you can silently stack the wrong columns together (and if both are the same type, no error is raised — just wrong data). Always verify the `SELECT` lists line up positionally, list columns explicitly (never `SELECT *` in a set operation), and consider aliasing both sides identically for clarity.

### 11.5 Ordering and precedence of combined results

A single `ORDER BY` may appear, only at the very **end**, and it applies to the *entire* combined result (not the individual queries) — which makes sense, since you are ordering the final set:

```sql
SELECT city, 'customer' AS source FROM customers
UNION ALL
SELECT city, 'supplier' AS source FROM suppliers
ORDER  BY city;          -- orders the whole combined result; must be last
```

When **three or more** queries are combined, operators are evaluated **top to bottom**, except that `INTERSECT` has higher precedence than `UNION`/`MINUS` in the SQL standard — though Oracle historically evaluated all set operators with **equal precedence, left to right**. Because this is subtle and a portability risk, **use parentheses** to make the intended order explicit whenever you mix operators:

```sql
-- Be explicit with parentheses when mixing set operators:
(SELECT id FROM a UNION ALL SELECT id FROM b)
MINUS
SELECT id FROM c;
```

> **Set operators vs joins — when to use which.** Use a **set operator** when comparing whole rows or single key columns drawn from similarly-shaped queries and you want clean set semantics ("which keys are in both / in one but not the other"). Use a **join** when you need to combine *columns* from both sides into wider rows, or when the matching condition is anything more complex than whole-row equality. A subtlety: an inner join on a key with duplicates multiplies rows (fan-out, Ch 8), whereas `INTERSECT` returns distinct rows — so if you want the set of common keys *without* multiplication, `INTERSECT` expresses that intent directly and safely.

---

## Chapter 12 — DDL: Defining the Schema

The **Data Definition Language** defines the *structure* of your database — the tables, columns, datatypes, and the constraints that enforce correctness. Where DML (Ch 13) changes the rows inside a table, DDL changes the table itself. This chapter covers creating and altering objects, the full constraint system, and modern features like virtual and identity columns. Remember from Ch 5: **DDL auto-commits in Oracle** — there is an implicit `COMMIT` before and after every DDL statement, so it cannot be rolled back, and it silently commits any pending DML.

### 12.1 CREATE TABLE

The core statement that brings a table into existence: name it, list its columns with datatypes, and declare its constraints:

```sql
CREATE TABLE employees (
    employee_id    NUMBER(6)         PRIMARY KEY,                 -- column-level PK
    first_name     VARCHAR2(20),
    last_name      VARCHAR2(25)      NOT NULL,                    -- NOT NULL constraint
    email          VARCHAR2(25)      NOT NULL UNIQUE,             -- two constraints
    hire_date      DATE              DEFAULT SYSDATE NOT NULL,    -- DEFAULT value
    salary         NUMBER(8,2)       CHECK (salary > 0),          -- CHECK constraint
    commission_pct NUMBER(2,2),
    department_id  NUMBER(4),
    -- table-level foreign key (required form when it spans columns or for clarity):
    CONSTRAINT fk_emp_dept FOREIGN KEY (department_id)
        REFERENCES departments (department_id)
);
```

A constraint can be declared **column-level** (inline with the column, for single-column constraints) or **table-level** (separately, required when the constraint spans multiple columns, as a composite primary key does). 

**Creating a table from a query — `CREATE TABLE AS SELECT` (CTAS):** a fast way to copy structure and data, widely used for staging, backups, and transformations:

```sql
-- Copy structure + data of high earners into a new table
CREATE TABLE high_earners AS
SELECT employee_id, last_name, salary FROM employees WHERE salary > 10000;

-- Copy structure ONLY (a false condition copies columns but no rows):
CREATE TABLE employees_empty AS SELECT * FROM employees WHERE 1 = 0;
```

> **CTAS gotcha.** `CREATE TABLE AS SELECT` copies column definitions and `NOT NULL` constraints, but **not** primary keys, foreign keys, indexes, defaults, or other constraints — you must add those afterward with `ALTER TABLE`. CTAS is excellent for quick copies and as a fast, minimally-logged bulk transformation (often faster than `INSERT ... SELECT`), but remember it strips most constraints.

> **23ai — `IF NOT EXISTS`.** Oracle 23ai finally adds `CREATE TABLE IF NOT EXISTS ...` (and `DROP TABLE IF EXISTS`), so scripts can be re-run without erroring when the object already (or no longer) exists — a long-awaited convenience that PostgreSQL and others had for years. On 11g–21c you must check the data dictionary or trap the error in PL/SQL instead.

### 12.2 Constraints in depth

A **constraint** is a rule Oracle itself guarantees will never be violated, moving correctness out of application code into the data layer where it is enforced once, centrally, for everyone. The five constraint types:

```sql
-- NOT NULL: column must always have a value (a special case of CHECK)
salary NUMBER(8,2) NOT NULL

-- PRIMARY KEY: unique + not null; the principal row identifier; one per table; auto-indexed
CONSTRAINT pk_emp PRIMARY KEY (employee_id)
CONSTRAINT pk_order_lines PRIMARY KEY (order_id, line_no)     -- composite PK

-- UNIQUE: no two rows share the value (alternate key); permits NULLs
CONSTRAINT uq_emp_email UNIQUE (email)

-- FOREIGN KEY: value must match a parent PK/UNIQUE, or be NULL (referential integrity)
CONSTRAINT fk_emp_dept FOREIGN KEY (department_id)
    REFERENCES departments (department_id) ON DELETE CASCADE   -- deletion behavior

-- CHECK: an arbitrary boolean condition on the row
CONSTRAINT chk_salary CHECK (salary > 0)
CONSTRAINT chk_status CHECK (status IN ('active','inactive','pending'))
```

**Foreign-key deletion behavior** controls what happens to child rows when a parent is deleted:

- `ON DELETE CASCADE` — automatically delete the child rows too.
- `ON DELETE SET NULL` — set the child's foreign key to NULL.
- *(default — no clause)* — **restrict**: forbid deleting a parent that still has children (raises `ORA-02292`). Oracle has no explicit `RESTRICT`/`NO ACTION` keyword; omitting the clause *is* restrict.

> **Always name your constraints.** An unnamed constraint gets a system-generated name like `SYS_C0012345`, which is meaningless in error messages and awkward when you must drop or alter it later. Naming explicitly (conventions: `pk_`, `fk_`, `uq_`, `chk_` prefixes) makes errors legible and migrations clean. Your future self, reading a violation at 2am, will thank you.

> **DE NOTE — Oracle enforces; warehouses don't.** Every constraint here is *enforced* by Oracle. Cloud warehouses (Snowflake, BigQuery) accept PK/FK definitions but do **not** enforce them — so the integrity Oracle guarantees becomes your responsibility downstream (dbt tests). Knowing exactly what Oracle enforces tells you exactly what you must re-create yourself in the warehouse. (Ch 2.4, and your DE Vol 3.)

### 12.3 Constraint states: enabling, validating, deferring

Oracle gives fine control over *when* and *whether* a constraint is checked — useful for bulk loads and complex transactions:

- **ENABLE / DISABLE** — whether the constraint is active. You might `DISABLE` a constraint for a fast bulk load, then re-`ENABLE` it.
- **VALIDATE / NOVALIDATE** — whether *existing* data is checked when enabling. `ENABLE NOVALIDATE` enforces the rule on *new* changes but does not verify existing rows (useful when you know old data may not comply yet).
- **DEFERRABLE / NOT DEFERRABLE** — whether checking can be postponed to commit time. A `DEFERRABLE INITIALLY DEFERRED` constraint is checked only at `COMMIT`, allowing temporary violations mid-transaction (essential when, e.g., two rows reference each other and neither can be inserted first without violating an FK).

```sql
-- A deferrable FK, checked at COMMIT rather than per-statement:
ALTER TABLE employees ADD CONSTRAINT fk_emp_dept
    FOREIGN KEY (department_id) REFERENCES departments (department_id)
    DEFERRABLE INITIALLY DEFERRED;

-- Disable for a bulk load, then re-enable and validate:
ALTER TABLE employees DISABLE CONSTRAINT fk_emp_dept;
-- ... fast bulk load ...
ALTER TABLE employees ENABLE VALIDATE CONSTRAINT fk_emp_dept;
```

### 12.4 ALTER TABLE

`ALTER TABLE` changes a table's structure after creation — adding/dropping/modifying columns and constraints:

```sql
-- Columns
ALTER TABLE employees ADD (phone VARCHAR2(20));                 -- add a column
ALTER TABLE employees ADD (phone VARCHAR2(20), fax VARCHAR2(20)); -- add several
ALTER TABLE employees MODIFY (salary NUMBER(10,2));            -- change a column's type/size
ALTER TABLE employees MODIFY (last_name VARCHAR2(40) NOT NULL);-- add NOT NULL
ALTER TABLE employees DROP COLUMN fax;                         -- drop a column
ALTER TABLE employees RENAME COLUMN phone TO phone_number;     -- rename a column

-- Constraints
ALTER TABLE employees ADD CONSTRAINT chk_sal CHECK (salary > 0);
ALTER TABLE employees DROP CONSTRAINT chk_sal;
ALTER TABLE employees DISABLE CONSTRAINT chk_sal;
ALTER TABLE employees ENABLE  CONSTRAINT chk_sal;

-- Defaults
ALTER TABLE employees MODIFY (hire_date DEFAULT SYSDATE);
```

> **Caution on modifying columns.** You can always *widen* a column (`VARCHAR2(20)`→`VARCHAR2(40)`, more precision). *Narrowing* or changing type is only allowed if the column is empty or all existing values fit the new definition — otherwise Oracle errors. Adding a `NOT NULL` column to a populated table requires either a `DEFAULT` (so existing rows get a value) or that you populate it first. **12c optimization:** adding a `NOT NULL` column *with a `DEFAULT`* is a fast metadata-only operation (Oracle does not rewrite every row), a notable improvement.

### 12.5 DROP, TRUNCATE, RENAME

```sql
DROP TABLE employees;                    -- remove the table and ALL its data and structure
DROP TABLE employees CASCADE CONSTRAINTS;-- also drop FKs in other tables that reference it
DROP TABLE employees PURGE;              -- skip the recycle bin (permanent, unrecoverable)

TRUNCATE TABLE employees;                -- remove ALL rows, keep the table structure; fast

RENAME employees TO staff;               -- rename a table (or use ALTER TABLE ... RENAME TO)
ALTER TABLE employees RENAME TO staff;
```

**DROP vs TRUNCATE vs DELETE** — a classic interview comparison:

| | `DELETE` | `TRUNCATE` | `DROP` |
|---|---|---|---|
| Removes | Rows matching `WHERE` | **All** rows | The whole table (rows + structure) |
| Language | DML | DDL | DDL |
| `WHERE` filter? | Yes | No | N/A |
| Speed on big tables | Slow (row-by-row, logged) | Very fast (deallocates storage) | Fast |
| Rollback? | Yes (until commit) | No (auto-commits)* | No (auto-commits)* |
| Fires triggers? | Yes | No | N/A |
| Resets storage? | No (keeps allocated space) | Yes (deallocates extents) | Removes everything |

\* Recoverable via **Flashback** in many cases (Ch 38) — `DROP` goes to the **recycle bin** unless `PURGE` is used, and `FLASHBACK TABLE` can restore it.

> **The recycle bin (10g+).** A plain `DROP TABLE` does not immediately destroy the table — it renames it and moves it to the **recycle bin**, from which `FLASHBACK TABLE employees TO BEFORE DROP;` can recover it. `DROP TABLE ... PURGE` skips the bin (truly permanent). This is a genuine safety net, but do not rely on it for important data — and note `TRUNCATE` does *not* go to the recycle bin.

### 12.6 Virtual columns and identity columns

Two features that remove boilerplate:

**Virtual (computed) columns** (11g+) derive their value from other columns in the same row via an expression; the value is computed on read (not stored), so it can never drift out of sync with its inputs:

```sql
CREATE TABLE order_lines (
    order_id    NUMBER,
    quantity    NUMBER,
    unit_price  NUMBER(10,2),
    line_total  NUMBER(12,2) GENERATED ALWAYS AS (quantity * unit_price) VIRTUAL  -- computed
);
-- line_total is always quantity*unit_price; you cannot (and need not) insert it.
```

**Identity columns** (12c+) auto-generate a sequential integer for each new row — the standard modern way to mint surrogate keys, replacing the older sequence-plus-trigger pattern:

```sql
-- 12c+ identity column (the modern surrogate-key approach)
CREATE TABLE products (
    product_id  NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,   -- auto-incrementing
    name        VARCHAR2(100)
);
INSERT INTO products (name) VALUES ('Widget');   -- product_id assigned automatically

-- Variants:
-- GENERATED ALWAYS AS IDENTITY        -> you cannot supply your own value (strict)
-- GENERATED BY DEFAULT AS IDENTITY    -> you may supply a value; else auto-generated
-- GENERATED BY DEFAULT ON NULL AS IDENTITY -> auto-generate only when you pass NULL
```

> **Before 12c (your notes' world):** surrogate keys were generated with a **sequence** plus a **BEFORE INSERT trigger** that fetched `seq.NEXTVAL` (Ch 16, 26). Identity columns make this a one-line declaration. Recognize both: legacy schemas use sequence+trigger; new schemas use identity columns (which are implemented as a sequence under the hood).

### 12.7 Invisible columns (12c)

**12c** — An **invisible column** exists and stores data but does not appear in `SELECT *` or `DESCRIBE` unless referenced explicitly. Useful for adding a column without breaking existing `SELECT *` code, or for phased schema changes:

```sql
ALTER TABLE employees ADD (audit_note VARCHAR2(200) INVISIBLE);
-- SELECT * FROM employees;          -> does NOT show audit_note
-- SELECT employee_id, audit_note FROM employees;  -> works (explicit reference)
ALTER TABLE employees MODIFY (audit_note VISIBLE); -- make it visible later
```

### 12.8 Comments — documenting the schema

Oracle lets you attach descriptions to tables and columns, stored in the data dictionary — a simple, underused form of in-database documentation:

```sql
COMMENT ON TABLE  employees IS 'Master record of all current and past employees';
COMMENT ON COLUMN employees.commission_pct IS 'Fraction of sales paid as commission; NULL for non-sales roles';
-- Read them back:
SELECT * FROM user_tab_comments WHERE table_name = 'EMPLOYEES';
SELECT * FROM user_col_comments WHERE table_name = 'EMPLOYEES';
```

### 12.9 Finding DDL and structure in the data dictionary

To inspect or reconstruct an object's definition (Ch 4), the dictionary and `DBMS_METADATA` are your tools:

```sql
DESCRIBE employees;                          -- quick column/type/nullability list

-- The exact DDL Oracle would use to recreate the object:
SELECT DBMS_METADATA.GET_DDL('TABLE', 'EMPLOYEES') FROM dual;

-- Constraints and their columns (from Ch 4):
SELECT constraint_name, constraint_type, status, search_condition
FROM   user_constraints WHERE table_name = 'EMPLOYEES';
```

> **`DBMS_METADATA.GET_DDL`** is invaluable: it generates the complete `CREATE` statement for any object (table, index, view, package…), letting you see and reproduce exact definitions — far better than guessing. A core tool when documenting or migrating a schema.

---

## Chapter 13 — DML & Transaction-Bound Data Changes

The **Data Manipulation Language** changes the *data* (rows) in tables: `INSERT`, `UPDATE`, `DELETE`, `MERGE`. Unlike DDL, **DML is transaction-bound** — changes are pending until you `COMMIT` (Ch 14), so they can be reviewed and rolled back. This chapter covers each statement in depth, plus Oracle's powerful multi-table insert, `MERGE` (upsert), `RETURNING`, DML error logging, and the idempotency patterns that make pipeline writes safe to re-run.

### 13.1 INSERT — single and multi-row

```sql
-- Single row, all columns in table order (fragile — breaks if columns change):
INSERT INTO departments VALUES (280, 'Data Engineering', 100, 1700);

-- Single row, naming columns explicitly (ALWAYS prefer this):
INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (280, 'Data Engineering', 100, 1700);

-- Partial columns: unlisted columns get their DEFAULT or NULL
INSERT INTO departments (department_id, department_name) VALUES (290, 'Research');

-- Multi-row with INSERT ALL (Oracle's multi-row literal insert):
INSERT ALL
  INTO departments (department_id, department_name) VALUES (300, 'Platform')
  INTO departments (department_id, department_name) VALUES (310, 'ML')
  INTO departments (department_id, department_name) VALUES (320, 'Analytics')
SELECT * FROM dual;
```

> **Always name the columns.** `INSERT INTO t VALUES (...)` relies on the physical column order, so adding or reordering a column silently breaks it (values land in the wrong columns, often without an error if types happen to match). Naming columns explicitly survives schema changes and documents intent. This is the single most important `INSERT` habit.

> **23ai note.** Oracle 23ai supports the standard multi-row `VALUES` syntax: `INSERT INTO t (a,b) VALUES (1,'x'), (2,'y'), (3,'z');`. On 11g–21c, use `INSERT ALL` (above) for multiple literal rows in one statement.

### 13.2 INSERT … SELECT — the workhorse

The most important form for data engineering: insert the entire result of a query. This is how you populate one table from another — moving data from staging to a cleaned table, or bronze to silver:

```sql
INSERT INTO high_earners (employee_id, last_name, salary)
SELECT employee_id, last_name, salary
FROM   employees
WHERE  salary > 10000;
```

Faster than many single-row inserts (one statement, one transaction) and the natural way to do set-based data movement. For very large loads, Oracle offers a **direct-path insert** via the `/*+ APPEND */` hint, which bypasses the buffer cache and writes above the high-water mark — much faster, but it locks the table and the data is not visible until commit:

```sql
INSERT /*+ APPEND */ INTO target_table SELECT * FROM source_table;
COMMIT;   -- required before the appended data is queryable; respects nologging settings
```

### 13.3 Multi-table INSERT

`INSERT ALL` / `INSERT FIRST` can route rows from a single query into **several tables** at once — useful for splitting or fanning out data in ETL:

```sql
-- Unconditional: every selected row goes into BOTH targets
INSERT ALL
  INTO emp_archive (employee_id, salary) VALUES (employee_id, salary)
  INTO emp_audit   (employee_id, action) VALUES (employee_id, 'ARCHIVED')
SELECT employee_id, salary FROM employees WHERE hire_date < DATE '2010-01-01';

-- Conditional: route each row by condition (WHEN ... THEN INTO)
INSERT ALL
  WHEN salary >= 10000 THEN INTO high_earners (employee_id, salary) VALUES (employee_id, salary)
  WHEN salary <  10000 THEN INTO std_earners  (employee_id, salary) VALUES (employee_id, salary)
SELECT employee_id, salary FROM employees;

-- INSERT FIRST: stop at the first matching WHEN (mutually exclusive routing)
INSERT FIRST
  WHEN salary >= 20000 THEN INTO tier1 VALUES (employee_id, salary)
  WHEN salary >= 10000 THEN INTO tier2 VALUES (employee_id, salary)
  ELSE                       INTO tier3 VALUES (employee_id, salary)
SELECT employee_id, salary FROM employees;
```

> **`INSERT ALL` vs `INSERT FIRST`.** `INSERT ALL` evaluates *every* `WHEN` for each row (a row can land in multiple targets); `INSERT FIRST` stops at the first matching `WHEN` (mutually exclusive). This is a genuinely useful ETL feature with no direct equivalent in many other databases — handy for pivoting/splitting source rows in a single pass.

### 13.4 UPDATE — including correlated updates

`UPDATE` changes values in existing rows: `SET` the columns, `WHERE` chooses which rows:

```sql
UPDATE employees SET salary = salary * 1.10 WHERE department_id = 10;   -- 10% raise
UPDATE employees SET salary = 5000, commission_pct = 0.1 WHERE employee_id = 200;
```

The new value can depend on **another table** via a correlated subquery in the `SET` clause:

```sql
-- Set each employee's salary to their department's average (correlated update)
UPDATE employees e
SET    salary = (SELECT AVG(e2.salary) FROM employees e2
                 WHERE e2.department_id = e.department_id)
WHERE  EXISTS   (SELECT 1 FROM employees e2
                 WHERE e2.department_id = e.department_id);

-- Updatable join view / inline-view update (Oracle-specific alternative):
UPDATE (SELECT e.salary, d.budget_factor
        FROM employees e JOIN departments d ON e.department_id = d.department_id)
SET    salary = salary * budget_factor;   -- requires the join to be key-preserved
```

> **DANGER — `UPDATE`/`DELETE` without `WHERE`.** The most expensive omission in SQL: `UPDATE employees SET salary = 0;` zeroes *every* row; `DELETE FROM employees;` empties the table. Before running a destructive statement on real data, first run the same `WHERE` as a `SELECT` to see exactly which rows match, and wrap the change in an explicit transaction so you can `ROLLBACK` if the count is wrong. Treat every unguarded `UPDATE`/`DELETE` as a loaded weapon. (Because DML is not auto-committed, you *can* `ROLLBACK` a mistaken DML before commit — a real safety margin DDL does not give you.)

### 13.5 DELETE vs TRUNCATE

```sql
DELETE FROM employees WHERE department_id = 10;   -- remove matching rows (DML, rollback-able)
DELETE FROM employees;                            -- remove ALL rows (still DML, still rollback-able)
TRUNCATE TABLE employees;                          -- remove all rows fast (DDL, auto-commits)
```

Covered comparatively in Ch 12.5. The short version: `DELETE` with a `WHERE` removes specific rows, is logged, fires triggers, can be rolled back, and keeps storage allocated. `TRUNCATE` removes *all* rows by deallocating storage — far faster on big tables, but no `WHERE`, no triggers, and auto-commits. Use `DELETE` for selective/transactional removal; `TRUNCATE` to quickly empty an entire table (e.g. refreshing a staging table at the start of a pipeline run).

### 13.6 MERGE — the upsert

Pipelines constantly need: for each incoming row, **update it if its key exists, insert it if it's new**. This "update-or-insert" is an **upsert**, and `MERGE` (since 9i) does it in one statement. It is the mechanism behind maintaining dimension tables and Slowly Changing Dimensions (Ch 42), and one of the most important DML statements for data engineering:

```sql
MERGE INTO dim_customer t                         -- target
USING staging_customer s                          -- source of incoming rows
   ON (t.customer_id = s.customer_id)             -- match condition
WHEN MATCHED THEN
   UPDATE SET t.name = s.name,
              t.city = s.city,
              t.updated_at = SYSDATE
   WHERE  t.name <> s.name OR t.city <> s.city    -- optional: only update if changed
WHEN NOT MATCHED THEN
   INSERT (customer_id, name, city, updated_at)
   VALUES (s.customer_id, s.name, s.city, SYSDATE);
```

`MERGE` can also **delete** matched rows (a `DELETE` clause within `WHEN MATCHED`), handle both insert and update in one pass, and source from a query rather than a table. The optional `WHERE` on the `UPDATE` avoids needless updates when nothing changed (reducing redo and trigger firing).

> **DE NOTE — MERGE is the heart of idempotent pipelines.** `MERGE` keyed on a business key is **idempotent**: run it twice with the same source and the second run updates rather than re-inserts, so the result is identical (§13.9). This is why `MERGE` underlies SCD Type 2 maintenance, deduplicated loads, and re-runnable pipeline steps. The identical pattern appears in Spark/Delta (`MERGE INTO`) and in dbt snapshots — you are learning the same concept that powers your lakehouse work, in its original SQL form.

### 13.7 RETURNING INTO — getting data back from a write

Ordinarily a DML statement reports only how many rows it affected. The `RETURNING` clause makes it also return data from the changed rows — most usefully an auto-generated key — into PL/SQL variables, saving a second query:

```sql
-- In PL/SQL: capture the generated id and a computed value from the inserted row
DECLARE
  v_id   products.product_id%TYPE;
  v_when products.created_at%TYPE;
BEGIN
  INSERT INTO products (name) VALUES ('Gadget')
  RETURNING product_id, created_at INTO v_id, v_when;   -- get the new key back
  DBMS_OUTPUT.PUT_LINE('New product id = ' || v_id);
END;
/

-- RETURNING also works for UPDATE/DELETE (single-row), and BULK COLLECT for many rows
```

### 13.8 DML error logging — don't let one bad row fail the batch

By default, if any row in a bulk `INSERT`/`UPDATE`/`MERGE` violates a constraint, the *entire statement* fails and rolls back. **DML error logging** (`LOG ERRORS`) instead diverts offending rows to an error table and lets the rest succeed — invaluable when loading large, imperfect data:

```sql
-- Create an error-logging table for the target
BEGIN DBMS_ERRLOG.CREATE_ERROR_LOG('TARGET_TABLE'); END;
/
-- Load, sending bad rows to ERR$_TARGET_TABLE instead of failing the whole load:
INSERT INTO target_table
SELECT * FROM staging_table
LOG ERRORS INTO err$_target_table ('load_2026_06_24') REJECT LIMIT UNLIMITED;

-- Inspect what failed and why:
SELECT ora_err_mesg$, ora_err_tag$, * FROM err$_target_table;
```

> **DE NOTE.** This is Oracle's built-in "quarantine the bad rows, load the good ones" mechanism — exactly the dead-letter/quarantine pattern you implement in pipelines. `REJECT LIMIT UNLIMITED` lets the whole batch proceed regardless of how many rows fail; you then review the error table. Far better than an all-or-nothing load that one malformed row can sink.

### 13.9 Idempotency — making writes safe to re-run

A production data process does not run once; it runs on a schedule and gets retried after failures, sometimes after partially completing. If re-running double-inserts rows or double-counts, the process is fragile and its outputs untrustworthy. The property you want is **idempotency**: running the same step twice produces the same result as running it once. How to achieve it in Oracle:

- **A plain `INSERT` is NOT idempotent** — run it twice, get the rows twice.
- **`MERGE` keyed on a business key IS idempotent** — the second run updates rather than re-inserts (§13.6). Prefer this for loads.
- **Delete-then-insert a partition** — for a recomputed slice of data, `DELETE` (or `TRUNCATE` a partition, Ch 37) the target range first, then `INSERT` the freshly computed rows, so re-running cleanly *replaces* rather than duplicates.
- **`INSERT ... WHERE NOT EXISTS`** — insert only rows whose key is not already present (a poor-man's idempotent insert when `MERGE` is overkill).

```sql
-- Idempotent "insert if absent" using NOT EXISTS:
INSERT INTO dim_product (product_id, name)
SELECT s.product_id, s.name
FROM   staging_product s
WHERE  NOT EXISTS (SELECT 1 FROM dim_product d WHERE d.product_id = s.product_id);

-- Idempotent partition replace (recompute one day cleanly):
DELETE FROM fact_sales WHERE sale_date = DATE '2026-06-24';
INSERT INTO fact_sales SELECT * FROM staging_sales WHERE sale_date = DATE '2026-06-24';
COMMIT;
```

> **Idempotency is the heart of reliable data pipelines.** Every orchestrator (Airflow, and Oracle's own `DBMS_SCHEDULER`) assumes tasks may be retried, and a non-idempotent task turns an ordinary retry into data corruption. Design every write so running it again is safe — prefer `MERGE`/upsert on a key, or delete-and-reinsert the specific slice you are recomputing, over blind appends. This single discipline prevents a whole category of 2am data incidents, and it is the same lesson as in your DE study guide.

---

## Chapter 14 — TCL: Transactions & Concurrency

A **transaction** is a logical unit of work — one or more DML statements — that Oracle treats as indivisible (the ACID guarantee, Ch 1). The **Transaction Control Language** marks transaction boundaries: `COMMIT`, `ROLLBACK`, `SAVEPOINT`. This chapter covers transaction control and the concurrency mechanisms (read consistency, locking, MVCC) that let many users work at once without corrupting each other's data. The deep internals are in Ch 32–33; here is the working understanding.

### 14.1 COMMIT, ROLLBACK, SAVEPOINT

A transaction begins implicitly with your first DML statement and ends when you `COMMIT` (make all changes permanent and visible to others) or `ROLLBACK` (undo all changes since the transaction began):

```sql
INSERT INTO accounts (id, balance) VALUES (1, 1000);
UPDATE accounts SET balance = balance - 200 WHERE id = 1;
UPDATE accounts SET balance = balance + 200 WHERE id = 2;
COMMIT;                       -- both updates become permanent together (atomicity)

-- ...or, on any problem:
ROLLBACK;                     -- undo everything since the last COMMIT
```

**`SAVEPOINT`** marks a point within a transaction you can roll back *to* without undoing the whole transaction — useful for partial recovery in long, multi-step logic:

```sql
INSERT INTO orders (id, status) VALUES (1001, 'new');
SAVEPOINT after_order;
INSERT INTO order_lines (order_id, line_no, product_id) VALUES (1001, 1, 9999);
-- oops, product 9999 is invalid:
ROLLBACK TO after_order;      -- undo just the order_lines insert; keep the order
INSERT INTO order_lines (order_id, line_no, product_id) VALUES (1001, 1, 500);
COMMIT;
```

> **What commits and what doesn't.** DML waits for an explicit `COMMIT`. But remember (Ch 5): **DDL and DCL auto-commit** — issuing any `CREATE`/`ALTER`/`DROP`/`GRANT` silently commits your pending DML first. Also, a normal session disconnect *commits* in some tools and *rolls back* in others (SQL\*Plus commits on clean `EXIT`, rolls back on abnormal termination). Never rely on disconnect behavior; commit or roll back explicitly.

### 14.2 Read consistency and MVCC

Oracle's concurrency model is built on **Multi-Version Concurrency Control (MVCC)** and **read consistency**, and understanding it explains much of Oracle's behavior. The defining guarantees:

- **Readers never block writers, and writers never block readers.** A query reading a table is not blocked by another session writing to it, and vice versa. This is a huge advantage over lock-based systems where readers and writers contend.
- **Statement-level read consistency.** A single query sees a consistent snapshot of the data *as it existed when the query began* — even if other sessions commit changes while it runs. So a long-running report does not see some rows from before an update and some from after; it sees one consistent point in time.

Oracle achieves this with **undo data** (Ch 32): when a row is modified, the old version is kept in undo segments, so a query that started before the change can reconstruct the old version it should see. This is the same snapshot-isolation idea that, decades later, became "time travel" in Delta Lake and Snowflake (your DE Vol 3).

```sql
-- Session A runs a long query at 10:00; Session B updates and commits rows at 10:01.
-- Session A's query still sees the data as of 10:00 (its start) — consistent snapshot.
```

> **`ORA-01555: snapshot too old`.** The flip side of read consistency: if a query runs very long and the undo data it needs to reconstruct old row versions has been overwritten (because undo retention was too short for the workload), Oracle cannot build the consistent snapshot and raises this classic error. The fix is adequate undo sizing/retention (Ch 32) or shorter-running queries. A famous Oracle error worth recognizing.

### 14.3 Locking — rows, tables, and modes

To coordinate concurrent *writes*, Oracle uses **locks**. Its locking is notably lightweight and automatic compared to many systems:

- **Row-level locks (TX).** When a session modifies a row (`UPDATE`/`DELETE`/`INSERT`/`SELECT ... FOR UPDATE`), Oracle locks just that row (exclusively) until the transaction commits or rolls back. Other sessions can freely read it (seeing the pre-change version via MVCC) and can modify *other* rows. Oracle does **not** escalate row locks to table locks (unlike some databases), and there is no practical limit on the number of row locks — a key strength.
- **Table-level locks (TM).** Acquired automatically (usually in a non-restrictive "row share" mode) to prevent conflicting DDL while DML is in progress, and explicitly via `LOCK TABLE`.
- **Lock modes** range from share (multiple compatible) to exclusive. Writers acquire exclusive row locks; the system manages compatibility.

Locks are released at `COMMIT` or `ROLLBACK`. You rarely manage them manually — Oracle's automatic, row-level, non-escalating locking "just works" for most workloads, which is part of why it scales well under concurrency.

### 14.4 SELECT … FOR UPDATE — explicit pessimistic locking

When you intend to read rows and then update them, and must prevent others from changing them in between (a "read-then-write" sequence), lock them explicitly with `FOR UPDATE`:

```sql
-- Lock the matching rows now; others can't modify them until we commit/rollback
SELECT * FROM accounts WHERE id = 1 FOR UPDATE;
-- ... compute new balance based on what we read ...
UPDATE accounts SET balance = :new_balance WHERE id = 1;
COMMIT;                                       -- releases the lock

-- FOR UPDATE NOWAIT: error immediately if a row is already locked (don't wait)
SELECT * FROM accounts WHERE id = 1 FOR UPDATE NOWAIT;
-- FOR UPDATE WAIT 5: wait up to 5 seconds, then error
-- FOR UPDATE SKIP LOCKED: skip rows others have locked (great for work queues!)
SELECT * FROM job_queue WHERE status = 'pending' FOR UPDATE SKIP LOCKED FETCH FIRST 10 ROWS ONLY;
```

> **`SKIP LOCKED` for work queues.** `FOR UPDATE SKIP LOCKED` lets multiple worker sessions each grab *different* unlocked rows from a queue table without blocking each other — the standard pattern for building a concurrent job/task queue in the database. A genuinely useful, somewhat advanced feature.

> **Pessimistic vs optimistic locking.** `FOR UPDATE` is *pessimistic* (lock first, assume conflict). The alternative, common in applications, is *optimistic*: read without locking, and at update time check that the row has not changed since you read it (via a version column or comparing old values), retrying if it has. Optimistic locking scales better under low contention; pessimistic is simpler when conflicts are likely. Know both approaches.

### 14.5 Isolation levels in Oracle

Isolation levels govern how completely concurrent transactions are isolated from each other (full treatment in Ch 33). Oracle supports:

- **READ COMMITTED** (the **default**) — each *statement* sees data committed before the statement began; you never see another transaction's uncommitted changes (no dirty reads). Different statements in the same transaction may see different data if others commit in between (non-repeatable reads are possible).
- **SERIALIZABLE** — the *transaction* sees a consistent snapshot as of its start; it behaves as if it ran alone. If it tries to update a row another transaction changed and committed after this one began, Oracle raises `ORA-08177: can't serialize access`, and you retry.
- **READ ONLY** — a transaction that sees a consistent snapshot as of its start and cannot perform DML; ideal for long reports needing consistency without locking.

Notably, Oracle does **not** offer READ UNCOMMITTED (dirty reads are impossible by design — MVCC means you always read committed data), and its default READ COMMITTED is stronger than the standard's minimum because of statement-level read consistency.

```sql
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;   -- for the current transaction
SET TRANSACTION READ ONLY;                       -- consistent read-only transaction
```

> **DE NOTE.** Because Oracle's default already gives statement-level consistency and never permits dirty reads, the kinds of read anomalies that plague some databases at their defaults are largely absent. But the "lost update" problem (two sessions read, both update based on stale reads) *can* still occur under READ COMMITTED — guard read-then-write sequences with `FOR UPDATE` (§14.4) or `SERIALIZABLE`.

### 14.6 Deadlocks

A **deadlock** occurs when two transactions each hold a lock the other needs and neither can proceed — A locks row 1 and wants row 2, while B locks row 2 and wants row 1. Oracle **detects deadlocks automatically** and breaks them by rolling back one statement (the victim), raising `ORA-00060: deadlock detected`, freeing the other. The victim's transaction is not entirely rolled back — just the statement — and the application should handle the error (typically retry).

```sql
-- Prevent deadlocks by acquiring locks in a CONSISTENT ORDER across all code paths:
-- always lock the lower account id before the higher one, so a circular wait can't form.
```

> **Prevention.** Deadlocks usually mean transactions acquire locks in inconsistent orders. The standard prevention is to ensure all code paths acquire locks in the *same* order (e.g. always update accounts in ascending id order), so the circular wait cannot form. Keep transactions short (hold locks briefly) and expect occasional deadlocks in concurrent write code — catch `ORA-00060` and retry.

### 14.7 Autonomous transactions (preview)

Sometimes you need a piece of work to commit **independently** of the surrounding transaction — most commonly **logging**: you want an audit/log row to persist even if the main transaction later rolls back. An **autonomous transaction** (a PL/SQL feature, full treatment in Ch 28) runs in its own independent transaction context, committing or rolling back without affecting the caller:

```sql
CREATE OR REPLACE PROCEDURE log_event(p_msg VARCHAR2) AS
  PRAGMA AUTONOMOUS_TRANSACTION;        -- this procedure commits independently
BEGIN
  INSERT INTO event_log (logged_at, message) VALUES (SYSTIMESTAMP, p_msg);
  COMMIT;                                -- commits ONLY this insert, not the caller's work
END;
/
-- Even if the calling transaction rolls back, the log row survives.
```

> **Use sparingly.** Autonomous transactions are the right tool for independent logging/auditing, but they break the normal atomicity of a transaction (work commits that the caller cannot undo), so misuse can leave inconsistent data. Reserve them for genuinely independent side-effects like logging. (Full detail and cautions in Ch 28.)

---

## Chapter 15 — DCL & Security Basics

The **Data Control Language** — `GRANT` and `REVOKE` — controls *who can do what*. This chapter covers users and schemas, the two kinds of privilege, roles, and password profiles. (Advanced security — VPD, redaction, TDE, auditing — is in Ch 39; here are the foundations every developer must know.)

### 15.1 Users and schemas

In Oracle, a **user** and a **schema** are two sides of one thing: creating a user creates a schema (a namespace) of the same name that owns that user's objects. "The HR schema" *is* the set of objects owned by the HR user.

```sql
-- Create a user (modern multitenant: do this inside a PDB, Ch 34)
CREATE USER appdev IDENTIFIED BY "Str0ng#Pass";
ALTER  USER appdev QUOTA UNLIMITED ON users;   -- allow it to use storage in a tablespace
GRANT  CREATE SESSION TO appdev;               -- minimum privilege to log in
GRANT  CREATE TABLE, CREATE VIEW, CREATE PROCEDURE TO appdev;  -- let it build objects

-- Change password / lock / expire
ALTER USER appdev IDENTIFIED BY "NewStr0ng#Pass";
ALTER USER appdev ACCOUNT LOCK;                -- disable login
ALTER USER appdev PASSWORD EXPIRE;             -- force a password change at next login

DROP USER appdev CASCADE;                       -- drop user AND all its objects
```

> **A new user can do nothing until granted privileges** — not even connect (`CREATE SESSION` is required to log in). This is least-privilege by default. **23ai** adds **schema-level privileges** (e.g. `GRANT SELECT ANY TABLE ON SCHEMA hr TO appdev`), a finer-grained option between single-object grants and the sweeping `ANY` system privileges.

### 15.2 System privileges vs object privileges

Two distinct kinds of privilege — the distinction is fundamental:

- **System privileges** — the right to perform an *action* of a certain kind, database-wide: `CREATE SESSION`, `CREATE TABLE`, `CREATE ANY TABLE`, `SELECT ANY TABLE`, `CREATE USER`, `DROP ANY TABLE`. The `ANY` variants are powerful and dangerous (they apply to *every* schema). There are ~200 system privileges.
- **Object privileges** — the right to perform an action on a *specific object*: `SELECT` on `hr.employees`, `INSERT`/`UPDATE`/`DELETE` on a table, `EXECUTE` on a procedure/package, `REFERENCES` (to create an FK pointing at it).

```sql
-- System privilege (an action, database-wide)
GRANT CREATE TABLE TO appdev;

-- Object privileges (actions on specific objects, granted by the owner)
GRANT SELECT, INSERT, UPDATE ON hr.employees TO appdev;
GRANT EXECUTE ON hr.process_payroll TO appdev;
GRANT SELECT ON hr.employees TO appdev WITH GRANT OPTION;  -- appdev may re-grant it
```

### 15.3 GRANT and REVOKE

`GRANT` gives privileges; `REVOKE` takes them away:

```sql
GRANT SELECT ON hr.employees TO appdev;
REVOKE SELECT ON hr.employees FROM appdev;

GRANT CREATE TABLE TO appdev WITH ADMIN OPTION;   -- appdev may grant CREATE TABLE onward
-- WITH GRANT OPTION  -> for OBJECT privileges (recipient may re-grant)
-- WITH ADMIN OPTION  -> for SYSTEM privileges and ROLES (recipient may re-grant)
```

> **Revoke cascades differently for object vs system privileges.** Revoking an *object* privilege that was granted `WITH GRANT OPTION` cascades — anyone the recipient granted it to also loses it. Revoking a *system* privilege granted `WITH ADMIN OPTION` does **not** cascade. A subtle but real difference.

### 15.4 Roles

A **role** is a named bundle of privileges you can grant as a unit — the practical way to manage privileges at scale. Instead of granting twenty privileges to fifty users, you grant them to a role once and grant the role to the users:

```sql
CREATE ROLE app_readonly;
GRANT SELECT ON hr.employees   TO app_readonly;
GRANT SELECT ON hr.departments TO app_readonly;
GRANT app_readonly TO appdev, analyst1, analyst2;   -- grant the bundle to many users

CREATE ROLE app_readwrite;
GRANT app_readonly TO app_readwrite;                 -- roles can be granted to roles
GRANT INSERT, UPDATE, DELETE ON hr.employees TO app_readwrite;
GRANT app_readwrite TO appdev;
```

Oracle ships predefined roles — `CONNECT` (basic connect), `RESOURCE` (create objects), `DBA` (almost everything, **never grant casually**). Roles can be enabled/disabled per session and can be password-protected or made **secure application roles** (enabled only by a verified procedure — Ch 39).

> **Best practice — privileges to roles, roles to users.** Grant privileges to roles and roles to users, not privileges directly to users. This makes access auditable and changeable in one place (change the role, every member updates). It is the same principle as group-based access control everywhere. **Gotcha:** privileges granted via a role are **not** active inside a definer-rights PL/SQL stored procedure (Ch 24) — the procedure needs the privilege granted *directly* to its owner. This trips people up constantly.

### 15.5 PUBLIC

**`PUBLIC`** is a special pseudo-user representing *every* user in the database. Granting to `PUBLIC` grants to everyone:

```sql
GRANT SELECT ON reference.country_codes TO PUBLIC;   -- everyone can read this lookup table
```

> **Use `PUBLIC` grants very sparingly.** A privilege granted to `PUBLIC` is held by every current and future user — a frequent security weakness. Reserve it for genuinely public reference data. Over-broad `PUBLIC` grants (especially `EXECUTE` on powerful built-in packages) are a classic audit finding. The principle of least privilege says grant to specific roles, not `PUBLIC`.

### 15.6 Profiles and password policy

A **profile** is a named set of resource limits and password rules you assign to users — the mechanism for enforcing password policy and capping resource use:

```sql
CREATE PROFILE app_users LIMIT
  FAILED_LOGIN_ATTEMPTS   5            -- lock after 5 failed logins
  PASSWORD_LIFE_TIME      90           -- password expires after 90 days
  PASSWORD_REUSE_TIME     365          -- can't reuse a password within a year
  PASSWORD_LOCK_TIME      1            -- locked for 1 day after too many failures
  PASSWORD_VERIFY_FUNCTION ora12c_verify_function  -- complexity rules
  SESSIONS_PER_USER       10           -- resource limit example
  IDLE_TIME               30;          -- disconnect after 30 idle minutes
ALTER USER appdev PROFILE app_users;
```

> Profiles are how an organization enforces "passwords must be complex, expire every 90 days, and accounts lock after 5 failed attempts" centrally. The DBA defines profiles; you should know they exist and that password policy lives here. Oracle provides built-in password-verify functions (`ora12c_verify_function`, `ora12c_strong_verify_function`) for complexity enforcement.

---

## Chapter 16 — Other Schema Objects

Beyond tables, an Oracle schema contains several other object types you create and use constantly: **views**, **sequences**, **synonyms**, **indexes**, and **materialized views**. This chapter introduces each (indexes and materialized views get deeper treatment in Ch 36 and 42).

### 16.1 Views

A **view** is a stored query that behaves like a table: you `SELECT` from it as if it were one, but it stores no data of its own — each query against the view runs its underlying query. Views serve two main purposes: **abstraction** (hide complex joins/logic behind a simple name) and **security** (expose only certain columns or rows).

```sql
-- Abstraction: wrap a join/filter behind a simple name
CREATE OR REPLACE VIEW emp_details AS
SELECT e.employee_id, e.first_name || ' ' || e.last_name AS full_name,
       e.salary, d.department_name, l.city
FROM   employees e
JOIN   departments d ON e.department_id = d.department_id
JOIN   locations   l ON d.location_id   = l.location_id;

-- Consumers query it like a table; the complexity lives in one place:
SELECT department_name, COUNT(*) FROM emp_details GROUP BY department_name;

-- Security: expose only non-sensitive columns / only some rows
CREATE OR REPLACE VIEW emp_public AS
SELECT employee_id, first_name, last_name, department_id   -- no salary!
FROM   employees
WHERE  department_id = 50;                                  -- only one department
-- Grant access to the VIEW, not the base table:
GRANT SELECT ON emp_public TO analyst1;
```

**View options:**

- **Simple view** — selects from one table, no functions/grouping; often *updatable* (DML through it affects the base table).
- **Complex view** — joins, aggregates, `DISTINCT`, `GROUP BY`; generally **read-only** for DML (Oracle cannot unambiguously map a change back to base tables). Use `INSTEAD OF` triggers (Ch 26) to make complex views updatable.
- **`WITH READ ONLY`** — explicitly forbid DML through the view.
- **`WITH CHECK OPTION`** — forbid DML through the view that would produce rows the view itself could not see (e.g. inserting an employee in department 60 through a view filtered to department 50).

```sql
CREATE OR REPLACE VIEW dept50 AS
SELECT * FROM employees WHERE department_id = 50
WITH CHECK OPTION;        -- can't insert/update a row out of department 50 via this view
```

> **DE NOTE.** Views are the classic abstraction/serving layer, and they map directly to dbt's "view" materialization (recompute on read) and to the gold-layer interfaces you expose to analysts. Oracle also has **materialized views** (§16.5, Ch 42) for the "precompute and store" trade-off — the same view-vs-materialized-view decision from your DE Vol 3.

### 16.2 Sequences

A **sequence** is an independent object that generates unique sequential numbers — the classic way (pre-12c identity columns) to produce surrogate primary keys, and still widely used:

```sql
CREATE SEQUENCE emp_seq
  START WITH 1000
  INCREMENT BY 1
  NOCACHE                 -- or CACHE 20 to pre-allocate 20 values in memory (faster)
  NOCYCLE;                -- error when it hits the max rather than wrapping to the start

-- Use it: NEXTVAL gets the next number; CURRVAL gets the last one THIS session got
INSERT INTO employees (employee_id, last_name) VALUES (emp_seq.NEXTVAL, 'Kuanr');
SELECT emp_seq.CURRVAL FROM dual;        -- the value just used (this session only)
```

> **The CACHE / gap gotcha.** With `CACHE n`, Oracle pre-allocates `n` values in memory for speed. If the instance restarts (or the cache is otherwise flushed), the unused cached values are **lost**, leaving **gaps** in the sequence. This is by design — sequences guarantee *uniqueness*, **not** gap-free contiguity. If you truly need gapless numbering (some invoice-numbering regulations), a sequence is the wrong tool; you must serialize generation yourself (with the contention cost that implies). Do not assume sequence values have no gaps.

> **12c improvements & identity columns.** 12c lets you use `seq.NEXTVAL` directly as a column **DEFAULT** (no trigger needed), and adds **identity columns** (Ch 12.6) which are sequences wired into a column automatically — the modern preferred approach for surrogate keys. Pre-12c code uses a sequence + a `BEFORE INSERT` trigger (Ch 26); recognize that pattern in legacy schemas.

### 16.3 Synonyms

A **synonym** is an alias for another object — a different name you can use to refer to a table, view, sequence, etc., often in another schema. They simplify access and provide a layer of indirection:

```sql
-- Private synonym (only for the creating user): refer to hr.employees as just "emp"
CREATE SYNONYM emp FOR hr.employees;
SELECT * FROM emp;                       -- resolves to hr.employees

-- Public synonym (for ALL users): everyone can use the short name
CREATE PUBLIC SYNONYM employees FOR hr.employees;
```

> **Why synonyms matter.** They give *location transparency*: application code references `emp` without knowing it lives in the `hr` schema, so you can move or repoint the object by changing the synonym, not the code. They are heavily used to expose another schema's objects under convenient names. **Caution:** public synonyms are global and can cause name-resolution confusion (a public synonym vs a local object of the same name); use them deliberately.

### 16.4 Indexes (introduction)

An **index** is an auxiliary structure that lets Oracle find rows matching a condition without scanning the whole table — like a book's index. This is the single most important tool for query performance (full treatment in Ch 36):

```sql
-- B-tree index (the default) on a column frequently used in WHERE/JOIN
CREATE INDEX idx_emp_dept ON employees (department_id);

-- Composite index (column order matters — leftmost-prefix rule, Ch 36)
CREATE INDEX idx_emp_dept_sal ON employees (department_id, salary);

-- Unique index (also enforces uniqueness; PK/UNIQUE constraints create these automatically)
CREATE UNIQUE INDEX idx_emp_email ON employees (email);

-- Function-based index: makes a function-wrapped predicate sargable (Ch 7, 36)
CREATE INDEX idx_emp_upper_name ON employees (UPPER(last_name));
-- now WHERE UPPER(last_name) = 'KING' can use an index

DROP INDEX idx_emp_dept;
```

> **Indexes are not free.** Every index speeds matching reads but *slows writes* (every `INSERT`/`UPDATE`/`DELETE` must maintain it) and consumes storage. Index the columns queries actually filter, join, and sort on — not speculatively. Primary-key and unique constraints create their supporting indexes automatically. Much more — B-tree internals, bitmap indexes, when indexes hurt — in Ch 36.

### 16.5 Materialized views (introduction)

A **materialized view (MV)** stores the *result* of its query physically (unlike a plain view, which recomputes every time), trading storage and staleness for fast reads. It is the database's "precompute and cache an expensive aggregation" tool, central to data warehousing (full treatment in Ch 42):

```sql
-- Precompute monthly sales totals; refresh on a schedule
CREATE MATERIALIZED VIEW mv_monthly_sales
  REFRESH COMPLETE ON DEMAND          -- refresh strategy (COMPLETE rebuild, or FAST/incremental)
AS
SELECT TRUNC(sale_date, 'MM') AS sale_month, product_id, SUM(amount) AS total
FROM   sales
GROUP  BY TRUNC(sale_date, 'MM'), product_id;

-- Refresh it:
BEGIN DBMS_MVIEW.REFRESH('MV_MONTHLY_SALES'); END;
/
```

> **The view vs materialized-view trade-off (same as everywhere).** A plain view recomputes its query every read (always fresh, more compute). A materialized view stores the result (fast reads, but stale until refreshed). Oracle's killer MV feature is **query rewrite** (Ch 42): the optimizer can *automatically* redirect a query against the base tables to a matching MV if it would answer faster — without the query even mentioning the MV. This is exactly the recompute-vs-precompute trade-off and incremental-vs-full-refresh decision from your DE Vol 3, built into Oracle.

---

## Chapter 17 — Advanced SQL

This chapter covers the advanced SQL that separates competent query writers from experts, and that your 11g notes barely touch: **analytic (window) functions** — the single highest-value advanced SQL skill — plus **hierarchical queries**, **PIVOT/UNPIVOT**, **regular expressions**, the powerful **MATCH_RECOGNIZE** pattern matcher, and **Flashback query**. These are heavily tested in interviews and used daily in real analytical work.

### 17.1 Analytic (window) functions — the core

A **window function** performs a calculation across a set of rows *related to the current row* — a ranking, a running total, a comparison to a previous row — and returns a value for **every** row, **without collapsing them** the way `GROUP BY` does. That last point is the whole idea: `GROUP BY department` collapses many employee rows into one row per department; a window function computes the same department-level value but *attaches it to every employee row*, so you keep all rows and gain a computed column.

Every window function is followed by an **`OVER`** clause defining the window — which rows the function sees for the current row. Its parts:

- **`PARTITION BY`** divides rows into groups; the function restarts per group (the window equivalent of `GROUP BY`, but rows are not collapsed).
- **`ORDER BY`** (inside `OVER`) orders rows within each partition — required for anything order-dependent (rankings, running totals, `LAG`/`LEAD`).
- A **frame** (`ROWS`/`RANGE BETWEEN ...`) defines exactly which rows around the current one are included (§17.1 frames below).

```sql
-- Attach each department's average salary to EVERY employee row (rows preserved!)
SELECT employee_id, last_name, department_id, salary,
       AVG(salary) OVER (PARTITION BY department_id)            AS dept_avg,
       salary - AVG(salary) OVER (PARTITION BY department_id)   AS diff_from_dept_avg
FROM   employees;
```

> **The mental shortcut:** `PARTITION BY` does the same grouping job as `GROUP BY`, but instead of collapsing each group to one row, it writes the computed value back onto every row of the group. If you can write a `GROUP BY` query, you can write the windowed version — swap `GROUP BY` for `PARTITION BY` inside `OVER` and keep all your rows. This is the most valuable advanced-SQL idea in the entire document.

**Ranking functions** assign a position within each partition, ordered by the `OVER`'s `ORDER BY`. The three essential ones differ precisely in how they handle ties (a favorite interview question):

```sql
SELECT last_name, department_id, salary,
       ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rn,
       RANK()       OVER (PARTITION BY department_id ORDER BY salary DESC) AS rnk,
       DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS dense,
       NTILE(4)     OVER (PARTITION BY department_id ORDER BY salary DESC) AS quartile
FROM   employees;
```

- **`ROW_NUMBER`** — a unique sequential integer per row; ties get *distinct* numbers (arbitrary order among them).
- **`RANK`** — tied rows share a rank, then it *skips* (two rows tied at 1 → next is 3).
- **`DENSE_RANK`** — tied rows share a rank, *no skip* (two tied at 1 → next is 2).
- **`NTILE(n)`** — divides rows into `n` roughly equal buckets (quartiles, deciles).

**Offset functions** let a row see another row's value a fixed distance away — the essence of comparing each row to its neighbors, replacing expensive self-joins:

```sql
-- Each employee vs the previous/next by hire date within their department
SELECT employee_id, department_id, hire_date, salary,
       LAG(salary)  OVER (PARTITION BY department_id ORDER BY hire_date) AS prev_hire_sal,
       LEAD(salary) OVER (PARTITION BY department_id ORDER BY hire_date) AS next_hire_sal,
       FIRST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY hire_date) AS first_sal,
       LAST_VALUE(salary)  OVER (PARTITION BY department_id ORDER BY hire_date
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_sal
FROM   employees;
```

- **`LAG(col, n, default)`** — value from `n` rows before (default 1); `default` returned at the boundary.
- **`LEAD(col, n, default)`** — value from `n` rows ahead.
- **`FIRST_VALUE` / `LAST_VALUE`** — value from the first/last row of the window (mind the frame — see the `LAST_VALUE` frame above, a classic gotcha).

> **`LAG`/`LEAD` replace self-joins.** Comparing each row to its predecessor once required joining a table to itself on an offset condition — verbose, error-prone, slow. `LAG`/`LEAD` do it in one ordered pass: month-over-month change, day-over-day deltas, time-between-events. A core pattern for analytics and a frequent optimization (recognizing where a self-join can become a `LAG`).

**Aggregate window functions** — any aggregate (`SUM`, `AVG`, `COUNT`, `MIN`, `MAX`) becomes a window function with `OVER`. Crucially, **adding `ORDER BY` inside `OVER` turns a whole-partition aggregate into a *running* (cumulative) one**, because the default frame becomes "start of partition through current row":

```sql
-- Without ORDER BY: the same partition total on every row
SELECT employee_id, department_id, salary,
       SUM(salary) OVER (PARTITION BY department_id) AS dept_total
FROM   employees;

-- WITH ORDER BY: the SAME function becomes a RUNNING total (cumulative)
SELECT employee_id, department_id, hire_date, salary,
       SUM(salary) OVER (PARTITION BY department_id ORDER BY hire_date) AS running_dept_total
FROM   employees;
```

> **The silent change that trips everyone:** `SUM(x) OVER (PARTITION BY k)` gives the partition total on every row; `SUM(x) OVER (PARTITION BY k ORDER BY t)` gives a *running* total up to each row, because adding `ORDER BY` changes the implicit frame. If you wanted the grand partition total and accidentally added `ORDER BY`, you silently get a running total instead. Make the frame explicit (below) to remove all doubt.

**The frame clause** (`ROWS`/`RANGE BETWEEN ... AND ...`) defines exactly which rows the window includes, enabling moving averages and precise running calculations:

```sql
-- Running total, frame written explicitly (this IS the default for ORDER BY)
SUM(amount) OVER (ORDER BY day ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)

-- 7-row moving average (current row + the 6 before it)
AVG(amount) OVER (ORDER BY day ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)

-- Centered 3-row average (one before, current, one after)
AVG(amount) OVER (ORDER BY day ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)
```

Frame keywords: `UNBOUNDED PRECEDING`, `n PRECEDING`, `CURRENT ROW`, `n FOLLOWING`, `UNBOUNDED FOLLOWING`. `ROWS` counts physical rows; `RANGE` works on the ordering *values* (treating ties together). Use `ROWS` for predictable row-by-row behavior; `RANGE` when ties in the ordering column should be grouped.

> **Top-N per group and deduplication — the two essential window idioms.** Because a window function cannot go directly in `WHERE` (it is computed after `WHERE`, per the evaluation order, Ch 6), wrap it in a subquery/CTE and filter there:
> ```sql
> -- Top 3 highest-paid per department
> SELECT * FROM (
>   SELECT last_name, department_id, salary,
>          ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rn
>   FROM employees
> ) WHERE rn <= 3;
>
> -- Deduplicate: keep only the latest row per key (the canonical CDC/dedup pattern)
> SELECT * FROM (
>   SELECT t.*, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY updated_at DESC) AS rn
>   FROM customer_snapshots t
> ) WHERE rn = 1;
> ```
> These two idioms appear in nearly every analytics codebase and interview. Deduplication especially — source systems deliver duplicates, CDC produces multiple versions, and the fix is exactly `ROW_NUMBER` partitioned by key, keep row 1. (Oracle has no `QUALIFY` clause as of 23ai — unlike Snowflake/BigQuery — so the subquery wrapper is required; it is the same logic.)

### 17.2 Hierarchical queries (CONNECT BY)

Oracle's proprietary `CONNECT BY` walks tree-structured data (an org chart, a bill of materials) — the Oracle-specific counterpart to recursive `WITH` (Ch 10). It is concise and pervades Oracle code, with handy pseudo-columns:

```sql
SELECT employee_id, last_name, manager_id,
       LEVEL,                                          -- depth in the tree (1 = root)
       LPAD(' ', (LEVEL-1)*3) || last_name AS chart,   -- indented org chart
       CONNECT_BY_ISLEAF                  AS is_leaf,  -- 1 if this row has no children
       SYS_CONNECT_BY_PATH(last_name,'/') AS path      -- '/King/Kochhar/Greenberg'
FROM   employees
START WITH manager_id IS NULL              -- the root(s) of the hierarchy
CONNECT BY PRIOR employee_id = manager_id  -- child.manager_id = parent.employee_id
ORDER SIBLINGS BY last_name;               -- order children within each parent
```

Key elements: **`START WITH`** identifies the root rows; **`CONNECT BY PRIOR`** defines the parent→child link (`PRIOR` marks the parent side); **`LEVEL`** is the depth pseudo-column; **`SYS_CONNECT_BY_PATH`** builds the path from root; **`CONNECT_BY_ISLEAF`** flags leaves; **`CONNECT_BY_ROOT`** returns a root value for each row; **`ORDER SIBLINGS BY`** orders within each parent. Use **`NOCYCLE`** (and `CONNECT_BY_ISCYCLE`) to survive cyclic data.

> **`CONNECT BY` vs recursive `WITH`.** `CONNECT BY` is terser and its pseudo-columns (`LEVEL`, path, isleaf) are convenient, but it is Oracle-only. Recursive `WITH` (Ch 10) is ANSI-standard and portable. In Oracle-only code, `CONNECT BY` is idiomatic and you must read it; for portability or general graphs, prefer recursive `WITH`. Both solve "walk a hierarchy of arbitrary depth."

### 17.3 PIVOT and UNPIVOT

`PIVOT` (11g+) rotates rows into columns — turning a tall table (one row per category) into a wide one (one column per category) — the dedicated operator for the conditional-aggregation idiom from Ch 9:

```sql
-- Salary total per job, as COLUMNS, one row per department
SELECT * FROM (
  SELECT department_id, job_id, salary FROM employees
)
PIVOT (
  SUM(salary)                                   -- the aggregate
  FOR job_id IN ('IT_PROG' AS it,               -- categories -> column names
                 'SA_REP'  AS sales,
                 'ST_CLERK' AS clerk)
);
-- Result columns: department_id, IT, SALES, CLERK
```

`UNPIVOT` does the reverse — wide columns back into rows — essential for normalizing spreadsheet-shaped data into tidy long form:

```sql
-- Turn q1..q4 columns into (quarter, amount) rows
SELECT product_id, quarter, amount
FROM   quarterly_sales
UNPIVOT (amount FOR quarter IN (q1 AS 'Q1', q2 AS 'Q2', q3 AS 'Q3', q4 AS 'Q4'));
```

> **PIVOT vs the CASE idiom.** `PIVOT` is cleaner for the common case but requires knowing the category values in advance (a fixed column list). The `SUM(CASE WHEN ...)` conditional-aggregation form (Ch 9) is more verbose but more flexible and fully portable. For a *dynamic* number of columns, you need dynamic SQL (Ch 27) with either approach. Know both; `PIVOT` for fixed categories in Oracle, `CASE` for flexibility and portability.

### 17.4 Regular expressions

Oracle's `REGEXP_*` functions bring full regular-expression power to SQL — far beyond `LIKE`'s `%`/`_`:

```sql
-- Does the string match a pattern?
SELECT * FROM employees WHERE REGEXP_LIKE(phone_number, '^\d{3}\.\d{3}\.\d{4}$');

-- Extract a matching substring
SELECT REGEXP_SUBSTR('order-12345-x', '\d+') FROM dual;          -- '12345'

-- Replace by pattern
SELECT REGEXP_REPLACE('a1b2c3', '\d', '#') FROM dual;            -- 'a#b#c#'

-- Position of a match; count of matches
SELECT REGEXP_INSTR('abc123', '\d') FROM dual;                   -- 4
SELECT REGEXP_COUNT('a.b.c.d', '\.') FROM dual;                  -- 3
```

The functions: `REGEXP_LIKE` (match test for `WHERE`), `REGEXP_SUBSTR` (extract), `REGEXP_REPLACE` (substitute), `REGEXP_INSTR` (position), `REGEXP_COUNT` (count, 11g+). They support standard regex metacharacters, capture groups, and case-insensitivity flags. Invaluable for validating and parsing messy text (phone numbers, codes, log lines).

> **Performance caveat.** Regex functions in a `WHERE` clause generally cannot use a normal index (they wrap the column), so they scan — fine for filtering an already-reduced set, costly on huge tables. For heavy text search, consider Oracle Text indexes or a function-based index on a normalized form. Powerful, but not free.

### 17.5 MATCH_RECOGNIZE — row pattern matching (12c)

**12c** — `MATCH_RECOGNIZE` is one of the most powerful (and underused) features in modern SQL: it finds **patterns across sequences of rows** using regular-expression-like syntax over ordered rows. It elegantly solves problems that are extremely awkward otherwise — detecting V-shapes in stock prices, sessionizing events, finding consecutive runs (gaps-and-islands), state transitions:

```sql
-- Detect a "V" pattern in a price series: a strictly falling run then a strictly rising run
SELECT * FROM stock_ticks
MATCH_RECOGNIZE (
  PARTITION BY symbol
  ORDER BY tick_time
  MEASURES  STRT.tick_time AS start_t,
            LAST(DOWN.tick_time) AS bottom_t,
            LAST(UP.tick_time)   AS end_t
  ONE ROW PER MATCH
  PATTERN (STRT DOWN+ UP+)                       -- regex over rows: start, fall(s), rise(s)
  DEFINE  DOWN AS price < PREV(price),           -- a "DOWN" row: price fell vs previous
          UP   AS price > PREV(price)            -- an "UP" row: price rose vs previous
);
```

The structure mirrors window functions (`PARTITION BY`, `ORDER BY`) plus: `PATTERN` (a regex over named row-classes, using `+ * ? | {n}`), `DEFINE` (boolean conditions defining each row-class), `MEASURES` (values to output per match), and `ONE ROW PER MATCH` / `ALL ROWS PER MATCH`.

> **Why it matters.** Sessionization and gaps-and-islands (your DE Vol 2) — which otherwise need the `LAG` + running-`SUM`-of-flags trick — can be expressed directly and readably with `MATCH_RECOGNIZE`. It is a genuine differentiator in advanced Oracle SQL, entirely absent from 11g, and a strong thing to know for interviews involving Oracle analytics. Most other databases lack an equivalent, so it is a real Oracle strength.

### 17.6 Flashback query — querying the past

Oracle's **Flashback** technology (built on undo/MVCC, Ch 14, 32) lets you query data **as it existed at a past time** — to recover from mistakes, audit changes, or compare states. The query-level features:

```sql
-- AS OF: see a table as it was at a past timestamp (or SCN)
SELECT * FROM employees AS OF TIMESTAMP (SYSTIMESTAMP - INTERVAL '1' HOUR)
WHERE  department_id = 50;

SELECT * FROM employees AS OF SCN 7654321;     -- as of a specific system change number

-- VERSIONS BETWEEN: see every version of rows over a time range (who/when changed them)
SELECT employee_id, salary,
       VERSIONS_STARTTIME, VERSIONS_ENDTIME, VERSIONS_OPERATION   -- I/U/D
FROM   employees
VERSIONS BETWEEN TIMESTAMP (SYSTIMESTAMP - INTERVAL '1' DAY) AND SYSTIMESTAMP
WHERE  employee_id = 200;
```

> **DE NOTE — Flashback is time travel.** `SELECT ... AS OF TIMESTAMP` is exactly the "time travel" you know from Delta Lake and Snowflake, and it predates them by years — both rest on the same idea (keep old versions, let a reader see a consistent past point). It is limited by your **undo retention** (how far back undo data is kept), and the broader Flashback suite (`FLASHBACK TABLE`, `FLASHBACK DROP`, Flashback Data Archive for long-term history) is covered in Ch 38. A powerful, distinctively-Oracle capability for recovery and auditing.

---

> **End of Part II.** You now have Oracle SQL in real depth: the datatype system; `SELECT` and its evaluation order; `WHERE` and the full function library; joins (ANSI and legacy `(+)`) and the fan-out trap; aggregation and the grouping extensions; subqueries, inline views, and CTEs (including recursive); set operators; the complete DDL with constraints, virtual/identity columns; DML with `MERGE`, error logging, and idempotency; transactions and Oracle's MVCC concurrency; DCL/security basics; the other schema objects; and the advanced SQL — window functions, `CONNECT BY`, `PIVOT`, regex, `MATCH_RECOGNIZE`, and Flashback query — that defines expert-level Oracle. **Part III** turns to **PL/SQL**, Oracle's procedural programming language, beginning with its block structure and fundamentals.

# PART III — PL/SQL

---

## Chapter 18 — PL/SQL Fundamentals

**PL/SQL** (Procedural Language extension to SQL) is Oracle's procedural programming language, embedded in the database. SQL is declarative and set-oriented — it describes *what* result you want. PL/SQL adds the *procedural* constructs SQL lacks: variables, conditionals, loops, error handling, and reusable stored program units (procedures, functions, packages, triggers). It runs *inside* the database engine, close to the data, which makes it efficient for data-intensive logic — though, as a recurring theme of this part will stress, much logic that was historically written in PL/SQL is better expressed as set-based SQL today (Ch 28, and your DE series). This chapter establishes PL/SQL's foundation: the block structure that is the skeleton of everything.

### 18.1 Why PL/SQL exists

Standard SQL cannot express everything. Some logic is inherently procedural: step through a result one row at a time applying complex rules, loop until a condition holds, branch on intermediate values, catch and handle errors gracefully, or bundle a sequence of operations into a reusable named routine that lives in the database and runs with its transactional guarantees. PL/SQL meets these needs. Its key characteristics:

- **Tightly integrated with SQL.** You can embed SQL statements directly in PL/SQL (no special API), and PL/SQL understands SQL datatypes natively. The two languages share types and the SQL engine.
- **Block-structured.** Programs are built from blocks (below), which can nest and be named.
- **Runs in the database.** Compiled and executed by the database server, minimizing the data movement that a client-side program would incur.
- **Portable across Oracle platforms** (but Oracle-specific — not portable to other databases; PostgreSQL's PL/pgSQL is similar but distinct, Ch 44).

> **The central judgment (stated up front, revisited in Ch 28).** PL/SQL is the right tool for genuinely procedural tasks, for logic that must live close to the data with transactional integrity, and — critically for you — for understanding and migrating the vast body of legacy systems built on it. But row-by-row procedural processing is often slow and hard to scale, and burying business logic in the database makes it awkward to version, test, and deploy. Learn PL/SQL thoroughly (it is a real skill and pervades enterprise Oracle), but always ask first whether a set-based SQL statement would do the job better. This tension runs through all of Part III.

### 18.2 The PL/SQL block structure

Every PL/SQL program is built from **blocks**. The block is the fundamental unit, and its structure is the first thing to internalize because everything — anonymous scripts, procedures, functions, triggers — is a block. A block has up to four parts in a fixed order:

```sql
DECLARE
   -- (optional) Declaration section: variables, constants, cursors, types, exceptions
   v_count   INTEGER;
   v_name    VARCHAR2(100);
BEGIN
   -- (required) Executable section: the procedural + SQL statements
   SELECT COUNT(*) INTO v_count FROM employees;
   DBMS_OUTPUT.PUT_LINE('Employee count: ' || v_count);
EXCEPTION
   -- (optional) Exception section: handle errors raised in the executable section
   WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('No rows found');
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
```

- **`DECLARE`** (optional) — declare variables, constants, types, cursors, and exceptions used in this block.
- **`BEGIN ... END`** (required) — the executable statements: procedural logic and embedded SQL. This is the only mandatory part.
- **`EXCEPTION`** (optional) — handlers that catch errors raised in the executable section (Ch 22).
- The trailing **`/`** (in SQL\*Plus/SQLcl) tells the tool to execute the block.

> **`SET SERVEROUTPUT ON` — the universal first step.** `DBMS_OUTPUT.PUT_LINE` writes to a buffer that the client displays only if server output is enabled. Without `SET SERVEROUTPUT ON` (Ch 4), every PL/SQL "hello world" runs successfully but shows *nothing*, and beginners conclude their code did not run. Turn it on at the start of any PL/SQL session. (In SQL Developer, it is a per-worksheet setting / `SET SERVEROUTPUT ON`.)

### 18.3 Anonymous blocks vs named blocks

Blocks come in two forms:

- **Anonymous blocks** — unnamed, compiled and run once, not stored in the database. The `DECLARE...BEGIN...END;/` examples above are anonymous blocks. Used for ad-hoc scripts, testing, and one-off tasks.
- **Named blocks** — stored in the database with a name, compiled once, and callable repeatedly: **procedures**, **functions**, **packages** (Ch 24–25), and **triggers** (Ch 26). Their bodies are blocks too (often without the `DECLARE` keyword — declarations go between the `IS/AS` and `BEGIN`).

```sql
-- A named block (procedure): same block structure, stored and reusable
CREATE OR REPLACE PROCEDURE show_emp_count AS    -- (note: AS replaces DECLARE here)
   v_count INTEGER;
BEGIN
   SELECT COUNT(*) INTO v_count FROM employees;
   DBMS_OUTPUT.PUT_LINE('Employees: ' || v_count);
END;
/
EXEC show_emp_count;     -- call it
```

Blocks can also **nest**: a block can contain inner blocks, each with its own `DECLARE`/`BEGIN`/`EXCEPTION`, which is how you scope variables and localize error handling (§18.6).

### 18.4 Variables, constants, and assignment

Declare variables in the declaration section with a name, a datatype, and optionally an initial value. Assign with the `:=` operator:

```sql
DECLARE
   v_salary     NUMBER(8,2);                    -- declared, initially NULL
   v_bonus      NUMBER(8,2) := 0;               -- declared with initial value
   v_name       VARCHAR2(100) := 'unknown';
   v_hired      DATE := SYSDATE;
   c_tax_rate   CONSTANT NUMBER := 0.30;        -- a constant (must be initialized)
   v_active     BOOLEAN := TRUE;                -- BOOLEAN exists in PL/SQL (unlike old SQL!)
BEGIN
   v_salary := 5000;                            -- assignment with :=
   v_bonus  := v_salary * 0.10;
   v_name   := 'Pratyush';
   DBMS_OUTPUT.PUT_LINE(v_name || ': ' || (v_salary + v_bonus));
END;
/
```

Key points:

- PL/SQL datatypes include all SQL types (`NUMBER`, `VARCHAR2`, `DATE`, etc.) **plus** PL/SQL-only types: **`BOOLEAN`** (TRUE/FALSE/NULL — note PL/SQL has had this for decades, even though *SQL* only got a boolean column type in 23ai), `PLS_INTEGER`/`BINARY_INTEGER` (fast integer types for loop counters and arithmetic), and types for records and collections (Ch 23).
- A **`CONSTANT`** must be given a value at declaration and cannot be changed.
- Uninitialized variables are **NULL** (all the NULL/3VL rules from Ch 2 apply inside PL/SQL too).
- `:=` is assignment; `=` is comparison (a common slip for those from languages where `=` assigns).

> **`PLS_INTEGER` for performance.** For integer loop counters and intensive integer arithmetic, `PLS_INTEGER` (or `BINARY_INTEGER`) is faster than `NUMBER` because it uses native machine integer operations rather than Oracle's decimal arithmetic. A small but real optimization in compute-heavy PL/SQL.

### 18.5 Anchored declarations: %TYPE and %ROWTYPE

PL/SQL has two elegant features for declaring variables whose types should *track the database schema* — anchoring a variable's type to a column or a whole row, so it automatically stays in sync if the schema changes. This is a genuine best practice and a defense against the schema-evolution problems of Ch 12.

**`%TYPE`** declares a variable with the same type as a specific table column (or another variable):

```sql
DECLARE
   v_salary   employees.salary%TYPE;       -- exactly the type of employees.salary
   v_name     employees.last_name%TYPE;    -- tracks the column definition automatically
BEGIN
   SELECT salary, last_name INTO v_salary, v_name
   FROM   employees WHERE employee_id = 100;
   DBMS_OUTPUT.PUT_LINE(v_name || ': ' || v_salary);
END;
/
```

**`%ROWTYPE`** declares a *record* variable matching an entire table row's structure, so you can fetch a whole row into one variable and reference its fields by name:

```sql
DECLARE
   v_emp   employees%ROWTYPE;              -- a record with one field per column
BEGIN
   SELECT * INTO v_emp FROM employees WHERE employee_id = 100;
   DBMS_OUTPUT.PUT_LINE(v_emp.last_name || ' earns ' || v_emp.salary
                        || ' in dept ' || v_emp.department_id);
END;
/
```

> **Always prefer anchored declarations.** Writing `v_salary employees.salary%TYPE` instead of hard-coding `v_salary NUMBER(8,2)` means that if the column's type later changes (say, widened to `NUMBER(10,2)`), your code adjusts automatically — no hunting for hard-coded types that have drifted out of sync with the schema. `%ROWTYPE` similarly future-proofs whole-row handling. This is a hallmark of well-written PL/SQL and directly mitigates the schema-evolution risk discussed in Ch 12.

### 18.6 Scope, nesting, and visibility

Variables are visible within the block where they are declared and any blocks nested inside it. An inner block can reference outer-block variables (and can declare its own, which *shadow* outer ones of the same name). This lexical scoping, plus nested exception sections, lets you localize both data and error handling:

```sql
DECLARE
   v_outer NUMBER := 1;
BEGIN
   DECLARE
      v_inner NUMBER := 2;          -- visible only in this inner block
   BEGIN
      DBMS_OUTPUT.PUT_LINE(v_outer + v_inner);   -- 3: inner sees outer
   EXCEPTION
      WHEN OTHERS THEN NULL;        -- localized error handling for just this inner work
   END;
   -- v_inner is NOT visible here (out of scope)
   DBMS_OUTPUT.PUT_LINE(v_outer);   -- 1
END;
/
```

> **Use nested blocks to localize error handling.** A common, powerful pattern: wrap a risky sub-operation in its own inner block with its own `EXCEPTION` section, so a failure there can be caught and handled (e.g. logged and skipped) without aborting the whole outer routine. This gives fine-grained control over which failures are recoverable. (More in Ch 22.)

### 18.7 Comments and literals

```sql
DECLARE
   v_x NUMBER := 10;        -- single-line comment (two dashes)
   /* multi-line comment
      spanning several lines */
   v_pi      CONSTANT NUMBER := 3.14159;
   v_text    VARCHAR2(50)   := 'It''s quoted';   -- '' inside a string = one literal '
   v_text2   VARCHAR2(50)   := q'[It's cleaner]'; -- q'[...]' quote operator: no doubling
   v_date    DATE           := DATE '2026-06-24'; -- ANSI date literal
BEGIN
   NULL;   -- the NULL statement: "do nothing" (a valid, sometimes-required statement)
END;
/
```

The **`q'[...]'`** alternative-quoting mechanism is a genuine convenience: instead of doubling every embedded single quote (`'It''s'`), you write `q'[It's]'` (or use any delimiter: `q'{...}'`, `q'!...!'`). Invaluable for strings containing many quotes — especially dynamic SQL (Ch 27). The **`NULL;` statement** ("do nothing") is occasionally required where a statement is syntactically mandatory but you want no action (an empty exception handler, a stub branch).

---

## Chapter 19 — Control Structures

PL/SQL provides the conditional and iterative control structures you expect from any programming language: `IF`/`CASE` for branching, and several loop forms for iteration. These are what let PL/SQL express algorithms SQL alone cannot — though, as always, prefer set-based SQL when a loop is merely iterating over rows (the warning recurs in Ch 21 and 23).

### 19.1 IF / ELSIF / ELSE

Conditional branching with `IF ... THEN ... ELSIF ... ELSE ... END IF`:

```sql
DECLARE
   v_salary NUMBER := 7500;
   v_grade  VARCHAR2(10);
BEGIN
   IF v_salary >= 10000 THEN
      v_grade := 'A';
   ELSIF v_salary >= 6000 THEN          -- note spelling: ELSIF (not ELSEIF or ELSE IF)
      v_grade := 'B';
   ELSIF v_salary >= 3000 THEN
      v_grade := 'C';
   ELSE
      v_grade := 'D';
   END IF;
   DBMS_OUTPUT.PUT_LINE('Grade: ' || v_grade);
END;
/
```

> **Spelling and NULL gotchas.** It is **`ELSIF`** (one word, no second E) — `ELSEIF` is a syntax error. And remember three-valued logic (Ch 2): an `IF` condition that evaluates to **UNKNOWN** (because of a NULL) takes neither the `THEN` nor `ELSIF` branch — it falls through to `ELSE` (or does nothing if there is no `ELSE`). `IF v_x > 10` when `v_x` is NULL is UNKNOWN, not TRUE, so the `THEN` block is skipped. Handle possibly-NULL variables explicitly.

### 19.2 CASE statement and CASE expression

PL/SQL has both a `CASE` **statement** (chooses which statements to execute) and a `CASE` **expression** (evaluates to a value) — distinguish them:

```sql
DECLARE
   v_dept NUMBER := 20;
   v_name VARCHAR2(30);
BEGIN
   -- CASE STATEMENT (executes statements per branch; ends with END CASE)
   CASE v_dept
      WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('Administration');
      WHEN 20 THEN DBMS_OUTPUT.PUT_LINE('Marketing');
      ELSE         DBMS_OUTPUT.PUT_LINE('Other');
   END CASE;

   -- CASE EXPRESSION (returns a value into a variable; ends with END)
   v_name := CASE v_dept
                WHEN 10 THEN 'Administration'
                WHEN 20 THEN 'Marketing'
                ELSE 'Other'
             END;

   -- Searched CASE (full conditions rather than equality to one expression)
   CASE
      WHEN v_dept BETWEEN 1 AND 50  THEN DBMS_OUTPUT.PUT_LINE('Low dept id');
      WHEN v_dept > 50              THEN DBMS_OUTPUT.PUT_LINE('High dept id');
      ELSE DBMS_OUTPUT.PUT_LINE('Unknown');
   END CASE;
END;
/
```

> **Statement vs expression; and `CASE_NOT_FOUND`.** The `CASE` *statement* ends with `END CASE` and runs statements; the `CASE` *expression* ends with `END` and produces a value (usable in assignments and SQL). A `CASE` *statement* with no matching `WHEN` and no `ELSE` raises `CASE_NOT_FOUND` (`ORA-06592`) — always include an `ELSE` (even `ELSE NULL;`) unless you intend that. (The `CASE` expression, by contrast, returns NULL when nothing matches and there is no `ELSE`.)

### 19.3 Basic loop (LOOP ... EXIT ... END LOOP)

The simplest loop runs forever until you explicitly `EXIT`:

```sql
DECLARE
   v_i PLS_INTEGER := 1;
BEGIN
   LOOP
      DBMS_OUTPUT.PUT_LINE('Iteration ' || v_i);
      v_i := v_i + 1;
      EXIT WHEN v_i > 5;        -- exit condition (or use IF ... THEN EXIT; END IF;)
   END LOOP;
END;
/
```

`EXIT` leaves the loop immediately; `EXIT WHEN condition` leaves when the condition becomes true. Use the basic loop when the exit logic is complex or must be tested mid-iteration.

> **Guard against infinite loops.** A basic `LOOP` with no reachable `EXIT` runs forever (until it errors or is killed). Always ensure the exit condition will be met. The basic loop is the most error-prone form precisely because the exit is manual.

### 19.4 WHILE loop

Tests a condition *before* each iteration; runs zero or more times:

```sql
DECLARE
   v_i PLS_INTEGER := 1;
BEGIN
   WHILE v_i <= 5 LOOP
      DBMS_OUTPUT.PUT_LINE('While ' || v_i);
      v_i := v_i + 1;
   END LOOP;
END;
/
```

Use `WHILE` when the number of iterations is not known in advance and depends on a condition checked at the top.

### 19.5 Numeric FOR loop

Iterates over an integer range; the loop counter is implicitly declared and read-only:

```sql
BEGIN
   FOR i IN 1 .. 5 LOOP            -- i is implicitly declared; do NOT declare it yourself
      DBMS_OUTPUT.PUT_LINE('For ' || i);
   END LOOP;

   FOR i IN REVERSE 1 .. 5 LOOP    -- REVERSE counts down (5,4,3,2,1)
      DBMS_OUTPUT.PUT_LINE('Reverse ' || i);
   END LOOP;
END;
/
```

The counter `i` exists only inside the loop, is automatically incremented (or decremented with `REVERSE`), and cannot be assigned to. The bounds are evaluated once at the start. This is the cleanest loop when you know the iteration count.

> **The counter is loop-scoped and read-only.** Do not declare `i` yourself (the loop declares it), and do not try to assign to it inside the loop — both are errors. If you declared a variable with the same name outside, the loop counter shadows it within the loop.

### 19.6 Cursor FOR loop (preview)

The most important loop for database work is the **cursor FOR loop**, which iterates over the rows of a query, implicitly opening, fetching, and closing the cursor. It is covered fully in Ch 21, but introduced here as the loop you will use most:

```sql
BEGIN
   FOR rec IN (SELECT employee_id, last_name, salary FROM employees WHERE department_id = 10)
   LOOP
      DBMS_OUTPUT.PUT_LINE(rec.last_name || ': ' || rec.salary);  -- rec is a %ROWTYPE record
   END LOOP;
END;
/
```

> **But beware the row-by-row trap (Ch 21, 23).** A cursor FOR loop that processes rows one at a time, especially one that runs DML inside it, is far slower than an equivalent single set-based SQL statement. The example above (just printing) is fine; a loop that *updates* each row should almost always be a single `UPDATE` instead. This is the central performance lesson of procedural SQL, previewed here and hammered in Ch 23.

### 19.7 CONTINUE and loop labels

**`CONTINUE`** (11g+) skips to the next iteration; **labels** name loops so you can `EXIT`/`CONTINUE` a specific (outer) loop from within a nested one:

```sql
BEGIN
   FOR i IN 1 .. 5 LOOP
      CONTINUE WHEN MOD(i, 2) = 0;        -- skip even numbers (11g+)
      DBMS_OUTPUT.PUT_LINE('Odd: ' || i);
   END LOOP;

   <<outer>>                               -- a loop label
   FOR i IN 1 .. 3 LOOP
      FOR j IN 1 .. 3 LOOP
         EXIT outer WHEN i = 2 AND j = 2;  -- exit the OUTER loop from the inner one
         DBMS_OUTPUT.PUT_LINE(i || ',' || j);
      END LOOP;
   END LOOP outer;
END;
/
```

> **`CONTINUE` is an 11g addition** — your notes' version has it, but older Oracle code works around its absence with `IF`/`GOTO`. Labels (`<<name>>`) are essential for controlling nested loops cleanly, letting you break out of or skip an outer loop without flag variables.

### 19.8 GOTO (and why to avoid it)

PL/SQL has `GOTO` to jump to a labeled statement. It exists, but is almost always the wrong choice:

```sql
BEGIN
   FOR i IN 1 .. 10 LOOP
      IF i = 5 THEN GOTO done; END IF;
      DBMS_OUTPUT.PUT_LINE(i);
   END LOOP;
   <<done>>
   DBMS_OUTPUT.PUT_LINE('Finished');
END;
/
```

> **Avoid `GOTO`.** It produces tangled, hard-to-follow control flow ("spaghetti code") and is essentially never necessary — `IF`/`CASE`/loops with `EXIT`/`CONTINUE` and proper exception handling cover every legitimate need more clearly. Mentioned for completeness because you may encounter it in old code, but do not write it. There are also subtle restrictions (you cannot `GOTO` into an `IF`/`LOOP`/exception block from outside it).

---

## Chapter 20 — SQL Inside PL/SQL

PL/SQL's defining strength is that SQL is a first-class citizen inside it — you embed SQL statements directly, no special API or string-building required (that is *dynamic* SQL, Ch 27; this chapter is *static* embedded SQL). This chapter covers how `SELECT`, DML, and transaction control work within PL/SQL, the all-important `SELECT INTO`, and the implicit cursor attributes that tell you what a statement did.

### 20.1 SELECT INTO — fetching a single row into variables

Inside PL/SQL, a query that returns exactly one row uses `SELECT ... INTO` to place its columns into variables (or a record):

```sql
DECLARE
   v_name   employees.last_name%TYPE;
   v_salary employees.salary%TYPE;
BEGIN
   SELECT last_name, salary INTO v_name, v_salary
   FROM   employees
   WHERE  employee_id = 100;
   DBMS_OUTPUT.PUT_LINE(v_name || ' earns ' || v_salary);
END;
/

-- Fetch a whole row into a %ROWTYPE record:
DECLARE
   v_emp employees%ROWTYPE;
BEGIN
   SELECT * INTO v_emp FROM employees WHERE employee_id = 100;
   DBMS_OUTPUT.PUT_LINE(v_emp.last_name);
END;
/
```

> **`SELECT INTO` must return EXACTLY one row** — this is its defining constraint and its two classic errors. If the query returns **no rows**, it raises **`NO_DATA_FOUND`** (`ORA-01403`). If it returns **more than one row**, it raises **`TOO_MANY_ROWS`** (`ORA-01422`). Both must be anticipated: either guarantee one row (e.g. query by primary key) or handle these exceptions (Ch 22). A `SELECT INTO` that *might* return zero or many rows needs an explicit cursor (Ch 21) or an exception handler — never assume one row without justification.

### 20.2 DML in PL/SQL

`INSERT`, `UPDATE`, `DELETE`, and `MERGE` are written directly in PL/SQL exactly as in SQL, and can use PL/SQL variables anywhere a value is expected:

```sql
DECLARE
   v_dept NUMBER := 50;
   v_pct  NUMBER := 1.05;
BEGIN
   UPDATE employees SET salary = salary * v_pct WHERE department_id = v_dept;
   INSERT INTO audit_log (action, logged_at) VALUES ('raise applied', SYSTIMESTAMP);
   DELETE FROM temp_staging WHERE load_date < SYSDATE - 30;
   COMMIT;
END;
/
```

PL/SQL variables are used seamlessly as **bind values** in embedded DML — Oracle handles the binding for you (a security and performance benefit; contrast the manual care needed in *dynamic* SQL, Ch 27). The same idempotency principles from Ch 13 apply: prefer `MERGE` for upserts, and structure DML so re-running a procedure is safe.

### 20.3 Implicit cursor attributes (SQL%...)

Every SQL statement PL/SQL executes has an associated **implicit cursor** named `SQL`, and after the statement you can inspect its attributes to learn what happened — most importantly **`SQL%ROWCOUNT`** (how many rows the last DML affected) and **`SQL%FOUND`/`SQL%NOTFOUND`**:

```sql
DECLARE
   v_updated PLS_INTEGER;
BEGIN
   UPDATE employees SET salary = salary * 1.10 WHERE department_id = 10;
   v_updated := SQL%ROWCOUNT;                       -- rows affected by the UPDATE
   DBMS_OUTPUT.PUT_LINE(v_updated || ' rows updated');

   IF SQL%FOUND THEN                                -- TRUE if the DML affected >= 1 row
      DBMS_OUTPUT.PUT_LINE('At least one row changed');
   END IF;

   DELETE FROM temp WHERE id = -1;
   IF SQL%NOTFOUND THEN                             -- TRUE if the DML affected 0 rows
      DBMS_OUTPUT.PUT_LINE('Nothing matched the delete');
   END IF;
   COMMIT;
END;
/
```

The implicit cursor attributes: **`SQL%ROWCOUNT`** (number of rows affected by the most recent SQL statement), **`SQL%FOUND`** (TRUE if it affected ≥1 row), **`SQL%NOTFOUND`** (TRUE if it affected 0 rows), **`SQL%ISOPEN`** (always FALSE for the implicit cursor — Oracle closes it automatically). `SQL%ROWCOUNT` is invaluable for logging and for conditional logic ("if no rows were updated, insert instead", though `MERGE` is usually cleaner).

> **`SQL%ROWCOUNT` reflects the *most recent* SQL statement.** Capture it immediately after the statement you care about — a subsequent SQL statement overwrites it. Storing it in a variable right away (as above) avoids surprises.

### 20.4 Transaction control in PL/SQL

`COMMIT`, `ROLLBACK`, and `SAVEPOINT` (Ch 14) work inside PL/SQL exactly as in SQL, controlling the transaction the procedure participates in:

```sql
BEGIN
   INSERT INTO orders (id, status) VALUES (5001, 'new');
   SAVEPOINT order_created;
   BEGIN
      INSERT INTO order_lines (order_id, line_no, product_id) VALUES (5001, 1, 9999);
   EXCEPTION
      WHEN OTHERS THEN
         ROLLBACK TO order_created;     -- undo just the failed line; keep the order
         DBMS_OUTPUT.PUT_LINE('Line failed, rolled back to savepoint');
   END;
   COMMIT;
END;
/
```

> **A procedure usually should NOT commit — let the caller control the transaction.** A subtle but important design principle: if a procedure commits internally, it forces a transaction boundary that the *calling* code may not want, breaking the atomicity of a larger unit of work. Generally, low-level procedures should perform their DML and let the *top-level* caller decide when to `COMMIT` or `ROLLBACK` the whole transaction. Commit inside a procedure only when it is genuinely meant to be its own complete transaction (or it is an autonomous transaction for logging, Ch 14/28). Over-eager internal commits are a common cause of partial, inconsistent data when something later fails.

---

## Chapter 21 — Cursors

A **cursor** is a pointer to the result set of a query — a handle through which PL/SQL processes query results, especially **multiple rows** one at a time. Where `SELECT INTO` (Ch 20) handles exactly one row, cursors handle many. This chapter covers implicit vs explicit cursors, the explicit-cursor lifecycle, the indispensable cursor FOR loop, parameterized cursors, updating through cursors, and REF cursors. It also repeatedly confronts the central tension of procedural data processing: **row-by-row iteration is usually slower than set-based SQL.**

### 21.1 Implicit vs explicit cursors

- **Implicit cursors** — Oracle creates these automatically for every `SELECT INTO` and DML statement (Ch 20); you do not declare or manage them, you only inspect their `SQL%...` attributes.
- **Explicit cursors** — you declare, open, fetch from, and close these yourself, to process a multi-row query result row by row with full control.

### 21.2 The explicit cursor lifecycle: DECLARE, OPEN, FETCH, CLOSE

An explicit cursor has four lifecycle steps, and understanding them illuminates what the (preferred) cursor FOR loop does automatically:

```sql
DECLARE
   -- 1. DECLARE: name the cursor and associate it with a query
   CURSOR c_emps IS
      SELECT employee_id, last_name, salary FROM employees WHERE department_id = 10;
   v_id     employees.employee_id%TYPE;
   v_name   employees.last_name%TYPE;
   v_salary employees.salary%TYPE;
BEGIN
   OPEN c_emps;                        -- 2. OPEN: execute the query, position before row 1
   LOOP
      FETCH c_emps INTO v_id, v_name, v_salary;   -- 3. FETCH: get the next row into vars
      EXIT WHEN c_emps%NOTFOUND;                   -- stop when no more rows
      DBMS_OUTPUT.PUT_LINE(v_name || ': ' || v_salary);
   END LOOP;
   CLOSE c_emps;                       -- 4. CLOSE: release the cursor's resources
END;
/
```

**Explicit cursor attributes** (prefix with the cursor name): `c_emps%FOUND` (TRUE if the last fetch returned a row), `c_emps%NOTFOUND` (TRUE if it did not — the standard loop-exit test), `c_emps%ROWCOUNT` (number of rows fetched so far), `c_emps%ISOPEN` (TRUE if the cursor is open).

> **Order of the EXIT matters.** Place `EXIT WHEN c_emps%NOTFOUND;` *immediately after* the `FETCH` and *before* using the fetched variables. If you process before checking, you will process the last row twice (the final `FETCH` fails but the variables still hold the previous row's values). This off-by-one is a classic explicit-cursor bug — which the cursor FOR loop (next) eliminates entirely.

### 21.3 The cursor FOR loop — the right default

The **cursor FOR loop** handles `OPEN`, `FETCH`, the loop, the exit test, and `CLOSE` *automatically*, and declares a loop record matching the query — eliminating all the boilerplate and the off-by-one risk of §21.2. It is the form you should use for almost all row iteration:

```sql
BEGIN
   FOR rec IN (SELECT employee_id, last_name, salary
               FROM employees WHERE department_id = 10)
   LOOP
      -- 'rec' is implicitly a %ROWTYPE record; reference fields by name
      DBMS_OUTPUT.PUT_LINE(rec.last_name || ': ' || rec.salary);
   END LOOP;   -- cursor opened, fetched, and closed automatically
END;
/

-- Equivalent using a named (declared) cursor in the FOR loop:
DECLARE
   CURSOR c_emps IS SELECT employee_id, last_name FROM employees WHERE department_id = 10;
BEGIN
   FOR rec IN c_emps LOOP
      DBMS_OUTPUT.PUT_LINE(rec.last_name);
   END LOOP;
END;
/
```

> **Prefer the cursor FOR loop over manual open/fetch/close.** It is shorter, cannot leak a cursor (always closes, even on most errors), and avoids the fetch-past-the-end off-by-one. Reserve the explicit `OPEN/FETCH/CLOSE` form for cases needing fine control (bulk fetching with `LIMIT`, Ch 23; conditional fetching; passing a cursor around). For straightforward "do something with each row", the cursor FOR loop is the clean idiom.

> **But first ask: do you need a loop at all?** A cursor FOR loop that runs a DML statement per row — "for each employee, update their bonus" — is the row-by-row anti-pattern. The same work as a single `UPDATE ... SET bonus = ...` runs dramatically faster because the set-based statement does it in one operation instead of N round-trips through the PL/SQL/SQL engine boundary. **Use a loop only when the per-row logic genuinely cannot be expressed in set-based SQL.** This is the most important performance principle in PL/SQL, and §21.6 / Ch 23 show how to speed up loops that are unavoidable.

### 21.4 Parameterized cursors

A cursor can take parameters, so the same cursor definition can be opened with different values — useful for reuse and for cursors used inside loops over a driving query:

```sql
DECLARE
   CURSOR c_emps_in_dept (p_dept NUMBER) IS
      SELECT last_name, salary FROM employees WHERE department_id = p_dept;
BEGIN
   FOR rec IN c_emps_in_dept(10) LOOP        -- open with department 10
      DBMS_OUTPUT.PUT_LINE('Dept 10: ' || rec.last_name);
   END LOOP;
   FOR rec IN c_emps_in_dept(20) LOOP        -- reuse the same cursor for department 20
      DBMS_OUTPUT.PUT_LINE('Dept 20: ' || rec.last_name);
   END LOOP;
END;
/
```

Parameterized cursors keep the query definition in one place while varying the inputs — cleaner than redefining similar cursors, and they make the parameter's role explicit.

### 21.5 Updating through a cursor: FOR UPDATE and WHERE CURRENT OF

When you intend to update or delete the rows a cursor is processing, declare it `FOR UPDATE` (which locks the rows as they are read, Ch 14) and use **`WHERE CURRENT OF cursor`** in the DML to target exactly the row just fetched:

```sql
DECLARE
   CURSOR c_emps IS
      SELECT employee_id, salary FROM employees WHERE department_id = 10
      FOR UPDATE OF salary;              -- lock these rows for update
BEGIN
   FOR rec IN c_emps LOOP
      UPDATE employees
      SET    salary = rec.salary * 1.10
      WHERE  CURRENT OF c_emps;          -- update exactly the row just fetched
   END LOOP;
   COMMIT;
END;
/
```

> **This very example, though, should be a single `UPDATE`.** `UPDATE employees SET salary = salary * 1.10 WHERE department_id = 10;` does the identical work in one set-based statement, far faster, with no cursor. The `FOR UPDATE`/`WHERE CURRENT OF` pattern is legitimate only when the per-row new value requires procedural logic that truly cannot be written in SQL (a complex computation, a call to a function with side effects). When you see this pattern, your first instinct should be "can this be one `UPDATE`?" — usually it can. (When it genuinely cannot, `FORALL` with bulk binding, Ch 23, is the fast way to apply many computed updates.)

### 21.6 REF cursors and cursor variables

A **REF cursor** (cursor variable) is a cursor whose query is not fixed at compile time — it is a *variable* that can point to different result sets, and crucially can be **passed between subprograms and returned to client applications**. This is how a stored procedure hands a result set back to a Java/Python/application caller:

```sql
DECLARE
   TYPE emp_refcursor IS REF CURSOR;       -- a weakly-typed REF CURSOR type
   c_emps emp_refcursor;
   v_name employees.last_name%TYPE;
   v_sal  employees.salary%TYPE;
   v_hi   BOOLEAN := TRUE;
BEGIN
   IF v_hi THEN
      OPEN c_emps FOR SELECT last_name, salary FROM employees WHERE salary > 10000;
   ELSE
      OPEN c_emps FOR SELECT last_name, salary FROM employees WHERE salary <= 10000;
   END IF;
   LOOP
      FETCH c_emps INTO v_name, v_sal;
      EXIT WHEN c_emps%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(v_name || ': ' || v_sal);
   END LOOP;
   CLOSE c_emps;
END;
/

-- Returning a result set from a procedure (the common real-world use):
CREATE OR REPLACE PROCEDURE get_emps (p_dept NUMBER, p_result OUT SYS_REFCURSOR) AS
BEGIN
   OPEN p_result FOR
      SELECT employee_id, last_name, salary FROM employees WHERE department_id = p_dept;
END;
/
-- A client app (or another procedure) consumes the returned cursor.
```

**Strong vs weak REF cursors:** a *strongly-typed* REF cursor (`TYPE t IS REF CURSOR RETURN employees%ROWTYPE`) fixes the result structure (compile-time checking); a *weakly-typed* one (`TYPE t IS REF CURSOR`, or the built-in **`SYS_REFCURSOR`**) can point to any query (flexible, no structure checking). `SYS_REFCURSOR` is the convenient predefined weak type used in most code.

> **DE NOTE — REF cursors are how Oracle returns result sets to applications.** When an application or reporting tool calls an Oracle stored procedure and expects rows back, a `SYS_REFCURSOR` `OUT` parameter is the standard mechanism — the procedure opens the cursor and the client iterates it. This is the bridge between PL/SQL and the outside world, and a common pattern in API/data-access layers built on Oracle. It is also how some ETL tools pull data out of Oracle procedurally.

---

## Chapter 22 — Exception Handling

Robust PL/SQL must anticipate and handle runtime errors — a query returning no rows, a constraint violation, a division by zero, an unexpected condition. PL/SQL's **exception** mechanism separates error-handling logic from the main flow: the executable section expresses the normal path, and the `EXCEPTION` section catches and responds to errors. This chapter covers predefined, non-predefined, and user-defined exceptions, the error-inspection functions, raising your own errors, and how exceptions propagate.

### 22.1 How exception handling works

When a runtime error (an **exception**) occurs in the executable section, normal execution stops and control transfers to the block's `EXCEPTION` section, where Oracle looks for a matching handler. If found, the handler runs and the block completes normally; if not found, the exception **propagates** to the enclosing block (§22.6):

```sql
DECLARE
   v_salary employees.salary%TYPE;
BEGIN
   SELECT salary INTO v_salary FROM employees WHERE employee_id = 999999;  -- no such row
   DBMS_OUTPUT.PUT_LINE('Salary: ' || v_salary);                          -- skipped
EXCEPTION
   WHEN NO_DATA_FOUND THEN                       -- the matching handler runs
      DBMS_OUTPUT.PUT_LINE('No employee with that id');
   WHEN TOO_MANY_ROWS THEN
      DBMS_OUTPUT.PUT_LINE('Query unexpectedly returned multiple rows');
   WHEN OTHERS THEN                              -- catch-all (use carefully — see 22.5)
      DBMS_OUTPUT.PUT_LINE('Unexpected: ' || SQLERRM);
END;
/
```

The structure of a handler is `WHEN exception_name THEN statements;`. A block can have many handlers; Oracle uses the first one that matches the raised exception. `WHEN OTHERS` matches anything not caught above it.

### 22.2 Predefined exceptions

Oracle predefines named exceptions for common errors, so you can catch them by name without knowing the error number. The ones you meet constantly:

| Exception | Oracle error | When it occurs |
|---|---|---|
| `NO_DATA_FOUND` | ORA-01403 | `SELECT INTO` returned no rows |
| `TOO_MANY_ROWS` | ORA-01422 | `SELECT INTO` returned more than one row |
| `DUP_VAL_ON_INDEX` | ORA-00001 | Insert/update violated a unique constraint/index |
| `ZERO_DIVIDE` | ORA-01476 | Division by zero |
| `INVALID_NUMBER` | ORA-01722 | Failed string-to-number conversion (in SQL) |
| `VALUE_ERROR` | ORA-06502 | Conversion/truncation/arithmetic error (in PL/SQL) |
| `CURSOR_ALREADY_OPEN` | ORA-06511 | Opened an already-open cursor |
| `INVALID_CURSOR` | ORA-01001 | Illegal cursor operation (e.g. fetch from a closed cursor) |
| `CASE_NOT_FOUND` | ORA-06592 | `CASE` statement with no matching `WHEN` and no `ELSE` |
| `ACCESS_INTO_NULL` | ORA-06530 | Referenced an attribute of an uninitialized object |
| `COLLECTION_IS_NULL` | ORA-06531 | Operated on an uninitialized collection |
| `SUBSCRIPT_BEYOND_COUNT` | ORA-06533 | Referenced a collection index past its end |

```sql
BEGIN
   INSERT INTO departments (department_id, department_name) VALUES (10, 'Dup');  -- PK exists
EXCEPTION
   WHEN DUP_VAL_ON_INDEX THEN
      DBMS_OUTPUT.PUT_LINE('That department id already exists');
END;
/
```

> **Catch specific exceptions, not just `OTHERS`.** Handling `NO_DATA_FOUND` or `DUP_VAL_ON_INDEX` by name lets you respond appropriately (e.g. insert-or-update logic, a friendly message) and leaves truly unexpected errors to propagate or to a logged `OTHERS`. Naming the exceptions you expect makes intent clear and behavior correct.

### 22.3 Non-predefined Oracle errors (PRAGMA EXCEPTION_INIT)

Most Oracle errors do *not* have predefined names — only an `ORA-nnnnn` number. To catch one by name, declare your own exception and bind it to the error number with **`PRAGMA EXCEPTION_INIT`**:

```sql
DECLARE
   -- ORA-02292: integrity constraint violated - child record found (FK restrict)
   child_record_exists EXCEPTION;
   PRAGMA EXCEPTION_INIT(child_record_exists, -2292);   -- bind name to error number
BEGIN
   DELETE FROM departments WHERE department_id = 10;     -- has employees -> ORA-02292
EXCEPTION
   WHEN child_record_exists THEN
      DBMS_OUTPUT.PUT_LINE('Cannot delete: department still has employees');
END;
/
```

This makes otherwise-anonymous errors catchable by a meaningful name. Note the error number is given as a **negative** value (Oracle errors are negative internally, except the no-data and a few others). Common candidates: `-2292`/`-2291` (FK violations), `-1` (unique), `-1400` (NOT NULL violation), `-12899` (value too large for column).

### 22.4 User-defined exceptions

You can declare and raise your own exceptions for business-rule violations that are not Oracle errors at all:

```sql
DECLARE
   salary_too_high EXCEPTION;                    -- declare a custom exception
   v_salary NUMBER := 50000;
   c_max    CONSTANT NUMBER := 40000;
BEGIN
   IF v_salary > c_max THEN
      RAISE salary_too_high;                     -- raise it explicitly
   END IF;
   -- ... normal processing ...
EXCEPTION
   WHEN salary_too_high THEN
      DBMS_OUTPUT.PUT_LINE('Salary exceeds the policy maximum of ' || c_max);
END;
/
```

User-defined exceptions let business logic use the same clean error-handling mechanism as system errors: detect a violation, `RAISE`, and handle it in the `EXCEPTION` section, keeping the main flow uncluttered by error checks.

### 22.5 SQLCODE, SQLERRM, and the WHEN OTHERS question

Inside an exception handler, two functions report what went wrong: **`SQLCODE`** returns the numeric error code, and **`SQLERRM`** returns the error message text. They are essential in a `WHEN OTHERS` handler to discover what was actually caught:

```sql
BEGIN
   -- ... some risky code ...
   RAISE_APPLICATION_ERROR(-20001, 'demo');
EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Code: ' || SQLCODE);                 -- e.g. -20001
      DBMS_OUTPUT.PUT_LINE('Message: ' || SQLERRM);              -- the text
      DBMS_OUTPUT.PUT_LINE('Stack: ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);  -- where!
      RAISE;     -- re-raise so the caller still sees the error (don't swallow it!)
END;
/
```

> **The `WHEN OTHERS` trap — the most dangerous habit in PL/SQL.** A bare `WHEN OTHERS THEN NULL;` *silently swallows every error*, so failures vanish without a trace and data quietly corrupts — the single worst PL/SQL anti-pattern. If you use `WHEN OTHERS`, you must do one of: (1) log the error (`SQLCODE`/`SQLERRM`/`FORMAT_ERROR_BACKTRACE`) **and** `RAISE;` to re-propagate it, or (2) handle it genuinely and deliberately. Never catch `OTHERS` and do nothing. **`DBMS_UTILITY.FORMAT_ERROR_BACKTRACE`** is gold here — it shows the exact line where the error originated, even after propagation, which plain `SQLERRM` loses.

### 22.6 Exception propagation

If a block does not handle an exception, it **propagates outward** to the enclosing block, and so on up the call stack, until a handler is found or it reaches the client (which sees the unhandled error). This is why nested blocks (Ch 18.6) give fine-grained control: an inner block can catch and handle (or log-and-continue) a failure in a sub-operation, while letting the outer block proceed:

```sql
BEGIN
   FOR rec IN (SELECT employee_id FROM employees) LOOP
      BEGIN
         -- risky per-row work in its own block
         UPDATE accounts SET balance = balance / 0 WHERE owner_id = rec.employee_id;  -- error
      EXCEPTION
         WHEN ZERO_DIVIDE THEN
            DBMS_OUTPUT.PUT_LINE('Skipped employee ' || rec.employee_id);  -- log & continue
      END;
   END LOOP;     -- the loop continues despite individual failures
END;
/
```

> **Localize handling where you can recover; propagate what you cannot.** The pattern above — an inner block per iteration that catches recoverable errors and continues — is how you build resilient batch processing that does not abort on one bad row (the PL/SQL analogue of DML error logging, Ch 13, and of quarantining bad records in a pipeline). Conversely, do not catch errors you cannot meaningfully handle; let them propagate to a level that can (or to the caller). Thoughtful placement of `EXCEPTION` sections is a core skill.

### 22.7 RAISE_APPLICATION_ERROR

To return a **custom error number and message** to the calling application (so a client sees a meaningful business error, not a raw Oracle code), use `RAISE_APPLICATION_ERROR(num, message)`, where `num` is in the range **−20000 to −20999** (reserved for application errors):

```sql
CREATE OR REPLACE PROCEDURE withdraw (p_acct NUMBER, p_amount NUMBER) AS
   v_balance accounts.balance%TYPE;
BEGIN
   SELECT balance INTO v_balance FROM accounts WHERE id = p_acct FOR UPDATE;
   IF p_amount > v_balance THEN
      RAISE_APPLICATION_ERROR(-20010,
         'Insufficient funds: balance ' || v_balance || ', requested ' || p_amount);
   END IF;
   UPDATE accounts SET balance = balance - p_amount WHERE id = p_acct;
   COMMIT;
END;
/
-- The caller receives: ORA-20010: Insufficient funds: balance 100, requested 500
```

> This is how PL/SQL communicates business-rule failures to applications in a controlled way: a stable custom error number the application can detect and a human-readable message. Use the −20000..−20999 range (other ranges are reserved by Oracle). Combined with user-defined exceptions (§22.4), it gives clean, meaningful error reporting from database logic to the outside world.

---

## Chapter 23 — Composite Types & Bulk Processing

This chapter covers PL/SQL's **composite datatypes** — records and collections — and culminates in **bulk processing** (`BULK COLLECT` and `FORALL`), the techniques that resolve the central performance tension of all of Part III. If you must process many rows procedurally, bulk binding is how you make it fast. This is among the most important performance topics in PL/SQL.

### 23.1 Records

A **record** is a composite variable grouping several related fields (of possibly different types) under one name — like a row, or a struct. You have already met `%ROWTYPE` records (Ch 18); you can also define your own record types:

```sql
DECLARE
   -- A user-defined record type
   TYPE emp_rec IS RECORD (
      id     employees.employee_id%TYPE,
      name   employees.last_name%TYPE,
      salary employees.salary%TYPE,
      raise  NUMBER(8,2)
   );
   v_emp emp_rec;                            -- a variable of that record type
   v_row employees%ROWTYPE;                  -- a record matching the table's row
BEGIN
   v_emp.id := 100; v_emp.name := 'King'; v_emp.salary := 24000;
   v_emp.raise := v_emp.salary * 0.1;
   DBMS_OUTPUT.PUT_LINE(v_emp.name || ' raise: ' || v_emp.raise);

   SELECT * INTO v_row FROM employees WHERE employee_id = 100;
   DBMS_OUTPUT.PUT_LINE(v_row.last_name);    -- field access by name
END;
/
```

Records group related data, can be passed to and returned from subprograms, and (via `%ROWTYPE`) make whole-row handling clean. You can even `INSERT`/`UPDATE` using a `%ROWTYPE` record directly (`INSERT INTO employees VALUES v_row;`).

### 23.2 Collections: the three kinds

A **collection** is an ordered set of elements of the *same* type — PL/SQL's arrays/lists. There are three kinds, and knowing which to use matters:

- **Associative arrays** (index-by tables) — key-value pairs, indexed by integer *or string*; sparse, grow dynamically, exist only in PL/SQL (not storable in a table). The workhorse for in-memory lookups and bulk operations.
- **Nested tables** — ordered collections that can be sparse, can be stored as a column in a database table, and have set operations. Persist in the database.
- **VARRAYs** (variable-size arrays) — ordered, with a fixed maximum size declared up front; dense; storable in a table. Use when there is a known, small upper bound.

```sql
DECLARE
   -- Associative array indexed by PLS_INTEGER
   TYPE num_tab IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
   v_salaries num_tab;

   -- Associative array indexed by STRING (a true "map"/dictionary)
   TYPE name_map IS TABLE OF NUMBER INDEX BY VARCHAR2(50);
   v_dept_budget name_map;

   -- Nested table (no INDEX BY; storable in a table)
   TYPE name_list IS TABLE OF VARCHAR2(100);
   v_names name_list := name_list('Asha', 'Ravi', 'Meera');   -- constructor initializes

   -- VARRAY with a max size
   TYPE top3 IS VARRAY(3) OF VARCHAR2(50);
   v_winners top3 := top3('Gold', 'Silver', 'Bronze');
BEGIN
   v_salaries(1) := 5000;  v_salaries(2) := 7000;       -- assign by index
   v_dept_budget('Engineering') := 1000000;             -- assign by string key
   DBMS_OUTPUT.PUT_LINE(v_salaries(2));                 -- 7000
   DBMS_OUTPUT.PUT_LINE(v_dept_budget('Engineering'));  -- 1000000
   DBMS_OUTPUT.PUT_LINE(v_names(1));                     -- Asha
END;
/
```

> **Which collection?** Use an **associative array** for in-memory work (lookups, accumulating results, bulk binding) — it is the most common and needs no initialization. Use a **nested table** when the collection must be stored in a database column or you need set operations. Use a **VARRAY** when there is a small, fixed maximum number of elements. For the bulk-processing techniques below (the main event), associative arrays and nested tables are typical.

### 23.3 Collection methods

Collections have built-in methods to inspect and manipulate them:

```sql
DECLARE
   TYPE num_tab IS TABLE OF NUMBER;
   v num_tab := num_tab(10, 20, 30);
BEGIN
   DBMS_OUTPUT.PUT_LINE(v.COUNT);        -- 3  (number of elements)
   DBMS_OUTPUT.PUT_LINE(v.FIRST);        -- 1  (first index)
   DBMS_OUTPUT.PUT_LINE(v.LAST);         -- 3  (last index)
   v.EXTEND;                              -- grow by one element (nested tables/VARRAYs)
   v(4) := 40;
   DBMS_OUTPUT.PUT_LINE(v.EXISTS(4));    -- TRUE
   v.DELETE(2);                           -- remove element 2 (now sparse)
   DBMS_OUTPUT.PUT_LINE(v.COUNT);        -- 3
   -- Iterate safely over a possibly-sparse collection:
   DECLARE i PLS_INTEGER := v.FIRST;
   BEGIN
      WHILE i IS NOT NULL LOOP
         DBMS_OUTPUT.PUT_LINE(i || ' => ' || v(i));
         i := v.NEXT(i);                  -- NEXT skips deleted gaps
      END LOOP;
   END;
END;
/
```

Methods: `COUNT`, `FIRST`, `LAST`, `PRIOR(n)`, `NEXT(n)`, `EXISTS(n)`, `EXTEND[(n)]`, `TRIM[(n)]`, `DELETE[(n)]`, `LIMIT` (VARRAY max). Use `FIRST`/`NEXT` (not a numeric `FOR 1..COUNT`) to iterate collections that might be sparse, so you skip deleted gaps without error.

### 23.4 BULK COLLECT — fetching many rows at once

Here the performance story turns decisive. Fetching rows one at a time (a normal cursor loop) incurs a **context switch** between the PL/SQL engine and the SQL engine on *every row* — and those switches dominate the cost when there are many rows. **`BULK COLLECT`** fetches *many rows in a single operation* into a collection, collapsing N context switches into one (or a few):

```sql
DECLARE
   TYPE emp_tab IS TABLE OF employees%ROWTYPE;
   v_emps emp_tab;
BEGIN
   -- Fetch ALL matching rows into the collection in ONE round trip
   SELECT * BULK COLLECT INTO v_emps FROM employees WHERE department_id = 50;

   DBMS_OUTPUT.PUT_LINE('Fetched ' || v_emps.COUNT || ' rows in one operation');
   FOR i IN 1 .. v_emps.COUNT LOOP
      DBMS_OUTPUT.PUT_LINE(v_emps(i).last_name);    -- now process in memory (no per-row SQL)
   END LOOP;
END;
/
```

For large result sets, fetch in **batches** with `LIMIT` so you do not load millions of rows into memory at once:

```sql
DECLARE
   CURSOR c IS SELECT * FROM employees;
   TYPE emp_tab IS TABLE OF employees%ROWTYPE;
   v_emps emp_tab;
BEGIN
   OPEN c;
   LOOP
      FETCH c BULK COLLECT INTO v_emps LIMIT 1000;   -- 1000 rows per fetch
      EXIT WHEN v_emps.COUNT = 0;
      FOR i IN 1 .. v_emps.COUNT LOOP
         NULL;  -- process each row in memory
      END LOOP;
      EXIT WHEN c%NOTFOUND;     -- last (partial) batch fetched
   END LOOP;
   CLOSE c;
END;
/
```

> **Always batch large bulk fetches with `LIMIT`.** `BULK COLLECT` without a `LIMIT` loads the *entire* result set into PGA memory — fine for a few thousand rows, dangerous for millions (it can exhaust memory). The `FETCH ... BULK COLLECT INTO ... LIMIT n` pattern (n typically 100–1000) gets the speed of bulk fetching while bounding memory. This is the standard idiom for processing large tables procedurally when you genuinely cannot do it set-based.

### 23.5 FORALL — bulk DML

The mirror image of `BULK COLLECT`: **`FORALL`** sends *many* DML operations to the SQL engine in a *single* bulk operation, again collapsing per-row context switches. It is not a loop — it is one statement that applies a DML across all elements of a collection:

```sql
DECLARE
   TYPE id_tab  IS TABLE OF employees.employee_id%TYPE;
   TYPE sal_tab IS TABLE OF employees.salary%TYPE;
   v_ids  id_tab;
   v_sals sal_tab;
BEGIN
   -- gather the data to change (bulk)
   SELECT employee_id, salary * 1.10 BULK COLLECT INTO v_ids, v_sals
   FROM   employees WHERE department_id = 50;

   -- apply ALL updates in ONE bulk operation (not row by row!)
   FORALL i IN 1 .. v_ids.COUNT
      UPDATE employees SET salary = v_sals(i) WHERE employee_id = v_ids(i);

   DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' rows updated in bulk');
   COMMIT;
END;
/
```

> **`BULK COLLECT` + `FORALL` is the performance answer when a loop is unavoidable.** Together they can make procedural row processing **many times faster** (often 10×+ on large volumes) by eliminating per-row context switching. *However* — and this is the recurring theme — if the work can be done as a **single set-based SQL statement** (`UPDATE ... SET salary = salary * 1.10 WHERE department_id = 50`), that is *still* better than even `FORALL`, because it never leaves the SQL engine at all. The hierarchy of preference: **(1) one set-based SQL statement > (2) `BULK COLLECT`/`FORALL` when procedural logic is required > (3) a plain row-by-row cursor loop (slowest, avoid).** Reach for bulk binding only when set-based SQL genuinely cannot express the logic.

### 23.6 FORALL with SAVE EXCEPTIONS

By default, if one DML operation inside a `FORALL` fails, the whole bulk statement aborts. **`SAVE EXCEPTIONS`** lets `FORALL` continue past failures, collecting them so you can inspect which elements failed — the bulk-processing analogue of DML error logging (Ch 13):

```sql
DECLARE
   TYPE id_tab IS TABLE OF NUMBER;
   v_ids id_tab := id_tab(1, 2, -3, 4, -5);   -- some invalid values
   bulk_errors EXCEPTION;
   PRAGMA EXCEPTION_INIT(bulk_errors, -24381); -- the bulk-operation error code
BEGIN
   FORALL i IN 1 .. v_ids.COUNT SAVE EXCEPTIONS
      INSERT INTO target (id) VALUES (v_ids(i));  -- some may violate a check/constraint
EXCEPTION
   WHEN bulk_errors THEN
      DBMS_OUTPUT.PUT_LINE('Failures: ' || SQL%BULK_EXCEPTIONS.COUNT);
      FOR j IN 1 .. SQL%BULK_EXCEPTIONS.COUNT LOOP
         DBMS_OUTPUT.PUT_LINE('  element ' || SQL%BULK_EXCEPTIONS(j).ERROR_INDEX
            || ' failed: ' || SQLERRM(-SQL%BULK_EXCEPTIONS(j).ERROR_CODE));
      END LOOP;
END;
/
```

> **`SAVE EXCEPTIONS` makes bulk DML resilient.** Without it, one bad element sinks the entire `FORALL`; with it, the good operations succeed and you get a collection (`SQL%BULK_EXCEPTIONS`) describing each failure by index and error code. This is exactly the "load the good rows, capture the bad ones" pattern — the procedural counterpart to `LOG ERRORS` (Ch 13) and to quarantining bad records in a data pipeline.

---

## Chapter 24 — Procedures & Functions

So far the PL/SQL examples were anonymous blocks. **Procedures** and **functions** are *named*, *stored* program units — compiled once and saved in the database, then called repeatedly by name. They are the building blocks of reusable database logic, and (grouped into packages, Ch 25) the standard way enterprise Oracle applications organize server-side code. This chapter covers creating them, the parameter system, and the design choices that distinguish good stored code.

### 24.1 Procedures

A **procedure** is a named block that performs an action. It is created with `CREATE OR REPLACE PROCEDURE`, takes parameters, and is invoked as a statement (it does not return a value via the call itself — it returns through `OUT` parameters or side effects):

```sql
CREATE OR REPLACE PROCEDURE give_raise (
   p_emp_id  IN  employees.employee_id%TYPE,    -- input parameter
   p_pct     IN  NUMBER DEFAULT 5                -- input with a default value
) AS
   v_old employees.salary%TYPE;
BEGIN
   SELECT salary INTO v_old FROM employees WHERE employee_id = p_emp_id;
   UPDATE employees SET salary = salary * (1 + p_pct/100) WHERE employee_id = p_emp_id;
   DBMS_OUTPUT.PUT_LINE('Raised ' || p_emp_id || ' from ' || v_old);
EXCEPTION
   WHEN NO_DATA_FOUND THEN
      RAISE_APPLICATION_ERROR(-20001, 'No employee ' || p_emp_id);
END give_raise;
/

-- Calling a procedure:
EXEC give_raise(100, 10);                 -- SQL*Plus shortcut
BEGIN give_raise(p_emp_id => 100); END;   -- from PL/SQL, using the default p_pct
/
```

Note the structure: `CREATE OR REPLACE PROCEDURE name (params) AS` (or `IS` — interchangeable), then declarations (no `DECLARE` keyword), then `BEGIN ... EXCEPTION ... END;`. `CREATE OR REPLACE` creates the procedure or replaces an existing one without needing to drop it first (and without losing granted privileges) — the standard way to deploy stored code.

### 24.2 Functions

A **function** is a named block that **computes and returns a value** (via a `RETURN` clause). Because it returns a value, a function can be used in expressions — including, importantly, inside SQL statements:

```sql
CREATE OR REPLACE FUNCTION annual_salary (
   p_emp_id IN employees.employee_id%TYPE
) RETURN NUMBER AS                          -- declares the return type
   v_salary employees.salary%TYPE;
BEGIN
   SELECT salary INTO v_salary FROM employees WHERE employee_id = p_emp_id;
   RETURN v_salary * 12;                     -- RETURN the computed value
EXCEPTION
   WHEN NO_DATA_FOUND THEN RETURN NULL;
END annual_salary;
/

-- Use it in PL/SQL:
DECLARE v NUMBER; BEGIN v := annual_salary(100); DBMS_OUTPUT.PUT_LINE(v); END;
/
-- Use it directly in SQL (a powerful feature):
SELECT employee_id, annual_salary(employee_id) AS yearly FROM employees;
```

A function **must** return a value on every path (`RETURN value;`); failing to do so raises `ORA-06503: function returned without value`. Functions used in SQL have restrictions — they should not modify the database (the **purity** issue, §24.5) and should be deterministic where possible.

> **Procedure vs function — the rule of thumb.** Use a **function** when the unit's purpose is to *compute and return a value* (especially if you want to call it from SQL); use a **procedure** when the purpose is to *perform an action* (DML, multi-step processing) and any results come back through `OUT` parameters. A function returns exactly one value through `RETURN`; a procedure can return many through `OUT` parameters or none at all. Choosing correctly makes the intent obvious to callers.

### 24.3 Parameter modes: IN, OUT, IN OUT

Parameters have a **mode** declaring the direction of data flow — the most important part of a subprogram's contract:

```sql
CREATE OR REPLACE PROCEDURE compute_pay (
   p_emp_id   IN     NUMBER,        -- IN: passed in, read-only inside (the default mode)
   p_gross    OUT    NUMBER,        -- OUT: returned to the caller (write-only inside)
   p_tax      OUT    NUMBER,
   p_running  IN OUT NUMBER         -- IN OUT: passed in AND returned (read-write)
) AS
   v_salary employees.salary%TYPE;
BEGIN
   SELECT salary INTO v_salary FROM employees WHERE employee_id = p_emp_id;
   p_gross   := v_salary;
   p_tax     := v_salary * 0.30;
   p_running := p_running + p_gross;     -- accumulate into the in/out parameter
END;
/

DECLARE
   v_g NUMBER; v_t NUMBER; v_total NUMBER := 0;
BEGIN
   compute_pay(100, v_g, v_t, v_total);
   DBMS_OUTPUT.PUT_LINE('Gross ' || v_g || ', tax ' || v_t || ', running ' || v_total);
END;
/
```

- **`IN`** (default) — the caller passes a value; the parameter is read-only inside the subprogram. The argument can be a literal, variable, or expression.
- **`OUT`** — the subprogram assigns a value that is returned to the caller; it starts NULL inside and the argument must be a variable (to receive the result).
- **`IN OUT`** — passed in *and* returned; read-write inside; the argument must be a variable.

> **`NOCOPY` — a performance hint for large parameters.** By default `OUT` and `IN OUT` parameters are passed by *value* (copied in and out), which is costly for large collections or records. The **`NOCOPY`** hint (`p_data IN OUT NOCOPY large_type`) asks Oracle to pass by *reference* instead, avoiding the copy. It is a hint (Oracle may ignore it) and has a subtlety: on an exception, a `NOCOPY` parameter may be left partially modified. Use it for large `IN OUT` collections/records where the copy cost is significant.

### 24.4 Default arguments and named notation

Parameters can have **default values** (used when the caller omits them), and callers can pass arguments by **position** or by **name** (named notation), which improves readability and lets you skip optional middle parameters:

```sql
CREATE OR REPLACE PROCEDURE log_msg (
   p_text     IN VARCHAR2,
   p_level    IN VARCHAR2 DEFAULT 'INFO',
   p_source   IN VARCHAR2 DEFAULT 'app'
) AS BEGIN
   INSERT INTO log_table (msg, lvl, src, ts) VALUES (p_text, p_level, p_source, SYSTIMESTAMP);
END;
/

BEGIN
   log_msg('started');                                   -- positional; defaults for the rest
   log_msg('error!', 'ERROR');                            -- positional, first two
   log_msg(p_text => 'done', p_source => 'batch');        -- NAMED: skip p_level (uses default)
   log_msg('mixed', p_source => 'cron');                  -- positional then named
END;
/
```

> **Named notation is self-documenting and robust.** Calling `log_msg(p_text => 'done', p_source => 'batch')` is clearer than `log_msg('done', 'INFO', 'batch')` and is unaffected if parameters are reordered or new optional ones are added. For subprograms with several parameters — especially several with defaults — named notation is the maintainable choice. It also lets you supply just the optional parameters you care about, skipping the rest.

### 24.5 Determinism, purity, and using functions in SQL

When a function is called from **SQL**, two properties matter:

- **`DETERMINISTIC`** — declare a function deterministic if it always returns the same output for the same input (no dependence on time, sequences, or table data that changes). This lets Oracle cache/reuse results and is *required* to use the function in a function-based index or materialized view:
  ```sql
  CREATE OR REPLACE FUNCTION full_name (p_first VARCHAR2, p_last VARCHAR2)
     RETURN VARCHAR2 DETERMINISTIC AS
  BEGIN RETURN p_first || ' ' || p_last; END;
  /
  ```
- **Purity / side effects** — a function called from a SQL statement should **not modify the database** (no DML on tables the query touches) — doing so can produce errors or unpredictable results because of how SQL parallelizes and orders function calls. Functions in SQL should be read-only and free of disruptive side effects.

> **The "function called per row in SQL" performance trap.** `SELECT my_function(col) FROM big_table` invokes the function *once per row*, with a context switch each time — potentially catastrophic on a large table. Mitigations: mark the function `DETERMINISTIC` (enables result caching for repeated inputs), use the **`RESULT_CACHE`** clause (Ch 28) for functions over slowly-changing data, or — best — express the logic as plain SQL (a `CASE`, a join) so no function call is needed. A PL/SQL function in a `WHERE` clause also typically defeats indexes (non-sargable, Ch 7/24). Use functions in SQL judiciously; for hot queries over big tables, inline the logic as SQL where possible.

### 24.6 Invoker's rights vs definer's rights

By default, a stored subprogram runs with **definer's rights** (`AUTHID DEFINER`) — it executes with the privileges and schema context of its *owner*, not the caller. The alternative, **invoker's rights** (`AUTHID CURRENT_USER`), runs with the *caller's* privileges and resolves object names in the *caller's* schema:

```sql
CREATE OR REPLACE PROCEDURE process_data AUTHID CURRENT_USER AS   -- invoker's rights
BEGIN
   -- 'orders' resolves to the CALLER's orders table; runs with the caller's privileges
   DELETE FROM orders WHERE status = 'cancelled';
END;
/
```

> **Definer vs invoker — a real security and behavior distinction.** **Definer's rights** (the default) is how you let users run a procedure that touches tables they cannot access directly — the procedure encapsulates and controls the access (a security pattern: grant `EXECUTE` on the procedure, not access to the tables). **Invoker's rights** is for code meant to operate in each caller's own schema with each caller's own privileges — e.g. a utility that should act on whichever user's tables invoke it. **Gotcha (from Ch 15):** under definer's rights, privileges granted via *roles* are not active inside the procedure — the owner needs the privileges granted *directly*. Choosing the wrong `AUTHID` causes either "table or view does not exist" or privilege errors that confuse many developers.

---

## Chapter 25 — Packages

A **package** groups related procedures, functions, types, variables, and cursors into a single named unit. Packages are the cornerstone of well-organized PL/SQL — the way professional Oracle applications structure server-side code — and they bring real benefits beyond mere grouping: encapsulation, a stable public interface, session-persistent state, and performance advantages. This chapter covers the spec/body split, public vs private elements, overloading, and package state.

### 25.1 Package specification and body

A package has two parts: the **specification** (the public interface — what callers can see and use) and the **body** (the implementation — the actual code, hidden from callers):

```sql
-- SPECIFICATION: the public contract (declarations only)
CREATE OR REPLACE PACKAGE emp_pkg AS
   -- public constant
   c_max_raise_pct CONSTANT NUMBER := 25;
   -- public procedure/function declarations (signatures only, no bodies)
   PROCEDURE give_raise (p_emp_id IN NUMBER, p_pct IN NUMBER);
   FUNCTION  annual_salary (p_emp_id IN NUMBER) RETURN NUMBER;
   FUNCTION  dept_headcount (p_dept_id IN NUMBER) RETURN NUMBER;
END emp_pkg;
/

-- BODY: the implementation (the actual code)
CREATE OR REPLACE PACKAGE BODY emp_pkg AS

   -- a PRIVATE helper (declared only in the body -> not visible to callers)
   FUNCTION emp_exists (p_emp_id IN NUMBER) RETURN BOOLEAN IS
      v_count INTEGER;
   BEGIN
      SELECT COUNT(*) INTO v_count FROM employees WHERE employee_id = p_emp_id;
      RETURN v_count > 0;
   END emp_exists;

   PROCEDURE give_raise (p_emp_id IN NUMBER, p_pct IN NUMBER) IS
   BEGIN
      IF NOT emp_exists(p_emp_id) THEN                 -- use the private helper
         RAISE_APPLICATION_ERROR(-20001, 'No such employee');
      END IF;
      IF p_pct > c_max_raise_pct THEN
         RAISE_APPLICATION_ERROR(-20002, 'Raise exceeds maximum');
      END IF;
      UPDATE employees SET salary = salary * (1 + p_pct/100) WHERE employee_id = p_emp_id;
   END give_raise;

   FUNCTION annual_salary (p_emp_id IN NUMBER) RETURN NUMBER IS
      v NUMBER;
   BEGIN
      SELECT salary * 12 INTO v FROM employees WHERE employee_id = p_emp_id;
      RETURN v;
   END annual_salary;

   FUNCTION dept_headcount (p_dept_id IN NUMBER) RETURN NUMBER IS
      v NUMBER;
   BEGIN
      SELECT COUNT(*) INTO v FROM employees WHERE department_id = p_dept_id;
      RETURN v;
   END dept_headcount;

END emp_pkg;
/

-- Call package elements with dot notation:
EXEC emp_pkg.give_raise(100, 10);
SELECT emp_pkg.annual_salary(100) FROM dual;
```

### 25.2 Public vs private elements

The spec/body split *is* encapsulation: anything declared in the **specification** is **public** (callable from outside, via `package.element`); anything declared only in the **body** is **private** (usable only by other code within the same package). In the example, `emp_exists` is private (a helper), while `give_raise` and `annual_salary` are public.

> **Encapsulation is the core benefit.** The specification is a *stable contract*: callers depend only on it, not on the body. You can rewrite the body — change algorithms, refactor helpers, optimize — without recompiling or affecting any code that calls the package, as long as the spec is unchanged. Private subprograms hide implementation detail and keep the public surface small and intentional. This separation of interface from implementation is exactly the software-engineering discipline that makes large PL/SQL codebases maintainable — and a major reason to organize *all* non-trivial stored code into packages rather than standalone procedures.

### 25.3 Overloading

Within a package, you can define multiple subprograms with the **same name** but **different parameter lists** (number, types, or order) — **overloading**. Oracle picks the right one based on the arguments you pass:

```sql
CREATE OR REPLACE PACKAGE math_pkg AS
   FUNCTION add_vals (a NUMBER, b NUMBER) RETURN NUMBER;
   FUNCTION add_vals (a NUMBER, b NUMBER, c NUMBER) RETURN NUMBER;   -- 3 args
   FUNCTION add_vals (a VARCHAR2, b VARCHAR2) RETURN VARCHAR2;        -- different types
END math_pkg;
/
-- math_pkg.add_vals(1, 2) -> first;  add_vals(1,2,3) -> second;  add_vals('a','b') -> third
```

Overloading lets one logical operation accept different input shapes under a single, intuitive name — common in utility packages (e.g. a `to_date_safe` that accepts various formats). Oracle resolves the call by matching argument count and types.

### 25.4 Forward declarations

If two private subprograms call each other, or one is used before it is defined in the body, you need a **forward declaration** — declaring the subprogram's signature earlier in the body so it can be referenced before its full definition appears:

```sql
CREATE OR REPLACE PACKAGE BODY util_pkg AS
   PROCEDURE proc_b (n NUMBER);          -- FORWARD DECLARATION (signature only)

   PROCEDURE proc_a (n NUMBER) IS
   BEGIN
      IF n > 0 THEN proc_b(n - 1); END IF;   -- calls proc_b, defined below
   END proc_a;

   PROCEDURE proc_b (n NUMBER) IS         -- the actual definition
   BEGIN
      IF n > 0 THEN proc_a(n - 1); END IF;
   END proc_b;
END util_pkg;
/
```

### 25.5 Package state and initialization

Variables declared in a package (spec or body) **persist for the duration of a session** — they hold their values across calls within the same session, giving packages *state*. A package can also have an **initialization section** (an unnamed `BEGIN ... END` at the end of the body) that runs *once*, the first time the package is referenced in a session:

```sql
CREATE OR REPLACE PACKAGE counter_pkg AS
   PROCEDURE increment;
   FUNCTION  current_value RETURN NUMBER;
END counter_pkg;
/
CREATE OR REPLACE PACKAGE BODY counter_pkg AS
   g_count NUMBER;                        -- package-level state (persists per session)

   PROCEDURE increment IS BEGIN g_count := g_count + 1; END;
   FUNCTION  current_value RETURN NUMBER IS BEGIN RETURN g_count; END;
BEGIN
   g_count := 0;                          -- INITIALIZATION: runs once per session
   DBMS_OUTPUT.PUT_LINE('counter_pkg initialized');
END counter_pkg;
/
-- Within a session, g_count accumulates across calls:
-- EXEC counter_pkg.increment;  EXEC counter_pkg.increment;
-- SELECT counter_pkg.current_value FROM dual;  -> 2
```

> **Package state: useful, but mind its scope and pitfalls.** Session-persistent package variables are handy for caching expensive-to-compute values, holding configuration, or maintaining counters within a session. But: (1) the state is **per session** — each session has its own copy, so it is not a shared global across users; (2) it persists for the *whole* session, which can cause subtle bugs if you assume it resets between calls; (3) it complicates the **`SERIALLY_REUSABLE`** pragma and connection pooling (where sessions are reused, stale package state can leak between logical requests). Use package state deliberately. For a stateless package, the `PRAGMA SERIALLY_REUSABLE` (in both spec and body) makes state last only for one call rather than the whole session.

### 25.6 Built-in packages worth knowing

Oracle ships hundreds of built-in packages providing powerful functionality; a data professional should recognize the key ones:

- **`DBMS_OUTPUT`** — write messages to a session buffer (debugging/display); `PUT_LINE` (Ch 18).
- **`DBMS_SQL`** and native dynamic SQL — execute dynamically-built SQL (Ch 27).
- **`UTL_FILE`** — read/write files on the database server's filesystem (for file-based load/extract).
- **`DBMS_SCHEDULER`** (and legacy `DBMS_JOB`) — schedule and manage jobs *inside* the database (Oracle's built-in cron — Ch 28).
- **`DBMS_STATS`** — gather optimizer statistics (Ch 35), crucial for performance.
- **`DBMS_METADATA`** — extract DDL for objects (Ch 12).
- **`DBMS_LOB`** — manipulate large objects (CLOB/BLOB).
- **`DBMS_UTILITY`** — utilities including `FORMAT_ERROR_BACKTRACE` (Ch 22).
- **`DBMS_XPLAN`** — format and display execution plans (Ch 35).
- **`DBMS_MVIEW`** — refresh and manage materialized views (Ch 16, 42).
- **`UTL_HTTP`**, **`UTL_SMTP`**, **`APEX_*`**, **`DBMS_AQ`** (advanced queuing), and many more.

> **DE NOTE.** `DBMS_SCHEDULER` (in-database job scheduling), `UTL_FILE` (server-side file I/O), and `DBMS_STATS` (statistics for the optimizer) are the built-ins most relevant to data engineering on Oracle — they cover scheduling pipeline steps, file-based ingest/extract, and keeping query plans fast. Recognizing what each major built-in package does (you need not memorize signatures — look them up) is part of Oracle fluency, and these packages are how a lot of "ETL inside Oracle" was historically built before external orchestrators like Airflow.

---

## Chapter 26 — Triggers

A **trigger** is a named block that executes *automatically* in response to an event — a DML operation on a table, a DDL statement, or a database event such as logon. Unlike procedures (which you call explicitly), triggers *fire* implicitly when their event occurs. They are powerful for enforcing rules, auditing, and automation — and equally a source of hidden complexity and performance problems when overused. This chapter covers DML triggers (the main kind), the `:OLD`/`:NEW` values, `INSTEAD OF` and compound triggers, the infamous mutating-table problem, and system/DDL triggers.

### 26.1 What triggers are and when they fire

A DML trigger is defined on a table and fires when an `INSERT`, `UPDATE`, or `DELETE` occurs on that table. Its firing is characterized by three choices:

- **Timing** — `BEFORE` the operation, `AFTER` it, or `INSTEAD OF` it (views only).
- **Event** — `INSERT`, `UPDATE`, `DELETE` (or a combination).
- **Level** — **row-level** (`FOR EACH ROW`: fires once per affected row, with access to each row's values) or **statement-level** (fires once per statement regardless of how many rows it affects).

```sql
CREATE OR REPLACE TRIGGER trg_emp_audit
   BEFORE INSERT OR UPDATE OR DELETE ON employees   -- timing + events + table
   FOR EACH ROW                                      -- row-level
BEGIN
   IF INSERTING THEN
      :NEW.created_at := SYSTIMESTAMP;               -- set audit columns on insert
      :NEW.created_by := USER;
   ELSIF UPDATING THEN
      :NEW.updated_at := SYSTIMESTAMP;
      :NEW.updated_by := USER;
   ELSIF DELETING THEN
      INSERT INTO emp_audit (emp_id, action, who, when_ts)
      VALUES (:OLD.employee_id, 'DELETE', USER, SYSTIMESTAMP);
   END IF;
END;
/
```

The **conditional predicates** `INSERTING`, `UPDATING`, `DELETING` let one trigger handle several events and branch on which fired. `UPDATING('column')` even tests whether a specific column was in the `SET` list.

### 26.2 :OLD and :NEW

In a **row-level** trigger, two pseudo-records give access to the row's values: **`:OLD`** (the values *before* the change) and **`:NEW`** (the values *after*). Their availability depends on the event:

| Event | `:OLD` | `:NEW` |
|---|---|---|
| `INSERT` | NULL (no prior row) | the new values (assignable in `BEFORE`) |
| `UPDATE` | the pre-update values | the post-update values (assignable in `BEFORE`) |
| `DELETE` | the values being deleted | NULL (no resulting row) |

In a **`BEFORE` row trigger**, you can *assign* to `:NEW` columns to modify the row before it is written (as in §26.1 setting audit timestamps) — a common and legitimate use. In an `AFTER` trigger, `:NEW` is read-only (the row is already written). Inside the trigger body, reference them without the colon in some contexts (the colon is for SQL/binding context).

```sql
CREATE OR REPLACE TRIGGER trg_salary_floor
   BEFORE UPDATE OF salary ON employees   -- fires only when 'salary' is updated
   FOR EACH ROW
BEGIN
   IF :NEW.salary < :OLD.salary THEN
      RAISE_APPLICATION_ERROR(-20050, 'Salary cannot be decreased');  -- veto the change
   END IF;
   IF :NEW.salary IS NULL THEN
      :NEW.salary := :OLD.salary;          -- default a null new salary to the old value
   END IF;
END;
/
```

### 26.3 Statement-level vs row-level triggers

- **Row-level** (`FOR EACH ROW`) — fires once for *each* affected row; has `:OLD`/`:NEW`. Use when logic depends on individual row values (auditing each change, validating/modifying each row).
- **Statement-level** (no `FOR EACH ROW`) — fires *once* for the whole statement, regardless of row count (even zero rows); no `:OLD`/`:NEW`. Use for logic that should run once per operation (e.g. "log that *someone* updated the table", enforce a table-wide rule, restrict *when* a table may be modified).

```sql
-- Statement-level: restrict WHEN the table can be modified (once per statement)
CREATE OR REPLACE TRIGGER trg_business_hours
   BEFORE INSERT OR UPDATE OR DELETE ON employees   -- no FOR EACH ROW
BEGIN
   IF TO_CHAR(SYSDATE, 'DY') IN ('SAT','SUN') THEN
      RAISE_APPLICATION_ERROR(-20060, 'No changes allowed on weekends');
   END IF;
END;
/
```

### 26.4 INSTEAD OF triggers

A plain view built on a join or aggregate is usually **not directly updatable** (Oracle cannot unambiguously map a DML on the view back to base tables — Ch 16). An **`INSTEAD OF` trigger** (defined on a *view*, row-level) intercepts DML against the view and *replaces* it with your own logic that updates the underlying tables — making complex views updatable:

```sql
CREATE OR REPLACE VIEW emp_dept_v AS
   SELECT e.employee_id, e.last_name, e.salary, d.department_name
   FROM employees e JOIN departments d ON e.department_id = d.department_id;

CREATE OR REPLACE TRIGGER trg_emp_dept_update
   INSTEAD OF UPDATE ON emp_dept_v
   FOR EACH ROW
BEGIN
   -- translate the view update into a real update on the base table
   UPDATE employees SET last_name = :NEW.last_name, salary = :NEW.salary
   WHERE  employee_id = :NEW.employee_id;
   -- (could also update departments, etc., as appropriate)
END;
/
-- Now "UPDATE emp_dept_v SET salary = ... WHERE employee_id = ..." works.
```

> **`INSTEAD OF` triggers are the supported way to make complex/join views updatable** (Codd's Rule 6, Ch 2, in practice). They are common in applications that present a simplified, joined view to clients while the real storage is normalized across several tables.

### 26.5 The mutating-table problem

A notorious trap: a **row-level** trigger generally **cannot query or modify the very table it is defined on** (the "mutating table"). If a `FOR EACH ROW` trigger on `employees` tries to `SELECT` from `employees`, Oracle raises **`ORA-04091: table is mutating, trigger/function may not see it`**. The reason is consistency — mid-statement, the table is in flux, and letting the trigger read it would give nondeterministic results depending on row processing order.

```sql
-- THIS FAILS with ORA-04091 (querying the mutating table from a row trigger):
CREATE OR REPLACE TRIGGER trg_check_avg
   BEFORE INSERT ON employees FOR EACH ROW
DECLARE v_avg NUMBER;
BEGIN
   SELECT AVG(salary) INTO v_avg FROM employees;        -- mutating table! ORA-04091
   IF :NEW.salary > v_avg * 3 THEN
      RAISE_APPLICATION_ERROR(-20070, 'Salary more than 3x the average');
   END IF;
END;
/
```

**The modern solution: a compound trigger.** A **compound trigger** (12c-era, available 11g) combines statement-level and row-level timing points in *one* trigger with a shared state section, letting you collect data during the row-level phase and then act in the `AFTER STATEMENT` phase — when the table is no longer mutating:

```sql
CREATE OR REPLACE TRIGGER trg_emp_compound
   FOR INSERT ON employees
   COMPOUND TRIGGER
   -- shared state across the timing points (a package-like private area)
   TYPE id_list IS TABLE OF employees.employee_id%TYPE;
   g_new_ids id_list := id_list();

   BEFORE EACH ROW IS BEGIN
      g_new_ids.EXTEND; g_new_ids(g_new_ids.COUNT) := :NEW.employee_id;  -- collect
   END BEFORE EACH ROW;

   AFTER STATEMENT IS
      v_avg NUMBER;
   BEGIN
      SELECT AVG(salary) INTO v_avg FROM employees;   -- now SAFE: table not mutating
      -- ... validate the collected new rows against the average ...
   END AFTER STATEMENT;
END trg_emp_compound;
/
```

> **The mutating-table error trips nearly everyone eventually.** The classic (ugly) workaround was a package-variable plus separate statement- and row-level triggers; the **compound trigger** does this cleanly in one object with built-in shared state. But step back: many rules that tempt a self-querying trigger are better enforced *outside* triggers entirely — with constraints, with a procedure that owns the operation, or in the application/pipeline. Reaching for a trigger that must read its own table is often a sign the logic belongs elsewhere.

### 26.6 DDL and database-event (system) triggers

Beyond DML, triggers can fire on **DDL statements** and **database events** — useful for auditing schema changes and reacting to logon/logoff/startup/shutdown:

```sql
-- Audit every DDL change in the schema
CREATE OR REPLACE TRIGGER trg_ddl_audit
   AFTER DDL ON SCHEMA
BEGIN
   INSERT INTO ddl_audit (event, obj_type, obj_name, who, when_ts)
   VALUES (ORA_SYSEVENT, ORA_DICT_OBJ_TYPE, ORA_DICT_OBJ_NAME, USER, SYSTIMESTAMP);
END;
/

-- React to user logon (e.g. set session context, audit access)
CREATE OR REPLACE TRIGGER trg_logon AFTER LOGON ON DATABASE
BEGIN
   INSERT INTO logon_audit (username, logon_ts) VALUES (USER, SYSTIMESTAMP);
END;
/
```

System triggers use event attribute functions (`ORA_SYSEVENT`, `ORA_DICT_OBJ_NAME`, `ORA_LOGIN_USER`, etc.) to learn about the event. They are mainly an administration/security/auditing tool.

### 26.7 Trigger order, and when NOT to use triggers

When multiple triggers fire for the same event, their order was historically undefined; since 11g you can control it with the **`FOLLOWS`** (and 12c `PRECEDES`) clause to make one trigger fire after another. Triggers can also be `ENABLE`/`DISABLE`d (`ALTER TRIGGER ... DISABLE`).

> **The trigger philosophy — use sparingly.** Triggers run *automatically and invisibly*, which is exactly their power and their danger. Overusing them produces "spooky action at a distance": a simple `INSERT` silently cascades through layers of triggers, making behavior hard to follow, hard to debug, and slow (every affected row may fire row-level logic). Legitimate uses: auditing, enforcing rules that constraints cannot express, maintaining derived/denormalized data, and making views updatable (`INSTEAD OF`). But prefer **declarative constraints** (Ch 12) over triggers for integrity, and prefer explicit **procedures** the application calls over hidden triggers for business logic, whenever you can. A system heavy with triggers is hard to reason about — a real maintenance and performance liability. **DE NOTE:** in data-warehouse/ELT work, triggers are largely avoided on big load tables (they cripple bulk-load performance); logic lives in the transformation layer instead.

---

## Chapter 27 — Dynamic SQL

All the SQL in PL/SQL so far has been **static** — written at compile time, fixed. Sometimes you must build and execute SQL whose text is not known until runtime: a table or column name supplied as a parameter, a `WHERE` clause assembled from optional filters, or DDL (which cannot be static in PL/SQL). This is **dynamic SQL**. It is powerful and necessary, but it is also the primary vector for **SQL injection**, so this chapter covers both how to do it and how to do it *safely*.

### 27.1 Why dynamic SQL — and its main forms

You need dynamic SQL when the statement's *structure* varies at runtime:

- The object name (table/column) is a parameter.
- The set of filters/columns is built conditionally.
- You must run **DDL** from PL/SQL (`CREATE`/`ALTER`/`DROP` cannot be static in a PL/SQL block).
- You execute arbitrary statements (an admin tool).

Oracle offers two mechanisms:

- **Native Dynamic SQL (NDS)** — the `EXECUTE IMMEDIATE` statement (and `OPEN ... FOR` for dynamic cursors). Concise, fast, the default choice for most dynamic SQL.
- **The `DBMS_SQL` package** — an older, more verbose API offering finer control (e.g. when the number/types of columns or binds is unknown until runtime — "method 4" dynamic SQL). Needed for genuinely unknown statement shapes.

### 27.2 EXECUTE IMMEDIATE

`EXECUTE IMMEDIATE` parses and runs a SQL string at runtime. It handles DDL, DML, single-row queries (`INTO`), and bind variables (`USING`):

```sql
DECLARE
   v_table  VARCHAR2(30) := 'employees';
   v_count  NUMBER;
   v_name   VARCHAR2(50);
BEGIN
   -- DDL from PL/SQL (only possible dynamically):
   EXECUTE IMMEDIATE 'CREATE TABLE tmp_x (id NUMBER)';

   -- Dynamic query returning one row, with a bind variable (SAFE — see 27.3):
   EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM employees WHERE department_id = :d'
      INTO v_count USING 50;
   DBMS_OUTPUT.PUT_LINE('Count: ' || v_count);

   -- Dynamic DML with binds:
   EXECUTE IMMEDIATE 'UPDATE employees SET salary = salary * :pct WHERE department_id = :d'
      USING 1.10, 50;
   DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' rows updated');

   -- Dynamic single-row query with multiple binds and INTO:
   EXECUTE IMMEDIATE 'SELECT last_name FROM employees WHERE employee_id = :id'
      INTO v_name USING 100;
END;
/
```

For **multi-row** dynamic queries, open a REF cursor dynamically:

```sql
DECLARE
   v_cur SYS_REFCURSOR;
   v_rec employees%ROWTYPE;
   v_where VARCHAR2(200) := 'department_id = :d AND salary > :s';
BEGIN
   OPEN v_cur FOR 'SELECT * FROM employees WHERE ' || v_where USING 50, 5000;
   LOOP
      FETCH v_cur INTO v_rec;
      EXIT WHEN v_cur%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(v_rec.last_name);
   END LOOP;
   CLOSE v_cur;
END;
/
```

### 27.3 Bind variables and SQL injection — the critical safety topic

Here is the single most important rule in dynamic SQL. There are two ways to get a runtime *value* into a dynamic statement, and only one is safe:

- **Concatenation (DANGEROUS):** splicing the value into the SQL string. This is the **SQL injection** vulnerability — a malicious value can change the meaning of the statement.
- **Bind variables (SAFE):** using a placeholder (`:x`) in the SQL and supplying the value via `USING`. The value is passed *separately* from the SQL text, so it can never alter the statement's structure.

```sql
-- DANGEROUS: value concatenated into the SQL string -> SQL INJECTION
-- If p_name = "x' OR '1'='1", this returns ALL rows; worse inputs can do real damage.
EXECUTE IMMEDIATE 'SELECT ... FROM users WHERE name = ''' || p_name || '''';   -- NEVER

-- SAFE: value passed as a BIND variable, separate from the SQL text
EXECUTE IMMEDIATE 'SELECT ... FROM users WHERE name = :n' USING p_name;        -- ALWAYS
```

> **NEVER concatenate user-supplied *values* into dynamic SQL — always bind them.** This is not optional. SQL injection is one of the most common and damaging security vulnerabilities in existence, and concatenating untrusted values into a query is exactly how it happens. Binds (`:x` + `USING`) make injection structurally impossible for values, *and* they improve performance (the database can reuse the parsed/cached statement across different values — Ch 35 on cursor sharing). The only thing binds cannot parameterize is an **object name** (you cannot bind a table or column name) — and that is the one case where you must concatenate. For those, do not pass raw user input: validate the name strictly (e.g. with **`DBMS_ASSERT.SQL_OBJECT_NAME`** / `SIMPLE_SQL_NAME`, which verify the string is a legal, existing identifier) before concatenating it.

```sql
-- The ONE legitimate concatenation (object name) — but VALIDATED, never raw:
DECLARE
   v_table VARCHAR2(128) := DBMS_ASSERT.SQL_OBJECT_NAME(p_table_name);  -- validate!
   v_count NUMBER;
BEGIN
   EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM ' || v_table INTO v_count;   -- name concatenated
END;                                                                     -- but checked first
/
```

### 27.4 DBMS_SQL — when you need it

`DBMS_SQL` is the older, procedural dynamic-SQL API: you `OPEN_CURSOR`, `PARSE`, `BIND_VARIABLE`, `DEFINE_COLUMN`, `EXECUTE`, `FETCH_ROWS`, `COLUMN_VALUE`, and `CLOSE_CURSOR` in explicit steps. It is far more verbose than `EXECUTE IMMEDIATE`, but it is necessary for the rare "method 4" case where the **number or types of columns or bind variables are unknown until runtime** — e.g. a generic query tool that must handle any `SELECT` the user types and fetch whatever columns come back:

```sql
-- Sketch (DBMS_SQL is verbose; this shows the shape, not a full program):
DECLARE
   v_cursor INTEGER := DBMS_SQL.OPEN_CURSOR;
   v_rows   INTEGER;
BEGIN
   DBMS_SQL.PARSE(v_cursor, 'SELECT last_name FROM employees WHERE rownum <= 5',
                  DBMS_SQL.NATIVE);
   -- DBMS_SQL.DEFINE_COLUMN(...); bind any variables; then:
   v_rows := DBMS_SQL.EXECUTE(v_cursor);
   -- loop: DBMS_SQL.FETCH_ROWS / DBMS_SQL.COLUMN_VALUE ...
   DBMS_SQL.CLOSE_CURSOR(v_cursor);
END;
/
```

> **Choose NDS by default; `DBMS_SQL` only when you must.** Use `EXECUTE IMMEDIATE`/`OPEN ... FOR` (Native Dynamic SQL) for the overwhelming majority of dynamic SQL — it is concise, fast, and readable. Reach for `DBMS_SQL` only for the genuinely dynamic cases it uniquely handles (unknown column/bind counts at compile time, describing a result set's structure at runtime, or reusing a parsed statement with many different bind sets). The two can even be bridged (`DBMS_SQL.TO_REFCURSOR` / `TO_CURSOR_NUMBER`). For everyday "build a query with optional filters", NDS with bind variables is the right, safe tool.

---

## Chapter 28 — Advanced PL/SQL

This chapter collects the advanced PL/SQL features that distinguish expert practitioners: performance features (native compilation, the result cache, pipelined functions), the autonomous-transaction mechanism in full, conditional compilation, edition-based redefinition, and in-database scheduling. Most of these are absent from a basic 11g course, and several are central to writing high-performance, maintainable database code.

### 28.1 Native compilation

By default, PL/SQL is compiled to an intermediate bytecode interpreted by the PL/SQL engine. **Native compilation** instead compiles PL/SQL to native machine code, which can run computation-heavy PL/SQL significantly faster (it does not speed up the embedded SQL, only the procedural parts). Since 11g it is simple to enable at the session or system level:

```sql
ALTER SESSION SET PLSQL_CODE_TYPE = NATIVE;     -- subsequently compiled units go native
ALTER PROCEDURE my_heavy_proc COMPILE PLSQL_CODE_TYPE = NATIVE;   -- recompile one unit
-- (INTERPRETED is the other setting; check via USER_PLSQL_OBJECT_SETTINGS)
```

> **When it helps.** Native compilation benefits PL/SQL that does heavy *procedural* work — intensive loops, numeric computation, string processing. It does nothing for PL/SQL that is mostly SQL (the SQL runs in the SQL engine regardless). For compute-bound packages it is a low-effort win; for SQL-bound code it is irrelevant. Modern Oracle makes NATIVE compilation easy and it is often set as the default for application schemas.

### 28.2 The function result cache

The **`RESULT_CACHE`** clause (11g+) caches a function's results *across sessions*, keyed by its arguments, and automatically invalidates the cache when any table the function depends on changes. For a function that is expensive to compute and called repeatedly with the same arguments over data that changes infrequently, this is dramatic:

```sql
CREATE OR REPLACE FUNCTION dept_name (p_dept_id NUMBER)
   RETURN VARCHAR2
   RESULT_CACHE                       -- cache results across sessions
AS
   v_name departments.department_name%TYPE;
BEGIN
   SELECT department_name INTO v_name FROM departments WHERE department_id = p_dept_id;
   RETURN v_name;
EXCEPTION WHEN NO_DATA_FOUND THEN RETURN NULL;
END;
/
-- The first call for a given p_dept_id computes & caches; later calls return the cached
-- value instantly. If the departments table changes, Oracle invalidates the cache.
```

> **Result cache vs `DETERMINISTIC`.** `DETERMINISTIC` (Ch 24) caches results *within a single SQL statement's execution*; `RESULT_CACHE` caches *across statements and sessions* and tracks table dependencies for invalidation. Use `RESULT_CACHE` for functions over slowly-changing reference data that are called often (lookups, configuration, dimension attributes). It directly addresses the "function called per row in SQL" trap (Ch 24) when inputs repeat. Caveat: it consumes a region of the SGA (the result cache) and is best for low-cardinality argument sets; caching a function with millions of distinct inputs wastes memory.

### 28.3 Autonomous transactions (full treatment)

Introduced in Ch 14, an **autonomous transaction** runs as an independent transaction within the context of another — it commits or rolls back *separately* from the calling (main) transaction. Marked by `PRAGMA AUTONOMOUS_TRANSACTION` in the subprogram's declaration:

```sql
CREATE OR REPLACE PROCEDURE audit_log (p_event VARCHAR2, p_detail VARCHAR2) AS
   PRAGMA AUTONOMOUS_TRANSACTION;          -- this runs as its OWN transaction
BEGIN
   INSERT INTO audit_trail (event, detail, logged_at)
   VALUES (p_event, p_detail, SYSTIMESTAMP);
   COMMIT;                                  -- commits ONLY this insert
END;
/

-- Usage: the log row survives even if the caller later rolls back
BEGIN
   audit_log('ATTEMPT', 'risky operation starting');
   UPDATE accounts SET balance = balance - 1000 WHERE id = 1;
   RAISE_APPLICATION_ERROR(-20001, 'something went wrong');   -- main work fails
EXCEPTION
   WHEN OTHERS THEN
      ROLLBACK;                             -- main transaction rolled back...
      -- ...but the audit_log INSERT already committed independently and PERSISTS
      RAISE;
END;
/
```

The canonical use is **logging/auditing that must persist regardless of the outcome of the main transaction** — you want a record that an attempt was made even if the attempt is rolled back. Other uses: incrementing a counter that should not be undone, or performing an action that is genuinely independent.

> **Cautions — autonomous transactions break atomicity by design.** Because the autonomous transaction commits independently, it deliberately *violates* the all-or-nothing atomicity of the enclosing transaction. Misused, this leaves inconsistent data (work committed that the caller intended to undo). Rules: (1) reserve them for genuinely independent side-effects — overwhelmingly, logging/auditing; (2) an autonomous transaction cannot see the *uncommitted* changes of its caller (it is a separate transaction), which can surprise you; (3) avoid using them to "work around" a mutating-table error or to sneak commits into otherwise-transactional logic. Powerful and occasionally essential, but a sharp tool.

### 28.4 Pipelined table functions

A **pipelined table function** returns rows that can be queried as if from a table — using `TABLE(function(...))` in the `FROM` clause — and *pipes* rows out as they are produced (rather than building the whole collection first), so a consumer can start processing immediately and memory stays bounded. This turns procedural row-generation into something usable directly in SQL:

```sql
-- A type for the function's output rows
CREATE OR REPLACE TYPE num_row AS OBJECT (n NUMBER, square NUMBER);
/
CREATE OR REPLACE TYPE num_tab AS TABLE OF num_row;
/

CREATE OR REPLACE FUNCTION gen_squares (p_n NUMBER)
   RETURN num_tab PIPELINED                 -- PIPELINED: stream rows out one at a time
AS
BEGIN
   FOR i IN 1 .. p_n LOOP
      PIPE ROW (num_row(i, i*i));            -- emit a row (don't accumulate a collection)
   END LOOP;
   RETURN;                                   -- pipelined functions RETURN with no value
END;
/

-- Query the function's output as a table:
SELECT n, square FROM TABLE(gen_squares(5));      -- 5 rows: (1,1),(2,4),(3,9),(4,16),(5,25)
SELECT * FROM TABLE(gen_squares(5)) WHERE square > 5;   -- and filter/join it like any table
```

> **DE NOTE — pipelined functions for transformation.** Pipelined table functions are used to implement procedural transformations that plug into SQL — historically a building block of PL/SQL-based ETL, where a function reads a source, transforms rows procedurally, and pipes them into an `INSERT ... SELECT ... FROM TABLE(transform(...))`. They keep memory bounded (streaming, not buffering) and let procedural logic participate in set-based SQL. That said, the modern preference remains pure set-based SQL where possible; pipelined functions are for transformations that genuinely need row-by-row procedural logic but must still be consumed as a rowsource.

### 28.5 Conditional compilation

**Conditional compilation** (`$IF ... $THEN ... $END`) lets the compiler include or exclude code based on compile-time conditions — useful for version-specific code, debug instrumentation you can compile out for production, and feature flags:

```sql
CREATE OR REPLACE PROCEDURE demo AS
BEGIN
   $IF DBMS_DB_VERSION.VERSION >= 23 $THEN
      DBMS_OUTPUT.PUT_LINE('Running on 23ai or later — using new features');
   $ELSE
      DBMS_OUTPUT.PUT_LINE('Older version path');
   $END

   $IF $$debug $THEN                       -- a custom inquiry directive (a "flag")
      DBMS_OUTPUT.PUT_LINE('DEBUG: detailed trace...');   -- compiled in only when debug=TRUE
   $END
   NULL;
END;
/
-- Set the flag at compile time:
ALTER PROCEDURE demo COMPILE PLSQL_CCFLAGS = 'debug:true';
```

> Conditional compilation produces code that adapts to the Oracle version or to build-time flags *without runtime overhead* (the excluded code is not compiled at all). The debug-instrumentation pattern — rich tracing that compiles to nothing in production — is its most practical everyday use.

### 28.6 Edition-based redefinition (EBR)

**Edition-Based Redefinition** (11gR2+) is an advanced feature for **online application upgrades** — changing PL/SQL code (and certain objects) in a running production database *without downtime*, by maintaining multiple **editions** of the code simultaneously. New sessions use the new edition while existing sessions finish on the old one, enabling zero-downtime rollouts of database-side code.

> **When it matters.** EBR is a specialized capability for high-availability systems that cannot tolerate downtime during upgrades — patch the PL/SQL while users keep working on the previous version, then cut over. It is complex to set up and not something you reach for casually, but it is worth knowing it exists: it is Oracle's answer to "how do I deploy a change to stored code without taking the application offline." Most shops do not use it; those with strict uptime requirements value it highly.

### 28.7 In-database scheduling: DBMS_SCHEDULER

Oracle has a full **job scheduler inside the database** — `DBMS_SCHEDULER` (the modern replacement for the older `DBMS_JOB`). It runs PL/SQL blocks, stored procedures, or external scripts on schedules, with dependencies, windows, and resource controls — effectively a cron/orchestrator built into Oracle:

```sql
-- Schedule a nightly job that runs a procedure
BEGIN
   DBMS_SCHEDULER.CREATE_JOB(
      job_name        => 'nightly_aggregate',
      job_type        => 'STORED_PROCEDURE',
      job_action      => 'refresh_daily_summary',         -- the procedure to run
      start_date      => SYSTIMESTAMP,
      repeat_interval => 'FREQ=DAILY; BYHOUR=2; BYMINUTE=0',  -- 02:00 every day
      enabled         => TRUE,
      comments        => 'Refresh the daily summary table'
   );
END;
/
-- Inspect jobs and their run history:
SELECT job_name, state, next_run_date FROM user_scheduler_jobs;
SELECT job_name, status, actual_start_date, error#
FROM   user_scheduler_job_run_details ORDER BY actual_start_date DESC;
```

> **DE NOTE — `DBMS_SCHEDULER` is "ETL orchestration inside Oracle".** Before dedicated orchestrators (Airflow, your Databricks Workflows/ADF), a great deal of scheduled data processing was built with `DBMS_SCHEDULER`: nightly aggregations, partition maintenance, statistics gathering, data movement — all defined as scheduled jobs with dependency chains (job "chains"). It supports calendar-based schedules, windows (run heavy jobs only in off-hours), and resource plans. You will meet it in legacy Oracle data platforms, and it is the in-database analogue of the external orchestrators you use now. Recognize the same concepts — scheduled tasks, dependencies, retries, run history — that you know from Airflow, implemented inside the database. The modern trend moves orchestration *out* of the database into dedicated tools (for visibility, version control, and cross-system coordination), but the in-database scheduler remains capable and widely deployed.

### 28.8 A closing note on PL/SQL and the modern data engineer

PL/SQL is a deep, capable language, and this part has covered it thoroughly because it remains everywhere in enterprise Oracle systems — and because, as a data engineer, you will frequently need to *read, understand, and migrate* PL/SQL-based logic into modern pipelines. Two balancing truths to carry forward:

- **PL/SQL is the right tool** for logic that must run transactionally inside the database, for encapsulating access behind a controlled interface, for genuinely procedural tasks, and for the vast installed base of systems built on it. Knowing it well is a real and marketable skill.
- **But the center of gravity has shifted** toward set-based SQL and external transformation/orchestration (dbt, Spark, Airflow). Row-by-row PL/SQL is often slower and harder to scale than set-based SQL; business logic buried in triggers and packages is harder to version, test, and deploy than transformation code in a Git repository. When you encounter heavy PL/SQL — or are tempted to write it — ask whether a set-based statement, a view, or a transformation in your modern stack would serve better.

> **The throughline of Part III.** From the first chapter's "PL/SQL exists because SQL is not procedural" to bulk binding to this closing note, one message recurs: use PL/SQL's procedural power where it is genuinely needed, but prefer set-based SQL whenever the work can be expressed declaratively. The best Oracle data engineers are fluent in PL/SQL *and* disciplined about when not to use it. That judgment — not mere syntax knowledge — is what this part has aimed to build.

---

> **End of Part III.** You now have PL/SQL in depth: its block structure and fundamentals; control structures; embedded SQL and `SELECT INTO`; cursors (explicit, FOR-loop, parameterized, REF); the full exception model; composite types and the all-important bulk processing (`BULK COLLECT`/`FORALL`); procedures and functions with their parameter and rights systems; packages and encapsulation; triggers and the mutating-table problem; dynamic SQL and injection safety; and the advanced features — result cache, autonomous transactions, pipelined functions, conditional compilation, EBR, and in-database scheduling. Throughout, the recurring discipline: prefer set-based SQL; use procedural power deliberately. **Part IV** turns to **Oracle's architecture and administration** — how the database actually works inside, and how it is operated, tuned, secured, and recovered — beginning with the instance and database architecture.

# PART IV — ARCHITECTURE & ADMINISTRATION

---

## Chapter 29 — Oracle Architecture

To tune, troubleshoot, or administer Oracle — and to answer the architecture questions that dominate senior interviews — you must understand what actually happens inside when a database runs. This chapter maps Oracle's architecture: the crucial distinction between an *instance* and a *database*, the memory structures (SGA and PGA), and the background processes that do the work. Your 11g notes cover much of this, and it generalizes to how most databases manage memory and durability.

### 29.1 Instance versus database — the foundational distinction

This is the single most important architectural concept, and a classic interview question. In Oracle:

- A **database** is the set of **files on disk** that persistently store the data: datafiles, control files, and redo log files (Ch 30). The database is permanent — it exists whether or not anyone is using it.
- An **instance** is the set of **memory structures and background processes** in RAM that manage a database while it is running: the System Global Area (SGA) plus the background processes (SMON, PMON, DBWn, LGWR, etc.). The instance is transient — it exists only while the database is "up", and it is created fresh each time you start the database.

To use a database, an instance **mounts** and **opens** it. One instance normally manages one database (the common single-instance case). In **Real Application Clusters (RAC)**, *multiple* instances on different servers manage *one* shared database for high availability and scalability — that is the precise sense in which "instance ≠ database" matters most.

```
   INSTANCE (memory + processes, in RAM)        DATABASE (files, on disk)
   ┌──────────────────────────────┐            ┌──────────────────────────┐
   │  SGA  (shared memory)         │  mounts &  │  data files (.dbf)        │
   │  background processes         │  opens     │  control files            │
   │  (SMON, PMON, DBWn, LGWR...)  │ ─────────► │  online redo log files    │
   └──────────────────────────────┘            └──────────────────────────┘
```

> **Why the distinction matters in practice.** Startup proceeds in stages that mirror it: **NOMOUNT** (instance starts — SGA allocated, processes started — but no database attached yet, used to create a database or restore a control file), **MOUNT** (the instance reads the control file and "mounts" the database, used for certain recovery/maintenance), and **OPEN** (datafiles and redo logs are opened; users can connect). When someone says "the database is down", they usually mean the *instance* is not running. When you see RAC, remember many instances, one database. Getting this distinction right is table stakes for any Oracle architecture discussion.

### 29.2 The System Global Area (SGA)

The **SGA** is a shared memory region allocated at instance startup, used by all sessions and the background processes. It is the heart of Oracle's performance, because keeping data and parsed statements in memory avoids disk I/O and re-parsing. Its major components:

- **Database Buffer Cache** — caches copies of data blocks read from datafiles. The most important SGA structure: when a query needs a block, Oracle checks the buffer cache first (a *cache hit* avoids a disk read entirely), and modified ("dirty") blocks live here until written back. Its effectiveness (the *buffer cache hit ratio*) is central to read performance.
- **Shared Pool** — caches parsed SQL/PL-SQL and metadata, with two key sub-areas: the **library cache** (parsed/compiled SQL statements and PL/SQL, so identical statements can be reused without re-parsing — Ch 31) and the **data dictionary cache** (row cache, caching dictionary metadata about objects, privileges, etc.).
- **Redo Log Buffer** — a circular buffer holding redo entries (records of changes) before they are written to the online redo log files by LGWR. The mechanism behind durability (Ch 32).
- **Large Pool** (optional) — memory for large allocations that would otherwise fragment the shared pool: RMAN backup buffers, parallel-execution message buffers, shared-server session memory.
- **Java Pool** — memory for the in-database Java Virtual Machine (if Java stored procedures are used).
- **Streams Pool** — memory for Oracle Streams / GoldenGate replication and Advanced Queuing.

> **The buffer cache is where read performance lives.** A query that finds its blocks already in the buffer cache (a *logical read* / cache hit) is vastly faster than one that must fetch them from disk (a *physical read*). This is exactly why running a query a second time is often much faster, why benchmarking must account for cache warmth, and why sizing the SGA appropriately is a primary tuning lever. The same idea — keep hot data in memory close to the engine — recurs as the warehouse query cache and as Spark's in-memory caching (your DE Vol 3).

### 29.3 The Program Global Area (PGA)

Where the SGA is *shared*, the **PGA** is *private* memory for each server process / session. It holds session-specific data: sort areas, hash areas (for sorts and hash joins — Ch 35), bind variable values, cursor state, and session variables. Each connected session has its own PGA.

> **PGA and sorting/hashing.** Operations like `ORDER BY`, `GROUP BY`, hash joins, and `DISTINCT` need workspace memory, which comes from the PGA. If the operation fits in the available PGA work area, it runs entirely in memory (fast); if it does not, Oracle spills to **temporary tablespace** on disk (a *disk sort* / one- or multi-pass operation — much slower). This is why under-sized PGA work areas cause slow sorts and joins, and why the optimizer's memory estimates (Ch 35) matter. The PGA is the session-local counterpart to Spark executor memory — and "spilling to disk" is the same concept as a Spark shuffle spill.

### 29.4 Memory management modes: AMM and ASMM

Sizing all these pools manually is tedious, so Oracle automates it:

- **Automatic Shared Memory Management (ASMM)** — you set one parameter (`SGA_TARGET`) and Oracle automatically distributes it among the SGA components (buffer cache, shared pool, etc.), adjusting dynamically to the workload.
- **Automatic Memory Management (AMM)** — you set one parameter (`MEMORY_TARGET`) and Oracle manages *both* SGA and PGA together, shifting memory between them as needed.
- **Manual** — you size each pool individually (`DB_CACHE_SIZE`, `SHARED_POOL_SIZE`, `PGA_AGGREGATE_TARGET`, etc.) for fine control.

> **Practical note.** AMM/ASMM make Oracle largely self-tuning for memory, which is why most installations use them. (AMM is not compatible with huge pages on Linux, so large systems often use ASMM plus a separately-managed PGA target.) The trend across all of Oracle administration — and across the cloud (Autonomous Database, Ch 43) — is toward self-management; understanding *what* the memory regions do remains essential even when their *sizing* is automatic.

### 29.5 Background processes

An Oracle instance runs a set of **background processes**, each with a specific job. The mandatory and most important ones (there are many more):

- **DBWn (Database Writer)** — writes *dirty* (modified) buffers from the buffer cache to the datafiles. It writes lazily and in batches (not on every change), which is efficient — the redo log, not immediate datafile writes, provides durability (Ch 32).
- **LGWR (Log Writer)** — writes the redo log buffer to the online redo log files. Crucially, LGWR flushes redo to disk **at commit** (and at other triggers), which is what makes a committed transaction durable. This is the write-ahead-logging guarantee.
- **CKPT (Checkpoint)** — signals checkpoints and updates the control file and datafile headers with checkpoint information, coordinating how far recovery would need to go (Ch 32).
- **SMON (System Monitor)** — performs instance recovery on startup after a crash, cleans up temporary segments, coalesces free space.
- **PMON (Process Monitor)** — cleans up after failed user processes: rolls back their uncommitted transactions, releases their locks and resources. (Modern Oracle splits some of this into PMON/CLMN/cleanup helper processes.)
- **ARCn (Archiver)** — when the database runs in **ARCHIVELOG mode**, copies filled online redo logs to archive storage *before* they are overwritten, preserving the full redo stream needed for point-in-time recovery (Ch 38).
- **MMON / MMNL** — gather statistics and manage the Automatic Workload Repository (AWR, Ch 35).
- Others: **RECO** (distributed transaction recovery), **LREG** (listener registration), and many helper/slave processes.

> **The DBWn/LGWR division is elegant and important.** Why doesn't Oracle write changed data blocks to disk immediately on commit? Because that would be slow and random. Instead, **LGWR writes the small, sequential redo record at commit** (fast, guarantees durability), while **DBWn writes the actual data blocks later, in efficient batches** (whenever convenient). If the instance crashes, the committed-but-not-yet-written changes are reconstructed from the redo log during recovery (Ch 32). This separation — durability via a sequential write-ahead log, data files updated lazily — is the core performance-and-safety trade at the heart of Oracle (and of every serious database, and of the lakehouse transaction log). Understanding it explains both Oracle's speed and its crash recovery.

### 29.6 The connection and server-process model

When a client connects, it gets a **server process** that executes its SQL. Two configurations:

- **Dedicated server** — each client connection gets its own dedicated server process. Simple, with predictable performance; the default and most common. Each dedicated server has its own PGA.
- **Shared server** (formerly MTS) — a pool of shared server processes serves many client connections via dispatchers, reducing per-connection overhead for systems with very many, mostly-idle connections. More complex; session memory moves into the SGA (the large pool).

The **listener** (Ch 4) receives incoming connection requests on its port (default 1521) and hands each to a server process. Modern applications also use **connection pooling** (in the app tier, or Oracle's Database Resident Connection Pooling, DRCP) to reuse connections efficiently — important because establishing a connection is relatively expensive.

> **DE NOTE — connection pooling matters for pipelines.** A data pipeline that opens a new Oracle connection per task or per query pays the (significant) connection-establishment cost repeatedly and can exhaust the server's process limit. Use connection pooling (in your ETL framework, JDBC pool, or DRCP) to reuse a bounded set of connections. This is the same lesson as managing connections to any database from a high-throughput application.

---

## Chapter 30 — Physical & Logical Storage

Oracle separates *logical* storage structures (how you think about storage — tablespaces, segments) from *physical* storage structures (the actual OS files — datafiles, blocks). This separation is another instance of the data-independence principle, and understanding the hierarchy is essential for administration, sizing, and performance. This chapter maps both, and how they connect.

### 30.1 The physical structures: the three file types

A database (Ch 29) is fundamentally three kinds of file on disk:

- **Datafiles** — the files that hold the actual data: tables, indexes, everything. The bulk of the database's size. Each datafile belongs to exactly one tablespace (below).
- **Control files** — small but critical files recording the database's physical structure: the names and locations of all datafiles and redo logs, the database name, the current log sequence, checkpoint information, and RMAN backup metadata. The control file is the database's "map of itself". It is so critical that Oracle multiplexes it (keeps multiple identical copies); losing all control files is a serious recovery event.
- **Online redo log files** — record every change made to the database (the redo stream, Ch 32), enabling recovery. Oracle writes to them in a **circular** fashion through **redo log groups** (switching to the next group when one fills), and each group should be **multiplexed** (multiple members on different disks) so the loss of one disk does not lose redo. In ARCHIVELOG mode, filled groups are archived before reuse.

Supporting files (not part of the database proper but essential): the **parameter file** (SPFILE/PFILE — instance configuration), the **password file** (privileged authentication), and **archived redo logs** (Ch 38).

### 30.2 The logical structures: tablespaces → segments → extents → blocks

Logically, Oracle storage is a four-level hierarchy, from largest to smallest:

```
   TABLESPACE   (a logical storage container, mapped to 1+ datafiles)
      └── SEGMENT     (storage for one object: a table, an index, etc.)
            └── EXTENT      (a contiguous set of blocks, the unit of allocation)
                  └── DATA BLOCK   (the smallest unit of I/O; e.g. 8 KB)
```

- **Data block** — the smallest unit of storage and I/O (Ch 23 / Vol 3's "page"). Typically 8 KB (set by `DB_BLOCK_SIZE`, fixed at database creation). Oracle reads and writes whole blocks, never individual rows. A block holds a header, row data, and free space (governed by `PCTFREE`/`PCTUSED`).
- **Extent** — a set of *contiguous* data blocks allocated together as one unit. When a segment needs more space, Oracle allocates another extent. Allocating in extents (rather than block by block) reduces overhead.
- **Segment** — the total storage allocated to a single object: a *table segment*, an *index segment*, an *undo segment*, a *temporary segment*, a *LOB segment*, etc. A segment is made of one or more extents.
- **Tablespace** — a logical container grouping related segments, mapped to one or more physical datafiles. You create objects "in" a tablespace; their segments' extents come from that tablespace's datafiles. Tablespaces are the level at which you organize, manage, back up, and take offline portions of the database.

> **The mapping is the point.** A *logical* object (a table's segment) is stored in a *logical* tablespace, which is physically realized in one or more *physical* datafiles. This indirection means you can move data to different disks (change which datafiles back a tablespace) without changing the table — physical data independence in action. When a query reads a table, Oracle translates: table → segment → extents → blocks → offsets within specific datafiles.

### 30.3 Kinds of tablespace

Oracle uses several tablespaces, each with a role:

- **SYSTEM** — holds the data dictionary (Ch 4); created automatically, critical, never used for user data.
- **SYSAUX** — auxiliary system data (AWR, etc.); companion to SYSTEM.
- **Undo tablespace** — holds undo segments (the old row versions for read consistency and rollback — Ch 32). Managed automatically (Automatic Undo Management).
- **Temporary tablespace** — workspace for sorts/hashes that spill from the PGA (Ch 29), and for global temporary tables. Uses *temp files* (similar to datafiles but for transient data).
- **User/application tablespaces** — where you place application tables and indexes (e.g. a `USERS` tablespace, or dedicated tablespaces per application).

```sql
-- Create a tablespace and place objects in it
CREATE TABLESPACE app_data
   DATAFILE '/u01/oradata/app_data01.dbf' SIZE 1G
   AUTOEXTEND ON NEXT 100M MAXSIZE 10G
   EXTENT MANAGEMENT LOCAL AUTOALLOCATE;

CREATE TABLE orders (...) TABLESPACE app_data;     -- segment's extents come from app_data
ALTER USER appdev DEFAULT TABLESPACE app_data QUOTA UNLIMITED ON app_data;
```

> **AUTOEXTEND and running out of space.** A datafile can be fixed-size or `AUTOEXTEND ON` (grows automatically up to `MAXSIZE` as needed). A classic production incident is a tablespace filling up because autoextend was off or hit its max — DML then fails with `ORA-01653/ORA-01654` (unable to extend segment). Monitoring tablespace free space (`DBA_FREE_SPACE`, `DBA_DATA_FILES`) is routine DBA work. **DE NOTE:** a bulk load that suddenly fails partway is often a tablespace-full problem — check space before large loads.

### 30.4 Segment space management: PCTFREE, blocks, and row chaining

Within a block, two settings govern space use, and they have performance consequences worth knowing:

- **`PCTFREE`** — the percentage of each block kept *free* for future *updates* to existing rows (so a row that grows — e.g. a NULL column gets a value — has room to expand in place). Default 10%.
- **`PCTUSED`** — (in manual segment-space management) the threshold below which a block becomes eligible for new inserts again. Modern Oracle uses **Automatic Segment Space Management (ASSM)**, which handles this with bitmaps and largely removes the need to tune `PCTUSED`.

Two phenomena to recognize:

- **Row migration** — if an `UPDATE` grows a row beyond the free space in its block, Oracle *moves* the row to a new block, leaving a pointer behind. Access now requires an extra hop. Caused by too-low `PCTFREE` on update-heavy tables.
- **Row chaining** — if a row is too large to fit in a single block at all (very long rows, or rows wider than the block size), it is stored across multiple chained blocks. Reading it requires multiple block reads.

> **Why this matters for performance.** Migrated and chained rows turn one block read into several, silently slowing access. Setting `PCTFREE` appropriately for the table's update pattern (higher for rows that grow, lower for insert-only/read-only tables to pack more rows per block) avoids migration. This is fairly deep tuning, but recognizing "lots of chained/migrated rows" as a cause of unexpectedly slow row access (visible in statistics) is useful diagnostic knowledge.

### 30.5 Other physical/storage topics worth knowing

- **Automatic Storage Management (ASM)** (10g+) — Oracle's own volume manager and filesystem for database files, striping and mirroring data across disks automatically. It replaces OS filesystems/LVM for many Oracle deployments, simplifying storage administration and providing performance and redundancy. You will hear "the database is on ASM" frequently in enterprise Oracle.
- **Bigfile vs smallfile tablespaces** — a *smallfile* tablespace can have many datafiles (the traditional model); a *bigfile* tablespace has exactly one, very large datafile (simpler management for huge tablespaces, common with ASM).
- **Oracle Managed Files (OMF)** — Oracle automatically names and places files when you specify a base location, reducing manual file management.
- **Tablespace operations** — tablespaces can be taken `OFFLINE`/`ONLINE`, set `READ ONLY` (e.g. for historical data that never changes, simplifying backups), and *transported* between databases (transportable tablespaces — a fast bulk data-movement method, Ch 38).

> **DE NOTE — the storage hierarchy maps to concepts you know.** The block (page) is the same unit-of-I/O idea from your DE Vol 3 storage chapter; tablespaces organizing storage parallel how you organize data across storage in a warehouse/lakehouse; read-only tablespaces for immutable historical data echo immutable partitions in the lakehouse; and ASM's striping/mirroring is the same durability-and-throughput goal as distributed object storage. You rarely administer Oracle storage as a data engineer, but understanding the hierarchy makes you literate in how the source systems you ingest from actually store their data — and why, for example, a poorly-sized temp tablespace makes a source extract query crawl.

---

## Chapter 31 — Memory & Process Management: Parsing and the Cursor Lifecycle

Chapter 29 mapped the SGA's structures; this chapter goes deeper into how Oracle *uses* them when executing SQL — the parsing process (and the critical hard-vs-soft parse distinction), the library cache and cursor sharing, and the lifecycle of a SQL statement. This is where SQL execution meets memory management, and it directly explains a major class of performance problems.

### 31.1 What happens when you submit a SQL statement

When a statement arrives, Oracle processes it through stages (introduced in your DE Vol 1's "query pipeline"; here in Oracle specifics):

1. **Parse** — check syntax, check semantics (do the objects/columns exist, do you have privileges), and either find an existing execution plan in the shared pool or have the optimizer generate one.
2. **Bind** — supply values for any bind variables (`:x`).
3. **Execute** — run the plan: for DML, apply the changes; for queries, identify the result rows.
4. **Fetch** — for queries, return the rows to the client.

The **parse** step is the focus here, because *how* a statement is parsed has outsized performance impact.

### 31.2 Hard parse vs soft parse — a major performance concept

Parsing is expensive: it involves syntax/semantic checks and, worst of all, *optimization* (the optimizer evaluating many possible plans — Ch 35). Oracle avoids repeating this work by caching parsed statements in the **library cache** (part of the shared pool). The distinction:

- **Hard parse** — the statement is *not* found in the library cache, so Oracle must do the full work: syntax check, semantic check, **optimization** (generate a plan), and load it into the cache. Expensive (CPU, latches, memory).
- **Soft parse** — an identical statement *is* already in the library cache, so Oracle reuses the existing parsed representation and plan, skipping optimization. Much cheaper.
- **(Softer still)** — session cursor caching and `PL/SQL` statement caching can avoid even the soft-parse lookup for repeated statements.

For two statements to match (enabling a soft parse), their text must be **identical** — same characters, same case, same whitespace. And this is where bind variables become critical:

```sql
-- These are THREE DIFFERENT statements to Oracle (literals differ) -> three HARD parses,
-- three plans cached, shared pool bloated, latch contention:
SELECT * FROM employees WHERE employee_id = 100;
SELECT * FROM employees WHERE employee_id = 101;
SELECT * FROM employees WHERE employee_id = 102;

-- This is ONE statement reused with different bind values -> one hard parse, then SOFT
-- parses (or cached cursor) for every subsequent execution:
SELECT * FROM employees WHERE employee_id = :id;   -- bind variable
```

> **Bind variables are a performance feature, not just a security one.** Chapter 27 stressed bind variables for SQL-injection safety; here is the *other* reason they matter enormously. Code that concatenates literal values into SQL produces a *distinct statement text for every value*, forcing a hard parse each time, flooding the shared pool with single-use plans, and causing **library-cache latch contention** that can cripple a busy OLTP system. Code that uses bind variables produces *one* reusable statement, hard-parsed once and soft-parsed (or cursor-cached) thereafter. This single difference — bind variables vs literal concatenation — is one of the highest-impact factors in OLTP scalability, and a top diagnostic when an application "doesn't scale". (The mitigation `CURSOR_SHARING=FORCE`, which makes Oracle auto-replace literals with binds, exists precisely to rescue applications that ignored this — but writing binds correctly is far better.)

### 31.3 The library cache and cursors

A **cursor** in this context is the in-memory representation of a parsed SQL statement and its execution plan (distinct from the PL/SQL cursors of Ch 21, though related). Oracle distinguishes:

- **Parent cursor** — keyed by the statement text.
- **Child cursors** — different plans/contexts for the "same" text (e.g. when the same statement runs against different objects, or under different optimizer settings, or — see bind peeking, Ch 35 — when different bind values warrant different plans).

The **library cache** holds these cursors so they can be reused. When too many *unsharable* statements churn through it (the literal-concatenation problem above), Oracle suffers from latch contention and may age out useful cursors, forcing re-parses. The `V$SQL`, `V$SQLAREA`, and `V$SQL_SHARED_CURSOR` views (Ch 4 / Ch 35) let you inspect cached statements, their parse counts, and why cursors did not share.

### 31.4 The data dictionary (row) cache

The other major shared-pool cache is the **data dictionary cache** (row cache): it caches metadata about schema objects, users, privileges, and constraints, so that the constant internal lookups Oracle performs during parsing and execution ("does this column exist? what's its type? does this user have this privilege?") hit memory rather than querying the dictionary tables on disk every time. It is managed automatically; you mostly need to know it exists and that it is part of why the shared pool must be adequately sized.

### 31.5 Putting it together: why parsing knowledge matters

> **The practical upshot.** Three habits follow directly from this chapter, all high-value: (1) **use bind variables** so statements are sharable and hard parses are rare; (2) **reuse statements** (prepared statements in applications, cursor caching) rather than rebuilding SQL text repeatedly; (3) **size the shared pool** adequately so parsed cursors and dictionary metadata stay cached. When an OLTP system shows high CPU, high parse counts, and latch contention, the cause is very often excessive hard parsing from literal SQL — and the fix is binds. This is one of the most common real-world Oracle performance diagnoses, and it flows entirely from understanding parsing and the library cache.

---

## Chapter 32 — Redo, Undo, Checkpoints & Recovery

This chapter explains the mechanisms that make Oracle both *durable* (committed data survives crashes) and *consistent* (readers see a stable snapshot, transactions can roll back): the **redo** stream, **undo** segments, **checkpoints**, and **recovery**. These are the internals behind the ACID guarantees of Ch 1 and the MVCC behavior of Ch 14, and they are deeply illuminating — the same principles power every serious database and the modern lakehouse.

### 32.1 Redo — the write-ahead log

**Redo** is the record of every change made to the database — enough information to *redo* (reapply) the change. It is the foundation of durability and recovery. The flow:

1. When a transaction modifies data, Oracle writes a **redo entry** describing the change into the **redo log buffer** (in the SGA) — *before* (or as) it modifies the actual data block in the buffer cache.
2. At **commit** (and other triggers), **LGWR** flushes the redo log buffer to the **online redo log files** on disk, and only then does Oracle acknowledge the commit as successful.
3. The actual data blocks (in the buffer cache) are written to datafiles *later*, lazily, by **DBWn**.

This is **write-ahead logging (WAL)**: the change is durably recorded in the redo log *before* the data block reaches disk. Its consequence is the elegant durability guarantee — *a committed transaction is safe the instant LGWR has written its redo, even though the data block itself may not be in the datafile yet.* If the instance crashes at that moment, recovery (below) replays the redo to reconstruct the change.

```
   change happens → redo entry to log buffer → (commit) LGWR flushes redo to disk → COMMIT done
                                              → (later) DBWn writes data block to datafile
```

> **Why write-ahead logging is brilliant.** Writing the actual modified data blocks to their scattered locations on disk at every commit would be slow (random I/O). Instead, Oracle writes the small redo record **sequentially** to the redo log (fast) at commit, and defers the data-block writes to efficient batches. Durability is guaranteed by the sequential redo write; the data files catch up lazily. This is *exactly* the principle behind PostgreSQL's WAL, the transaction logs of Delta Lake and Iceberg, and every reliable database — recognizing it as one universal idea (Ch 1, and your DE Vol 3) is a hallmark of cross-system understanding. The redo log is Oracle's WAL.

### 32.2 Online redo logs and archiving

The **online redo log** consists of two or more **groups**, written in a **circular** fashion: LGWR fills group 1, switches to group 2, then group 3, then back to group 1 (overwriting it). Each group should be **multiplexed** — have multiple **members** on different disks — so losing one disk does not lose redo.

The critical operational choice:

- **NOARCHIVELOG mode** — when LGWR cycles back to reuse a redo log group, its contents are simply overwritten and lost. You can recover only to the last full backup (any changes since are gone if you lose the datafiles). Acceptable only for test/dev or databases you can fully reload.
- **ARCHIVELOG mode** — before a filled redo log group is overwritten, the **ARCn** process copies it to an **archived redo log**. This preserves the *complete, unbroken* redo stream, enabling **point-in-time recovery** (restore a backup and replay archived + online redo up to any moment). **Required for production** databases and for most backup strategies (Ch 38).

> **ARCHIVELOG mode is non-negotiable for production.** Without it, you cannot recover changes made since your last backup, and you cannot do online backups or point-in-time recovery. The trade-off is the storage and management of archived logs (which must be backed up and eventually purged). Switching a database to ARCHIVELOG mode is a foundational production setup step. **DE NOTE:** ARCHIVELOG mode is also what makes **log-based CDC** (LogMiner, GoldenGate — Ch 44) possible, since CDC reads the redo/archive stream to capture changes — so the same mechanism that enables recovery enables replicating Oracle data into your lakehouse.

### 32.3 Undo — the old versions

Where redo records how to *reapply* a change, **undo** records how to *reverse* it — the *old* value of changed data. Undo is stored in **undo segments** (in the undo tablespace, Ch 30) and serves three purposes:

1. **Rollback** — if a transaction issues `ROLLBACK` (or fails), Oracle uses the undo to restore the original values.
2. **Read consistency (MVCC)** — when a query needs to see a row as it existed at the query's start time but the row has since been changed, Oracle reconstructs the old version from undo (Ch 14). This is how readers see a consistent snapshot without blocking writers.
3. **Flashback** — the Flashback features (Ch 17, 38) use undo to show or restore past states.

**Undo retention** governs how long undo data is kept after the transaction commits (it cannot be reused while a query might still need it for read consistency). Modern Oracle uses **Automatic Undo Management** (an undo tablespace with an `UNDO_RETENTION` target, auto-tuned).

> **`ORA-01555: snapshot too old` — undo's signature error (revisited).** A long-running query needs to reconstruct old row versions from undo to maintain its consistent snapshot. If those undo records have already been overwritten (because undo retention was too short for the workload, or the undo tablespace too small, and many transactions churned through it), Oracle cannot build the snapshot and raises `ORA-01555`. The fixes: increase undo retention / undo tablespace size, or shorten the offending query, or (for known long readers) guarantee retention. This classic error is a direct consequence of how undo underpins read consistency — and a frequent issue when a long analytical extract runs against a busy OLTP source (a real DE concern when pulling from Oracle).

### 32.4 Checkpoints

A **checkpoint** is a synchronization point that says "all changes up to this point are guaranteed written to the datafiles." At a checkpoint, DBWn writes the relevant dirty buffers to datafiles, and CKPT records the checkpoint position (in the control file and datafile headers). Checkpoints bound how much redo would need to be replayed during recovery: recovery starts from the last checkpoint, so more frequent checkpoints mean faster recovery but more ongoing write I/O — a tunable trade-off (`FAST_START_MTTR_TARGET` lets you target a recovery time and let Oracle manage checkpoint frequency).

### 32.5 Recovery: instance recovery and media recovery

Putting redo and undo together explains how Oracle recovers:

**Instance (crash) recovery** — automatic, when an instance restarts after a crash (power loss, kill). On startup, **SMON** performs two phases:

1. **Roll forward (redo)** — replay the redo log from the last checkpoint to reapply *all* changes (committed *and* uncommitted) that had not yet been written to datafiles, bringing the datafiles up to the moment of the crash.
2. **Roll back (undo)** — then use undo to reverse the changes of transactions that were *not committed* at the time of the crash.

The result: every committed transaction is present (durability) and every uncommitted one is gone (atomicity). This happens automatically and is why a crashed Oracle database comes back consistent.

**Media recovery** — manual (via RMAN, Ch 38), when datafiles are *lost or corrupted* (a disk failure). You **restore** datafiles from backup and **recover** by applying archived + online redo logs to roll them forward to a chosen point — either the latest possible (complete recovery) or a specific past time/SCN (point-in-time recovery, e.g. to just before a catastrophic mistake). This requires ARCHIVELOG mode (§32.2).

> **The redo/undo duality is the conceptual heart of database reliability.** *Redo* lets Oracle **roll forward** (reapply committed work after a crash) — durability. *Undo* lets Oracle **roll back** (reverse uncommitted work, and reconstruct past versions) — atomicity and read consistency. Crash recovery uses both: roll forward everything from redo, then roll back the uncommitted using undo. Understanding this pair illuminates not just Oracle recovery but the general theory of how databases guarantee ACID under failure — and it maps directly onto how the lakehouse transaction log enables both time travel (undo-like) and recovery (redo-like).

---

## Chapter 33 — Transactions & Concurrency, In Depth

Chapter 14 covered transaction control and the working model of Oracle's concurrency (MVCC, read consistency, locking). This chapter goes to the internals — the mechanics of MVCC, lock and latch types, deadlock detection, the isolation levels in precise terms, and the anomalies they do and do not permit — because deep concurrency understanding is exactly what distinguishes senior database engineers.

### 33.1 MVCC internals — how read consistency actually works

Oracle's **Multi-Version Concurrency Control** delivers the guarantee that *readers never block writers and writers never block readers* (Ch 14). The mechanism, now in detail, ties together the SCN, undo, and block versions:

- The **System Change Number (SCN)** is Oracle's logical clock — a monotonically increasing number marking every committed change. Every commit gets an SCN; every block records the SCN of its last change.
- When a query begins, it notes the current SCN — its **snapshot SCN**. The query must see the database *as of* that SCN.
- As the query reads each block, it compares the block's last-change SCN to its snapshot SCN. If the block was last changed *at or before* the snapshot SCN, the query reads it directly (it is a version the query is allowed to see). If the block was changed *after* the snapshot SCN (by some other transaction that committed during the query), the query must **reconstruct the older version**: it takes the current block and applies **undo** to roll it back to how it looked at the snapshot SCN — producing a **consistent read (CR) version** of the block in memory.

This is how a long-running query sees a single consistent point in time even as other sessions commit changes throughout: it rebuilds the past versions it needs from undo. And it never takes read locks, so it never blocks writers and is never blocked by them.

> **This is the precise mechanism behind everything in Ch 14.** "Statement-level read consistency", "readers don't block writers", and `ORA-01555` all fall out of this SCN-plus-undo machinery. A query reads as of its snapshot SCN, reconstructing old block versions from undo when necessary; if the undo it needs is gone, it cannot reconstruct and raises `ORA-01555`. The same multiversion idea — keep versions, let each reader see a consistent point-in-time view — is exactly what Delta/Iceberg/Snowflake "time travel" reimplemented for analytics decades later.

### 33.2 Lock types and the lock queue

Where MVCC handles read/write coexistence, **locks** coordinate concurrent *writes*. Oracle's locking, in more detail than Ch 14:

- **Row locks (TX)** — acquired automatically when a transaction modifies a row (`INSERT`/`UPDATE`/`DELETE`/`SELECT...FOR UPDATE`). Exclusive on that row, held until commit/rollback. Stored *in the block itself* (in the interested-transaction list, ITL), not in a central lock table — which is why Oracle has no practical limit on the number of row locks and **never escalates** row locks to table locks (a significant advantage over databases that do).
- **Table locks (TM)** — acquired automatically (usually in a non-restrictive mode like Row Exclusive) when you modify a table, to coordinate with DDL; and explicitly via `LOCK TABLE`. They prevent, e.g., someone dropping a table while you are inserting into it.
- **Lock modes and compatibility** — locks have modes (row share, row exclusive, share, share row exclusive, exclusive) with a compatibility matrix determining which can be held simultaneously. The system manages this; you rarely think about TM modes directly.
- **Enqueues and the lock queue** — when a session needs a lock another holds incompatibly, it waits in a queue (an *enqueue*). The waiting shows up as an event you can see in `V$SESSION`/`V$LOCK` — invaluable for diagnosing "why is this session stuck?" (it is blocked by another session's lock).

### 33.3 Latches and mutexes — protecting memory

Distinct from locks (which protect *data*), **latches** (and **mutexes**) are very lightweight, short-duration serialization mechanisms that protect Oracle's *in-memory structures* (the SGA) from concurrent corruption. For example, the **library cache latch** protects the library cache while a session parses. Latches are held for microseconds, but under extreme concurrency, contention for a hot latch becomes a bottleneck.

> **Latch contention as a scaling limit.** The library-cache and shared-pool latches are exactly what the literal-SQL/hard-parsing problem (Ch 31) stresses: thousands of sessions hard-parsing distinct statements all fight for the library-cache latch, and that contention — not CPU or I/O — caps throughput. This closes the loop: bind variables reduce hard parses, which reduces library-cache latch contention, which lets the system scale. Latch contention is a more advanced diagnosis, but recognizing it (high "latch: library cache" waits) points straight back to parsing behavior.

### 33.4 Deadlocks, in detail

A **deadlock** (Ch 14) is a circular wait: session A holds a lock B wants, and B holds a lock A wants. Oracle's handling, in detail:

- Oracle **automatically detects** deadlocks (a background check finds the cycle in the wait-for graph).
- It breaks the deadlock by choosing a **victim** and rolling back the victim's *statement* (not necessarily the whole transaction), raising `ORA-00060` to that session and freeing the other.
- A **trace file** is written recording the deadlock (the statements and resources involved) — useful for diagnosing the root cause.

Prevention (Ch 14) is consistent lock-acquisition ordering across all code paths, short transactions, and application-level retry of `ORA-00060`. Note that deadlocks involving only row locks are usually application-logic problems (inconsistent update order); deadlocks involving other resources (ITL shortages, bitmap indexes under concurrent DML, unindexed foreign keys) point to schema/design issues.

> **Unindexed foreign keys cause locking grief — a classic gotcha.** If a child table's foreign-key column is *not* indexed, then updating or deleting a *parent* row takes a share lock on the *whole child table* (to check for orphans), blocking concurrent DML on the child and risking deadlocks. **Always index foreign-key columns** (unless you know the parent key is never updated/deleted). This is one of the most common, easily-fixed causes of mysterious locking and deadlocks in Oracle applications — and a frequent interview question.

### 33.5 Isolation levels, precisely

Chapter 14 introduced Oracle's isolation levels; here they are with the standard anomaly framework. The SQL standard defines isolation levels by which **anomalies** they permit:

- **Dirty read** — reading another transaction's *uncommitted* changes. **Oracle never permits this** (MVCC always reads committed data) — so Oracle has no READ UNCOMMITTED level; its lowest level already excludes dirty reads.
- **Non-repeatable read** — re-reading a row within a transaction returns different values because another transaction changed and committed it in between.
- **Phantom read** — re-running a query returns new rows that another transaction inserted and committed.

Oracle's levels mapped onto these:

| Oracle isolation level | Dirty read | Non-repeatable read | Phantom read |
|---|---|---|---|
| **READ COMMITTED** (default) | No | Possible | Possible |
| **SERIALIZABLE** | No | No | No |
| **READ ONLY** | No | No | No (and no writes) |

- **READ COMMITTED** (default) — *statement-level* read consistency: each statement sees data committed as of when that statement began. Different statements in the same transaction can see different committed data, so non-repeatable and phantom reads are possible *across statements*. This is stronger than the standard's minimum READ COMMITTED because of Oracle's statement-level snapshot.
- **SERIALIZABLE** — *transaction-level* read consistency: the whole transaction sees a snapshot as of its start, so it experiences neither non-repeatable nor phantom reads. If it tries to update a row that another transaction modified and committed after this transaction began, Oracle raises **`ORA-08177: can't serialize access`**, and the application must retry. (Oracle's SERIALIZABLE is technically *snapshot isolation*, which prevents the standard anomalies but can, in rare cases, allow "write skew" — a subtlety beyond most needs.)
- **READ ONLY** — transaction-level snapshot with no DML allowed; ideal for long, consistent reporting.

```sql
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;   -- transaction-level consistency
SET TRANSACTION READ ONLY;                        -- consistent, no writes
-- (default is READ COMMITTED if you set nothing)
```

> **The lost-update problem persists under READ COMMITTED.** Two sessions read a balance of 100, each computes a new value, each writes — the second overwrites the first, and one update is "lost." MVCC does *not* prevent this (both reads were valid committed snapshots). Defenses: **`SELECT ... FOR UPDATE`** (pessimistic — lock the row before reading-to-modify, Ch 14), **optimistic concurrency** (re-check the row hasn't changed at write time, via a version column), or **SERIALIZABLE** (which detects the conflict and forces a retry). Knowing that the default isolation does not prevent lost updates — and how to defend against them — is exactly the kind of senior-level concurrency understanding that separates strong engineers, and it applies when your pipelines do read-modify-write against Oracle sources.

---

## Chapter 34 — Multitenant Architecture (CDB/PDB)

The **multitenant architecture** — introduced in **12c** and now the *only* architecture (the old non-CDB model is desupported in modern releases) — is the single biggest structural change since your 11g notes. It reorganizes how databases are packaged: instead of one database per instance, a **container database (CDB)** hosts many **pluggable databases (PDBs)**. Understanding it is essential for working with any Oracle from 12c onward.

### 34.1 Why multitenant exists

Before 12c, each database was a heavyweight, standalone entity with its own full set of background processes, memory, and a complete copy of the data dictionary. Running many databases (for many applications, or many tenants of a SaaS product) meant many redundant copies of all that overhead — wasteful and hard to manage at scale. Multitenant solves this by **sharing** the instance-level overhead across many databases while keeping each database's *application data* cleanly separated:

- The **container database (CDB)** provides the shared instance: one set of background processes, one SGA, one set of redo logs and undo, and the *system* metadata.
- Each **pluggable database (PDB)** is a self-contained, portable database with its own application schemas, data, and *local* metadata — but it relies on the CDB for the shared infrastructure.

The benefits: dramatically higher **consolidation density** (many PDBs per CDB, sharing overhead), **fast provisioning** (clone a PDB in seconds), **portability** (unplug a PDB from one CDB and plug it into another), and **manage-many-as-one** operations (patch/upgrade/back up at the CDB level to affect all PDBs at once). This is also the architecture underpinning Oracle's cloud (Autonomous Database, Ch 43).

### 34.2 The container hierarchy: CDB$ROOT, PDB$SEED, and PDBs

A CDB contains several kinds of container:

- **`CDB$ROOT`** (the root) — holds Oracle-supplied metadata and *common* objects shared across all containers. You do **not** put application data here. Connecting to the root is for CDB-wide administration.
- **`PDB$SEED`** — a read-only template PDB used to create new PDBs quickly (Oracle copies the seed). You never modify it directly.
- **User PDBs** — the actual application databases (e.g. `FREEPDB1` in Oracle Free, or `SALES_PDB`, `HR_PDB`). Each is a full database from the application's point of view: it has its own schemas, tables, users, and a local data dictionary. Applications connect to a *PDB* (via its service name, Ch 4), not the root.

```sql
-- See the containers in a CDB
SELECT con_id, name, open_mode FROM v$containers;
SELECT con_id, name FROM v$pdbs;

-- Which container am I in right now?
SHOW CON_NAME;

-- Switch containers (from a privileged common user)
ALTER SESSION SET CONTAINER = FREEPDB1;
ALTER SESSION SET CONTAINER = CDB$ROOT;

-- Open / close a PDB
ALTER PLUGGABLE DATABASE freepdb1 OPEN;
ALTER PLUGGABLE DATABASE freepdb1 CLOSE IMMEDIATE;
```

> **The connection gotcha (from Ch 4, now explained).** Beginners on modern Oracle constantly "lose" their tables because they connected to `CDB$ROOT` instead of their PDB — application objects live *in the PDB*, not the root. Always connect to the PDB (e.g. service `FREEPDB1`), and use `SHOW CON_NAME` to confirm where you are. This single confusion accounts for a large share of "my tables disappeared" support questions on 12c+.

### 34.3 Common users vs local users

Multitenant splits users (and roles, privileges) into two scopes:

- **Common users** — exist in the **root and all PDBs**, with names that must start with `C##` (e.g. `C##ADMIN`). Used for CDB-wide administration. Created from the root.
- **Local users** — exist in **one specific PDB** only (e.g. the `HR` schema inside `SALES_PDB`). These are your normal application users. Created while connected to (or specifying) that PDB.

```sql
-- Common user (created from the root; exists everywhere; C## prefix required)
ALTER SESSION SET CONTAINER = CDB$ROOT;
CREATE USER c##dba_admin IDENTIFIED BY pw CONTAINER=ALL;
GRANT DBA TO c##dba_admin CONTAINER=ALL;

-- Local user (created in a specific PDB; normal application user)
ALTER SESSION SET CONTAINER = freepdb1;
CREATE USER appdev IDENTIFIED BY pw;            -- CONTAINER=CURRENT is implied in a PDB
GRANT CREATE SESSION, CREATE TABLE TO appdev;
```

> Most application work uses **local users** inside a PDB — the PDB behaves just like a standalone database from the application's perspective. Common users are an administrative concept. The `C##` naming requirement for common users is a frequent point of confusion when first creating users on multitenant.

### 34.4 Plugging, unplugging, and cloning

The "pluggable" in PDB refers to genuine portability — a PDB can be detached from one CDB and attached to another:

- **Unplug** — disconnect a PDB from its CDB, producing an XML manifest (and the PDB's datafiles) describing it.
- **Plug in** — attach an unplugged PDB (via its manifest) into a (possibly different) CDB.
- **Clone** — create a copy of an existing PDB (within the same CDB or from a remote one), in seconds, sharing or copying storage. The basis of fast environment provisioning (spin up a copy of production for testing).

```sql
-- Clone a PDB (fast provisioning of a test copy)
CREATE PLUGGABLE DATABASE test_pdb FROM freepdb1;

-- Unplug a PDB to a manifest, then it can be plugged into another CDB
ALTER PLUGGABLE DATABASE sales_pdb UNPLUG INTO '/tmp/sales_pdb.xml';
DROP PLUGGABLE DATABASE sales_pdb KEEP DATAFILES;
-- elsewhere: CREATE PLUGGABLE DATABASE sales_pdb USING '/tmp/sales_pdb.xml' ...
```

> **DE NOTE — PDB cloning is dev/test gold, and the model echoes the cloud.** Snapshot-cloning a production PDB to get a realistic test database in seconds is enormously useful (and snapshot/refreshable clones make it cheap). More broadly, the multitenant model — many isolated databases sharing infrastructure, provisioned and cloned instantly — is conceptually the same consolidation-and-elasticity move that cloud data platforms make, and it is exactly how Oracle delivers Autonomous Database at scale (Ch 43). The "clone instantly, share storage until changed" idea also parallels zero-copy cloning in Snowflake (your DE Vol 4).

### 34.5 Application containers (briefly)

A further refinement: an **application container** is a special kind of container that holds a *master application definition* (shared schemas, tables, code) which many **application PDBs** inherit and share. It targets SaaS scenarios where many tenants run the *same* application — the common application objects are defined once in the application root and shared, while each tenant PDB holds its own data. A specialized feature; know it exists for multi-tenant SaaS on Oracle.

---

## Chapter 35 — The Optimizer & Performance

This is the most important chapter in Part IV for a data engineer, because performance work ultimately comes back to the **optimizer** — the component that decides *how* to execute each SQL statement — and to reading the **execution plans** it produces. This chapter covers the cost-based optimizer, statistics and cardinality, reading plans, the plan operators, hints, and the performance-diagnosis tooling (AWR/ASH). It is the Oracle-specific deepening of your DE Vol 3 performance chapter.

### 35.1 The Cost-Based Optimizer (CBO)

SQL is declarative: you state *what* you want, and the **optimizer** chooses *how* to compute it. For any non-trivial query there are many physically different execution strategies — different join orders, different join methods (nested loops/hash/merge), with or without each index, different access paths — that all produce the same result but can differ in speed by orders of magnitude. Oracle's **Cost-Based Optimizer (CBO)** estimates the "cost" of candidate plans and picks the cheapest.

- **Cost** is an internal estimate of the resources a plan will consume — primarily I/O, plus CPU and memory — a proxy for elapsed time.
- The CBO cannot evaluate *every* possible plan (the number explodes combinatorially with the number of tables), so it uses heuristics to prune the search and **statistics** to estimate costs.
- The older **Rule-Based Optimizer (RBO)** — which chose plans by fixed syntactic rules regardless of data — is long obsolete (desupported). All modern Oracle uses the CBO. (You may still hear "RBO" in legacy contexts.)

The CBO's choices are only as good as its cost estimates, and those depend entirely on **statistics** — which is why the next section is the crux of optimizer behavior.

### 35.2 Statistics and cardinality estimation

The optimizer's most important inputs are **statistics** describing the data: for each table, the number of rows and blocks; for each column, the number of distinct values, the high/low values, the number of nulls, and optionally a **histogram** of value distribution. From these it performs **cardinality estimation** — predicting how many rows each step of a plan will produce.

Cardinality is the linchpin: the best plan depends entirely on data volume. If a filter will match 10 rows, an index + nested-loop join is ideal; if it will match 10 million, a full scan + hash join is far better. Accurate cardinality estimates → good plans; badly wrong estimates → bad plans.

```sql
-- Gather statistics (the modern way; usually automated, but manual after big loads)
EXEC DBMS_STATS.GATHER_TABLE_STATS('HR', 'EMPLOYEES');
EXEC DBMS_STATS.GATHER_SCHEMA_STATS('HR');
-- Oracle also runs an automatic stats-gathering job in a maintenance window by default.

-- Histograms capture skew (when some values are far more common than others)
EXEC DBMS_STATS.GATHER_TABLE_STATS('HR','EMPLOYEES',
       method_opt => 'FOR COLUMNS SIZE AUTO department_id');
```

> **Stale or missing statistics is the #1 cause of sudden plan regressions.** If a table grows from a thousand rows to ten million but its statistics still say a thousand, the optimizer plans as if the table is tiny — choosing nested loops and index lookups that are catastrophic at the real size. The classic symptom: "the same query was fast yesterday, slow today, with no code change" — very often stale stats after a data load. The fix is `DBMS_STATS` to refresh them. Mature systems gather stats automatically (and modern Oracle has **real-time statistics**, 19c, and **online statistics gathering** during bulk loads), but after a large load or bulk change, refreshing stats is a primary tuning action. This is the identical lesson from your DE Vol 3 — stale statistics break the optimizer in every database.

> **Histograms and data skew.** Plain statistics assume values are evenly distributed. When they are not (e.g. a `status` column that is 99% `'CLOSED'` and 1% `'OPEN'`), a **histogram** tells the optimizer the real distribution so it can choose differently for the rare value (use an index for `'OPEN'`) vs the common one (full scan for `'CLOSED'`). Histograms on skewed, frequently-filtered columns are an important tuning tool.

### 35.3 Reading execution plans: EXPLAIN PLAN, AUTOTRACE, DBMS_XPLAN

Reading the optimizer's chosen plan is the single most important performance skill. Oracle exposes plans several ways:

```sql
-- 1. EXPLAIN PLAN: show the plan WITHOUT running the query
EXPLAIN PLAN FOR
SELECT e.last_name, d.department_name
FROM   employees e JOIN departments d ON e.department_id = d.department_id
WHERE  e.salary > 10000;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);     -- format and display the plan

-- 2. AUTOTRACE (SQL*Plus): run the query AND show plan + statistics
SET AUTOTRACE ON;
SELECT ... ;        -- shows results, then the plan, then stats (consistent gets, etc.)

-- 3. The ACTUAL plan used, with real row counts vs estimates (the most useful):
SELECT /*+ GATHER_PLAN_STATISTICS */ ... ;   -- run with this hint
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(FORMAT => 'ALLSTATS LAST'));
-- ^ shows E-Rows (estimated) vs A-Rows (actual) — the key to finding misestimates
```

A plan is a **tree of operations**, displayed indented; read it **from the most-indented (innermost) operations outward and upward**. The leaves access data (scans of tables/indexes); each parent combines, filters, sorts, or aggregates the rows flowing up from its children; the root produces the final result.

> **The two things to look for in any plan.** (1) The **access methods and join methods** — is it doing a full table scan where an index would help? a hash join where you expected a quick indexed nested loop, or vice versa? (2) With actual statistics (`DISPLAY_CURSOR` + `ALLSTATS LAST`), the **gap between estimated rows (E-Rows) and actual rows (A-Rows)** — a step the optimizer thought would produce 100 rows but actually produced 10 million is a cardinality misestimate, and it almost always explains a bad plan, pointing you to stale stats, missing histograms, or an unestimable predicate. This E-Rows-vs-A-Rows discipline is the most powerful single technique for diagnosing Oracle query performance.

### 35.4 Access paths and join methods in the plan

The vocabulary you will read in plans:

**Access paths** (how a single table's rows are obtained):
- **TABLE ACCESS FULL** — a full table scan: read every block. Fine for small tables or when most rows are needed; a red flag on a large table with a selective filter.
- **INDEX UNIQUE SCAN** — fetch one row via a unique index (e.g. primary-key lookup). Optimal.
- **INDEX RANGE SCAN** — walk an index for a range of values.
- **TABLE ACCESS BY INDEX ROWID** — having found ROWIDs via an index, fetch the actual rows. (Index scan + this is the common indexed-access pair.)
- **INDEX FAST FULL SCAN** — scan the whole index (when all needed columns are in the index — a covering index, Ch 36).
- **INDEX SKIP SCAN** — use a composite index even when the leading column is not in the predicate (in limited cases).

**Join methods** (the three from Ch 8/Vol 1, now seen in plans):
- **NESTED LOOPS** — for each row of the outer table, probe the inner (ideally via an index). Best when one side is small or an index makes lookups cheap.
- **HASH JOIN** — build a hash table on the smaller input, probe with the larger. The workhorse for large equality joins; needs PGA memory (spills to temp if too small).
- **MERGE JOIN (SORT MERGE)** — sort both inputs on the join key, then merge. Good when inputs are already sorted or for non-equijoins.

Other operators: **SORT** (ORDER BY, or feeding a merge join — watch for expensive sorts), **HASH GROUP BY / SORT GROUP BY** (aggregation), **FILTER**, **VIEW** (an inline view materialized), **PX** operators (parallel execution), **PARTITION RANGE ITERATOR/SINGLE** (partition pruning — Ch 37).

> **When a plan is slow, ask: which operator does the most work, and why?** Is it a full scan that should be an index access (missing/unusable index, or a non-sargable predicate, Ch 7)? A sort that an index could eliminate? A hash join spilling to disk (too little PGA)? The wrong join method because of a cardinality misestimate? The discipline — find the costliest operator, understand why it was chosen — is identical across Oracle, Postgres, Spark, and Snowflake (your DE Vol 3); only the operator names differ.

### 35.5 Hints

**Optimizer hints** are directives embedded in a SQL statement (in a special `/*+ ... */` comment) that instruct the optimizer to make a particular choice — use a specific index, a specific join method or order, parallelism, etc.:

```sql
SELECT /*+ INDEX(e idx_emp_dept) */ * FROM employees e WHERE department_id = 50;
SELECT /*+ FULL(e) */ * FROM employees e;                    -- force a full scan
SELECT /*+ USE_HASH(e d) */ ... ;                            -- force a hash join
SELECT /*+ LEADING(d e) */ ... ;                             -- join d before e
SELECT /*+ PARALLEL(4) */ * FROM big_table;                  -- parallel execution, 4 servers
SELECT /*+ GATHER_PLAN_STATISTICS */ ... ;                   -- collect actual row counts
```

> **Hints are a last resort, not a first reflex.** A hint *freezes* a decision that should adapt as data changes — an index hint that helps today may force a bad plan after the data grows or the schema changes, and an over-hinted codebase becomes brittle and hard to maintain. The mature approach is to fix the *root cause* so the optimizer chooses well on its own: refresh statistics, add histograms, rewrite predicates to be sargable and estimable, add the right index, restructure the query. Reserve hints for the genuine cases where you *know* better than the optimizer and the cost of being wrong is acceptable — and document why. **SQL Plan Management (SPM)** / **SQL Plan Baselines** are the more robust, modern way to *stabilize* a known-good plan without scattering hints in code.

### 35.6 Adaptive optimization and plan stability (12c+)

Modern Oracle's optimizer adapts at runtime, addressing the misestimate problem:

- **Adaptive plans** (12c) — the optimizer can defer the final choice of join method and switch at runtime based on the actual rows it sees (e.g. start as nested loops, switch to hash if more rows appear than estimated).
- **Adaptive statistics / automatic reoptimization** — Oracle notices when a plan's actual cardinalities diverged from estimates and *reoptimizes* on the next run with corrected information.
- **SQL Plan Management (SPM)** — captures and stores known-good plan baselines so that the optimizer will not switch to a new plan unless it is verified to be at least as good — protecting against plan regressions (e.g. after an upgrade or stats change).
- **Automatic indexing** (19c+, Autonomous) — Oracle can automatically identify, create, validate, and retain or drop indexes based on workload.

> These features make modern Oracle far more resistant to the plan-regression problems that plagued earlier versions, and they are squarely outside your 11g notes. The trend (as everywhere in Oracle) is toward self-tuning — but understanding *what* the optimizer does and *how to read a plan* remains essential, because automation handles the common cases and leaves the hard ones to you.

### 35.7 Performance diagnosis: AWR, ASH, ADDM

For diagnosing performance at the *system* level (not just one query), Oracle provides a powerful built-in toolset (Enterprise Edition, with the Diagnostics Pack license):

- **AWR (Automatic Workload Repository)** — periodically snapshots database performance statistics (every hour by default). An **AWR report** between two snapshots shows top SQL, wait events, load profiles, and resource usage over that interval — the primary tool for "the database was slow between 2 and 3 pm; what happened?"
- **ASH (Active Session History)** — samples what every active session is doing every second, enabling fine-grained "what was running and waiting at 2:47 pm?" analysis.
- **ADDM (Automatic Database Diagnostic Monitor)** — automatically analyzes AWR data and produces findings and recommendations ("this SQL consumed 40% of DB time; consider this index").
- **Wait events** — Oracle instruments *what sessions wait for* (disk I/O, locks, latches, log writes…). Performance tuning is largely about identifying the dominant wait events and reducing them — the "wait interface" is the foundation of modern Oracle tuning.

> **A method for performance tuning (the Oracle expression of your DE Vol 3 method).** (1) **Measure** — confirm and quantify the problem (AWR/ASH, or `SET TIMING ON`). (2) **Find the bottleneck** — the top SQL by DB time, the dominant wait events, or, for one query, the costliest plan operator. (3) **Diagnose** — why is it expensive? stale stats, missing index, non-sargable predicate, full scan, excessive parsing, lock contention, undersized memory? (4) **Fix one thing** — and **re-measure** to confirm. This measure-find-diagnose-fix-verify loop, grounded in the wait interface and execution plans, is how Oracle performance is actually done — the same discipline as tuning any engine, with Oracle's particularly rich instrumentation.

---

## Chapter 36 — Indexing in Depth

Chapter 16 introduced indexes; this chapter goes deep, because indexing is the single most powerful tool for query performance and a top interview topic. We cover B-tree internals, the specialized index types Oracle offers, composite-index design, covering indexes, and — crucially — when indexes *hurt*. This is the Oracle-specific deepening of your DE Vol 3 indexing chapter.

### 36.1 How a B-tree index works

The default Oracle index is the **B-tree** (specifically a B+ tree). It stores the indexed column's values in **sorted order** across a balanced tree of blocks:

- A **root** block at the top, **branch** blocks in the middle that guide the search, and **leaf** blocks at the bottom that hold the actual indexed values, each paired with the **ROWID** (Ch 5) of the table row containing that value.
- The tree is **balanced** and **shallow** — even an index over billions of rows is only a few levels deep — so finding any value takes just a few block reads, walking root → branch → leaf.
- Leaf blocks are **linked** to each other in key order, so a **range scan** (find values between X and Y) locates the start and then reads contiguous leaves sequentially.

A lookup `WHERE email = 'x'` thus descends the tree to the leaf holding `'x'`, reads the ROWID there, and fetches the row (`TABLE ACCESS BY INDEX ROWID`, Ch 35) — a handful of block reads instead of scanning the whole table.

```sql
CREATE INDEX idx_emp_email ON employees (email);     -- B-tree (the default)
-- Now: WHERE email = 'asha@x.com'  -> descends the index to the row (fast)
--      WHERE email LIKE 'asha%'    -> range scan (leading-anchored, can use the index)
--      WHERE email LIKE '%@x.com'  -> CANNOT use it (leading wildcard) -> full scan
```

> **B-trees are excellent for high-cardinality columns and selective queries.** They shine when a column has many distinct values and your query selects a small fraction of rows (a specific email, a narrow salary range). They are *not* helpful when a query returns most of the table anyway (a full scan is cheaper than index + many row fetches), nor for low-cardinality columns (few distinct values) — for which bitmap indexes (§36.3) may fit. Understanding *why* a B-tree is shallow and sorted explains both its speed for point/range lookups and its limits.

### 36.2 Unique vs non-unique, and constraint-backing indexes

- A **unique index** enforces that no two rows share the indexed value, *and* speeds lookups. Creating a `PRIMARY KEY` or `UNIQUE` constraint (Ch 12) automatically creates a supporting unique index. (You can also create one explicitly with `CREATE UNIQUE INDEX`.)
- A **non-unique index** speeds lookups without enforcing uniqueness — the common case for foreign keys and frequently-filtered columns.

> **Index your foreign keys (the locking reason, restated).** Beyond query speed, indexing FK columns avoids the table-level locking on the child table when a parent row is updated/deleted (Ch 33) — a frequent, easily-missed cause of contention and deadlocks. A near-universal best practice: index every foreign-key column unless the parent key is provably immutable.

### 36.3 Bitmap indexes

A **bitmap index** represents each distinct value of a column as a **bitmap** — a string of bits, one per row, set where the row has that value. For a `gender` column, there is a bitmap for `'M'` and one for `'F'`; for `region`, one bitmap per region. They are radically different from B-trees:

- **Excellent for low-cardinality columns** (few distinct values: gender, status, region, yes/no flags) — the opposite of B-trees.
- **Extremely compact**, and **fast to combine** with bitwise AND/OR — so `WHERE region='West' AND status='active' AND gender='F'` can be answered by ANDing three bitmaps, very efficiently. This makes them powerful for the multi-condition filtering typical of **data warehouses** and ad-hoc analytical queries.

```sql
CREATE BITMAP INDEX idx_sales_region ON sales (region);     -- low-cardinality column
CREATE BITMAP INDEX idx_sales_channel ON sales (channel_id);
-- Combining bitmap-indexed predicates is very efficient for DW-style queries.
```

> **Bitmap indexes are a data-warehouse tool, NOT for OLTP.** Their fatal weakness is concurrent DML: updating a single row's bitmap-indexed value can lock a large *range* of rows (because one bitmap segment covers many rows), making bitmap indexes terrible for tables with concurrent transactional writes. They are designed for **read-mostly, bulk-loaded** data — i.e. data warehouses and the SH-style star schemas (Ch 42). A related feature, the **bitmap join index**, pre-computes a bitmap on a *joined* dimension column, accelerating star-schema joins. Rule: bitmap indexes on DW fact/dimension tables you load in batches; **never** on hot OLTP tables. **DE NOTE:** this read-vs-write index trade-off is the same calculus as in your warehouse work (where columnar engines skip traditional indexes entirely).

### 36.4 Composite indexes and column order

A **composite index** covers multiple columns in a specified order, and the order is decisive (the **leftmost-prefix rule**, Ch 24/Vol 3):

```sql
CREATE INDEX idx_emp_dept_sal ON employees (department_id, salary);
-- USABLE for:  WHERE department_id = 50
--              WHERE department_id = 50 AND salary > 8000
-- NOT efficiently usable for:  WHERE salary > 8000   (skips the leading column)
```

The index is sorted by the first column, then the second within the first, and so on (like a phone book sorted by last then first name). So it serves queries that filter on a **leading prefix** of its columns. Guidance for ordering: put **equality-filter columns first**, then a **range column**, and lead with the **most selective** columns where that does not conflict.

> **Composite-index column order is one of the highest-impact tuning decisions.** Get it right and one index serves many queries; get it wrong and the index sits unused while queries scan. Design composite indexes around your actual `WHERE`/`JOIN`/`ORDER BY` patterns, not speculatively. (Oracle's **index skip scan** can sometimes use a composite index even when the leading column is absent, but only when that leading column has few distinct values — do not rely on it as a substitute for correct ordering.)

### 36.5 Covering indexes and index-only access

If an index contains **all** the columns a query needs (both filtered and returned), Oracle can answer the query entirely from the index without touching the table — an **index-only** access (shown as `INDEX FAST FULL SCAN` or a range scan with no `TABLE ACCESS BY ROWID`). This eliminates the row-fetch step and can be dramatically faster:

```sql
-- This index "covers" a query that filters on department_id and returns only salary:
CREATE INDEX idx_cover ON employees (department_id, salary);
SELECT salary FROM employees WHERE department_id = 50;     -- answered from the index alone
```

> Covering a hot query with an index trades extra index storage for the elimination of table lookups — a surgical, high-value optimization for frequently-run queries. (Oracle's B-tree indexes do not have a separate `INCLUDE` clause like SQL Server's; you achieve covering by listing the needed columns as index columns.)

### 36.6 Specialized index types

Oracle offers several more index types for particular needs:

- **Function-based index** (Ch 7, 16) — indexes the result of an *expression*, making a function-wrapped predicate **sargable**: `CREATE INDEX ... ON employees (UPPER(last_name))` lets `WHERE UPPER(last_name)='KING'` use an index. Essential for case-insensitive search and computed-value filters. (Requires the function be `DETERMINISTIC`, Ch 24.)
- **Reverse-key index** — reverses the bytes of the key before storing, spreading sequentially-increasing values (like a sequence-generated id) across the index to avoid a "hot" right-edge leaf block under heavy concurrent inserts (a contention point). A niche fix for insert-contention on monotonic keys.
- **Index-Organized Table (IOT)** — not an index *on* a table but a table *stored as* a B-tree on its primary key (the rows live in the index leaves, no separate table segment). Ideal for tables always accessed by primary key (lookup tables), giving fast PK access and no row-to-index duplication. (Conceptually like a clustered index in SQL Server, Ch 24.)
- **Invisible index** (**11g**) — an index the optimizer *ignores* by default (`CREATE INDEX ... INVISIBLE` or `ALTER INDEX ... INVISIBLE`), though it is still maintained. Brilliant for *testing* whether dropping an index would hurt (make it invisible, watch performance, then drop or revert) without the risk and cost of actually dropping and rebuilding it. A genuinely useful, low-risk tuning tool from your notes' version.
- **Bitmap join index** (§36.3) — a bitmap on a column of a *joined* table, accelerating star-schema joins in warehouses.
- **Domain indexes / Oracle Text** — extensible indexing for full-text search, spatial data, etc. (For "contains this word" search, an Oracle Text index vastly outperforms `LIKE '%word%'`.)
- **Partitioned indexes** — local vs global indexes on partitioned tables (Ch 37).

### 36.7 When indexes hurt

Indexes are not free, and over-indexing is a real, common problem:

- **Every index slows writes.** Each `INSERT`/`UPDATE`/`DELETE` that affects an indexed column must also maintain the index. A table with a dozen indexes pays that cost a dozen times on every relevant write — write throughput can be crippled.
- **Indexes consume storage** — sometimes more than the table itself.
- **The optimizer must consider each index**, adding (small) parse overhead, and a misleading index can tempt a worse plan.
- **Unused indexes are pure cost** — all the write/storage overhead, no read benefit.

```sql
-- Find indexes that are never used (monitor, then drop the dead ones):
ALTER INDEX idx_maybe_unused MONITORING USAGE;        -- (pre-12.2 mechanism)
-- 12.2+: query V$INDEX_USAGE_INFO / DBA_INDEX_USAGE for real usage tracking.
```

> **Index deliberately; audit and drop dead indexes.** Index the columns queries actually filter, join, and sort on — and *only* those. On write-heavy OLTP tables, fewer indexes are often better; on read-heavy reporting tables, more can pay off. A frequent production win is auditing a table that accumulated indexes over years and dropping the ones no query uses — restoring write performance at no read cost. Use **invisible indexes** (§36.6) to safely test a drop first. And remember (your DE Vol 3): **columnar warehouses largely abandon traditional indexes**, relying instead on partitioning, clustering, and column-skipping — so this whole B-tree-centric calculus is an OLTP/row-store concern that does *not* transfer to Snowflake/BigQuery.

---

## Chapter 37 — Partitioning

**Partitioning** divides a large table (or index) into smaller, independently-manageable pieces — **partitions** — while presenting it to applications as a single logical table. It is one of the most powerful features for managing and querying very large tables, central to data warehousing on Oracle, and a separately-licensed Enterprise Edition option. This chapter covers the partitioning strategies, the all-important **partition pruning**, partition-wise joins, local vs global indexes, and partition maintenance. It is the Oracle deepening of your DE Vol 3 partitioning discussion.

### 37.1 Why partition

A table of billions of rows is hard to query quickly, hard to manage, and hard to maintain. Partitioning addresses all three:

- **Performance** — via **partition pruning** (§37.3): a query that filters on the partitioning key reads only the relevant partitions, skipping the rest entirely. A query for last week's data against a table partitioned by day touches a few partitions instead of years of data.
- **Manageability** — you can load, back up, archive, compress, or drop *individual partitions*. Dropping last year's data is an instant `DROP PARTITION` instead of a massive, slow `DELETE`.
- **Availability** — maintenance on one partition need not affect the others; a problem in one partition can be isolated.

The table remains a single logical object — applications query it normally; partitioning is transparent to SQL.

### 37.2 Partitioning strategies

Oracle offers several ways to decide which row goes in which partition:

```sql
-- RANGE partitioning: by ranges of a column (the classic, esp. for dates)
CREATE TABLE sales (
   sale_id NUMBER, sale_date DATE, amount NUMBER, region VARCHAR2(20)
)
PARTITION BY RANGE (sale_date) (
   PARTITION p2024 VALUES LESS THAN (DATE '2025-01-01'),
   PARTITION p2025 VALUES LESS THAN (DATE '2026-01-01'),
   PARTITION p2026 VALUES LESS THAN (DATE '2027-01-01'),
   PARTITION pmax  VALUES LESS THAN (MAXVALUE)         -- catch-all for future/overflow
);

-- LIST partitioning: by discrete values of a column
CREATE TABLE customers (...)
PARTITION BY LIST (region) (
   PARTITION p_west  VALUES ('CA','OR','WA'),
   PARTITION p_east  VALUES ('NY','MA','NJ'),
   PARTITION p_other VALUES (DEFAULT)
);

-- HASH partitioning: Oracle hashes the key to spread rows EVENLY across N partitions
CREATE TABLE events (...)
PARTITION BY HASH (event_id) PARTITIONS 8;        -- 8 even partitions, good for parallelism

-- COMPOSITE partitioning: partition, then sub-partition (e.g. range by date, hash by id)
CREATE TABLE sales2 (...)
PARTITION BY RANGE (sale_date)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 4
( PARTITION p2026 VALUES LESS THAN (DATE '2027-01-01') );
```

- **Range** — by ranges of a (usually date/numeric) column. The most common, ideal for time-series data (partition by month/day), enabling time-based pruning and easy archival.
- **List** — by explicit discrete values (region, category). For partitioning along a known set of categories.
- **Hash** — Oracle hashes the key to distribute rows *evenly* across a fixed number of partitions. For spreading data and I/O uniformly (e.g. for parallelism) when there is no natural range/list key.
- **Composite** — combine two (range-hash, range-list, etc.): partition by one strategy, sub-partition each by another.

And two powerful automatic/relational variants:

- **Interval partitioning** (**11g**) — an extension of range partitioning where Oracle **automatically creates new partitions** as data arrives for new intervals (e.g. a new partition per month appears automatically when the first row of that month is inserted). Eliminates manual partition maintenance for growing time-series tables — a major convenience absent from older range partitioning.
- **Reference partitioning** — a child table inherits the partitioning of its parent via the foreign key, keeping related rows co-partitioned (so a partition-wise join works and you can manage parent+child partitions together).

```sql
-- Interval partitioning: new monthly partitions appear automatically (11g+)
CREATE TABLE sales_auto (sale_id NUMBER, sale_date DATE, amount NUMBER)
PARTITION BY RANGE (sale_date)
INTERVAL (NUMTOYMINTERVAL(1,'MONTH'))             -- auto-create one partition per month
( PARTITION p_start VALUES LESS THAN (DATE '2024-01-01') );
```

### 37.3 Partition pruning — the key performance benefit

**Partition pruning** is the payoff: when a query's `WHERE` clause filters on the partitioning key, the optimizer determines which partitions *could* contain matching rows and **skips all the others entirely** — reading a fraction of the data:

```sql
-- Against the range-partitioned 'sales' table, this touches ONLY the 2026 partition:
SELECT SUM(amount) FROM sales WHERE sale_date >= DATE '2026-01-01';
-- The plan shows PARTITION RANGE SINGLE/ITERATOR — proof that pruning happened.
```

> **Pruning is sargability at the partition level — and a function on the partition key defeats it.** Just as wrapping an indexed column in a function disables the index (Ch 7), wrapping the *partition key* in a function disables pruning: `WHERE TRUNC(sale_date) = DATE '2026-06-24'` may scan *every* partition, whereas `WHERE sale_date >= DATE '2026-06-24' AND sale_date < DATE '2026-06-25'` prunes to one. **Keep the partition key bare in predicates.** Partition pruning is the single most effective technique for keeping queries fast as a table grows into the billions — and it is the direct ancestor of partition pruning / file skipping in the lakehouse (your DE Vol 3): same idea, "read only the partitions that can match," at warehouse scale.

### 37.4 Partition-wise joins and parallelism

When two tables are partitioned the same way on their join key (or via reference partitioning), Oracle can perform a **partition-wise join** — joining partition-to-partition rather than the whole tables, which is far more efficient and parallelizes beautifully (each partition pair joined by a separate parallel server). This is a key technique for joining huge fact and dimension tables in a warehouse. Partitioning also enables **parallel query** to divide work cleanly across partitions.

### 37.5 Local vs global indexes on partitioned tables

Indexes on a partitioned table come in two flavors, a frequent design decision:

- **Local index** — partitioned the *same way* as the table; each index partition corresponds to one table partition. Partition maintenance (drop/add/truncate a table partition) only affects that index partition — so local indexes are low-maintenance and the usual default. Great when queries include the partition key.
- **Global index** — a single index spanning *all* partitions (or partitioned differently from the table). Useful for queries that do *not* filter on the partition key but need a fast lookup across the whole table. The downside: a table-partition operation (e.g. `DROP PARTITION`) can invalidate the global index, requiring a rebuild (mitigated by `UPDATE INDEXES` / asynchronous global index maintenance in modern versions).

> **Local indexes are the common choice for partitioned tables**, especially in warehouses where partition maintenance (rolling off old partitions) is routine — they avoid the global-index invalidation problem. Use a global index when you have a high-selectivity lookup that does not align with the partition key and must remain fast.

### 37.6 Partition maintenance and the rolling-window pattern

Partitioning makes large-table lifecycle operations cheap:

```sql
-- Drop old data INSTANTLY (vs a slow, logged DELETE of millions of rows)
ALTER TABLE sales DROP PARTITION p2024;

-- Add a new partition (not needed with interval partitioning, which auto-adds)
ALTER TABLE sales ADD PARTITION p2027 VALUES LESS THAN (DATE '2028-01-01');

-- Truncate one partition (e.g. to reload one day idempotently — Ch 13!)
ALTER TABLE sales TRUNCATE PARTITION p2026;

-- EXCHANGE PARTITION: swap a standalone table INTO a partition near-instantly
-- (the fast bulk-load pattern: load into a temp table, then exchange it in)
ALTER TABLE sales EXCHANGE PARTITION p2026 WITH TABLE sales_stage_2026
   INCLUDING INDEXES WITHOUT VALIDATION;
```

> **DE NOTE — partitioning is the heart of large-table data engineering on Oracle.** Three patterns matter for you: (1) the **rolling window** — add a new partition for the current period, drop the oldest, to maintain a fixed retention (instant, vs catastrophic mass `DELETE`s); (2) **partition exchange** — load fresh data into a standalone staging table, build its indexes, then `EXCHANGE PARTITION` to swap it into the live table in a metadata-only operation (the fast, low-impact bulk-load technique); (3) **idempotent partition reload** — `TRUNCATE PARTITION` then reload, so re-running a day's load cleanly replaces rather than duplicates (Ch 13's idempotency, at partition scale). These are exactly the partition-based load and retention patterns you use in the lakehouse, in their original Oracle form — and partition exchange is conceptually what an atomic partition-overwrite is in Delta/Iceberg.

---

## Chapter 38 — Backup, Recovery & Data Movement

A database is only as trustworthy as your ability to recover it. This chapter covers Oracle's backup-and-recovery tooling (RMAN), the Flashback technologies for fast recovery from logical errors, and the data-movement utilities (Data Pump, external tables, SQL\*Loader) you use to get data in and out — the last of which is directly relevant to data engineering. Much here builds on the redo/undo foundations of Ch 32.

### 38.1 Backup and recovery concepts

The purpose of backup is to enable **recovery** from failures: media failure (lost/corrupted datafiles), user error (a wrong `DELETE`/`DROP`), or disaster. Key concepts:

- **Physical backup** — copies of the actual database files (datafiles, control files, archived logs). The basis of full database recovery. Made with **RMAN** (§38.2).
- **Logical backup** — an export of the *logical contents* (object definitions and data) into a dump file, via **Data Pump** (§38.4). For moving data, refreshing environments, or restoring specific objects — not a substitute for physical backup of a production database.
- **Complete recovery** — restore and recover to the present (lose nothing). Requires ARCHIVELOG mode (Ch 32).
- **Point-in-time recovery (PITR)** — recover to a specific past moment (e.g. just before a catastrophic mistake), by restoring a backup and applying redo *up to* that point. Also requires ARCHIVELOG mode.
- **RPO and RTO** — *Recovery Point Objective* (how much data loss is tolerable — drives backup/archive frequency) and *Recovery Time Objective* (how fast you must be back — drives backup strategy and standby use). The two numbers that define a backup strategy.

### 38.2 RMAN (Recovery Manager)

**RMAN** is Oracle's dedicated backup-and-recovery tool — the standard for physical backups. It understands Oracle's file structures, so it backs up and restores intelligently:

- **Backs up** datafiles, control files, the SPFILE, and archived redo logs — full or **incremental** (only changed blocks since the last backup, via block-change tracking — far smaller/faster).
- **Validates** backups and detects block corruption (and can repair some corruptions via **block media recovery** — restoring just the damaged blocks).
- **Compresses and encrypts** backups; manages **retention policies** (automatically obsoleting old backups).
- Integrates with the **Fast Recovery Area** (a managed disk area for backups/archives) and with media managers (tape, cloud).

```
-- RMAN is its own command-line tool; illustrative commands (not SQL):
RMAN> BACKUP DATABASE PLUS ARCHIVELOG;            -- full backup incl. archived logs
RMAN> BACKUP INCREMENTAL LEVEL 1 DATABASE;        -- incremental (changed blocks only)
RMAN> RESTORE DATABASE;  RMAN> RECOVER DATABASE;  -- restore then roll forward with redo
RMAN> RESTORE DATABASE UNTIL TIME "...";          -- point-in-time recovery
RMAN> VALIDATE DATABASE;                          -- check for corruption
```

> **The restore/recover distinction (from Ch 32).** *Restore* = copy backup files back into place. *Recover* = apply redo (archived + online) to roll the restored files forward to the desired point (the latest, or a past time for PITR). Both steps are needed for media recovery, and PITR is impossible without ARCHIVELOG mode. RMAN is a DBA tool, not a daily data-engineering one, but you must understand the concepts: what protects the source databases you depend on, and what "we can restore to any point in the last 30 days" actually requires.

### 38.3 Flashback technologies

Oracle's **Flashback** suite — built on undo (Ch 32) and, for some features, a dedicated archive — provides fast recovery from *logical* errors (a bad `DELETE`, a wrong `UPDATE`) *without* a full restore. These are distinctively powerful, and several are absent from a basic course:

- **Flashback Query** (Ch 17) — `SELECT ... AS OF TIMESTAMP/SCN`: see data as it was at a past time. **Flashback Version Query** (`VERSIONS BETWEEN`) shows every version of rows over a time range.
- **Flashback Table** — `FLASHBACK TABLE t TO TIMESTAMP ...`: rewind an *entire table* to a past state (using undo), undoing erroneous DML — without restoring from backup.
- **Flashback Drop** — `FLASHBACK TABLE t TO BEFORE DROP`: recover a dropped table from the **recycle bin** (Ch 12). Undoes an accidental `DROP TABLE`.
- **Flashback Database** — `FLASHBACK DATABASE TO ...`: rewind the *whole database* to a past point quickly (using **flashback logs**), far faster than a restore+PITR — the "undo button" for the entire database after a catastrophic logical error (a bad batch job, a failed release). Must be enabled in advance.
- **Flashback Data Archive (FDA / "Total Recall")** — automatically retains *all* historical changes to specified tables for a long, configurable period (years), in a compressed archive, so you can query any table `AS OF` any time far in the past — beyond what undo retention allows. Used for long-term history, auditing, and compliance.

```sql
-- Recover a table from an accidental DELETE without a restore:
FLASHBACK TABLE employees TO TIMESTAMP (SYSTIMESTAMP - INTERVAL '30' MINUTE);
-- Recover an accidentally dropped table:
FLASHBACK TABLE employees TO BEFORE DROP;
-- Query long-term history (if Flashback Data Archive is enabled on the table):
SELECT * FROM employees AS OF TIMESTAMP (SYSTIMESTAMP - INTERVAL '2' YEAR);
```

> **DE NOTE — Flashback is time travel, and a real safety net.** `AS OF TIMESTAMP` and Flashback Data Archive are exactly the **time travel** you know from Delta Lake and Snowflake (Ch 17, your DE Vol 3) — Oracle did it first, on undo. Flashback Table/Database can rescue you from a bad pipeline run in minutes instead of hours of restore. And Flashback Data Archive is essentially a built-in, queryable, slowly-changing-history mechanism — conceptually an SCD-Type-2-like full history maintained automatically by the database. Knowing these exist can turn a "we lost data, restore from last night's backup" disaster into a one-line recovery.

### 38.4 Data Pump (expdp/impdp)

**Oracle Data Pump** (`expdp` export / `impdp` import) is the modern utility for **logical** data movement — exporting object definitions and data to dump files and importing them elsewhere. It replaces the old `exp`/`imp` tools and is far faster (parallel, server-side):

```
-- Export a schema to a dump file (server-side, can be parallel):
expdp hr/pw SCHEMAS=hr DIRECTORY=dpump_dir DUMPFILE=hr.dmp LOGFILE=hr_exp.log

-- Import into another database / schema (remap as needed):
impdp hr/pw DIRECTORY=dpump_dir DUMPFILE=hr.dmp REMAP_SCHEMA=hr:hr_test

-- Export just specific tables, with a filter:
expdp hr/pw TABLES=employees QUERY=employees:'"WHERE department_id=50"' \
   DIRECTORY=dpump_dir DUMPFILE=emp50.dmp
```

Uses: moving a schema/database between systems, refreshing a test environment from production, migrating to a new version or platform, and selective object/table extraction. It can remap schemas, tablespaces, and datafiles during import, and run in parallel for speed.

> **DE NOTE — Data Pump for migration and environment refresh.** Data Pump is a tool you *will* use as a data engineer: to migrate an Oracle schema to a new database, to copy production data (or a subset, via `QUERY`) into a test environment, or as one step in a migration off Oracle. It is logical (portable across platforms/versions, unlike physical backups) but not incremental and not real-time — for ongoing replication you want CDC (GoldenGate/LogMiner, Ch 44). Know Data Pump for bulk, point-in-time movement; know CDC for continuous change capture.

### 38.5 External tables and SQL*Loader

For getting *external file* data into Oracle — directly relevant to ingestion:

- **External tables** — let Oracle read a flat file (CSV, etc.) on the server's filesystem *as if it were a table*, via a `SELECT`, with no prior load step. You define the table's columns and the file format, and query the file directly (often as the source of an `INSERT ... SELECT` into a real table). Excellent for ELT-style loading: land a file, query/transform it with SQL, insert the result.
- **SQL\*Loader** (`sqlldr`) — the classic high-speed bulk loader for flat files into tables, driven by a control file describing the file format and mapping. Supports **direct-path load** (bypassing the buffer cache, writing above the high-water mark) for very fast bulk loading.

```sql
-- External table: read a CSV on the server as a queryable table
CREATE TABLE ext_sales (
   sale_id NUMBER, sale_date DATE, amount NUMBER
)
ORGANIZATION EXTERNAL (
   TYPE ORACLE_LOADER
   DEFAULT DIRECTORY data_dir
   ACCESS PARAMETERS (
      RECORDS DELIMITED BY NEWLINE
      FIELDS TERMINATED BY ','
      ( sale_id, sale_date DATE 'YYYY-MM-DD', amount )
   )
   LOCATION ('sales.csv')
);
-- Now load/transform with plain SQL (ELT):
INSERT INTO sales SELECT * FROM ext_sales WHERE amount > 0;   -- query the file directly
```

> **DE NOTE — external tables are Oracle's "query the file" feature, an ELT building block.** Reading a CSV directly as a table, then transforming with SQL into the target, is exactly the **ELT** pattern (load/expose raw, transform in-database) you use in the lakehouse — and conceptually the same as querying Parquet via an external table in a warehouse, or a Spark `read.csv`. For bulk-loading flat files fast, SQL\*Loader's direct-path mode is the high-throughput option. These are the Oracle-native ingestion tools you would use (or replace with ADF/Spark) when Oracle is a source or target in your pipelines.

---

## Chapter 39 — Security in Depth

Chapter 15 covered the basics — users, privileges, roles. This chapter goes deeper into the security features that matter for protecting real data: authentication options, fine-grained access control (Virtual Private Database), data redaction and masking, encryption (TDE), and auditing. With data-protection regulations (GDPR, India's DPDP Act, etc.) now central to any data role, this is increasingly essential knowledge for a data engineer, not just a DBA.

### 39.1 Authentication options

How Oracle verifies *who* a user is:

- **Password authentication** — the classic username/password, checked against the stored (hashed) password, governed by profiles' password policies (Ch 15).
- **OS authentication** — trust the operating-system user (e.g. `OPS$` users), used in limited, controlled scenarios.
- **Strong/external authentication** — Kerberos, PKI certificates, RADIUS — integrating with enterprise authentication infrastructure.
- **Centralized / directory authentication** — integrate with LDAP/Active Directory (Enterprise User Security, or modern **Centrally Managed Users / IAM integration** in the cloud), so user identities and roles are managed centrally rather than per-database.
- **Privileged authentication** — `SYSDBA`/`SYSOPER` and the password file, for administrative connections that can start/stop the instance.

> **Best practice — centralize identity, enforce strong policy.** For many databases, managing users centrally (LDAP/AD/IAM) beats per-database accounts (one place to provision/deprovision, consistent policy). Enforce strong password policy via profiles (Ch 15), lock/expire unused accounts, and tightly control `SYSDBA` access. The principle of least privilege (Ch 15) governs *authorization*; strong, centralized *authentication* governs identity.

### 39.2 Virtual Private Database (VPD) — fine-grained access control

**VPD** (also called Fine-Grained Access Control / row-level security) transparently restricts *which rows* a user can see or modify, by automatically appending a security predicate to their queries — enforced at the database level, so it cannot be bypassed by any application or tool. You write a **policy function** that returns a `WHERE` predicate, and Oracle silently adds it to every query against the protected table:

```sql
-- A policy function returns a predicate restricting rows to the user's own department
CREATE OR REPLACE FUNCTION emp_dept_policy (schema_name VARCHAR2, table_name VARCHAR2)
   RETURN VARCHAR2 AS
BEGIN
   -- e.g. limit rows to the department stored in the session context for this user
   RETURN 'department_id = SYS_CONTEXT(''app_ctx'',''user_dept'')';
END;
/
-- Attach the policy: now EVERY query on employees is silently filtered by it
BEGIN
   DBMS_RLS.ADD_POLICY(
      object_schema => 'HR', object_name => 'EMPLOYEES',
      policy_name   => 'emp_dept_pol',
      function_schema => 'HR', policy_function => 'EMP_DEPT_POLICY',
      statement_types => 'SELECT,UPDATE,DELETE');
END;
/
-- A user now sees only rows where department_id matches their context — automatically.
```

> **VPD enforces row-level security where it cannot be circumvented.** Because the predicate is added by the *database*, every access path — application, ad-hoc SQL, reporting tool, export — is filtered identically. This is how multi-tenant data isolation, "managers see only their team", and regulatory data-segregation are enforced robustly (rather than trusting every application to filter correctly). **Oracle Label Security** builds on this for classification-based (row-label) access control. Modern Oracle also has simpler declarative row-level and column-level security in some contexts, but VPD remains the powerful, programmable mechanism. **DE NOTE:** this is the same goal as row-level/column-level security in Snowflake/BigQuery/Unity Catalog (your DE Vol 3) — restrict who sees which rows/columns — implemented in Oracle via policy functions.

### 39.3 Data Redaction and masking

Two related features protect **sensitive column values**:

- **Data Redaction** (`DBMS_REDACT`) — redacts column data *at query time*, on the fly, based on policy — showing, e.g., only the last 4 digits of a credit-card number, or `XXX` for a salary, to users without the privilege to see the real value. The underlying stored data is unchanged; redaction happens as results are returned. Ideal for letting support staff or analysts work without exposing full PII.
- **Data Masking / Subsetting** (a separate pack) — *permanently* replaces sensitive data with realistic fake values when creating **non-production** copies (dev/test). So a test database has structurally-valid but fake names, IDs, and card numbers — protecting real PII from exposure in lower environments.

```sql
-- Redact a salary column: non-privileged users see 0 instead of the real value
BEGIN
   DBMS_REDACT.ADD_POLICY(
      object_schema => 'HR', object_name => 'EMPLOYEES', column_name => 'SALARY',
      policy_name => 'redact_salary',
      function_type => DBMS_REDACT.FULL,        -- full redaction (to a fixed value)
      expression => 'SYS_CONTEXT(''USERENV'',''SESSION_USER'') != ''PAYROLL''');
END;
/
```

> **DE NOTE — redaction for live data, masking for non-prod copies.** These map directly to data-protection practice: **redact** PII at query time so people see only what they are entitled to (Data Redaction), and **mask** PII permanently when copying production into dev/test (Data Masking) so real personal data never lands in a lower environment. Both are central to GDPR/DPDP compliance and to the responsible PII handling stressed in your DE Vol 3. As a data engineer you are increasingly expected to ensure sensitive data is redacted/masked appropriately as it flows through systems.

### 39.4 Transparent Data Encryption (TDE)

**TDE** encrypts data **at rest** — in the datafiles, backups, and redo — so that someone who obtains the physical files cannot read the data without the encryption keys. "Transparent" means applications and SQL are unaffected: authorized sessions read decrypted data normally; the encryption/decryption happens automatically below the SQL layer.

- **Column encryption** — encrypt specific sensitive columns.
- **Tablespace encryption** — encrypt entire tablespaces (the common, simpler choice — everything in them is encrypted at rest).
- Keys are managed via a **keystore/wallet** (or Oracle Key Vault / cloud key management), and the master key protects the table/tablespace keys.

```sql
-- Encrypt a column (sketch — requires a configured keystore):
ALTER TABLE customers MODIFY (credit_card ENCRYPT);
-- Or encrypt a whole tablespace at creation (everything stored in it is encrypted at rest).
```

> **TDE protects against physical theft of data.** It addresses the threat of someone stealing datafiles, backups, or disks — they get only ciphertext. It does *not* protect against an authorized user querying data they shouldn't (that is VPD/redaction/privileges). Encryption at rest (TDE), plus encryption in transit (network encryption / TLS), plus access control (privileges/VPD), plus redaction/masking, together form defense in depth — the same layered data-protection model you apply in the cloud (your DE Vol 3: encryption at rest and in transit, access control, masking). Regulations increasingly *require* encryption at rest for personal/financial data, making TDE standard in regulated Oracle environments.

### 39.5 Auditing

**Auditing** records *who did what* — essential for security monitoring, compliance, and forensics:

- **Unified Auditing** (12c+) — the modern, consolidated audit framework. You define **audit policies** (what actions, on what objects, by whom, under what conditions) and enable them; audit records go to a secure, unified audit trail queryable via dictionary views. Replaces the older, fragmented standard/fine-grained/DBA auditing.
- **Fine-Grained Auditing (FGA)** — audit access to specific *data* under specific conditions (e.g. "record any query that reads salaries above 500,000", or any access to a particular sensitive row), with optional handler procedures — auditing at the row/column/predicate level.

```sql
-- Unified Auditing: audit all access to a sensitive table (12c+)
CREATE AUDIT POLICY audit_emp_access
   ACTIONS SELECT, INSERT, UPDATE, DELETE ON hr.employees;
AUDIT POLICY audit_emp_access;
-- Review the audit trail:
SELECT dbusername, action_name, object_name, event_timestamp
FROM   unified_audit_trail WHERE object_name = 'EMPLOYEES'
ORDER  BY event_timestamp DESC;
```

> **DE NOTE — auditing answers "who touched this data, when."** For compliance (GDPR/DPDP, SOX, HIPAA) and security investigations, you must be able to show who accessed or changed sensitive data. Unified Auditing is Oracle's mechanism; the data-engineering parallel is the access logging and lineage you maintain in a data platform (your DE Vol 3). Over-auditing hurts performance and creates noise, so audit *deliberately* — sensitive objects and privileged actions, not everything. Auditing, like the rest of this chapter, is part of treating data protection as a first-class concern, which is increasingly the data engineer's responsibility, not only the DBA's.

---

> **End of Part IV.** You now understand how Oracle works inside and how it is operated: the instance/database architecture and background processes; physical and logical storage; parsing, the library cache, and why bind variables are a scalability feature; redo/undo/checkpoints and the recovery mechanisms; MVCC and concurrency internals; the multitenant CDB/PDB architecture; the cost-based optimizer, statistics, execution plans, and the performance-diagnosis toolset; indexing in depth and when indexes hurt; partitioning and pruning; backup/recovery, Flashback, and the data-movement utilities; and the security features — VPD, redaction, TDE, auditing — that protect real data. Throughout, the bridges to your modern stack: WAL, time travel, partition pruning, ELT, row/column security, and encryption are all ideas you meet again in the lakehouse. **Part V** turns outward — to **modern Oracle and how it relates to the wider data world**: the version-by-version changes since 11g, JSON and duality views, analytics and the cloud, how Oracle maps to the modern data stack, and a closing set of best practices.
