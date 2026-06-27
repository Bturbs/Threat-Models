CBUAE: CBDC Phase 2
Retail Solution Components:
Low-Level Design Document
Omar Awad, Simon Johnson, Owen Stanford, Sotiria Fytraki, Vedesh Dambal, James O’Brien, Hale Aslan | 2025/07/07
V5







1 

Table of contents
TABLE OF CONTENTS	3
TABLE OF FIGURES	27
FIGURES GLOBAL LEGEND	33
TABLE OF TABLES	34
1	WALLET SERVICES	37
1.1	Overview	37
1.1.1	Summary	37
1.1.2	Background	37
1.1.3	Terminology	37
1.2	Wallets architecture	38
1.3	Wallet Service solution design	39
1.3.1	Wallet Service interactions and containers	39
1.3.2	Wallet Service components	40
1.3.2.1	Create component	40
1.3.2.2	Status component	40
1.3.2.3	Tags component	40
1.3.2.4	View component	40
1.3.2.5	Transfer component	40
1.3.2.6	Add component	40
1.3.2.7	Deduct component	41
1.3.2.8	Contract component	41
1.3.2.9	Wallet Manager component	41
1.3.2.10	Transaction Manager component	41
1.3.2.11	Contract Manager component	41
1.4	Wallet Service implementation	41
1.4.1	API	41
1.4.1.1	Digital Currency APIs	41
1.4.1.2	Wallet Management APIs	42
1.4.1.3	Contract Management APIs	42
1.4.1.4	View API	43
1.4.1.5	Shared Wallets APIs	43
1.4.2	Wallet Service data models	43
1.4.2.1	Wallet data model	43
1.4.2.2	Hierarchical wallets data model	45
1.4.2.3	Contract data model	45
1.4.2.4	Transaction data model	46
1.4.2.5	Database tables and ERD	47
1.4.3	Authorization and access control	51
1.4.4	Wallet management workflows	54
1.4.4.1	Create Wallet workflow	54
1.4.4.2	Associate Wallet with User workflow	55
1.4.4.3	Disassociate Wallet from User workflow	56
1.4.4.4	Activate/Suspend Wallet workflow	57
1.4.4.5	Add/Remove Tags workflow	59
1.4.4.6	View API	60
1.4.4.7	Filtering	61
1.4.4.8	Pagination	61
1.4.4.9	Aggregate queries over the hierarchy	62
1.4.4.10	Authorization	62
1.4.5	Add and Deduct workflows	62
1.4.6	Transfer workflow	63
1.4.6.1	Transaction settlement	65
1.4.6.2	Wallet balance updates	65
1.4.6.3	Error handling	66
1.4.7	Programmable wallets	66
1.4.7.1	Writing contracts against wallets	66
1.4.7.2	Managing contracts	67
1.4.7.3	Contract execution	69
1.4.7.4	Example: Transaction and balance limits	71
1.4.8	Shared wallets	71
1.4.8.1	Data model	71
1.4.8.2	Shared Wallet Transfer workflow	73
1.4.8.3	Viewing shared wallets	74
1.5	Non-functional considerations	74
1.5.1	Resiliency	74
1.5.2	Data consistency	75
1.5.3	Disaster recovery	76
1.5.4	Performance and scalability	76
1.5.5	Monitoring and alarms	77
1.6	Deployment infrastructure	78
2	WALLET BACK-OFFICE PORTAL	79
2.1	Overview	79
2.1.1	Summary	79
2.1.2	Thesis	79
2.2	Terminology	79
2.3	Solution design	80
2.3.1	Architecture/context	80
2.3.2	Container diagram	82
2.3.3	Component diagram	83
2.3.3.1	Wallet Back Office UI	83
2.3.3.2	Wallet Back Office CSB	84
2.4	Implementation	84
2.4.1	Create Wallet	84
2.4.2	Activate/Suspend Wallet	86
2.4.3	Add/Remove Properties	87
2.4.4	View	88
2.4.4.1	View All Wallets	88
2.4.4.2	View Wallet and Associated Transactions	88
2.4.4.3	View Transactions	88
2.4.4.4	View Workflow	89
2.4.5	Transfer	90
2.5	Deployment infrastructure	91
2.6	Other considerations	92
2.6.1	Resiliency	92
2.6.2	Data consistency	92
2.6.3	Disaster recovery	92
2.6.4	Performance and scalability	93
2.6.5	Monitoring and alarms	93
2.6.6	Security	93
3	ACQUIRER GATEWAY	94
3.1	Overview	94
3.1.1	Summary	94
3.1.2	Thesis	94
3.1.2.1	Aani Instant Payment platform	94
3.1.2.2	Network International Acquirer Service	95
3.1.3	In scope	95
3.1.4	Out of scope	95
3.2	Solution design	96
3.2.1	Architecture/context	96
3.2.2	Containers	98
3.2.3	Components	99
3.2.4	Implementation	101
3.2.4.1	Retail user lookup using Aani lookup service	101
3.2.4.2	Peer to Merchant Payment (P2M)	104
3.2.4.3	Data model and data storage	110
3.2.5	API description	112
3.2.5.1	Retail User Lookup	113
3.2.5.2	Get Merchant Wallet ID	114
3.2.5.3	Get Transaction Status	114
3.3	Other considerations	115
3.3.1	Monitoring and instrumentation	115
3.3.1.1	Logging	115
3.3.1.2	Metrics	116
3.3.1.3	Tracing	116
3.3.2	Resilience and reliability	117
3.3.3	Disaster recovery	117
3.3.4	Performance and scalability	118
3.3.5	Recovery and reconciliation	119
3.3.5.1	General error handling mechanism	119
3.3.6	Infrastructure	120
3.3.6.1	Topology	120
4	UNIVERSAL MOBILE APPLICATION	122
4.1	Overview	122
4.1.1	Summary	122
4.1.2	Terminology	122
4.1.3	Thesis	123
4.2	Requirements	123
4.2.1	Mobile application features	123
4.2.2	Dependencies	123
4.3	Mobile application solution design	124
4.3.1	Architecture/context	124
4.3.2	Mobile application components	125
4.3.3	Mobile application implementation	127
4.3.3.1	Security	127
4.3.3.2	Wallet management	128
4.3.4	Mobile application deployment	131
4.3.4.1	Deployment workflow overview	131
4.3.4.2	Initial upload vs. app updates	132
4.3.4.3	Internal testing and QA distribution	132
4.3.4.4	Enforcing force and soft updates	132
4.3.4.5	Post-deployment monitoring and next steps	132
4.3.4.6	Technical details	133
4.3.5	Mobile CSB components	136
4.3.6	Mobile CSB implementation	137
4.3.6.1	Mobile CSB API	137
4.3.7	Firebase Cloud Messaging	137
4.3.7.1	Firebase Cloud Messaging specific configurations and implementations	138
4.3.8	Notification Relay Service components	139
4.3.9	Notification Relay Service implementation	140
4.3.9.1	Notification Relay Service API	140
4.3.9.2	Notification Relay Service data model	140
4.3.10	Sequence and interactions	145
4.3.10.1	View Wallet sequence	145
4.3.10.2	View wallet transactions sequence	146
4.3.10.3	Transfer sequence	147
4.3.10.4	Register device for push notification	148
4.3.10.5	Update device token sequence	149
4.4	Topology	149
4.5	Considerations	151
4.5.1	Data usage optimization	151
4.5.2	Battery efficiency	151
4.5.3	Mobile security	152
4.5.3.1	Alignment with OWASP TOP 10 threats for mobile applications	153
4.5.4	Internationalization of messages	155
4.5.5	Availability guarantees	155
4.5.6	Data consistency	155
4.5.7	Disaster recovery guarantees	155
4.5.8	Monitoring and alarms	156
5	CORDA NETWORKS	157
5.1	Networking	157
5.1.1	Terminology	157
5.1.2	Background reading	157
5.1.3	Requirements	157
5.1.3.1	In scope	157
5.1.3.2	Out of scope	157
5.1.4	Solution design	158
5.1.4.1	Proposed solution	158
5.1.4.2	Monitoring	163
5.2	API gateway	164
5.2.1	Expectations	164
5.2.2	Prerequisites	164
5.2.2.1	Terminology	164
5.2.2.2	Dependencies	164
5.2.3	Requirements	165
5.2.3.1	Out of scope	165
5.2.4	Solution design	165
5.2.4.1	Proposed solution - edge deployment using decoupled mode	165
5.2.4.2	Implementation components	166
5.2.4.3	Alternative solution - edge deployment using standalone mode	171
5.2.5	Solution analysis	174
5.2.5.1	Centralized configuration vs service owned configuration	174
5.3	Service mesh	175
5.3.1	Expectations	175
5.3.2	Prerequisites	175
5.3.2.1	Terminology	175
5.3.2.2	Background reading	176
5.3.3	Requirements	176
5.3.3.1	In scope	176
5.3.3.2	Out of scope	176
5.3.4	Solution design	176
5.3.4.1	Proposed solution	176
5.3.5	Solution analysis	183
5.3.5.1	Concerns and observations	183
5.4	High availability, failover, and backup/restore	184
5.4.1	In scope	184
5.4.2	Terminology	184
5.4.3	High availability	184
5.4.3.1	What high availability means	184
5.4.3.2	High availability within a Kubernetes cluster	184
5.4.3.3	Component-specific details	185
5.4.4	Cross-site failover	186
5.4.4.1	What cross-site failover means	186
5.4.4.2	How cross-site failover between Kubernetes clusters is achieved	186
5.4.4.3	Component-specific details	187
5.4.5	Backup and restore	189
5.4.5.1	What backup and restore means	189
5.4.5.2	How backup and restore is achieved	189
5.4.5.3	Component-specific details	189
5.4.6	Open questions	190
5.5	Observability	190
5.5.1	In scope	190
5.5.2	Out of scope	191
5.5.3	Proposed solution	191
5.5.3.1	Accessing observability data	191
5.5.3.2	R3 environments	191
5.5.3.3	Client environments	192
5.5.3.4	Testing in client environments	193
6	CORDA CONTRACTS	195
6.1	Overview	195
6.1.1	Summary	195
6.2	Prerequisites	195
6.2.1	Terminology	195
6.3	Solution design	195
6.3.1	Summary	195
6.3.1.1	Context	196
6.3.1.2	Containers	196
6.3.1.3	Components	198
6.3.2	Detail design	198
6.3.2.1	Contract Service API	198
6.3.2.2	Access controls and security	213
6.3.2.3	Evaluation Engine	214
6.3.3	Monitoring and instrumentation	218
6.3.4	Resilience and disaster recovery	218
6.3.5	Performance and scalability	218
6.3.6	Infrastructure requirements	219
6.3.6.1	Hosting	219
6.3.6.2	Storage	220
6.3.6.3	Downstream service dependencies	220
6.3.6.4	Networking	220
7	CORDA DISTRIBUTED LEDGER TECHNOLOGY	221
7.1	Overview	221
7.1.1	Summary	221
7.2	Prerequisites	221
7.2.1	Terminology	221
7.3	Solution design	223
7.3.1	Overview	223
7.3.2	API	224
7.3.2.1	Mint API	224
7.3.2.2	Transfer API	224
7.3.2.3	Burn API	226
7.3.2.4	Query API	227
7.3.3	Transaction data modeling	227
7.3.3.1	Block structure	228
7.3.3.2	Block command	231
7.3.4	Privacy and cryptography	233
7.3.4.1	Privacy in transit	233
7.3.4.2	Privacy at rest	234
7.3.4.3	Cryptography	234
7.3.5	Finality & consensus	235
7.3.5.1	Consensus model	235
7.3.5.2	Notary implementation	235
7.3.5.3	Finality	236
7.3.6	Contract validation	240
7.3.6.1	Agreeing a block	240
7.3.6.2	Use of Corda contracts	241
7.3.7	Token selection	242
7.3.8	Data storage & management	244
7.3.8.1	Data storage (ledger and notary databases)	244
7.3.8.2	Data storage (token selection)	244
7.3.8.3	Retention policy	244
7.3.9	Monitoring and instrumentation	245
7.3.9.1	Logging	245
7.3.9.2	Metrics	245
7.3.10	Resilience and disaster recovery	246
7.3.10.1	DLT instances	246
7.3.10.2	Token selection instances	246
7.3.11	Performance and scalability	247
7.3.12	Infrastructure requirements	247
7.3.12.1	Topology	247
7.3.12.2	Database	248
7.3.12.3	Messaging	248
7.3.12.4	Corda Contract Service	248
7.3.12.5	Coda Signing Service	248
7.3.12.6	Networking	248
8	CORDA WORKFLOW SDK OVERVIEW	249
8.1	Summary	249
8.2	Prerequisites	249
8.2.1	Terminology	249
8.3	Solution design	250
8.3.1	Overview	250
8.3.2	Workflow API	251
8.3.3	Identity management	256
8.3.4	Workflow execution	258
8.3.4.1	Overview of workflow structure	258
8.3.4.2	Workflow checkpoints	260
8.3.4.3	Workflow lifecycle and execution	261
8.3.4.4	Workflow messaging	266
8.3.4.5	Reliable execution model	268
8.3.4.6	Error handling	269
8.3.5	Networking	270
8.3.5.1	Addressing	270
8.3.5.2	Host resolution	270
8.3.5.3	HTTP endpoints (sync/async)	271
8.3.5.4	Get workflow status endpoint	271
8.3.5.5	Structure of HTTP messages	271
8.3.5.6	Asynchronous HA and reliable messaging model	275
8.3.5.7	Synchronous HA messaging model	275
8.3.5.8	NATS messaging, headers, payloads, topics	276
8.3.5.9	NATS topic naming for isolation and sharding	277
8.3.6	State management	277
8.3.7	Monitoring and instrumentation	278
8.3.7.1	Logging	278
8.3.7.2	Tracing	279
8.3.7.3	Metrics	279
8.3.7.4	Data format and collection	280
8.3.8	Resilience and disaster recovery	280
8.3.9	Performance and scalability	282
8.3.10	Data management	284
8.3.11	Infrastructure requirements	284
9	SOLUTION DELIVERY	286
9.1	Source and binary scanning	287
9.1.1	Overview	287
9.1.1.1	Background reading	287
9.1.1.2	In scope	287
9.1.1.3	Acceptance criteria	287
9.1.2	Solution design	287
9.1.2.1	Current solution	287
9.1.2.2	Proposed solution	289
9.2	Solution promotion	290
9.2.1	Overview	290
9.2.1.1	In scope	290
9.2.2	Solution design	290
9.2.2.1	Environments and activities	290
9.2.2.2	Artifact tracking	290
9.2.2.3	Environment promotion policy	291
9.2.2.4	Artifact storage	291
9.2.2.5	GitOps	292
9.2.2.6	Artifact promotion into the client registry	297
9.2.2.7	Artifact promotion into client environments	297
9.2.3	Solution analysis	297
9.2.3.1	Open questions	297
9.3	Artifact syncing	297
9.3.1	Overview	297
9.3.2	Prerequisites	297
9.3.2.1	Terminology	297
9.3.2.2	In scope	298
9.3.2.3	Out of scope	298
9.3.3	Proposed solution	298
9.3.3.1	Artifact syncing	298
9.3.4	Solution analysis	304
9.3.4.1	Open questions	304
9.4	Solution deployment	304
9.4.1	Prerequisites	304
9.4.1.1	In scope	304
9.4.1.2	Out of scope	304
9.4.2	Solution design	304
9.4.2.1	Solution deployment diagram	304
9.4.2.2	Infrastructure components	305
9.4.2.3	Assumptions	305
9.4.2.4	Solution deployment process	306
9.5	Configuration	309
9.5.1	Overview	309
9.5.1.1	Problem statement	309
9.5.1.2	Expectations	309
9.5.1.3	Terminology	309
9.5.1.4	In scope	310
9.5.1.5	Out of scope	310
9.5.2	Solution design	311
9.5.2.1	Proposed solution	311
9.5.2.2	Alternative solutions	313
10	CRYPTOGRAPHY AND PUBLIC KEY INFRASTRUCTURE	316
10.1	Overview	316
10.2	Architecture/context	317
10.3	Deployment infrastructure	317
10.4	Compliance	318
10.5	Prerequisites	319
10.5.1	Terminology	319
10.5.2	Background reading	320
10.6	Cryptographic key management	320
10.6.1	Overview	320
10.6.1.1	In scope	321
10.6.2	Dependencies	322
10.6.2.1	Out of scope	322
10.6.3	Solution design	322
10.6.3.1	Key versioning	323
10.6.3.2	Architecture/context	323
10.6.4	Implementation components	325
10.6.4.1	Component 1 - HashiCorp Vault Transit secrets engine	325
10.6.4.2	Component 2 - Key Pair Generation Agent	327
10.6.4.3	Component 3 - Terraform modules and deployment	327
10.7	Public key infrastructure	328
10.7.1	Overview	328
10.7.1.1	In scope	329
10.7.2	Dependencies	329
10.7.3	Solution design	329
10.7.3.1	Architecture/context	330
10.8	Certificate authority, certificate trust chain, and validation	332
10.8.1	Overview	332
10.8.2	Chain validation	334
10.8.3	Timestamping	337
10.8.3.1	In scope	338
10.8.4	Dependencies	338
10.8.5	Solution design	338
10.8.5.1	Architecture/context	339
10.8.6	Component 1 - Root and intermediate certificate authority	340
10.8.6.1	Overview design	340
10.8.6.2	Fault tolerance and disaster recovery guarantees	341
10.8.6.3	Security guarantees	341
10.8.7	Component 2 - Terraform modules and deployment	342
10.8.7.1	Overview design	342
10.8.7.2	Features	344
10.8.7.3	Limitations	344
10.8.7.4	Security guarantees	344
10.9	Certificate propagation: platform operator and local certificate store	344
10.9.1	Overview	344
10.9.1.1	In scope	345
10.9.1.2	Out of scope	346
10.9.2	Dependencies	346
10.9.3	Solution design	346
10.9.3.1	Architecture/context	346
10.9.3.2	Sequence and interactions	348
10.9.4	Component 1: Back-end Vault KV store	349
10.9.4.1	Overview design	349
10.9.4.2	Features	350
10.9.4.3	Fault tolerance and disaster recovery guarantees	351
10.9.4.4	Security guarantees	351
10.9.5	Component 2: Front-End Rest Service	352
10.9.5.1	Overview design	352
10.9.5.2	Features	352
10.9.5.3	Fault tolerance and disaster recovery guarantees	352
10.9.5.4	Security guarantees	353
10.10	Certificate and asymmetric key lifecycle	353
10.10.1	Overview	353
10.10.1.1	In scope	353
10.10.2	Dependencies	354
10.10.3	Solution design	354
10.10.3.1	Architecture/context	354
10.10.3.2	Certificate expiry	355
10.10.3.3	Component 1 - Certificate issuance and registration authority agent	356
10.10.4	Component 2 - Terraform modules	360
10.10.4.1	Overview design	360
10.10.4.2	Features	361
10.10.4.3	Fault tolerance and disaster recovery guarantees	361
10.10.4.4	Security guarantees	361
10.11	Cryptography SDK	361
10.11.1	Overview	361
10.11.1.1	In scope	362
10.11.2	Dependencies	362
10.11.3	Solution design	362
10.11.3.1	Architecture/context	362
10.11.3.2	Deployment	363
10.11.3.3	Key versioning	363
10.11.3.4	Validation	364
10.11.4	Component - Key management library	364
10.11.4.1	Overview design	364
10.11.4.2	Features	366
10.11.4.3	Availability guarantees	366
10.11.4.4	Data consistency guarantees	366
10.11.4.5	Security guarantees	366
10.11.4.6	Fault tolerance and disaster recovery guarantees	367
10.12	Authentication with Vault	367
10.12.1	Overview	367
10.12.1.1	In scope	369
10.12.2	Solution design	369
10.12.2.1	Architecture/context	370
10.12.2.2	Sequence and interactions	370
10.12.2.3	Component 1 - Kubernetes authentication for secrets retrieval	371
10.12.2.4	Component 2 - Username/password authentication for signing operations	372
10.13	Resiliency and recovery	373
10.13.1	Overview	373
10.13.2	Service instances and availability	373
10.13.2.1	Read and write operations	374
10.13.3	HashiCorp Vault storage	375
10.13.3.1	Cross-site replication	375
10.13.3.2	Raft References	376
10.13.3.3	Backups	376
10.13.4	Two-tier certificate store architecture	376
10.14	Security information and event management (SIEM), monitoring and alerting	377
10.14.1	Overview	377
10.14.2	Dependencies	377
10.14.3	Vault monitoring	378
10.14.4	Kubernetes health checks	378
10.14.5	Log analytics	378
10.14.5.1	Vault Service	379
10.14.5.2	Central certificate store	379
10.14.5.3	Participant certificate store	379
10.14.5.4	Key generation	380
10.14.5.5	Cryptography SDK	380
11	SECRETS MANAGEMENT	381
11.1	Overview	381
11.2	Architecture/context	382
11.3	Sequence and interactions	383
11.4	Deployment infrastructure	383
11.4.1	Compliance	384
11.5	Prerequisites	384
11.5.1	Terminology	384
11.5.2	Background reading	385
11.6	Secrets management service	385
11.6.1	Overview	385
11.6.1.1	In scope	386
11.6.1.2	Solution design	386
11.6.1.3	Implementation components	387
11.7	Secrets management client	391
11.7.1	Overview	391
11.7.1.1	In scope	392
11.7.2	Dependencies	392
11.7.3	Solution design	392
11.7.3.1	Architecture/context	392
11.7.4	Implementation components	393
11.7.4.1	Component 1 - Vault Agent Injector	393
11.7.4.2	Component 2 - Terraform modules	394
11.8	Resiliency and recovery	394
11.8.1	Overview	394
11.8.2	Service instances and availability	395
11.8.3	Cross-site replication	395
11.8.4	Raft references	395
11.8.5	Backups	396
11.9	Security information and event management (SIEM), monitoring and alerting	396
11.9.1	Overview	396
11.9.2	Dependencies	396
11.9.3	Vault monitoring	396
11.9.4	Kubernetes health checks	397
11.9.5	Log analytics	397
11.9.5.1	Vault service	397
12	IDENTITY AND ACCESS MANAGEMENT (IAM)	399
12.1	Overview	399
12.2	Additional tech choices	399
12.3	Architecture/context	400
12.3.1	Authentication	400
12.3.1.1	Federation	401
12.3.2	Authorization	403
12.3.2.1	Mapping customer-specific attributes to claims	404
12.4	Deployment infrastructure	404
12.5	Compliance	405
12.6	Prerequisites	406
12.6.1	Terminology	406
12.6.2	Background reading	407
12.7	Identity management system fundamentals	408
12.7.1	Overview	408
12.7.1.1	In scope	408
12.7.2	Personally identifiable information (PII)	408
12.7.3	Dependencies	409
12.7.4	Solution design	409
12.7.4.1	Realms	409
12.7.4.2	Architecture/context	409
12.7.4.3	Authentication protocol and configuration	411
12.7.4.4	Configuring a client application	412
12.7.4.5	Scopes and tokens	413
12.7.4.6	Configuring sessions and timeouts	415
12.7.4.7	Login and logout	416
12.7.5	Implementation components	416
12.7.5.1	Component 1 - Master realm	416
12.7.5.2	Component 2 - Identity provider realm	417
12.7.5.3	Component 3 - Terraform modules and deployment	418
12.8	Identity and user federation	418
12.8.1	Overview	418
12.8.1.1	External users	420
12.8.1.2	Internal users	421
12.8.1.3	In scope	421
12.8.2	Dependencies	421
12.8.2.1	Out of scope	422
12.8.3	Solution design	422
12.8.3.1	Architecture/context	422
12.8.3.2	Sequence and interactions	424
12.8.4	Implementation components	426
12.8.4.1	Realm architecture/context	427
12.8.4.2	Component 1 - Identity brokering	427
12.8.4.3	Component 2 - Attribute mapper	428
12.8.4.4	Component 3 - Authentication flow configuration	429
12.8.4.5	Component 4 - User directory synchronization service	429
12.9	Securing the identity provider	432
12.9.1	Overview	432
12.9.1.1	In scope	434
12.9.2	Dependencies	435
12.9.2.1	Out of scope	435
12.9.3	Keycloak data	435
12.9.3.1	Data in transit	435
12.9.3.2	Data at rest	436
12.9.4	Certificate and key management	436
12.9.4.1	Sequence of generation of keys and certificates for JWT signing	436
12.9.4.2	Certificate trust chain augmented token checks	437
12.9.4.3	Key rotation	437
12.9.5	Secrets management	437
12.9.5.1	Secret rotation	439
12.9.6	Network security	439
12.9.7	Application security	440
12.9.7.1	Keycloak application security	440
12.9.7.2	Client-side security	443
12.9.7.3	Vulnerability scanning	443
12.9.8	Hardening	443
12.9.8.1	Admin console access	443
12.9.8.2	Disabling dynamic client registration	444
12.9.8.3	Security patching and upgrades to Keycloak and its dependencies	444
12.9.9	Platform security remit	445
12.9.9.1	Compliance and governance	445
12.9.9.2	User education and awareness	446
12.9.10	Security testing	446
12.10	Identity management performance, scalability & resiliency	447
12.10.1	Overview	447
12.10.1.1	In scope	448
12.10.2	Dependencies	448
12.10.2.1	Out of scope	449
12.10.3	Solution design	449
12.10.4	Scaling identity management and federation	451
12.10.5	Resiliency strategies	451
12.10.6	High availability strategies	451
12.10.7	Upgrades	452
12.10.8	Resource sizing for identity management and federation	452
12.11	Authorization services	453
12.11.1	Overview	453
12.11.1.1	In scope	453
12.11.1.2	Out of scope	454
12.11.2	Dependencies	454
12.11.3	Solution design	454
12.11.3.1	Architecture/context	455
12.11.3.2	Sequence and interactions	456
12.11.4	Component 1 - Policy Decision Service	458
12.11.4.1	Overview design	458
12.11.4.2	Architecture/context	459
12.11.4.3	Policy structure	459
12.11.4.4	Features	461
12.11.4.5	Availability guarantees	461
12.11.4.6	Data consistency guarantees	461
12.11.4.7	Security guarantees	462
12.11.5	Component 2 - Resource Service (using Hasura GraphQL Engine)	462
12.11.5.1	Overview design	462
12.11.5.2	Features	462
12.11.5.3	Availability guarantees	462
12.11.5.4	Data consistency guarantees	462
12.11.5.5	Security guarantees	462
12.11.6	Component 3 - Resource Database	463
12.11.6.1	Overview design	463
12.11.6.2	Database schema	463
12.11.6.3	Features	463
12.11.6.4	Availability guarantees	463
12.11.6.5	Data consistency guarantees	463
12.11.6.6	Fault tolerance and disaster recovery guarantees	464
12.11.6.7	Security guarantees	464
12.11.7	Component 4 - Resource Synchronization Service	464
12.11.7.1	Overview design	464
12.11.8	Architecture/context	465
12.11.8.1	Features	465
12.11.8.2	Availability guarantees	466
12.11.8.3	Data consistency guarantees	466
12.11.8.4	Security guarantees	466
12.12	Security information and event management (SIEM), monitoring and alerting	466
12.12.1	Overview	466
12.12.2	Dependencies	466
12.12.3	Kubernetes health checks	467
12.12.4	Log analytics	467
12.12.5	Keycloak monitoring and logging	467
12.12.6	Hasura monitoring	468
12.12.7	User Sync Service monitoring	468
12.12.8	Compromised JWTs	469
13	NETWORK IDENTITY DETAILED DESIGN	470
13.1	Overview	470
13.1.1	In scope	470
13.2	Prerequisites	470
13.2.1	Terminology	470
13.2.2	Background reading	472
13.2.3	Dependencies	472
13.3	SPIFFE identity format	472
13.3.1	Introductory concepts	472
13.3.2	Identity attestation	474
13.3.3	Hierarchy and trust chain	475
13.3.4	Private key naming	475
13.4	Exchanging application identity via tokens	476
13.4.1	Secure transmission of application identity	477
13.4.1.1	JOSE header	477
13.4.2	Architecture/context	478
13.4.3	Security guarantees	480
13.4.4	Sequence and interactions	481
13.4.5	Token validation responsibilities	481
13.4.6	Crypto Client Library integration	481
13.4.6.1	Overview design	481
13.4.6.2	Features	482
13.4.6.3	Security guarantees	482
13.4.7	Corda Workflow SDK integration	482
13.4.7.1	Overview design	482
13.4.7.2	Security guarantees	482
13.4.8	Example flow utilizing components of network identity	483
14	APPENDICES	485
14.1	Appendix A: Contract execution examples	485
14.2	Appendix B: G42 to on-prem: developer access	486
DISCLAIMER	488
ABOUT R3	489



Table of figures
Figure 1: Figures Global Legend	33
Figure 2: Wallets Service Context Diagram	38
Figure 3: Wallets Service Container Diagram	39
Figure 4: Wallets Service Component Diagram	40
Figure 5: Hierarchical Wallets Data Model	45
Figure 6: Wallets Entity Relationship Diagram	47
Figure 7: Wallets Service Authorization	52
Figure 8: Create Wallet Workflow	54
Figure 9: Associate Wallet with User Workflow	55
Figure 10: Disassociate Wallet from User Workflow	56
Figure 11: Suspend Wallet Workflow	57
Figure 12: Add/Remove Wallet Tags Workflow	59
Figure 13: View Workflow	60
Figure 14: Wallets Service Add and Deduct Workflows	62
Figure 15: Transfer Workflow	64
Figure 16: Applying Contracts	68
Figure 17: Contract Execution	69
Figure 18: Contract Execution Workflow	70
Figure 19: Shared Wallet Data Model	72
Figure 20: Shared Wallet Transfer Workflow	73
Figure 21: Shared Wallets View	74
Figure 22: Wallet Service Infrastructure	78
Figure 23: Wallet Back Office Portal Context Diagram	80
Figure 24: Wallet Back Office Portal Container Diagram	82
Figure 25: Wallet Back Office Portal Component Diagram	83
Figure 26: Create Wallet UI Flow	85
Figure 27: Suspend Wallet UI Flow	86
Figure 28: Add/Remove Wallet Properties Flow	87
Figure 29: View Workflow	89
Figure 30: Transfer Flow	90
Figure 31: Wallet Back Office Portal Infrastructure	91
Figure 32: Acquirer Gateway Context Diagram	97
Figure 33: Acquirer Gateway Container Diagram	99
Figure 34: Acquirer Gateway Component Diagram	100
Figure 35: Acquirer Gateway Lookup Process	103
Figure 36: P2M Payment Process	105
Figure 37: Acquirer Gateway Data Model	110
Figure 38: Acquirer Gateway Infrastructure Topology	120
Figure 39: Architecture Context Diagram	124
Figure 40: Mobile Application Components	126
Figure 41: Login With Foreign IDM	127
Figure 42: Mobile App Deployment Workflow	133
Figure 43: Mobile CSB Components	136
Figure 44: Third-party Push Notification Service	137
Figure 45: Notification Relay Service components	139
Figure 46: Notification Relay Service ERD	144
Figure 47: View Wallet Sequence	145
Figure 48: View Wallet Sequence	146
Figure 49: Transfer Sequence	147
Figure 50: Register Device For Push Notification	148
Figure 51: Update Device Token Sequence	149
Figure 52: Topology Diagram	150
Figure 53: Network Topology Diagram	158
Figure 54: Application Ingress	160
Figure 55: Control Plane Ingress	161
Figure 56: Replication	162
Figure 57: API Gateway - Decoupled	165
Figure 58: API Gateway - Standalone	172
Figure 59: Linkerd’s Architecture	177
Figure 60: System Context	196
Figure 61: Corda Contracts Container Diagram	197
Figure 62: Contracts Service API Component Diagram	198
Figure 63: ERD	212
Figure 64: Contracts Evaluation Component Diagram	214
Figure 65: Corda Contracts Infrastructure Topology	219
Figure 66: Corda 4 DLT Diagram	223
Figure 67: Ledger Database Entity Relationship Diagram	230
Figure 68: Single Participant Finality Diagram	237
Figure 69: Two Participant Finality Diagram	239
Figure 70: Selecting Tokens	243
Figure 71: Creating and Consuming Tokens	243
Figure 72: Corda DLT Infrastructure Topology	247
Figure 73: Corda Workflow SDK Topology	249
Figure 74: Corda Workflow SDK Components	251
Figure 75: API Synchronous Example	254
Figure 76: API Asynchronous Example	255
Figure 77: Corda Workflow SDK Example Network	256
Figure 78: Example Workflow with Control Flow Graph	260
Figure 79: Message Processing Concurrency	263
Figure 80: Checkpoint Update Logic Flowchart	265
Figure 81: Network Service Calls	267
Figure 82: Workflow Messaging Service and Workflow Executor Interactions	268
Figure 83: Corda Workflow SDK - Networking HA and Reliable Async Request Processing	275
Figure 84: Corda Workflow SDK - Networking HA and Reliable Sync Start Flow	276
Figure 85: High Level Trace Example with Spans for Synchronous Flow	279
Figure 86: Scalability - Synchronous Messaging	282
Figure 87: Scalability - Asynchronous Messaging	283
Figure 88: Horizontal Scaling	283
Figure 89: Vulnerability Process	288
Figure 90: Snyk Report Sharing Process	289
Figure 91: Solution PR	293
Figure 92: Running Tests as Part of PR	294
Figure 93: Solution Project Main Branch	295
Figure 94: Stable Deployments	296
Figure 95: Unstable Artifact Syncing	300
Figure 96: Stable Artifact Syncing	302
Figure 97: Client Artifact Syncing	303
Figure 98: Solution Deployment	305
Figure 99: PKI and Crypto Overview	317
Figure 100: PKI and Crypto Deployment	318
Figure 101: System Context	324
Figure 102: Deployment	325
Figure 103: PKI Topology	331
Figure 104: Root CA Hierarchy	333
Figure 105: Certificate Authority Overview	340
Figure 106: Intermediate Certificate Authority	343
Figure 107: Intermediate CA	343
Figure 108: Certificate Management	347
Figure 109: Certificate Propagation Container	348
Figure 110: Certificate Propagation Sequence	349
Figure 111: Certificate Issuance - System Context	355
Figure 112: Certificate Issuance Components	356
Figure 113: Certificate Issuance Components	358
Figure 114: Cryptography SDK High Level Overview	362
Figure 115: SDK Container	364
Figure 116: Vault Authentication Context	370
Figure 117: Vault Authentication Sequence	370
Figure 118: Secrets Management Overview	382
Figure 119: Secrets Management Sequence and Interactions	383
Figure 120: Secrets Deployment	383
Figure 121: Secrets Management Service Context	387
Figure 122: Secrets Management Service Sequence Overview	387
Figure 123: Secrets Management Overview for Client	393
Figure 124: Authentication Overview	400
Figure 125: Authorization Overview	403
Figure 126: IAM Deployment	405
Figure 127: IdM Context Diagram	410
Figure 128: Reach of Tokens	414
Figure 129: Identity Federation Overview	419
Figure 130: Federated IdM Context	423
Figure 131: Foreign IdP Authorization Flow	424
Figure 132: Federation Sequence	425
Figure 133: Identity Brokering	427
Figure 134: User Directory Synchronization Service	430
Figure 135: IdM Data Protection	435
Figure 136: HA Overview	450
Figure 137: Authorization Context	455
Figure 138: Invoke Policy Sequence	457
Figure 139: Add or Modify Policy Sequence	458
Figure 140: Synchronize Resource Sequence	458
Figure 141: Policy Decision Service	459
Figure 142: Policy Structure	460
Figure 143: Pipeline	461
Figure 144: Resource Sync Service	465
Figure 145: Network Identity Context	478
Figure 146: Network Identity Container	479
Figure 147: Network Identity Component	480
Figure 148: Wallet Hierarchy Examples	485
Figures global legend

Figure 1: Figures Global Legend
Table of tables
Table 1: Wallet Data Model	44
Table 2: Wallet Data Model Additional Fields	44
Table 3: Contract Data Model	46
Table 4: Transaction Data Model	46
Table 5: Wallet Table	48
Table 6: Tags Table	48
Table 7: Contract Table	49
Table 8: Transaction Table	50
Table 9: Transaction Tags Table	51
Table 10: Operations and Claims	53
Table 11: Add/Remove Tags Fields	60
Table 12: QR Code Parameters	108
Table 13: External Service Data Model	111
Table 14: Transaction Status Data Model	112
Table 15: REST API Details	113
Table 16: Retail User Lookup Request Fields	113
Table 17: Retail User Lookup Response Fields	113
Table 18: Get Merchant Wallet ID Request Fields	114
Table 19: Get Merchant Wallet ID Response Fields	114
Table 20: Get Transaction Status Request Fields	114
Table 21: Get Transaction Status Response Fields	115
Table 22: Table user_device_token	141
Table 23: Table failed_notifications	143
Table 24: Schema Definition Fields	200
Table 25: Contract Definition Fields	201
Table 26: Definition File Upload Response	205
Table 27: Contract Database Table	208
Table 28: Contract Metadata Table	209
Table 29: Contact Archive Table	210
Table 30: Contract Schema Table	210
Table 31: Contract Audit Log Table	211
Table 32: Contract Evaluation Request Fields	215
Table 33: Contract Evaluation Response Fields	216
Table 34: Contract Evaluation Status Codes	216
Table 35: Contract Evaluation Status Types	217
Table 36: Mint Request Fields	224
Table 37: Transfer Request Fields	225
Table 38: Signature DTO Format	225
Table 39: Key Identify DTO Format	226
Table 40: Burn Request Fields	227
Table 41: DLT Component Groups	228
Table 42: Transfer Command Fields	232
Table 43: Transfer Details Fields	232
Table 44: Mint Command Fields	233
Table 45: Burn Command Fields	233
Table 46: Workflow Step Types	260
Table 47: Message Address Elements	266
Table 48: Flow Errors	269
Table 49: Synchronous Receive Request Header	272
Table 50: Synchronous Receive Response	272
Table 51: Asynchronous Receive Request	273
Table 52: Asynchronous Receive Response	273
Table 53: Header Details	273
Table 54: Body Details	273
Table 55: Workflow Status Endpoint Request	274
Table 56: Workflow Status Endpoint Response	274
Table 57: Header Details	274
Table 58: Body Details	274
Table 59: Claim Mappings	415
Table 60: User Schema	417
Table 61: Attribute Mapper Types	429
Table 62: IdM Requirements	434
Table 63: Security Goals	434
Table 64: Keycloak Secrets	439
Table 65: Non-Functional Requirements and Related Metrics	448
Table 66: JSON-Based Tokens Terminology	471
Table 67: R3 Platform Identity Types	473
Table 68: Contract Execution Example	486



1 Wallet Services
1.1 Overview
1.1.1 Summary
This chapter is a detailed design for the Wallet Service, part of R3’s Digital Currency (DC) suite. This service manages wallets, each holding digital currency, and processes transactions between wallets. Transactions are submitted to a Settlement Layer (for example, Corda DLT) for finalization, ensuring accurate user balances. This chapter details the functionality of the Wallet Service and its interactions with other components, focusing on how the service operates within the ecosystem.
1.1.2 Background
The Settlement Layer functions at the institution level for identities and currency holdings. By introducing a Wallets layer, we can scale to handle large user volumes without impacting the Settlement Layer’s performance. The proposed design separates transaction settlement from user holdings management, allowing for optimization of each layer to its function. The Wallet Service maintains detailed records of users’ digital currency holdings and transactions, while the Settlement Layer aggregates and finalizes retail transactions. This design supports high transaction volumes without burdening the settlement process.
1.1.3 Terminology
* Digital currency (DC): Currency that is managed and exchanged digitally, often online.
* Distributed ledger technology (DLT): A system where digital data is distributed and synchronized across multiple locations.
* Large financial institution (LFI): An entity that manages DC holdings and operates Wallet Services.
* Retail user or End user: Individuals or entities whose DC holdings are managed by a large financial institution.
* Employee user: Individuals responsible for managing a Wallet Service deployment, usually working for a large financial institution.
* CBUAE/Issuer: The entity responsible for creating and destroying DC.
* Transaction: Movement of DC between wallets as handled by the Wallet Service.
* Sender and recipient: The wallets involved in a transaction, with Sender initiating and Recipient receiving the DC.
* Client specific backend (CSB): A backend servicing a particular front-end.
1.2 Wallets architecture

Figure 2: Wallets Service Context Diagram
The Wallets architecture consists of the following:
* Wallet Service: Offers wallet management, transaction processing and contract management functionalities.
* Wallet Portal: Includes the front-end UI for the wallets, the associated API gateway, and the CSB (the backend service to support the front-end).
* Authentication Service: Authenticates users.
* Authorization Service: Authorizes users, provides fine-grained information about user permissions, and is written to when new user data becomes available.
* Signing Service: Signs transactions on the recipient’s end to ensure authenticity at the Settlement Layer.
* Settlement Layer: Finalizes transactions and notifies the Wallet Service upon completion.
* Corda Contracts: Executes Corda contracts to determine transaction completion eligibility.
1.3 Wallet Service solution design
1.3.1 Wallet Service interactions and containers

Figure 3: Wallets Service Container Diagram
The Wallet Service consists of the following containers:
* Wallet Authorization: Authorizes the access to the wallets maintained in the Wallet Service.
* Wallet Core: Stateless service implementing business logic using Corda Workflow SDK.
* Wallets and Transaction DB: Persists wallet, transaction and contract data.
1.3.2 Wallet Service components

Figure 4: Wallets Service Component Diagram
1.3.2.1 Create component
The Create component processes wallet creation requests and persists relevant data.
1.3.2.2 Status component
The Status component manages changes to the status of wallets (active/suspended).
1.3.2.3 Tags component
The Tags component adds/removes tags to/from Wallets.
1.3.2.4 View component
The View component handles retrieval requests for wallet and transaction data, including timeout transaction management.
1.3.2.5 Transfer component
The Transfer component implements the transfer workflow, ensuring DC is transferred and settled properly, both within and across Wallet Services.
1.3.2.6 Add component
The Add component executes the Add workflow, introducing new DC into wallets.
1.3.2.7 Deduct component
The Deduct component executes the Deduct workflow, removing DC from wallets.
1.3.2.8 Contract component
The Contract component handles contracts application and execution.
1.3.2.9 Wallet Manager component
The Wallet Manager component manages wallet domain objects, including hierarchies.
1.3.2.10 Transaction Manager component
The Transaction Manager component oversees transaction domain objects from creation to finalization, ensuring idempotency.
1.3.2.11 Contract Manager component
The Contract Manager component manages metadata for Corda Contracts.
1.4 Wallet Service implementation
1.4.1 API
The Wallet Service provides APIs to do the following operations:
* Create Wallet
* Activate/Suspend Wallet
* Add digital currency
* Deduct digital currency
* Move digital currency
* Add/Remove Contracts
* Add/Remove Tags
* View Wallet and Transaction data
* Associate User with Wallet
* Disassociate User from Wallet
1.4.1.1 Digital Currency APIs
The Wallet Service exposes the following APIs for moving digital currency between wallets:
* Add: Create DC and add it to a wallet.
* Deduct: Remove DC from a wallet and destroy it.
* Transfer: Transfer a specified amount of DC from one wallet to another.
All these APIs are backed by the Corda Workflow SDK. Each is triggered via a POST call to a URL representing the operation to be completed. The URL takes a single parameter, which is the deduplication ID for this operation. This acts as an identifier for the request and is additionally used by the Wallet Service to ensure that a request is executed exactly once; see the section on Data Consistency. Each takes a payload to indicate the wallets involved in the operation, the amount and type of DC to create a new transaction for, and a reference indicating why this transaction was made.
1.4.1.2 Wallet Management APIs
The Wallet Service exposes the following APIs for wallet management:
* Create: Create a new wallet.
* Activate: Activate a suspended wallet.
* Suspend: Suspend an active wallet.
* Associate Wallet with User: Associate a wallet with a user.
* Disassociate Wallet from User API: Disassociate a wallet from a user.
* Add Tags: Add tags to a Wallet.
* Remove Tags: Remove tags from a Wallet.
All management APIs are backed by the Corda Workflow SDK. Each is triggered via a POST call to a URL representing the operation to be completed. The URL takes a single parameter, which is the deduplication ID for this operation. This acts as an identifier for the request and is additionally used by the Wallet Service to ensure that a request is executed exactly once; see the section Data Consistency).
1.4.1.3 Contract Management APIs
The Wallet Service exposes two endpoints for the management of contracts on wallet operations.
* Add Contract: Apply a new contract.
* Remove Contract: Remove a contract.
These APIs are backed by the Corda Workflow SDK. Each is triggered via a POST call to a URL representing the operation to be completed. A deduplication ID is required to ensure that the request is executed exactly once.
Contracts may be applied to digital currency movements (transfer, add and deduct), or to management operations (create, update and activate, suspend). In all cases, the payload contains the contract ID to apply, any contract data, and the operation to which this contract applies. In most cases, contracts are applied to a specific wallet (or group of wallets via the hierarchy). In the latter case, a wallet ID is also required to apply the contract to, as well as an indication of how much of the hierarchy this contract should apply to. See the section Managing Contracts for more details.
1.4.1.4 View API
The Wallet Service exposes a single endpoint for viewing wallet data. This endpoint is triggered via an HTTP GET request. The payload consists of a schema-based query describing which data the client wishes to retrieve. The schema maps to the data models described below for the Wallet Service. See the section View API for further details.
1.4.1.5 Shared Wallets APIs
The Wallet Service exposes the following endpoints for working with shared wallets:
* Transfer: Perform a transfer from the shared wallet.
* View: View a shared wallet.
The endpoint mirrors the endpoint for non-shared wallets. The main differences are around contract execution and routing of responses. See the section Shared Wallets for more details.
1.4.2 Wallet Service data models
This section describes the objects managed by the Wallet Service.
1.4.2.1 Wallet data model
The wallet is the primary object managed by the Wallet Service. It holds a balance representing Digital Currency (DC).
Wallets have the following fields to support the functionality provided by the Wallet Service:
Field
Description
Nullable?
Mutability
Wallet ID
A unique identifier for the wallet
No
Immutable
Balance
The DC value held by this wallet
No
Only through transactions
DC Type
Type of digital currency held by the wallet
No
Immutable
Status
Current status of the wallet; for example, active or suspended
No
Through suspend API
Parent Pointer
Reference to the parent wallet, if any
Yes
Immutable
Tags
A set of strings enabling user-specific context to be attached to a wallet
N/A
Through add/remove tags API
Table 1: Wallet Data Model
The wallet ID provides a network-unique identifier for the wallet, which is set at wallet creation time. The ID consists of a random value unique to the Wallet Service deployment, and the deployment name. The deployment name is used to route requests for a wallet to the correct Wallet Service (for example, for a transfer).
The balance, DC type and status fields support basic wallet operations. The parent pointer is used to create a wallet hierarchy. Tags allow for user-specific context to be attached to a wallet.
Additionally, a wallet may have the following fields associated with it:
Field
Description
Nullable?
Mutability
Wallet Creation Time
Timestamp indicating when this wallet was created
No
Immutable
Last Update Time
Timestamp indicating when this wallet was last updated
No
Set when update happens
Table 2: Wallet Data Model Additional Fields
1.4.2.2 Hierarchical wallets data model

Figure 5: Hierarchical Wallets Data Model
The wallet hierarchy is a tree structure of wallets maintained by the Wallet Service. Each wallet maintains a pointer to the wallet above it in the tree, which is referred to as the parent wallet. Direct descendants of a wallet are referred to as its sub-wallets. For example, in the above diagram, the sub-wallets of wallet ID 1 are IDs 2, 3 and 4. The parent wallet of ID 2 is ID 1.
Any wallets that can be reached directly through parent pointers from a wallet are referred to as ancestor wallets. For example, wallet ID 1 is an ancestor of wallet ID 5, as it can be reached by following the parent pointers to ID 2 and then to ID 1. If a wallet can be reached via parent pointers from another wallet in the hierarchy, that other wallet is a descendant wallet. For example, all wallets in the above diagram are descendant wallets of wallet ID 1.
The hierarchy allows wallets to be organized according to the requirements of the institution hosting the Wallets Service. It also allows for contracts to be applied to groups of wallets, by applying the contract to the common ancestor of the required wallets. See the section Contract execution for more details.
The Wallets Service places no requirements on the structure of the wallet hierarchy. There is no requirement for all wallets to be under a single root: multiple tree structures hosted by the same Wallet Service are acceptable. The hierarchy may be arbitrarily deep (within the scaling limit of the application).
1.4.2.3 Contract data model
Corda contracts metadata is used to support the programmable wallets feature.
Field
Description
Nullable?
Mutability
Wallet ID
The wallet ID to associate the contract with
No
Set through Add or Remove API
Corda Contracts ID
The contract ID
No
Set through Add or Remove API
Corda Contracts metadata
The contract data
Yes
Set through Add or Remove API
Table 3: Contract Data Model
1.4.2.4 Transaction data model
Transactions represent the movement of Digital Currency (DC) within the system. They are recorded in a transaction table to support historical tracking and operational requirements. Each transaction includes:
Field
Description
Transaction ID
A network-unique identifier for this transaction; supports use cases where transactions from all network participants should be aggregated
Transaction Creation Time
Timestamp indicating when the transaction was created
Sender Wallet ID
Wallet ID that the amount is deducted from; for add and deduct flows, either the sender or recipient wallet ID is null, to indicate that the transaction introduced or removed value.
Recipient Wallet ID
Wallet ID that the amount is added to
Amount
Value of this transaction
DC Type
Type of DC used
Reference
String provided by user indicating what the transaction is for
Status
Current status of the transaction
Tags
Context information provided by the user;
Table 4: Transaction Data Model

1.4.2.5 Database tables and ERD

Figure 6: Wallets Entity Relationship Diagram
1.4.2.5.1 Wallet table
Column
Datatype
Description
PK?
FK?
Nullable?
Constraints
wallet_id
VARCHAR
The unique ID of the wallet
Y
N
N
N/A
balance
NUMBER
The balance held by this wallet
N
N
N
N/A
token_type
VARCHAR
The type of currency held by this wallet
N
N
N
N/A
status
VARCHAR
The status of this wallet
N
N
N
N/A
parent
VARCHAR
The ID of the parent wallet, or null if there is no parent
N
Y (1:1)
Y
Self-referential
wallet_type
VARCHAR
The type of this wallet
N
N
N
N/A
Table 5: Wallet Table
1.4.2.5.2 Tags table
Column
Datatype
Description
PK?
FK?
Nullable?
Constraints
id
ID
Unique identifier for a row in the Tags table
Y
N
N
N/A
wallet_id
VARCHAR
ID of the wallet the tag applies to
N
Y (1:N)
N
N/A
tag_name
VARCHAR
Name of the tag
N
N
N
UNIQUE(wallet_id, tag_name)
tag_value
Value of the tag
N
N
N
N
N/A
Table 6: Tags Table
1.4.2.5.3 Contract table
Column
Datatype
Description
PK?
FK?
Nullable?
Constraints
id
ID
Unique identifier for row in the contracts table
Y
N
N
N/A
wallet_id
VARCHAR
ID of the wallet the contract is applied to
N
Y (1:N)
N
N/A
contract_id
VARCHAR
ID of the contract applied to the wallet
N
N
N
UNIQUE(contract_id, wallet_id)
contract_data
JSONB
Parameters and extra data to submit when evaluating the contract
N
N
Y
N/A
Table 7: Contract Table
1.4.2.5.4 Transaction table
Column
Datatype
Description
PK?
FK?
Nullable?
Constraints
tx_id
VARCHAR
Network-unique identifier representing the transaction
Y
N
N
N/A
tx_type
VARCHAR
The type of the transaction
N
N
N
N/A
creation_time
DATETIME
Timestamp indicating when the transaction was created
N
N
N
N/A
sender_wallet_id
VARCHAR
Wallet ID for the sender wallet; null if this is an add transaction
N
Y (1:1)
Y
CHECK (sender_wallet_id <> receiver_wallet_id)
receiver_wallet_id
VARCHAR
Wallet ID for the receiver wallet; null if this is a deduct transaction
N
Y (1:1)
Y
CHECK (sender_wallet_id <> receiver_wallet_id)
amount
NUMBER
Value of the transaction
N
N
N
N/A
status
VARCHAR
Transaction status
N
N
N
N/A
external_reference
VARCHAR
User-inputted reference information
N
N
N
N/A
failure_reason
VARCHAR
Reason why the transaction failed; null if it succeeded
N
N
Y
N/A
last_modified_at
TIMESTAMP
The time at which this transaction was last modified
N
N
N
N/A
Table 8: Transaction Table
1.4.2.5.5 Transaction Tags table
Column
Datatype
Description
PK?
FK?
Nullable?
Constraints
id
ID
Unique identifier for row in the Transaction Tags table
Y
N
N
N/A
tx_id
VARCHAR
The ID of the transaction the tag applies to
N
Y (1:N)
N
N/A
tag_name
VARCHAR
Name of the tag
N
N
N
UNIQUE(tx_id, tag_name)
tag_value
VARCHAR
Value of the tag
N
N
N
N/A
Table 9: Transaction Tags Table
1.4.3 Authorization and access control
Authorization and access control is handled by the Wallet Authorization container within the Wallet Service. All APIs exposed by the Wallet Service first go through this container to establish whether the user has the right access permissions. The user context is provided alongside the request to the Wallet Service. Requests with no user context are rejected. The Wallet Core container assumes all requests are authenticated. The Wallet Authorization container sends authorization requests to the Authorization Service. An authorization request includes the incoming requests. The Authorization Service does not keep hierarchy-related information.
A claim is an attribute on the user context. A claim allows the user to execute a particular wallet operation.
The user context is submitted to the Authorization Service alongside the request. The Authorization Service executes policies against the combination of the user claims (in the user context) and the specific request to determine whether the request is authorized.
A claim may indicate that a user can access, for instance, all wallets. Otherwise, there needs to be a specific entry in the database of the authorization service which indicates that the specific user has permission to execute the specific operation to the specific resource.
The result is returned to the Wallet Service to determine whether the operation can proceed.

Figure 7: Wallets Service Authorization
A user can execute the following operations, and can have the following claims associated with them:
Operation
Claim
Specific Resource
Create Wallet
“CreateWallet”
N/A
Activate Wallet
“ActivateWallet”
N/A
Suspend Wallet
“SuspendWallet”
N/A
Add
“ExecuteAdd”
N/A
Deduct
“ExecuteDeduct”
N/A
Associate User with Wallet
“AssociateUser”
N/A
Disassociate User from Wallet
“DisassociateUser”
N/A
Add Contracts
“AddContract”
N/A
Remove Contracts
“RemoveContract”
N/A
View Any Wallet
“ViewAllWallets”
N/A
Add Tags to Any Wallet
“AddTagsToAllWallets”
N/A
Remove Tags from Any Wallet
“RemoveTagsFromAllWallets”
N/A
Transfer From All Wallets
“TransferFromAllWallets”
N/A
View Wallet
“ViewWallet”
User ID - Wallet ID - Op
Transfer
“Transfer”
User ID - Wallet ID - Op
Add Tags to Wallet
“AddTags”
User ID - Wallet ID - Op
Remove Tags from Wallet
“RemoveTags”
User ID - Wallet ID - Op
Table 10: Operations and Claims
Each operation in this table corresponds to an endpoint on the Wallet Authorization container.
A user can be granted access to a wallet via the Associate User with Wallet API. This links a user ID to a wallet ID in the Authorization Service. The authorization information also includes an operation indicator.
1.4.4 Wallet management workflows
1.4.4.1 Create Wallet workflow

Figure 8: Create Wallet Workflow
The Create Wallet workflow generates a new wallet with a unique identifier. It stores the wallet data in the Wallet Service database and sets up user-wallet associations within the Authorization Service.
The Create Wallet workflow is backed by the Corda Workflow SDK. This requires that a deduplication ID is provided as part of the request, to prevent replays from creating duplicate wallets. The request takes as parameters the DC Type and the parent pointer. The wallet ID is generated by the request.
If the create request fails, no data is persisted in the Wallet Service.
1.4.4.2 Associate Wallet with User workflow

Figure 9: Associate Wallet with User Workflow
The Associate Wallet with User workflow associates a wallet ID with a user ID and a set of permissions in the Authorization service. Associating a wallet with a user in this way is required for end-user access to the wallet; for more details, see Authorization and access control. The Associate Wallet with User workflow first verifies that the request wallet ID is valid. It then makes a call to write the association between the wallet ID and the user ID in the Authorization Service database. Once this has succeeded, the request returns to the caller.
If the request fails, the caller should assume that the association has not been created. This may require a retry on the caller’s side.
1.4.4.3 Disassociate Wallet from User workflow

Figure 10: Disassociate Wallet from User Workflow
The Disassociate Wallet from User workflow removes an association between a wallet ID and a user ID from the Authorization Service. This revokes access to the wallet for the end user; for more details, see Authorization and access control. The Disassociate Wallet from User workflow takes a wallet ID and a user ID as input. It first verifies that the pair is currently associated in the Authorization Service. If so, the workflow then instructs the Authorization Service to remove the association between the wallet ID and the user ID. The request then returns to the caller.
If the request fails, the caller should assume that the association still exists in the Authorization Service. If the requested association never existed, this API returns success to the caller to indicate that the wallet ID and user ID are not associated.
1.4.4.4 Activate/Suspend Wallet workflow

Figure 11: Suspend Wallet Workflow
The Suspend Wallet workflow marks a wallet as suspended. A suspended wallet can be activated again. When a wallet is suspended the data for the wallet are left in the Wallet Service.
To suspend a wallet, the following requirements must be met:
* The wallet must have a balance of zero.
* All descendant wallets of the wallet must be suspended (that is, the wallet is a leaf wallet in the hierarchy).
The Suspended Wallet workflow first verifies that the above requirements are met. It then updates the wallet status in the database to SUSPENDED, and returns to the user.
A suspended wallet may not be involved in any transactions. Any attempt to use a suspended wallet in an add, deduct, or transfer flow results in a failure of that flow.
The Activate Wallet workflow sets the wallet status in the database to ACTIVE. Active wallets can participate in any operation as per usual.
Note that the ability to permanently close a wallet will be provided. Once closed, the wallet will be permanently restricted from initiating or receiving any transactions. Further clarification on the specific requirements for this functionality is pending.
1.4.4.5 Add/Remove Tags workflow

Figure 12: Add/Remove Wallet Tags Workflow
This workflow allows for modifications of wallet data. Authorized users can add tags to wallets or remove tags from wallets.
Field
Description
Tags
A set of strings enabling user-specific context to be attached to a wallet
Table 11: Add/Remove Tags Fields
The workflow is backed by the Corda Workflows SDK. This requires that a deduplication ID is provided along with the request, to ensure duplicate requests are not processed multiple times.
1.4.4.6 View API

Figure 13: View Workflow
Upstream components may wish to query data held by the Wallet Service. To support this, the Wallet Service provides a View API.
The View API is a single HTTP endpoint that uses a schema-based query as the input payload. When making a query, the client specifies only the fields it requires. The Wallet Service translates this into database queries that return the data required. This data is then returned back to the client.
The schema used by the View API is based on the Wallet Service data models. This schema includes the following:
* All fields associated with a wallet as described in the section on the Wallet data model.
* Contracts
* Local contracts for wallet
* Contracts of the associated wallet hierarchy
* List of transactions under a wallet:
* A transaction is considered visible to a wallet if the wallet ID is either the sender or recipient.
* All transaction fields are available as described in the section on the Transaction data model.
* An aggregate of all balances underneath a wallet in the wallet hierarchy.
* Transactions retrieved separately from wallets.
The View API has different semantics than other operations, as it is read-only. This endpoint does not require deduplication of requests. If the request times out or otherwise fails, the client is expected to retry the request. The View API is synchronous.
1.4.4.7 Filtering
Simple filters removing fields from the response are handled by the client not requesting that data. The client may additionally wish to select results based on some criteria, which is performed by providing arguments indicating what values are expected for fields.
1.4.4.8 Pagination
Any list results in a query are paginated. This is implemented using a cursor that is opaque to the client. The client may choose how many results to return in each page. The cursor is then used to ensure the next page of results is selected from where the previous page left off. Both wallets and transactions are sorted by creation time, with newer results returned first.
1.4.4.9 Aggregate queries over the hierarchy
The View API supports an aggregate balance field over all wallets underneath a requested wallet. This request is implemented via a recursive query against the database (for example, using a recursive common table expression). The query identifies the sub-wallets, and then for each sub-wallet identifies their sub-wallets, recursing until no sub-wallets are identified. The balances of the identified wallets are then summed together.
1.4.4.10 Authorization
Authorization of users happens after the query has been parsed, in the business logic beneath the view query. Admin users may be able to view all wallet data, depending on granted permissions. Other users may only view data for wallets owned by that user or for descendant wallets under that wallet.
1.4.5 Add and Deduct workflows
The Wallet Service provides APIs for adding value to a wallet and removing value from a wallet. These processes are referred to as add and deduct respectively.

Figure 14: Wallets Service Add and Deduct Workflows
The Add and Deduct workflows have a similar sequence of operations.
1. The user is authorized for the incoming request.
2. The request is validated and contracts are executed against the request. For the deduct flow, this includes a balance check to ensure the amount removed can be taken out the wallet.
3. The transaction is saved to the database in PENDING state.
* For add transactions, the sender wallet is null, indicating that this transaction introduces value.
* For deduct transactions, the recipient wallet is null, indicating that this transaction removes value.
4. The transaction is submitted to the settlement layer for processing.
5. On completion of settlement, the transaction is moved to the SUCCESSFUL state and the wallet balance is atomically updated.
6. A notification of transaction completion is emitted and execution returns to the caller flow, if there is one.
Both workflows are synchronous, meaning they block until the operation is confirmed or fails.
It is expected that Add and Deduct workflows are executed only by CBUAE, the defined issuer party in the network. This is enforced at the settlement layer.
1.4.6 Transfer workflow
This section describes the Transfer workflow that orchestrate transactions between wallets.

Figure 15: Transfer Workflow
The Transfer workflow moves value between two wallets, which may reside within the same or different Wallet Services. The sequence of steps in this workflow is as follows:
1. The Wallet Service ensures that the sender user is authorized to perform a transfer with this wallet.
2. Contracts are executed for the sender side wallet.
3. If contract execution succeeds, the current wallet balance is checked and a new transaction is written atomically in PENDING state if there is sufficient balance.
4. The transaction is sent to the recipient wallet (which may be hosted by a different Wallet Service instance).
5. Contracts are executed for the recipient wallet.
6. If contract execution succeeds, a new transaction is written in PENDING state for the recipient and the transaction is signed to indicate that the recipient has seen it.
7. The signed transaction is returned to the sender.
8. The sender submits the transaction to the settlement layer for settlement.
9. The settlement layer notifies both the sender and recipient once the transaction has been settled.
10. Both sides update the transaction to COMPLETED and atomically update the balance to reflect the amount transferred.
11. The Wallet Service on both sides sends a broadcast notification indicating that a transfer has completed, for use by upstream components.
12. The Wallet Service returns to the caller.
1.4.6.1 Transaction settlement
The Transfer workflow supports various asset types and resolves transactions through tailored settlement layer mappings. Default settings can be adapted for specific asset types as required.
Settlement of transactions is asynchronous. When this completes, the Wallet Service is notified on both sides of the successful transfer. If it fails, the Wallet Service is notified of this also. This results in the transaction being marked as FAILED.
1.4.6.2 Wallet balance updates
The Wallet Service must ensure that the wallet balance is correct at all times and never falls below zero. To ensure correctness, the Wallet Service only updates the wallet balance once at the point where a transaction is marked as COMPLETED. This means that in error scenarios, the balance will not be modified.
One consequence of this is that when checking to see if the current balance is enough to facilitate a transfer, PENDING transactions must be taken into account. To support this, the Wallet Service uses row locking on the wallet in the database whenever checking or updating the balance. This effectively serializes balance updates and balance checks. Additionally, updates to the transaction table (writing a new transaction or updating a transaction status) are performed atomically with the balance changes. This ensures that new transfers always see all pending transactions, and that balance updates do not affect in-flight balance checks.
1.4.6.3 Error handling
Error handling is structured to manage failures at various stages of transaction processing:
1. Pre-transaction Failures: Errors are returned if the validation fails before a transaction is stored as pending.
2. Post-Logging Failures: Transactions marked as failed if errors occur after storing, with recipient side informed if applicable.
3. Settlement Layer Failures: Transactions are flagged as failed if settlement fails, potentially requiring manual intervention for resolution.
Timeout handling ensures transactions that time out are adequately addressed:
1. Pre-Submission Timeouts: Treated as failures with appropriate error handling.
2. Post-Submission Timeouts: Requires querying the Settlement Layer to establish transaction status. If unresolved, manual resolution may be necessary.
1.4.7 Programmable wallets
The Wallet Service allows business rules to be written and executed automatically when operations are performed with wallets. Different business rules can be applied to different wallets, allowing a degree of flexibility for what transactions are allowed. Rules may also be applied to operations as whole, to control how wallets are managed. This can be used to automatically enforce policies, limit the movement of digital currency, or for other business cases.
1.4.7.1 Writing contracts against wallets
A Corda contract may be written to apply a rule to a digital currency movement (add, deduct or transfer), or to apply a rule to wallet management (creating, updating and deleting wallets). In either case, the contract author references a data object that is provided by the Wallet Service at the point the contract is invoked. For digital currency movements, this data object is the transaction. For wallet management requests, this data object is the proposed end state of the wallet.
The Corda contract author may wish to make the contract configurable, or otherwise require extra data in order to execute the contract. For example, a contract limiting the value of a transaction may have a configurable maximum value. To support this case, the data object provided by the Wallet Service contains a contractData field. When applying the contract, the user is expected to provide suitable values for the contract to use. On executing the contract, the contractData field is populated with the user-provided data by the Wallet Service.
1.4.7.2 Managing contracts
Contracts can be applied using the Add Contract API and removed using the Remove Contract API. Contracts can be applied to specific wallets (for any digital currency movements, or updates), or to operations (typically Create Wallet, Suspend and Activate Wallet). In either case, when adding a contract or removing a contract, the contract ID must be provided, along with the operation to which the contract applies.
When a contract is applied, any data required by the contract outside of the objects the contract acts upon must be supplied. For example, if the contract limits the amount of a transaction, the value of the limit must be supplied when the contract is applied. The Wallet Service supplies this data to the Corda Contracts Engine when executing contracts.
Contracts can be applied to wallets in one of three modes:
* LOCAL: Applies the contract to only the specified wallet.
* SUBWALLETS: Applies the contract to only the descendants of the specified wallet, but not the wallet itself.
* ALL: Applies the contract to the both the specified wallet and its descendants.
The diagram below shows the sequence of events when applying a contract using the Add Contract API.

Figure 16: Applying Contracts
The sequence of events is as follows:
1. The new contract ID and contract data is provided to the Wallet Service and handled by the Contract component.
2. The Contract component instructs the Contract Manager to store the contract ID and data.
3. The Contract Manager retrieves the full contract from the Corda Contracts Service to verify that the contract ID is valid.
4. If validation passes, the Contract Manager stores the contract ID and data in the database, along with the operation and any wallet data (if required), and returns a successful response to the client (via the Contract component).
5. If validation fails, the request is rejected and the client receives an error (via the Contract component).
1.4.7.3 Contract execution

Figure 17: Contract Execution
When contracts are executed, the contracts are sourced from the following places:
* Contracts applied directly to the wallet
* Contracts applied to any ancestor wallets of the wallet
* Contracts applied for an operation (if this is not wallet specific, for example creating a new wallet)
The algorithm for finding and executing contracts works as follows:
1. Contracts directly applied to the wallet with modes LOCAL and ALL are retrieved.
2. If the wallet has a parent wallet, contracts on the parent wallet with modes SUBWALLETS and ALL are retrieved.
3. Step 2 is repeated until there is no parent to go to.
4. All retrieved contracts are executed and the process terminates.
If any contracts fail, then the operation fails and the Wallet Service returns an error with details of all failed contracts.
To execute a contract, the Wallet Service supplies the contract code, contract data, and operation data (for example a wallet or a transaction) to the Corda Contract Engine. The contract code is retrieved from the Corda Contracts Service (and potentially cached for performance). The contract data is retrieved from the Wallet Service database. The operation data is provided as part of the request that triggered this contract execution. For example, a transfer flow builds the transaction object and submits this to the Corda Contract Engine, while a create flow builds the new wallet object and submits this instead. The Corda Contract Engine is responsible for providing the result of the contract execution. This will either be a successful response, or a failure indicating what went wrong.
The Corda Contract Engine is run as a sidecar to the main Wallet Service container. Additionally, contracts may be cached by the Wallet Service. This significantly reduces the latency of this process.
See Appendix A for examples of how this process works.

Figure 18: Contract Execution Workflow
1.4.7.4 Example: Transaction and balance limits
To implement balance and transaction limits, an LFI can set two contracts on wallets. The first examines the transaction amount and determines whether this is less than a configurable amount. The second examines the transaction amount and determines whether the resultant wallet balance will be less than a configurable amount. To support applying these to multiple wallets at once, the contracts can be applied to an ancestor wallet in either SUBWALLETS or ALL modes. To support different wallet types, the contracts can additionally inspect the wallet tags to determine if the limit should apply. By applying the contracts for different tag types, different limits for different wallet types can be supported. This is managed by the LFI hosting the wallets.
1.4.8 Shared wallets
Shared wallets support scenarios where the authorization data is held in one large financial institution (LFI) while the actual digital currency value is held in wallets that reside in a different large financial institution (referred to as a sponsor in this document).
Note that the authorization data that associate a user with a wallet are kept in the Authorization Service. The Wallet Service is accessing the authorization data through the Wallet Authorization container.
The wallet ID indicates where a wallet resides, because the wallet ID consists of two parts: the institution identifier and a unique identifier (UUID). The institution identifier indicates where the wallet resides.
In the case of a shared wallet, both the LFI and the sponsor can apply contracts to the wallets. The data of the contracts that the LFI applies are kept in the LFI Wallet Service, while the data of the contracts that the Sponsor applies are kept in the Sponsor Wallet Service.
Hierarchical wallets can be shared across institutions.
1.4.8.1 Data model
The data model for the shared wallet is shown in the following diagram:

Figure 19: Shared Wallet Data Model
In this model, wallet data always resides on the sponsor side. This is represented by the red triangles. Authorization data resides on the LFI, which is represented by the blue diamonds.
Contracts and the corresponding contract data are split between both sides. These are represented by the circles: blue for the LFI, red for the sponsor. This allows both the LFI and the sponsor to apply contract rules to the shared wallets without the other needing to be aware of them.
For all requests to shared wallets, a network identity token is sent to the sponsor when a request is executed. This is checked by the sponsor to verify that the request came from another trusted party in the network.
1.4.8.2 Shared Wallet Transfer workflow

Figure 20: Shared Wallet Transfer Workflow
The Shared Wallet Transfer workflow handles transactions involving shared wallets by:
* Routing: Redirecting operations from the shared to the relevant actual wallet.
* Verification: The actual wallet processes the transaction as usual, ensuring that all the necessary checks take place.
1.4.8.3 Viewing shared wallets

Figure 21: Shared Wallets View
A shared wallet has an identifier that is the same as a local wallet.
* Transfers routed from LHS auth container to RHS processing container.
* Views redirected to RHS.
1.5 Non-functional considerations
1.5.1 Resiliency
The Wallet Service consists of containerized, stateless processes. This allows for multiple active replicas to be running at once. Individual requests execute without affinity, meaning that they can be rebalanced across processes as required. The Wallet Service can therefore tolerate failure of an individual process by rebalancing requests onto the remaining replicas.
For further resiliency, the Wallet Service can be deployed to a Kubernetes cluster using multiple nodes, and pods can be distributed across these nodes in the deployment. The Wallet Service can then tolerate loss of a physical node, as the remaining nodes host some number of Wallet Service pods that requests can be distributed across.
The Wallet Service database must be deployed in a suitable topology to support resiliency. This requires a number of read replicas hosted across different physical nodes. With this setup, failure of the primary writer instance results in a read replica being promoted, allowing for failover of the database within a cluster. Care must be taken to perform periodic backups regardless, for disaster recovery purposes.
In a multi-cluster setup, the database must be configured with at least asynchronous replication between clusters. If the deployment is running in an active-standby configuration, then this is sufficient. In an active-active setup, further care must be taken to ensure data consistency. Failure of a whole cluster can then be tolerated, as all data is replicated to the backup cluster and this can be immediately used.
The Wallet Service is dependent on a few other services to complete any business flows. The availability of the Wallet Service workflows is therefore dependent on the availability of these services.
1.5.2 Data consistency
Wallet balances must always be accurate. When concurrently processing requests for the same wallet, the balance check must account for in-flight transactions. It is important that updates to the balance cannot happen while a balance check is in progress. To guard against this, row locking is employed in the wallet table to ensure that the balance remains static while a balance update is in progress. Similarly, locking occurs when updating the balance to prevent both concurrent reads and writes to the balance.
The Wallet Service uses at-least-once processing semantics for any input events. This ensures that so long as the underlying infrastructure retains the message, it is guaranteed to be processed. This ensures consistency between services. Deduplication of events is managed by the Corda Workflow SDK.
Further data consistency considerations may need to be taken depending on whether the database is deployed in an active-active or active-standby configuration. In an active-active setup, to be confident that the balance check is correct, all database updates must be fully replicated before any row locks are released. This may have latency implications. This could potentially be mitigated if requests to write to particular wallets were routed to particular database instances. In an active-standby deployment, there is potential for loss of consistency in a disaster scenario if the full active database state is not replicated.
1.5.3 Disaster recovery
Disaster recovery strategies depend on deployment specifics. Wallet Service deployments will have a target recovery time objective (RTO) and recovery point objective (RPO). These describe the length of time the Wallet Service can be unavailable for in a disaster scenario, and the length of time over which data loss is tolerable respectively. The following are considerations when choosing a suitable deployment topology for the Wallet Service:
* Periodic backups of the Wallet Service database must be taken to guard against data corruption faults. RPO will be affected by how frequently these are taken. RTO will be affected by how quickly a backup can be restored.
* The Wallet Service database must be deployed with a number of read replicas. RTO will be affected by how long it takes to fail over to a new writer instance if the primary one fails. RPO may be affected depending on how long a writer fault manifests for, though this is dependent on the database choice.
* Monitoring and alarms must be set on the Wallet Service to identify faults. RTO will be affected by how long these take to trigger and how long it takes to perform any actions in response (particularly for any manual failover processes).
* The cluster topology will affect the DR strategy:
* An active-standby setup, whereby the secondary cluster does not serve traffic, will have a higher RTO than an active-active setup.
* An active-active setup is harder to ensure data consistency, as data must be replicated across both clusters to be certain there is no inconsistency.
Disaster recovery plans will vary depending on the targets for a given deployment. For example, a testing environment may not need the same RTO and RPO targets as a production one.
1.5.4 Performance and scalability
Key performance concerns for the Wallet Service are the following:
* Low latency of transfer requests
* Support for high transfer request throughput
* Scalability to handle periods of increased load while still maintaining low latency
* High throughput of read requests against wallet and transaction data
Transfer latency can be minimized by ensuring calls to external services are made to replicas located physically close to each other. The Corda Contract Engine is a good example of this, as it is deployed as a sidecar to the main Wallet Service container, ensuring minimal network latency when evaluating contracts. The Wallet Service Kubernetes deployment can optionally be configured to prefer submitting requests to services hosted in the same location, to further reduce latency on average. Within the application, latency is minimized by reducing the number of required database operations and attempting to keep lock contention between requests to a minimum.
The Wallet Service is a set of containerized, stateless processes. This allows the Wallet Service to be scaled horizontally to handle increased load on the system. The Wallet Service also uses database connection pooling to ensure these are used efficiently, reducing this as a scaling limit.
Monitoring of the Wallet Service is important to identify bottlenecks in production. Some of these may be mitigated by making changes to the deployment topology of the Wallet Service, or by scaling the number of replicas. The exact formula for when and how to scale is dependent on the context in which the Wallet Service is deployed.
The choice of database deployment can affect Wallet Service performance. Read requests could be routed to read replicas of the database, reducing the load on the write replica and allowing more resource for processing transfers there.
1.5.5 Monitoring and alarms
The Wallet Service utilizes the OpenTelemetry Protocol (OTLP) to export logs, metrics, and traces. Configuration is done through environment variables in the service’s container image. It is expected that the deployment includes an observability stack capable of effective monitoring and alarms, although specific deployment configurations and dashboards are beyond this design’s scope.
1.6 Deployment infrastructure

Figure 22: Wallet Service Infrastructure
When communicating between two Wallet Service instances, requests are routed through the shared private network. All requests come with a network token to indicate that it originated from a trusted party in the network.


2 Wallet Back-Office Portal
2.1 Overview
2.1.1 Summary
This chapter outlines the detailed design for the Wallet Back Office Portal, a UI for operating a Wallets Service deployment. The Wallet Back Office Portal comprises two main elements: the Back Office UI and the Client-Specific Backend (CSB). The Back Office UI is a secure web application accessible to back-office users within a private network, while the CSB facilitates communication between the UI and services within the Digital Currency solution. The portal provides essential wallet management functionalities, visibility over the wallet and transaction data, and facilities for modifying wallets (such as applying contracts and tags).
2.1.2 Thesis
The Wallet Back Office Portal is a management interface designed for back-office users to efficiently oversee and control wallets. It enables financial institutions to administer digital wallets by providing key operations such as creation, suspension/activation, viewing wallet data and transactions, and initiating transfers.
The Back Office Client Specific Backend (CSB) implements the use-case-specific functionality required by the UI. It orchestrates calls to the Wallet Service, enabling the UI to perform wallet operations. The CSB structures responses tailored to the UI. While the Wallet Service provides generic wallet management capabilities, the CSB adapts these into structured workflows aligned with back-office operational needs.
2.2 Terminology
* Client-specific backend (CSB): A design pattern whereby an application acts as a dedicated backend process for a specific UI.
* Digital currency (DC): Currency managed and exchanged digitally, often online.
* Licensed financial institution (LFI): An entity which manages DC holdings and operates Wallet Services.
* Retail user: Individuals or entities whose DC holdings are managed by a financial institution.
* Back-office user: Individual or entity with responsibility for managing a collection of wallets on behalf of retail users.
* Transaction: Movement of CBDC between wallets as handled by the Wallet Service.
* Wallet hierarchy: A tree structure of wallets stored in the Wallet Service.
* Wallet Service: Maintains wallets and negotiates transactions between wallets.
* Authorization Service: Links users to allowed actions and owned resources, including wallets.
* Authentication Service: Identifies users.
* Wallet Back Office API Gateway: Entry point into the back-end deployment which the front-end can access.
* Action button: Round exclamation icon button in the table row.
2.3 Solution design
2.3.1 Architecture/context

Figure 23: Wallet Back Office Portal Context Diagram
The architecture consists of the following:
* Wallet Back Office UI: Displays details of wallets to the user and provides an interface viewing, creating, updating, and suspending/activating wallets, viewing transactions, triggering transfers, viewing dashboards, and setting UI preferences.
* Wallet Back Office API Gateway: Routes incoming traffic to various services within the application, including the Back Office CSB. It handles traffic management, authentication, etc.
* Authentication Service: Authenticates users.
* Authorization Service: Authorizes users to access endpoints and other resources for fine-grained authorization, and stores user-wallet associations.
* Wallet Service: Manages wallet data, exposes APIs for creating, updating, suspending/activating, and viewing wallets, triggering transfers between wallets, and viewing transactions.
* Backend Services: Mediates all interactions between the web client and the Wallet Service through the Wallet Back Office CSB. It also includes the Content Server.
2.3.2 Container diagram

Figure 24: Wallet Back Office Portal Container Diagram
The Wallet Back Office Portal consists of the following containers:
* Wallet Back Office UI: Includes all the interactions with the users.
* Back Office CSB: Mediates all interactions with the web client.
* Content Server: Includes the content that is displayed in the Wallet Back Office UI.
2.3.3 Component diagram

Figure 25: Wallet Back Office Portal Component Diagram
2.3.3.1 Wallet Back Office UI
The Wallet Back Office UI consists of the following components:
* Create: Interacts with the Wallets Service for wallet creation requests.
* View: Interacts with the Wallets Service for retrieval requests for wallet and transaction data.
* Add/Remove Properties: Interacts with the Wallets Service to add/remove wallet properties.
* Activate/Suspend: Interacts with the Wallets Service for wallet Activations/Suspensions.
* Transfer: Interacts with the Wallets Service for transfer requests between wallets.
2.3.3.2 Wallet Back Office CSB
The Wallet Back Office CSB consists of the following components:
* Create: Interacts with the Wallets Service for wallet creation requests.
* View: Interacts with the Wallets Service for retrieval requests for wallet and transaction data.
* Add/Remove Properties: Interacts with the Wallets Service to add/remove wallet properties.
* Activate/Suspend: Interacts with the Wallets Service for wallet Activations/Suspensions.
* Transfer: Interacts with the Wallets Service for transfer requests between wallets.
2.4 Implementation
2.4.1 Create Wallet
Create Wallet takes the following input parameters:
* Parent Wallet ID: Reference to the parent wallet, if any
* Wallet Type: Tag representing the type of the wallet; for example, “LFI”, “Consumer”, “Merchant”, or “Acquirer”
* Contracts: Contracts to be applied to the wallet
* User ID: The user to assign to the wallet

Figure 26: Create Wallet UI Flow
The Create Wallet flow is synchronous end to end.
The following flow is executed from the CSB:
1. The UI calls into the Back Office CSB.
2. The Back Office CSB calls the Wallet Service Create Wallet endpoint.
3. The newly created wallet is returned.
4. The contracts (if any) are added to the wallet in the form of tags.
5. If the user provided UserID:
* The Back Office CSB calls the Wallet Service Update Wallet endpoint.
* The updated wallet is received at the CSB.
6. The complete wallet creation response is returned to the UI.
2.4.2 Activate/Suspend Wallet

Figure 27: Suspend Wallet UI Flow
The Suspend Wallet flow is synchronous end to end.
The following flow is executed from the CSB:
1. The UI calls the Back Office CSB Suspend Wallet endpoint.
2. The Back Office CSB calls the Wallet Service Suspend Wallet endpoint.
3. The resulting request status is returned to the UI for presentation.
The Activate Wallet flow works the same.
2.4.3 Add/Remove Properties

Figure 28: Add/Remove Wallet Properties Flow
The Add/Remove Properties flows are synchronous end to end.
These flows can do one of the following:
* Add contracts: Used to add contracts to a wallet.
* Remove contracts: Used to remove contracts from a wallet.
* Add tags: Used to add tags to a wallet.
* Remove tags: Used to remove tags from a wallet.
* Associate user: Used to associate a user with a wallet.
* Disassociate user: Used to disassociate a user from a wallet.
The following flow is executed from the CSB:
1. The UI calls into the Back Office CSB.
2. The Back Office CSB calls the necessary Wallet Service endpoint.
3. The updated wallet is returned to the UI for presentation.
2.4.4 View
2.4.4.1 View All Wallets
* View Data
* Wallet ID: The ID of the wallet
* Balance: Current balance of the wallet
* Currency: Currency type of the wallet
* User: The user associated with the wallet
* Type: Type of the wallet
* Status: Current status of the wallet
2.4.4.2 View Wallet and Associated Transactions
* View Data
* Wallet Data
* Balance
* Wallet ID
* Status
* Contracts
* Parent Wallet (if any)
* Access Data
* The user associated with the wallet
* Sub Wallets Data
* Display sub-wallets of the wallet
* Transaction Data
* Display transactions associated with the wallet
2.4.4.3 View Transactions
* View Data
* Transaction ID
* Amount
* Currency
* Source Wallet
* Organization of Source Wallet
* Target Wallet
* Organization of Target Wallet
* Status
* Updated Time
2.4.4.4 View Workflow

Figure 29: View Workflow
The View Wallet flow is synchronous end to end.
The following flow is executed from the CSB:
1. The UI calls the Back Office CSB View Transactions endpoint, passing a schema-based query to indicate which data fields it needs.
2. The Back Office CSB calls the Wallet Service View Transactions endpoint, passing a schema-based query to indicate which data fields it needs.
3. The resulting views are returned to the UI for presentation.
2.4.5 Transfer

Figure 30: Transfer Flow
The Transfer flow takes the following inputs:
* Source Wallet ID: The ID of the wallet from which CBDC will be deducted
* Amount to Transfer: The amount to be transferred
* Target Wallet ID: The ID of the wallet where the CBDC will be sent
* Reference: The transfer reference provided by the user
API calls from the Back Office UI to the CSB are synchronous, while API calls from the CSB to the Wallet Service are asynchronous.
The following flow is executed from the CSB:
1. The UI calls the Back Office CSB transfer endpoint.
2. The Back Office CSB calls the Wallet Service transfer endpoint.
3. The resulting transfer response is returned to the UI for presentation.
2.5 Deployment infrastructure

Figure 31: Wallet Back Office Portal Infrastructure
The Wallet Back Office Portal is deployed within the private network of an LFI. Access to the portal is secured using the IAM functionality provided by R3 Digital Currency services. Requests from the browser are routed to the API gateway in the deployment, which in turn routes these requests to the Back Office CSB.
2.6 Other considerations
2.6.1 Resiliency
The Back Office CSB is a containerized, stateless process. This allows for multiple active replicas to be running at once. Individual requests execute without affinity, meaning that they can be rebalanced across processes as required. The Back Office CSB can therefore tolerate failure of an individual process by rebalancing requests onto the remaining replicas.
For further resiliency, the Back Office CSB can be deployed to a Kubernetes cluster using multiple nodes, and pods can be distributed across these nodes in the deployment. The Back Office CSB can then tolerate loss of a physical node, as the remaining nodes host some number of Back Office CSB pods that requests can be distributed across.
The Back Office CSB is dependent on a few other services to complete any business flows. The availability of Back Office CSB workflows is therefore dependent on the availability of these services.
2.6.2 Data consistency
As the Back Office CSB stores no data, there are no data consistency concerns.
2.6.3 Disaster recovery
Disaster recovery strategies depend on deployment specifics. Solution deployments will have a target recovery time objective (RTO) and recovery point objective (RPO). These describe the length of time the solution can be unavailable for in a disaster scenario, and the length of time over which data loss is tolerable respectively. The following are considerations when choosing a suitable deployment topology for the Wallet Service:
* Monitoring and alarms must be set on the Back Office CSB to identify faults. RTO will be affected by how long these take to trigger and how long it takes to perform any actions in response (particularly for any manual failover processes).
* The cluster topology will affect the DR strategy:
* An active-standby setup, whereby the secondary cluster does not serve traffic, will have a higher RTO than an active-active setup.
* An active-active setup is harder to ensure data consistency, as data must be replicated across both clusters to be certain there is no inconsistency.
Disaster recovery plans will vary depending on the targets for a given deployment. For example, a testing environment may not need the same RTO and RPO targets as a production one.
2.6.4 Performance and scalability
Key performance concerns for the Back Office CSB are the following:
* Low latency of transfer requests
* Support for high transfer request throughput
* Scalability to handle periods of increased load while still maintaining low latency
* High throughput of read requests against wallet and transaction data
Transfer latency can be minimized by ensuring calls to external services are made to replicas located physically close to each other.
The Back Office CSB can be scaled horizontally to handle increased load on the system.
Monitoring of the Back Office CSB is important to identify bottlenecks in production. Some of these may be mitigated by making changes to the deployment topology of the Back Office CSB or by scaling the number of replicas.
2.6.5 Monitoring and alarms
The Back Office CSB utilizes the OpenTelemetry Protocol (OTLP) to export logs, metrics, and traces. Configuration is done through environment variables in the service’s container image. It is expected that the deployment includes an observability stack capable of effective monitoring and alarms, although specific deployment configurations and dashboards are beyond this design’s scope.
2.6.6 Security
The Wallet Back Office Portal relies on authentication at the API Gateway. Authorization is performed by downstream services for the requests made by the Back Office CSB.
APIs are exposed via the Wallet Back Office API Gateway within an internal private network. These are not exposed to the public internet.



3 Acquirer Gateway
3.1 Overview
3.1.1 Summary
This document describes the detailed design of the Acquirer Gateway component of the Integration Gateway sub-system of the CBDC Platform. The document also explains the infrastructure topology for the deployment of the Acquirer Gateway component.
Note that the information in this document may be updated based on further discussions with external integration service providers like Aani and Network International (NI).
3.1.2 Thesis
The Acquirer Gateway component of the CBDC Platform is used to integrate with Acquirer Services like NI to enable CBDC payments to merchants using in-store POS systems. The component is also used to integrate with the Aani Instant Payments Platform to perform lookups of retail users for payment. The Aani Lookup Service will be used to perform lookups of retail user wallet IDs based on attributes like phone number, email address, and identification documents like Emirates ID.
More details about the Aani Instant Payments Platform and NI Acquirer Backend Service are provided in the following sections.
3.1.2.1 Aani Instant Payment platform
The Aani Instant Payments platform is operated by Al Etihad Payments, a subsidiary of the Central Bank of the UAE. One of the initiatives of the CBUAE National Payment System Strategy (NPSS) is to provide instant payment services to LFIs and their customers. The Aani platform provides two main services for integration:
* Core Service: A basic service that enables LFIs to send and receive instant payments in real-time.
* Overlay Service: An additional service that enables LFIs to provide value-added services to their customers.
The proposed Aani Lookup Service is a type of overlay service to enable the lookup of users’ wallet IDs or account numbers based on specified attributes (or proxies as referred by Aani) such as their mobile number, email address, or document ID (such as their Emirates ID).
3.1.2.2 Network International Acquirer Service
Network International (NI) is a leading payment solutions provider in the Middle East and Africa, offering a range of services including merchant acquiring, payment processing, and digital banking solutions. As a merchant acquirer, NI enables businesses to accept card payments through various channels, including point-of-sale (POS) terminals, e-commerce platforms, and mobile payment solutions.
The NI Acquirer Backend Service manages interactions with merchant point of sale (POS) systems and is responsible for facilitating electronic payment transactions, ensuring compliance with payment regulations, and handling settlement processes. It also facilitates QR code generation for a seamless payment experience. As a part of the Digital Dirham initiative, it is proposed that NI shall support Retail CBDC payments on their platform by integrating with the Retail CBDC Platform.
3.1.3 In scope
* User lookup: Retail users can retrieve the details of other retail users to perform CBDC transfers using any proxy attributes such as mobile number, email address, or document ID (such as their Emirates ID), leveraging the Aani Lookup Service.
* Merchant wallet ID retrieval: The NI Acquirer Backend Service fetches merchant wallet IDs which are required for POS QR code generation for retail users to scan and make payments.
* QR code generation: The NI Acquirer Backend Service generates dynamic payment QR codes for POS transactions, encapsulating key payment details and the wallet ID of the relevant merchant.
* Transaction status retrieval: The NI Acquirer Backend Service retrieves payment statuses for POS transactions from the Acquirer Gateway, and sends confirmations to the merchant POS.
3.1.4 Out of scope
* Integration with LFIs’ core banking/backend systems
* Enrollment of retail users to the Aani platform
* Onboarding of merchants to the NI Acquirer platform, and wallet creation on the NI Acquirer node
* Settlement of funds between acquirers and merchants
* Reconciliation of transactions between acquirers and merchants
* Support for any other operations that are not listed in In scope above
* Refund processing for canceled or return transactions should be handled by the acquirer.
3.2 Solution design
3.2.1 Architecture/context
The overall Acquirer Gateway architecture and system context is shown in the following diagram:

Figure 32: Acquirer Gateway Context Diagram
The Acquirer Gateway architecture consists of the following key components:
* Digital Dirham Mobile App: This is the mobile-based user interface used by retail users to manage their CBDC wallet and perform other related operations such as top-up, withdrawal, transfer, and view wallet balance.
* Merchant POS: This is the in-store point of sale (POS) system used by the merchants to accept payments from the retail users.
* Acquirer Gateway: This is the gateway component of the CBDC Platform that manages interactions with the NI Acquirer Backend Service and the Aani Lookup Service.
* Wallet Service: This is the CBDC Platform service that manages the wallet for the retail users and merchants.
* NI Acquirer Backend Service (Acquirer Platform): This is the third-party service of the acquirer NI, which manages interactions with the merchant POS and the Acquirer Gateway. It manages QR code generation, transaction status management, and other Acquirer Services.
* Aani Instant Payments Platform: This is the platform that maintains the database of retail users onboarded to the Aani platform, and provides CBDC wallet IDs for users based on search attributes such as phone number and email address.
3.2.2 Containers
The Acquirer Gateway shall be deployed as a container in the solution infrastructure as shown in the following diagram:

Figure 33: Acquirer Gateway Container Diagram
3.2.3 Components
The Acquirer Gateway components view is shown in the following diagram:

Figure 34: Acquirer Gateway Component Diagram
The Acquirer Gateway design consists of the following components:
* Config management: This component manages the configuration of the Acquirer Gateway and connectivity details with other external systems.
* Messaging Service: This component manages the messaging between the Acquirer Gateway and other external systems or other components of the CBDC Platform.
* Data validator: This component validates the incoming data from the external systems or other components of the CBDC Platform.
* Persistence: This component manages the persistence of the data in the Acquirer Gateway.
* Data conversion adapter: This component converts data into acceptable formats as required by external systems or the CBDC Platform.
* P2M Wallet Transfer Workflow: This workflow component accepts P2M wallet transfer requests from retail customers. These requests are forwarded to the Wallet Service to perform the transfers. A transfer completion callback is received, and the result persisted, to be shared with the external NI Acquirer.
* P2M Transfer Result Workflow: This workflow component provides results of a P2M transfer to the Acquirer platform.
* Retail User Lookup workflow: This workflow performs the retail user lookup based on a specified phone number, email address, or Emirates ID.
* Merchant Wallet ID Lookup workflow: This workflow performs the merchant wallet ID lookup based on the specified merchant ID.
* Metrics: This component manages the metrics of the Acquirer Gateway operations.
3.2.4 Implementation
3.2.4.1 Retail user lookup using Aani lookup service
3.2.4.1.1 Overview
The retail user lookup process involves searching for retail users using either their mobile number, email address, or a document ID (such as an Emirates ID). The Retail User Lookup workflow component is a part of the Acquirer Gateway, and is responsible for managing the interactions between the Acquirer Gateway and the Aani platform.
The Aani platform maintains a centralized database of enrolled users which can be queried based on an attribute (or proxy in Aani terminology), and facilitates the lookup of users based on searches using such proxies.
The Retail User Lookup workflow involves interactions with the following key components:
* Lookup service connectivity config: This component manages the configuration of the Aani Lookup/Addressing service connectivity.
* Retail User Lookup workflow: This workflow component accepts requests for retail user lookup, forwards them to the Aani Lookup Service, and later returns the lookup responses.
* Aani Lookup Service: This is the Aani proxy responsible for the retrieving retail users’ wallet IDs, using one of their proxy attributes such as their mobile number, email address, or document ID (such as Emirates ID).
3.2.4.1.2 Proposal to store wallet IDs as additional attribute in Aani database
Aani maintains the centralized database of all the retail user information. Currently, it stores their mobile numbers, email addresses, Document/Emirates IDs, IBAN number, account names, and so on. To lookup wallet IDs using the Aani Lookup Service, wallet IDs must be stored as an additional attribute in the Aani lookup database for each retail user account, in addition to other fields. Hence the following is proposed for the Aani lookup service:
1. The Aani proxy database will store CBDC wallet IDs for retail users and for merchants.
2. Each account record in the proxy database (retail or merchant) can have maximum of five wallet IDs linked to it.
3. Each account record in the proxy database (retail user or merchant) must have at least one IBAN or one wallet ID (they are allowed to have both).
3.2.4.1.3 Detailed sequence and interactions

Figure 35: Acquirer Gateway Lookup Process
The sequence of operations for retail user lookup is as follows:
1. A retail user logged into the Digital Dirham mobile app performs a CBDC payment to another user, looking up that user using either their phone number, email address, or document ID (such as their Emirates ID).
2. The Acquirer Gateway receives the lookup request using the specified criterion (for example, phone number) from the Digital Dirham mobile app.
3. The Acquirer Gateway validates the request, converts it to the format accepted by the Aani Lookup Service, and invokes the Aani Lookup Service.
4. The Aani Lookup Service retrieves the required wallet ID or IDs and other requested attributes of the retail user, based on the provided search criterion, and returns the available wallet IDs (a maximum of five).
5. The Acquirer Gateway sends the retrieved wallet IDs back to the Digital Dirham mobile app, so that the retail user can select the appropriate wallet for payment.
3.2.4.1.4 Design considerations
* The Acquirer Gateway can make a request for multiple attributes (for example, wallet ID, name, profile picture if present) by passing a phone number, email address or Document/Emirates ID as input.
* A proxy record of the user in the Aani database must have at least one IBAN or at least one wallet ID (it can have both).
* Retail users can have a maximum of five wallet IDs linked to their account in the Aani proxy database.
* The Aani Lookup Service shall return all the linked wallet IDs of the retail user irrespective of the LFI involved.
* The Aani Lookup Service shall return the masked name of the retail user as per the masking rules specified by the Aani platform. The retail user will use this to verify that the returned user is the correct one.
* The onboarding of retail users to the Aani proxy database (in the case of new users) and/or update of wallet IDs for existing users shall be handled by the LFI and is not covered in this document.
3.2.4.2 Peer to Merchant Payment (P2M)
3.2.4.2.1 Overview
The P2M (Peer-to-Merchant) Payment process enables digital payments from a customer (payer) to a merchant (payee) via an acquiring service. The NI Acquirer acts as an intermediary that processes and routes payment transactions from the merchant to the respective payment networks (for example, card networks, the Retail CBDC network, or bank transfers), ensuring secure, real-time, and convenient fund transfers. This integration is crucial for e-commerce platforms, retail stores, and service providers.
The P2M process involves interactions with the following key components:
* Acquirer Gateway: Manages the interactions between the Digital Dirham Mobile app and the NI Acquirer.
* NI Acquirer: Manages the interactions with the merchant POS, and is responsible for facilitating electronic transactions, ensuring compliance with payment regulations, and handling settlement processes. Also, it facilitates dynamic QR code generation for making payments to merchants.
* Wallet Service: Manages wallets for the retail users and merchants.
* Digital Dirham mobile app: Provides UI components for users to interact and view features such as select wallet, view wallet, view sub-wallet, perform transfers, scan QR codes, generate QR codes, top-up, withdrawal, and view activity.
* Merchant POS: The point of sale system used by the merchants to accept payments from the retail users.
* API gateway: Routes incoming traffic to various services within the application. It handles traffic management, load balancing, SSL termination, and so on.
* Mobile Client-Specific Backend (CSB): Mediates all interactions between the Digital Dirham mobile app, the Wallet Service, and other microapps in the Retail CBDC solution.
3.2.4.2.2 Detailed sequence and interactions

Figure 36: P2M Payment Process
The P2M process involves the following interactions:
1. QR code generation: The Acquirer POS requests a dynamically generated QR code from the Acquirer Backend.
2. QR code scanning: The retail user uses their Digital Dirham mobile app to scan the QR code displayed on the POS.
3. Payment verification: The retail user’s Digital Dirham mobile app displays the transaction details for verification.
4. Payment confirmation: The retail user confirms the payment request, triggering a CBDC P2M wallet transfer via the Acquirer Gateway.
5. Payment processing: Acquirer Gateway forwards the P2M wallet transfer request to the Wallet Service for processing the transfer request to transfer CBDC from the retail user’s wallet to the merchant wallet.
6. Payment completion and notifications:
* Digital Dirham mobile app: The mobile backend sends a real-time notification confirming the transaction based on confirmation from the Wallet Service.
* Acquirer POS: The Acquirer Service queries the Get Transaction Status API via the Acquirer Gateway. The Acquirer Gateway receives a CBDC Transfer completion result, temporarily stores the transaction status for reference, and sends a response with the transaction status update. The POS updates the merchant with the transaction completion status.
The integration points in the above flow are described below.
3.2.4.2.3 Retrieve Payment Transaction Confirmation Status
The Acquirer Gateway provides an API to query the status of transactions in batch. The NI Acquirer Backend Service can use this API to check the status of a transaction and update the POS accordingly. The Acquirer Gateway receives the CBDC Transfer completion result from the Wallet Service and temporarily stores the transaction status for reference. Based the result of Query Transaction Status requests, it sends responses with transaction status updates to the NI Acquirer Backend Service.
The transaction confirmation flow involves the following steps:
1. Listen to CBDC Transfer completion result: The Acquirer Gateway receives the CBDC Transfer completion result from the Wallet Service.
2. Query transaction status: The Acquirer Transaction Manager (a component of the Acquirer Platform) queries the Acquirer Gateway for the status of a batch of transactions.
3. Update to acquirer: The Acquirer Gateway sends the transaction completion result to the NI Acquirer Backend Service.
4. Notify the merchant POS: The NI Acquirer Backend Service sends the completion status to the merchant POS, which updates the merchant with the transaction completion status.
3.2.4.2.3.1 Design considerations
* Only the final status (success or failure) of the transaction is recorded in the Acquirer Gateway for reference.
* The transaction status is stored in the Acquirer Gateway for a limited period (for example, 24 hours).
* Rate limits are applied to the Query Transaction Status API, to safeguard the Acquirer Gateway in case of exceeding maximum frequency limit.
3.2.4.2.4 Acquirer as node on CBDC Platform and merchant wallets hosting
The acquirer will have a dedicated acquirer node responsible for hosting wallets on behalf of merchants. This design is analogous to an LFI node, where the LFI hosts wallets of retail users. The acquirer holds exclusive responsibility for both merchant onboarding and merchant wallet creation on the acquirer node. The entire process, including merchant registration, validation, and wallet provisioning, is managed and controlled solely by the acquirer.
3.2.4.2.4.1 Merchant wallet accessibility and restrictions
* Each retail user wallet within the acquirer node is strictly managed by the acquirer.
* Direct access by each merchant to their wallet on the acquirer node is strictly restricted. Merchants do not have any direct control or visibility over their wallets within this infrastructure.
* The acquirer acts as the sole authority that can interact with each merchant wallet.
3.2.4.2.4.2 Merchant wallet operations
The acquirer can perform specific financial operations on merchant wallets, including:
* Withdrawal transactions: The acquirer can initiate fund withdrawals from merchant wallets, as part of merchant settlements or authorized disbursements.
3.2.4.2.5 Merchant POS QR code generation
The POS payment QR code generation process is responsible for generating a dynamic QR code for POS transactions. Each QR code contains the relevant merchant wallet ID and transaction details, and can be scanned by the retail user’s Digital Dirham mobile app to initiate the payment.
3.2.4.2.5.1 QR code specification
The QR code generated for the P2M transaction will follow the EVM specifications for QR code generation. Refer to the EMV® QR Code MPM Specification for the QR code generation as it is being used in the Aani platform. EMV® (specification-based) QR codes, supporting multiple payment systems, can be read in approximately one second, without any degradation in performance, and without variance between the size of the QR code payload
The QR code generated for the P2M transaction typically contains the following parameters:
(It is proposed to NI that the merchant CBDC wallet ID is added to the QR code generated by the NI Acquirer Backend Service.)
Parameter
Description
Data Origin
TransactionId
A unique transaction ID generated by the Acquirer Backend
Acquirer
Trxn Channel
The channel through which the transaction is initiated; for example, POS/Ecomm
Acquirer
Trxn Type/class/category
The type/class/category of the transaction; for example, MerchantPay
Acquirer
MerchantId
The unique ID of the merchant
Acquirer
Merchant Category Code
The category of the merchant
Acquirer
Amount
The amount to be paid by the customer
Acquirer
Transaction Currency
The currency of the payment
Acquirer
CRC
Calculated using the algorithm defined in EMV specification
Acquirer
Merchant Wallet ID
The CBDC wallet ID of the merchant
TBD
Table 12: QR Code Parameters
3.2.4.2.5.2 Merchant wallet ID storage and retrieval
The merchant wallet ID is a crucial parameter required for generating QR codes in P2M POS QR scan CBDC payments. The two potential approaches under evaluation are as follows:
* Storing the merchant wallet ID in the Acquirer Service
* Retrieving the merchant wallet ID from the Acquirer Gateway (CBDC Platform)
For more information on these two approaches, see the following sections.
3.2.4.2.5.2.1 Approach 1: Merchant wallet ID stored in the Acquirer Service
In this approach, the Acquirer Backend stores the merchant wallet ID locally and retrieves it when needed for QR code generation. The flow is described below:
1. The acquirer retrieves the merchant wallet ID from the CBDC Platform during merchant onboarding and stores a mapping to the merchant in their own Acquirer Service.
2. When a POS requests a QR code, the Acquirer Service fetches the merchant wallet ID from its own data storage.
3. Using this merchant wallet ID, the QR code is generated and sent back to the POS.
The advantages of this approach are:
* Faster QR code generation as it is a local retrieval of the merchant wallet ID.
* Lower external dependency as there is no dependence on the CBDC Platform for QR code generation.
The disadvantages of this approach are:
* Data synchronization is needed, as any merchant wallet ID changes (although they happen rarely) must be updated in the Acquirer Service.
3.2.4.2.5.2.2 Approach 2: Merchant wallet ID retrieved from the CBDC Platform
In this approach, the CBDC Platform is the single source of truth for all merchant wallet IDs. The acquirer queries the Acquirer Gateway (CBDC Platform) API to fetch the merchant wallet ID when needed. The flow is described below:
1. Merchant wallet ID mappings with the merchant identifier are stored in the Acquirer Gateway (CBDC Platform).
2. When a POS requests a QR code, the Acquirer Service calls the Acquirer Gateway API to retrieve the relevant merchant wallet ID based on the merchant identifier.
3. The corresponding merchant wallet ID is returned by the Acquirer Gateway to the Acquirer Service.
4. The Acquirer Service generates the relevant QR code and returns it to the POS.
The advantages of this approach are:
* No data synchronization is required at the Acquirer Service, as any changes to the merchant wallet ID are managed in the CBDC Platform.
The disadvantages of this approach are:
* High API latency due to the introduction of an additional external API call.
* External dependency as QR code generation depends on the CBDC Platform API.
* API rate limits applied at CBDC Platform as frequent queries may be throttled.
* Increased storage overhead for Acquirer Gateway as the Acquirer Gateway has to maintain additional data mappings.
3.2.4.2.5.2.3 Recommended approach for Merchant Wallet ID storage and retrieval
Storing the Merchant’s CBDC Wallet ID within the acquirer’s existing system (the Acquirer Service) eliminates additional latency during QR code generation. This helps ensure the QR code appears promptly on the POS device, preserving a smooth in-store user experience. Also, updates to a merchant’s CBDC wallet ID are infrequent and typically require coordination between the merchant and the acquirer, since such changes can affect other business operations such as settlement. Hence, it is recommended “Approach 1 - Merchant wallet identifier stored in Acquirer Service” is used.
3.2.4.3 Data model and data storage
This section describes the proposed data model and attributes. These will be further refined based on discussions with the external service providers like Aani and NI.

Figure 37: Acquirer Gateway Data Model
3.2.4.3.1 Aani Lookup Service and NI Acquirer Backend Service connectivity config
This configuration is to securely establish and manage connectivity with Aani Lookup Service & the NI Acquirer Backend Service, ensuring authentication, encryption, and controlled access.
The typical data model consists of the following:
* Service identifier: Unique identifier for the configuration of the external service
* Endpoint: The service endpoint (for example, HTTPS endpoint URL for the external service)
* Authentication details: Any parameters required for authentication of the Acquirer Gateway and external service (for example, API key or token)
Column Name
Data Type
Description
PK
FK
Nullable
Constraints
ServiceId
UUID
Unique ID for the service configuration
Y
N
N
Must be unique across all services
Endpoint
VARCHAR(255)
The endpoint URL of the external service (for example, HTTPS endpoint)
N
N
N
Must be a valid URL
AuthType
VARCHAR(50)
The type of authentication used for the external service
N
N
N
Must be one of the predefined auth types
AuthDetails
VARCHAR(255)
The authentication details required for the external service
N
N
Y
Must be a valid authentication detail
Table 13: External Service Data Model
3.2.4.3.2 Transaction Status
This data model tracks the status of transactions, ensuring efficient tracking and updates to the external NI Acquirer System.
The typical data model consists of the following:
Column Name
Data Type
Description
PK
FK
Nullable
Constraints
AcquirerTxnRefId
UUID
Unique ID for the transaction, generated by the Acquirer Service
Y
N
N
Must be unique across all transactions
WalletTxnRefId
UUID
Unique ID for the transaction in the Wallet Service of the CBDC Platform
N
N
N
Must be unique across all transactions
MerchantWalletId
UUID
The CBDC wallet ID of the merchant
N
N
N
Must be a valid wallet ID
ConsumerWalletId
UUID
The CBDC wallet ID of the retail user
N
N
N
Must be a valid wallet ID
Amount
NUMERIC
The transaction amount
N
N
N
Must be a positive value
TransactionDate
TIMESTAMP
Timestamp of the transaction, sent by the Acquirer Service
N
N
N
Must be in UTC format
UpdatedDate
TIMESTAMP
Timestamp of CBDC Platform wallet transaction completion
N
N
N
Must be in UTC format
Status
VARCHAR(50)
The status of the transaction; for example, PENDING, COMPLETED, or FAILED
N
N
N
Must be one of the predefined statuses
ErrorCode
VARCHAR(50)
The related error code in the case the transaction failed
N
N
Y
Must be a valid error code
Message
VARCHAR(255)
Details of the transaction status
N
N
Y
Must be a descriptive message
Table 14: Transaction Status Data Model
3.2.5 API description
This section describes the REST API specification details:
API Name
API Description
Retail User Lookup
Lookup the wallet ID of the retail user using either their mobile number, email address, or document ID (such as their Emirates ID).
Get Merchant Wallet Id
Get the merchant wallet ID, for QR code generation.
Get Transaction Status
Get the status of a transaction
Table 15: REST API Details
3.2.5.1 Retail User Lookup
The Retail User Lookup API will enable the Digital Dirham Mobile app to look up the wallet ID of the retail user using either their phone number, email address, or document ID (such as their Emirates ID). The Acquirer Gateway uses the Aani platform’s proposed lookup service to perform retail user lookup using their proxy attributes.
The Retail User Lookup request will contain any one of the following fields:
Field
Description
Phone Number
Mobile number of the retail user
Email ID
Email address of the retail user
Document/Emirates ID
Document or Emirates ID of the retail user
Table 16: Retail User Lookup Request Fields
The response will contain the following fields:
Field
Description
List of Wallet IDs
Wallet identifiers of the retail user across LFIs
Masked Name
Masked name of the retail user
Profile Image URL
Profile image URL of the retail user
LFI Name
Name of the LFI for this wallet
Table 17: Retail User Lookup Response Fields
3.2.5.2 Get Merchant Wallet ID
The Get Merchant Wallet ID API will enable the Acquirer Gateway to get the relevant merchant wallet ID to perform QR code generation.
The Get Merchant ID request will contain the following fields:
Field
Description
Merchant ID
Merchant ID of the merchant from the Acquirer Service
Table 18: Get Merchant Wallet ID Request Fields
The response will contain the following fields:
Field
Description
Merchant Wallet ID
CBDC wallet ID of the merchant
Table 19: Get Merchant Wallet ID Response Fields
3.2.5.3 Get Transaction Status
The Get Transaction Status API will enable the Acquirer Gateway to get the status of the specified transaction or transactions. Multiple transaction IDs can be included in the request, and their statuses returned in a single response.
The Get Transaction Status request will contain the following fields:
Field
Description
Transaction ID
Identifier of the transaction from the Acquirer Service
Merchant ID
Identifier of the merchant in the Acquirer Service
Table 20: Get Transaction Status Request Fields
The response will contain the following fields:
Field
Description
Transaction Status
Status of the transaction
Updated Date
Timestamp of the wallet transaction completion
Wallet Transaction ID
The transaction ID in the CBDC Platform’s Wallet Service
Error Code
The related error code, in the event the transaction failed
Message
The description of the transaction status or error
Table 21: Get Transaction Status Response Fields
3.3 Other considerations
3.3.1 Monitoring and instrumentation
Effective logging, metrics generation, and monitoring are essential for maintaining the health and performance of the Acquirer Gateway components.
3.3.1.1 Logging
Logging will be supported at the following levels:
* INFO log level:
* This will be the default logging level.
* INFO messages shall describe the important logical actions that happened during processing.
* In general, INFO messages shall be kept to minimum to avoid large log file sizes.
* WARN log level:
* Any condition in the application that indicates an unexpected event shall be logged as WARN. The application can continue to function in this case.
* WARN messages are displayed in log when log level is set to INFO.
* ERROR log level:
* Any condition in the application that indicates error and prevents the correct functioning of the application shall be logged as ERROR.
* ERROR shall always be logged with context information and a stack trace.
* It will be ensured that the stack trace is printed in the log only once and not repeated as the exception is passed through the call stack.
* DEBUG log level:
* Any information useful in debugging the application flow and error paths shall be logged as DEBUG messages.
* DEBUG messages shall not be printed at INFO log level.
* In production environments, DEBUG messages shall not be printed.
Log messages shall contain well-defined delimiters to allow log parsing tools to work properly. Log messages shall contain context data (such as network identifiers, message IDs, and any other contextual data). However, logs shall not contain (or will have masked) sensitive data like PII, passwords or secrets.
The logs shall be extracted by a collector at each cluster node level (for example, Dynatrace OneAgent) or pushed to an OpenTelemetry compliant collector. This will be sent to the backend monitoring system (for example, Dynatrace) for storing and querying logs.
The log retention period will be as defined by CBUAE IT standards. In general, it is assumed to be one year retention in online system and six years in cold storage (backup storage).
3.3.1.2 Metrics
Each component in the Acquirer Gateway shall generate operational metrics and export via the OpenTelemetry collector to a backend monitoring system. OpenTelemetry is a framework that collects telemetry data from applications, including traces, logs, and metrics. Metrics data collected using OpenTelemetry framework can be integrated with common monitoring backends like Prometheus, Grafana, and Dynatrace.
The Acquirer Gateway components shall expose the health and observability metrics via OpenTelemetry exporter. An OpenTelemetry Protocol (OTLP) metrics exporter can directly export metrics to backend systems like Dynatrace or Splunk used within CBUAE. OpenTelemetry metrics format ensures that any supported monitoring system, like Grafana, can also ingest these metrics.
Typical metrics that will be exposed are:
* Number of requests received
* Number of responses sent
* Number of failures
It should be noted that each participant (such as an acquirer) can only view their own component’s metrics.
3.3.1.3 Tracing
Tracing refers to tracking the execution of transactions or workflows through multiple components in a distributed system. It involves propagating a unique trace identifier across the components and providing visibility into the trace path, latency, and performance bottlenecks.
Acquirer Gateway components are developed using the Corda Workflow SDK as the underlying framework which provides many capabilities like workflow definitions, workflow execution, messaging, signing, and key-value storage. It also supports workflow execution tracing by ensuring that a unique ID that is passed during workflow initiation (Deduplication ID or Transaction ID) is propagated automatically to other workflows that are invoked by the parent workflow. All components in the CBDC Platform use the Corda Workflow SDK and hence provide the capability for tracing of requests across the platform. In the case of any system that does not use this SDK, the tracing capability may be implemented using additional libraries or custom code. The workflows can store the execution states containing the Deduplication ID in a separate database whose entries can then be used to trace the execution of a complete transaction across the different components.
3.3.2 Resilience and reliability
The Acquirer Gateway Services, comprising the Core Business Service and Monitoring and Reporting Service components, are containerized and stateless processes. This allows for multiple active replicas to be running at once. The requests made to these services execute without affinity, meaning that they can be rebalanced across processes. The Acquirer Gateway Services can tolerate failure of an individual process by rebalancing requests onto the remaining replicas.
For further resiliency, the Acquirer Gateway Services are deployed to a Kubernetes cluster with multiple nodes. The components are deployed as pods in the cluster and can be distributed across these nodes in the deployment. The components can tolerate loss of a physical node, as the cluster will instantiate the pods running on the lost node on to the remaining nodes. The requests are automatically distributed to the new pods by the cluster.
The Acquirer Gateway Services use the PostgreSQL database, which will be deployed in a high-availability topology to support resiliency. This requires a number of read replicas hosted across different physical nodes. With this setup, failure of the primary writer instance results in a read replica being promoted, allowing for failover of the database within a cluster. Care must be taken to perform periodic backups regardless, for disaster recovery purposes.
In a multi-cluster setup, the database must be configured with at least asynchronous replication between clusters. If the deployment is running in an active-standby configuration, then this is sufficient. In an active-active setup, further care must be taken to ensure data consistency. Failure of a whole cluster can then be tolerated, as all data is replicated to the backup cluster and this can be immediately used.
3.3.3 Disaster recovery
Disaster recovery strategies depend on deployment specifics. Acquirer Gateway Service deployments will have a target recovery time objective (RTO) and recovery point objective (RPO). These describe, respectively, the length of time that the Acquirer Gateway Service can be unavailable in a disaster scenario, and the length of time over which data loss is tolerable. The following are considerations when choosing a suitable deployment topology for the Acquirer Gateway Service:
* Periodic backups of the Acquirer Gateway Service database must be taken to guard against data corruption faults.
* RPO will be affected by how frequently backups are taken.
* RTO will be affected by how quickly a backup can be restored.
* The Acquirer Gateway Service database must be deployed with a number of read replicas. RTO will be affected by how long it takes to fail over to a new writer instance if the primary one fails. RPO may be affected depending on how long a writer fault manifests for, though this is dependent on the database choice.
* Monitoring and alarms must be set on the Acquirer Gateway Service to identify faults. RTO will be affected by how long alarms take to trigger and how long it takes to perform any actions in response (particularly for any manual failover processes).
* The cluster topology will affect the DR strategy:
* An active-standby setup, whereby the secondary cluster does not serve traffic, will have a higher RTO than an active-active setup.
* An active-active setup is harder to ensure data consistency, as data must be replicated across both clusters to be certain there is no inconsistency.
* Disaster recovery plans will vary depending on the targets for a given deployment. For example, a testing environment may not need the same RTO and RPO targets as a production one.
3.3.4 Performance and scalability
Key performance concerns for the Acquirer Gateway Service are the following:
* Low latency of requests
* Support for high request throughput
* Scalability to handle periods of increased load while still maintaining low latency
* High throughput of read requests against reporting and transaction data
* Latency can be minimized by ensuring calls to external services are made to replicas located physically close to each other
The Acquirer Gateway Service is a set of containerized, stateless processes. This allows the Acquirer Gateway Service to be scaled horizontally to handle increased load on the system. The Acquirer Gateway Service also uses database connection pooling to ensure these are used efficiently, reducing this as a scaling limit.
3.3.5 Recovery and reconciliation
3.3.5.1 General error handling mechanism
* Retry mechanism: For transient errors, The Corda Workflow SDK handles retries.
* Timeouts: The Corda Workflow SDK enables the configuration of custom timeouts to prevent workflows from running indefinitely.
* Incident management: Severe errors are logged as incidents in the monitoring system.
* Compensation steps: In case of errors, compensation steps are executed to revert the changes made by the workflow; for example, reserve reversal if an issuance or redemption request fails.
* Event publishing: Events are published for manual recovery/compensation steps in case of failures late in the flow.
* Error responses: Error responses are sent back to the client with a detailed error message.
* Error codes: Errors are classified into different categories and assigned error codes for easy identification.
* Error handling: Errors are handled at each step of the workflow to ensure that the workflow continues to execute without interruption.
* Error reporting: Errors are reported to the monitoring system for tracking and analysis.
* Error resolution: Errors are resolved by the operations team based on the severity and impact of the error.
The following significant app failure cases are foreseen:
* Data validation error: The Acquirer Gateway performs various checks on incoming requests to ensure they are complete and valid before processing. Data validation errors are handled by the Acquirer Gateway by sending an error response back to the client with a detailed error message.
* Service unavailability: The Acquirer Gateway is designed to be highly available and resilient to service failures. In case of service unavailability, the Acquirer Gateway will retry the request to the service. If the service is still unavailable after a certain number of retries, the Acquirer Gateway will send an error response back to the client.
3.3.6 Infrastructure
The Acquirer Gateway is designed as microapps in conformance with the architecture principles of the CBDC Platform. They leverage reliable messaging, scalability, and monitoring to support the reliable execution of transactions.
3.3.6.1 Topology
The Acquirer Gateway infrastructure is provisioned through Terraform for consistency and scalability. This infrastructure includes a Kubernetes cluster deployment within a multi-zone architecture, enhancing resilience and supporting horizontal scaling. The components are replicated across multiple cluster nodes. A Kubernetes service will expose internal endpoints. The infrastructure supports high availability across multiple data centers. The application components are deployed in an active-hot-standby mode where the standby site has the application components deployed and ready to serve requests. The databases between the two sites are replicated (synchronous replication is the target state) so that in case of any site failure, the other site can serve the requests with low RTO and RPO values.

Figure 38: Acquirer Gateway Infrastructure Topology
The nodes will be physically separate hardware to ensure that a failure in one node does not affect multiple replicas. The deployment manifests of the components will be configured to have multiple replicas, with a policy in place to distribute these replicas across the nodes. This approach will provide high availability in the following scenarios:
* A single instance of an application becomes unresponsive
* Rescheduling of a failed replica
* Load balancing of requests across replicas
* Primary database fails
* Kubernetes node fails
* Network failure affecting a single node
* Rolling updates
* Canary or A/B testing

4 Universal Mobile Application
4.1 Overview
4.1.1 Summary
This document outlines the detailed design for the Digital Currency mobile application as well as the interaction it has with the Client Specific Backend and other back-end services, part of R3’s Digital Currency (DC) suite. It also covers the push notification capabilities of the solution.
4.1.2 Terminology
* UI: User interface
* API: Application programming interface
* SDK: Software development kit
* P2P: Peer-to-peer transfer
* P2M: Peer-to-merchant transfer
* IDM: Identity Manager; a function of authentication, a solution for providing identity to a platform or software system.
* OIDC: OpenID Connect; an open standards protocol for authentication.
* JWT: JSON Web Token; a type of token which uses JSON for the payload. The JSON payload will contain a set of claims (key/value pairs) which describe the identity of the requester.
* Digital currency (DC): Currency that is managed and exchanged digitally, often online.
* Licensed financial institution (LFI): An entity that manages DC holdings and operates Wallet Services.
* Retail user or End user: Individuals or entities whose DC holdings are managed by a financial institution.
* Transaction: Movement of DC between wallets as handled by the Wallet Service.
* Sender and recipient: The wallets involved in a transaction, with Sender initiating and Recipient receiving the DC.
* Client-specific backend (CSB): A backend servicing a particular front-end.
* Lookup service: A lookup service provides the functionality to query the wallet ID of a retail user according to specified search criteria.
* FCM: Firebase Cloud Messaging is a third-party push notification service which provides the ability to send push notifications to both Android and iOS devices.
4.1.3 Thesis
* Mobile application: The mobile application offers a unified digital wallet solution that seamlessly integrates with different licensed financial institutions, enabling users to efficiently manage their digital wallets.
* Mobile CSB: The client-specific backend acts as a bridge between the mobile application and other backend services running on a retail CBDC solution of an LFI.
* Notification Relay Service: Listens for notification events produced by the Wallet Service and sends push notifications to mobile devices.
* Integration Gateway Sub-system: The Integration Gateway Sub-system enables backend services on retail CBDC solution to interact with LFI APIs, Acquirer services and lookup service.
4.2 Requirements
4.2.1 Mobile application features
* Wallet management
* Language selection
* QR code generation
* QR code scanning
* Push notifications
* Multi-language support
4.2.2 Dependencies
* Wallet Service for transfers, transactions, and other wallet features
* IAM solution for authentication
* Firebase Cloud Messaging for push notifications
* Integration Gateway Sub-system for lookup, top-up, withdrawal, P2M transfer and LFI API integrations
4.3 Mobile application solution design
4.3.1 Architecture/context
The following architecture diagram shows how a retail user interacts with an LFI’s retail CBDC solution through the mobile application.

Figure 39: Architecture Context Diagram
This detailed design focuses on the mobile application, the Mobile CSB and the Push Notification service. Each of these is implemented in a different container.
* Retail user: A retail user of an LFI.
* Mobile application: Provides UI components for users to access features such as select wallet, view wallet, view sub-wallet, perform transfers, scan QR codes, generate QR codes, top-up, withdrawal, and view transaction activity.
* API gateway: Routes incoming traffic to various services within the Retail CBDC Solution. It handles traffic management, load balancing, SSL termination, and so on.
* Mobile CSB: Client-specific backend that mediates all interactions between the mobile application, the Wallet Service, and other back-end services in the Retail CBDC Solution.
* Notification Relay Service: Listens for events produced by the Wallet Service and integrates with FCM to send push notifications to users’ mobile devices.
* Authentication service: Authenticates users and provides authentication tokens.
* Authorization service: Authorizes users to access endpoints and other resources.
* Wallet Service: The Wallet Service is responsible for wallet management, transaction processing, and contract management functionalities.
* Integration Gateway Sub-system: The Integration Gateway Sub-system exposes APIs on each Retail CBDC Solution to enable specific functionalities like lookup, top-up, withdrawal, P2M transfer, and LFI API integrations.
4.3.2 Mobile application components

Figure 40: Mobile Application Components
The mobile application allows users to manage their wallets through a native mobile application. It displays wallet balances, child wallets, transactions and other key details related to the wallet.
* Login: Enables a retail user to log in to the mobile application by sending an authentication request to an OIDC-compliant IDM.
* View Wallet: Enables a retail user to view their wallets by interacting with the Mobile CSB.
* View Wallet Activity: Enables a retail user to view their transactions by interacting with the Mobile CSB.
* Transfer: Designed to facilitate both P2P and P2M transactions, enabling users to transfer funds directly to other individuals or merchants.
* Top Up: Enables top-up of digital currency to a retail user’s wallet from their LFI bank account. A retail user initiates a Digital Dirham top-up via the mobile app, which is processed only after a successful fiat movement by the LFI.
Upon confirmation from the LFI, the user receives a notification on the mobile app confirming the top-up.
* Withdrawal: Enables banked retail users to withdraw digital currency from their wallet by interacting with the Mobile CSB. A retail user initiates a Digital Dirham withdrawal via the mobile app, first triggering the Digital Dirham transfer. The LFI then processes the corresponding fiat transfer as a part of the withdrawal request.
* QR Code: Enables generation and scanning of QR codes on the mobile application.
* Device Registry: Registers the mobile device to FCM to receive push notifications.
* Profile Management: Enables management of a retail user’s profile settings on the mobile application.
* Lookup: Enables searching for the wallet ID of a retail user according to specified search criteria on the mobile application by interacting with the Mobile CSB.
* Notification: Enables receiving and handling of push notifications that are sent to the mobile application from FCM.
4.3.3 Mobile application implementation
4.3.3.1 Security
4.3.3.1.1 Authentication
The mobile application allows retail users to authenticate via an OIDC-compliant IDM.
4.3.3.1.1.1 Login
Retail users can log into the mobile application by using their credentials managed by an OIDC-compliant IDM.
The details of authentication are subject of the Authentication Service design.
The IDM can be LFI-federated or consumer-federated, and the mobile application supports authentication with both.
The following sequence diagram shows the user authentication flow using IDM:

Figure 41: Login With Foreign IDM
1. User opens the mobile application and selects an LFI.
2. The mobile application sends an authentication request to the identity broker.
3. The identity broker redirects the user to the selected LFI’s IDM.
4. User enters credentials in the LFI’s IDM.
5. LFI’s IDM returns a token to the identity broker.
6. The identity broker returns an authentication response which contains an identity token and an access token.
7. The mobile application includes the access token in all its requests to the back-end APIs after successful authentication.
8. Back-end services use this access token to authorize the user before allowing them to perform a specific operation.
4.3.3.1.1.2 Security considerations
* All communications with IDM must be encrypted using HTTPS.
* Secure storage mechanisms must be in place for storing authentication tokens on the device.
* Regular security audits must be performed to identify and mitigate vulnerabilities.
* The mobile application refreshes the authentication token if it expires while the mobile application is in the foreground.
4.3.3.1.2 Authorization
Authorization determines user access levels and permissions after successful authentication. Authorization is not handled by the mobile application or the Mobile CSB, but is handled by back-end services. Each back-end service is responsible for the authorization check via the Authorization Service for each operation a user wants to perform.
4.3.3.2 Wallet management
4.3.3.2.1 View wallet details and activities
The mobile application enables retail users to:
* View any wallets that are associated with their user ID
* View their child wallets
* View their latest transactions including credits and debits
The mobile application uses a caching mechanism to store frequently accessed data, to reduce database load and improve response time.
4.3.3.2.2 Transfer
4.3.3.2.2.1 P2P Transfer
The mobile application enables a retail user to start a transfer from their wallet to another retail user’s wallet.
4.3.3.2.2.2 P2M Transfer
The mobile application enables a retail user to start a transfer from their wallet to a merchant’s wallet by scanning QR codes from a POS terminal.
4.3.3.2.3 Notifications
The mobile application supports receiving push notifications from FCM by using Firebase SDK. A push notification pops up on the screen when the mobile application is running in the foreground, background, and even the mobile application is not running. Once the mobile application receives a push notification, it checks the user’s language settings and shows the push notification in the user’s language.
4.3.3.2.4 Device registry
As a prerequisite for receiving push notifications, the mobile application first registers itself and retrieves a device token from FCM by using Firebase SDK. This device token is passed to the notification relay service to be stored on a database. This device token is then used by the notification relay service to send push notifications to users’ mobile devices through FCM.
4.3.3.2.5 Top-up
The mobile application supports top-up of digital currency to a retail user’s wallet from their LFI bank account. The user can select an available top-up method, enter the required amount, and initiate the top-up request.
4.3.3.2.6 Withdrawal
The mobile application enables retail users to withdraw digital currency from their wallet and transfer the equivalent in fiat currency to their registered LFI’s bank account. Users can select the available withdrawal method, enter the required amount, and initiate the withdrawal request.
4.3.3.2.7 Lookup
The mobile application enables a user to search for another retail user’s wallet ID based on certain search criteria. This component sends lookup requests to the Mobile CSB and retrieves the wallet IDs of users that match the specified search criteria.
4.3.3.2.8 QR code generation and scanning
QR codes serve as a crucial element in the Retail CBDC solution. The QR codes must comply with EMVCo QR Code Standards. The mobile application scans QR codes using the device camera, decodes them, and extracts relevant information.
* The mobile application validates the QR code format and structure before proceeding with any payments.
* It ensures the QR data follows EMVCo standards.
* Any malformed QR code results in an error message before the transaction process starts.
4.3.3.2.8.1 P2P QR codes generation and scanning
Retail users can generate QR codes for P2P transfers by using the mobile application. According to the business use case, the mobile application can generate static or dynamic QR codes that comply with EMVCo Consumer-Presented QR Code (CPQR) standards.
* Static P2P QR codes contain the wallet ID.
* Dynamic P2P QR codes contain the wallet ID and the transaction amount.
To initiate a P2P payment using a QR code:
1. A retail user initiates a QR code generation request on the mobile application.
2. The system formats the QR code data per EMVCo specifications.
3. The recipient scans the QR code and confirms the payment on their mobile application.
4. The transaction is validated, processed, and confirmed.
5. The sender and the recipient receive the notification result as a push notification to their mobile devices.
4.3.3.2.8.2 POS QR codes scanning
POS terminals generate QR codes dynamically for each transaction, and the mobile application supports scanning of these QR codes.
1. POS terminal generates a transaction-specific QR code.
2. Retail user scans the QR code and confirms payment.
3. Mobile application sends a transfer request to the backend system from retail user’s wallet to merchant’s wallet.
4. Backend validates the transfer request and updates the transaction status.
5. The POS terminal is notified of the transfer result.
6. The sender receives the notification result as a push notification to their mobile device.
4.3.3.2.9 Profile management
Profile management allows users to personalize their mobile application experience. This section outlines the structure and functionalities available within the Profile Management module.
4.3.3.2.9.1 App preferences
Users can personalize their mobile application experience by configuring language and theme settings.
4.3.3.2.9.1.1 Language selection
* Allows users to switch between supported languages.
* Affects all text elements in the app, including notifications and UI texts.
* The selected language key-value is managed within the mobile bundle.
4.3.3.2.9.1.2 Theme mode
* Users can choose between:
* Light Mode (default)
* Dark Mode
* The selected theme preference is stored locally for a consistent user experience.
4.3.4 Mobile application deployment
This section outlines how the mobile application will be built and published to the App Store (iOS) and Google Play (Android). It covers the initial deployment, subsequent updates, and how to handle force/soft update mechanisms for end users. Automation with Fastlane is also integrated into the workflow to streamline deployments.
4.3.4.1 Deployment workflow overview
The deployment process begins with preparing the app for release, which includes aligning versioning, environment configurations, build settings, and relevant platform-specific metadata.
* For iOS, this typically means updating the CFBundleShortVersionString and CFBundleVersion in the Info.plist.
* For Android, versionName and versionCodein are used in the build.gradle configuration.
These values ensure proper version tracking and compliance with both App Store and Play Store submission requirements. Fastlane is used to automate much of the build and release pipeline, streamlining repetitive tasks such as generating signed build artifacts (.ipa for iOS, .aab or .apk for Android), uploading them to TestFlight or Firebase App Distribution, managing changelogs, handling screenshots, and submitting metadata to stores. Fastlane not only accelerates the release cycle but also ensures consistency and reduces the margin for manual error.
4.3.4.2 Initial upload vs. app updates
When an app is being submitted for the first time, additional configurations such as app identifiers, signing keys, store metadata, policy documentation, and category classification must be established on both App Store Connect and Google Play Console. Once approved through a manual review process, the app is made available to the public either immediately or according to a scheduled release window.
In the case of updates, the process becomes more straightforward. Developers simply increment the version identifiers, bundle the new build, and submit it for review. The approval workflow is similar to the initial upload but typically faster, especially for apps with a history of clean submissions. Fastlane can be leveraged again here to automate and simplify the re-submission.
4.3.4.3 Internal testing and QA distribution
Before any production release, TestFlight (for iOS) and Firebase App Distribution (for Android and iOS) are used for internal testing. This enables product stakeholders, QA, and UAT teams to test new features, UI changes, and critical fixes ahead of a public rollout. These testing channels mirror the production environment and include crash reporting and analytics for better observability.
4.3.4.4 Enforcing force and soft updates
As the app evolves, certain backend changes or feature rollouts may require users to be on the latest version. In such cases, force update and soft update mechanisms will be implemented within the application.
* A force update ensures that users must upgrade to a minimum required version in order to continue using the app. This is typically managed through a remote configuration service such as Firebase Remote Config, where the client-side app checks for the minimum supported version at launch and displays a blocking dialog if the installed version is outdated.
* A soft update, conversely, acts as a gentle prompt, allowing users to continue using the app while encouraging them to upgrade. This can be implemented using toast messages, banners, or modal alerts, and can be triggered using the same remote configuration infrastructure. For Android, Google Play’s In-App Updates API also offers native UI components to support both flexible and immediate updates.
To maintain visual consistency and user experience, the design system ensures that any update messaging adheres to accessibility and branding guidelines across platforms.
4.3.4.5 Post-deployment monitoring and next steps
Once a release goes live, the app can be monitored through integrated tools such as Firebase Crashlytics, Google Analytics, and Sentry to ensure stability, performance, and usability. Metrics such as crash-free sessions, user retention, and store reviews are actively tracked. Based on user feedback and performance insights, hotfixes may be issued or subsequent feature rollouts may be planned using the same controlled deployment process.
4.3.4.6 Technical details
4.3.4.6.1 Deployment workflow

Figure 42: Mobile App Deployment Workflow
This diagram outlines the end-to-end deployment pipeline for a mobile application, starting from a code commit through to final release on the App Store and Play Store. The process includes CI-based build and test automation, app packaging and signing via Fastlane, pre-release distribution through Firebase for QA and internal testing, and eventual store deployment. It highlights both success and failure scenarios, integrates seamlessly with CD pipelines, and includes quality gates and notification mechanisms to ensure reliability and visibility across the release process.
4.3.4.6.2 Versioning and build metadata
4.3.4.6.2.1 iOS (via Info.plist)
Key
Purpose
CFBundleShortVersionString
User-visible version (for example, 1.0.2)
CFBundleVersion
Internal build number, incremented with each release build (for example, 14)
Different xcconfig files per environment are maintained and referenced in each build scheme (for example, Dev.xcconfig, Staging.xcconfig, and Prod.xcconfig).
4.3.4.6.2.2 Android (via build.gradle)
Key
Purpose
versionName
User-visible version (for example, 1.0.2)
versionCode
Monotonically increasing internal version
Each environment is defined using product flavors.
productFlavors {
  dev {
    dimension "default"
    applicationIdSuffix ".dev"
    versionNameSuffix "-dev"
    resValue "string", "app_name", "\"${project.env.get("APP_NAME")}\""
    resValue "string", "app_icon", "@mipmap/ic_launcher"
  }
  stagging {                          // stagging is used rather than staging, its a intentional typo
    dimension "default"
    applicationIdSuffix ".stagging" // stagging is used rather than staging, its a intentional typo
    versionNameSuffix "-stagging",  // stagging is used rather than staging, its a intentional typo
    resValue "string", "app_name", "\"${project.env.get("APP_NAME")}\""
    resValue "string", "app_icon", "@mipmap/ic_launcher"
  }
  production {
    dimension "default"
    applicationIdSuffix ".production"
    versionNameSuffix "-production"
    resValue "string", "app_name", "\"${project.env.get("APP_NAME")}\""
    resValue "string", "app_icon", "@mipmap/ic_launcher"
  }
}
4.3.4.6.3 Environment configurations
.env files or .plist equivalents are maintained for iOS and Android to isolate environment-specific variables such as API endpoints, feature toggles, analytics keys, and Firebase configurations.
* .env.dev, .env.staging, and .env.production for Android using react-native-config.
* Environment.plist for iOS, bundled into targets via custom build phases.
4.3.4.6.3.1 Handling Updates (Force & Soft)
Version enforcement checks are implemented through Firebase Remote Config or custom backend APIs:
{  
  "min_required_version": "10",   
  "latest_version": "14"
}
* min_required_version for force updates
* latest_version for soft updates
Clients check these values at app launch and display appropriate dialogs or banners based on whether the version needs to be updated. Android also supports Google Play’s In-App Updates API, enabling native UI for both flexible and immediate updates.
4.3.5 Mobile CSB components

Figure 43: Mobile CSB Components
* View: Enables a retail user to retrieve their wallets, their transactions, and their child wallets by interacting with the View flow of the Wallet Service.
* P2P Transfer: Enables a retail user to transfer funds to another retail user’s wallet by interacting with the Transfer flow of the Wallet Service.
* P2M Transfer: Enables a retail user to transfer funds to a merchant wallet by interacting with the P2M transfer flow of the Integration gateway.
* Lookup: Enables searching for the wallet ID of a retail user according to criteria specified on the mobile application by interacting with the Integration gateway.
* Withdrawal: Enables a retail user to withdraw digital currency from their wallet by interacting with the Withdrawal flow of the Integrations gateway.
* Top-up: Enables top-up of digital currency to a retail user’s wallet from their LFI bank account by interacting with the Top-up flow of the Integrations gateway.
4.3.6 Mobile CSB implementation
The Mobile CSB is a stateless service implementing business logic using the Corda Workflow SDK. It interacts with the Wallet Service and the Integration gateway sub-system.
4.3.6.1 Mobile CSB API
The Mobile CSB exposes the following APIs to the mobile application. It expects the JWT OICD access token in the request header for all API requests. The Mobile CSB passes the JWT of the retail user to the Wallet Service and the Integration Gateway Sub-system.
* View: Retrieve a retail user’s wallets, their transactions, and their child wallets.
* P2P Transfer: Start P2P transfer flow.
* P2M Transfer: Start P2M transfer flow.
* Top-up: Start top-up flow.
* Withdrawal: Start withdrawal flow.
* Lookup: Search for the wallet ID of a retail user.
4.3.7 Firebase Cloud Messaging
The following diagram shows how Retail CBDC solutions interact with Firebase Cloud Messaging (FCM):

Figure 44: Third-party Push Notification Service
* Firebase Cloud Messaging (FCM): FCM routes the message to the targeted device, handles message delivery, and applies platform-specific configuration where appropriate. FCM interacts with the following transport layers by having point-to-point encryption. FCM does not provide an end-to-end encryption solution.
* Android transport layer (ATL) for Android devices with Google Play services: FCM uses encrypted transport while sending messages to Android devices.

* Apple Push Notification service (APNs) for Apple devices: FCM uses encrypted transport while sending messages to APN and similarly APN uses encrypted transport while sending messages to iOS devices.
4.3.7.1 Firebase Cloud Messaging specific configurations and implementations
Notification Relay Service uses FCM HTTP v1 API to send push notifications to the FCM back end. The REST API requires an OAuth 2.0 access token derived from a private key of a Google service account. The Retail CBDC solution requires a single Google service account specific to the mobile application. This means the service account is not specific to LFIs and there will be only one service account to be used for push notifications.
The Firebase project enables a service account to generate a private key as a JSON file. Details for generating private key can be found on this link. This generated private key needs to be securely stored on Vault on all LFI networks. The FCM REST API requires the Firebase project ID to be present in the URL for send message requests, so the project ID also needs to be injected as an environment variable. Below are the steps for enabling push notifications in the Retail CBDC solution:
1. A Firebase Project needs to be created on Firebase Console.
2. The mobile application needs to be added to the Firebase Project.
3. Android and iOS applications need to be registered on this project.
4. A Service Account Key needs to be generated on Firebase Console and this private key needs to be downloaded as a JSON file.
5. The service account private key needs to be stored securely on Vault.
6. The service account private key needs to be injected for Notification Relay Service. Details for injection of secrets to micro-services can be found in the “Secrets management” section.
7. Notification Relay Service uses this service account private key to get an OAuth 2.0 Access Token, which is a short-lived access token. Notification Relay Service uses Google Auth Library to create and refresh the token. It is recommended to rotate service account keys periodically.
8. Notification Relay Service listens for and processes notification events generated by the Wallet Service and sends notification messages to FCM REST API by sending the access token in the authorization header.
4.3.8 Notification Relay Service components

Figure 45: Notification Relay Service components
* User Device Token Manager: The User Device Token Manager stores the latest device token of a user in the User Device Token database. When a user logs in, the mobile application sends a request to the notification relay service to update their latest device token information.
* Notification Event Listener:
* Listens to the Wallet Service notification topic.
* Fetches the user’s device token from the database.
* Sends a push notification via the Push Notification Sender by passing a notification event, metadata, and device token.
* Push Notification Sender: The Push Notification Sender sends push notification messages to FCM by sending HTTP POST request to its REST API. In case of failure, the Sender puts the failed messages to the failed notifications database for retries.
* Retry Scheduler: The Retry Scheduler queries the message database to find messages that need to be retried. In case of successful delivery, the message is removed from the database. Failed messages are kept in the database until a certain time or retry count is reached. The Retry Scheduler enables the configuration of retry policy.
4.3.9 Notification Relay Service implementation
The Notification Relay Service is a stateful service. This service handles the delivery of push notifications to users by listening for specific event triggers. When an event occurs for a user, the service attempts to send a notification to the user’s mobile device via a stored device token. If the delivery fails, the notification is stored in a database, and a retry scheduler ensures that the failed message is retried after a specified interval based on a retry policy.
4.3.9.1 Notification Relay Service API
The Notification Relay Service exposes the following API to the mobile application:
* Register Device: Registers a device token for a user ID in the user device token database. If there is an existing user for a device token, the user ID is updated with the new user ID for the device token.
4.3.9.2 Notification Relay Service data model
4.3.9.2.1 Table user_device_token
Column Name
Data Type
Description
PK
FK
Nullable
Constraints
device_token
VARCHAR(255)
Unique device token
Yes
No
No
PRIMARY KEY
user_id
UUID
User identifier
No
No
No

platform
VARCHAR(32)
Device platform (for example, iOS or Android)
No
No
No

last_updated_at
TIMESTAMP
Last update timestamp
No
No
No
DEFAULT current_timestamp
Table 22: Table user_device_token
* device_token is the primary key
* user_id is mutable and can be updated as a user may change their device which means a different device token would be associated with the user.
4.3.9.2.2 Table failed_notifications
Column Name
Data Type
Description
PK
FK
Nullable
Constraints
transaction_id
UUID
Transaction identifier for each failed notification record
No
No
No

user_id
UUID
The unique identifier of the user for whom the notification was sent
No
No
No

device_token
VARCHAR(255)
The device token for the user’s mobile device to which the notification was sent
No
Yes
No
REFERENCES user_device_token(device_token)
message
VARCHAR(4096)
The payload of the push notification
No
No
No

platform
VARCHAR(32)
The platform the device belongs to (for example, iOS or Android)
No
No
No

status
VARCHAR(32)
The current status of the notification (for example, "failed", or "pending retry”)
No
No
No

error_code
VARCHAR(255)
Error code or description from the push notification service indicating the failure reason
No
No
Yes

created_at
TIMESTAMP
Timestamp when the notification failure occurred
No
No
No
DEFAULT current_timestamp
updated_at
TIMESTAMP
Timestamp when the last retry attempt or failure check was made
No
No
No
DEFAULT current_timestamp
retry_count
INTEGER
Number of retry attempts made for this notification
No
No
No
DEFAULT 0
next_retry_at
TIMESTAMP
The timestamp of the next scheduled retry attempt (based on retry policy)
No
No
Yes

permanent_failure
BOOLEAN
Indicates if the notification has been marked as a permanent failure after reaching retry limits
No
No
No
DEFAULT FALSE
last_retry_error_code
VARCHAR(255)
The error code from the last retry attempt
No
No
Yes

Table 23: Table failed_notifications
* Only device_token is a FK in Failed notifications, referencing user_device_token(device_token).
4.3.9.2.3 Entity relation diagram

Figure 46: Notification Relay Service ERD
4.3.10 Sequence and interactions
4.3.10.1 View Wallet sequence

Figure 47: View Wallet Sequence
1. User logs into the mobile application by selecting an LFI.
2. UI sends a request to the Mobile CSB to request the wallets of a logged-in user for an LFI.
3. Mobile CSB sends a request to retrieve the user’s wallets from the Wallet Service, including the JWT access token in the request header.
4. Wallet Service finds the wallets and returns the wallet list.
5. Mobile CSB returns the wallet list to the UI.
6. UI displays the wallet details.
4.3.10.2 View wallet transactions sequence

Figure 48: View Wallet Sequence
1. A logged-in user selects a wallet.
2. UI sends a request to the Mobile CSB to request the wallet’s transactions.
3. Mobile CSB sends a request to retrieve the wallet’s transactions from the Wallet Service, including the JWT access token in the request header.
4. Wallet Service finds the transactions and returns the transaction list.
5. Mobile CSB returns the transaction list to the UI.
6. UI displays transactions.
4.3.10.3 Transfer sequence

Figure 49: Transfer Sequence
1. User initiates a request to transfer a specific amount of digital currency to a recipient wallet.
2. The mobile application sends a transfer request to the Mobile CSB with the specified amount and transfer details.
3. Mobile CSB forwards the request to the Wallet Service, including the JWT access token in the request header.
4. Wallet Service updates the sender and recipient wallet balances.
5. Wallet Service returns the successful transfer result to the Mobile CSB.
6. Mobile CSB responds to the UI, which displays a success message to the user.
7. Wallet Service broadcasts notifications, to be sent to both the sender and receiver of the transaction, to a notification topic. If the sender and receiver are on different LFI networks, each Wallet Service on the LFI network is responsible for broadcasting the notifications to the topics on each LFI.
8. The events on the topics are listened to by the Notification Relay Services on each LFI and processed to be sent to FCM.
4.3.10.4 Register device for push notification

Figure 50: Register Device For Push Notification
1. The mobile application initiates a Register Device request to FCM.
2. FCM registers the device and returns the device token.
4.3.10.5 Update device token sequence

Figure 51: Update Device Token Sequence
1. After successfully registering the device to FCM, the mobile application initiates an update device token for the user ID and sends the request to the Notification Relay Service.
2. The Notification Relay Service updates the user device token database with the new device token.
4.4 Topology
The diagram below shows the components on deployment infrastructure. It illustrates two network participants running private networks and their interactions with a mobile application. Services in the blue boxes are running as containerized workloads in Kubernetes. There may be multiple instances of some containers, to facilitate a highly available system (not shown). Mobile CSB APIs are exposed via the API Gateway to the public internet so that mobile applications can access these APIs. All requests coming to Mobile CSB have a JWT access token which is directly passed on to other back-end services. Each back-end service is responsible for authorizing users with JWT access token via Authorization Service. To be able to interact with a wallet on an LFI’s retail CBDC solution, users are required to authenticate through their mobile application and select their choice of authentication for that LFI. Each JWT access token is only valid on the LFI Retail CBDC solution that generates the JWT access token.

Figure 52: Topology Diagram
4.5 Considerations
4.5.1 Data usage optimization
Efficient data usage is essential for reducing both user costs and mobile application response times, especially in a data-sensitive environment like mobile wallets. Optimization methods include:
* Data compression: Compress data transmitted between the client and server using formats like Gzip or Brotli to minimize payload sizes.
* Efficient data fetching: Includes:
* On-demand loading: Load data only when necessary, such as when the user opens a specific wallet or views their transaction history.
* Pagination: Implement pagination for lists (for example, transaction history) instead of loading all data at once, therefore reducing bandwidth use.
* Caching: Cache frequently accessed data (such as wallet balances) using local storage to limit redundant network requests.
* Real-time data with throttling: For real-time features (such as live balance updates), limit update frequency (throttle) to minimize network traffic, fetching data only when needed or at set intervals.
4.5.2 Battery efficiency
Mobile applications, especially finance apps with real-time updates and data fetching, need to be optimized to limit battery drain and improve user experience.
* Efficient background processing:
* Use background jobs wisely: Schedule non-urgent tasks (such as data synchronization and analytics) during periods of low usage using OS-specific APIs like Android’s WorkManager or iOS’s BackgroundTasks framework.
* Avoid frequent background updates: Limit the frequency of background updates for non-essential data and use push notifications or on-demand data fetching instead.
* Optimize real-time data usage:
* Use push notifications: For event-driven updates, like P2P transfer confirmations, use push notifications instead of continuous background data checks.
* Battery usage monitoring: Track battery impact during development using tools to identify and optimize energy-intensive processes.
4.5.3 Mobile security
Security is critical for mobile wallet applications due to the sensitivity of financial data and the potential for unauthorized access. Below are the design considerations for the mobile security.
* Data encryption:
* In-transit: Use HTTPS with TLS to encrypt all data exchanged between the mobile application and the CSB, ensuring data cannot be intercepted. The mobile application talks directly to the backend platform using secure TLS connections. TLS protocol enables WAF (web application firewall) and related security appliances to be integrated to monitor and manage mobile/user sessions.
* At-rest: Encrypt sensitive data stored locally (for example, JWT access token and cached user data) using platform-specific secure storage mechanisms.
* Jailbreak/root detection: Detect if the device is rooted (Android) or jailbroken (iOS), which can increase vulnerability. If detected, restrict access to sensitive actions or show warnings to alert users of potential risks.
* Permissions management:
* Minimal permissions: Request only essential permissions (such as camera access for QR code scanning).
* Transparent permission explanation: Clearly explain to users why each permission is needed, helping them understand their security impact and functionality benefits.
* Code obfuscation and hardening:
* Obfuscation transforms the code into a functionally equivalent but much harder-to-read version, making it significantly more difficult for attackers to understand the application’s logic or extract sensitive information. The Mobile application is built with React Native and uses Hermes engine, which compiles JavaScript into an optimized bytecode format. This bytecode is more efficient for execution on mobile devices and reduces startup time. However, since the original JavaScript code is still the source of truth before compilation, it remains a target for reverse engineering. To mitigate this, JavaScript code needs to be obfuscated before it is compiled by Hermes using javascript-obfuscator and react-native-obfuscating-transformer.
* The mobile application does not have any in-house native module code or native third-party code, so code obfuscation is not required for iOS native code and Android native code.
* Session timeout and auto-logout:
* Implement auto-logout after a defined period of inactivity to minimize security risks from unattended devices.
* Session limits to prevent multiple logins will be configurable within Keycloak.
* User Authentication:
* Security controls relating to user and identity management are defined and controlled by the OIDC-compliant IDM.
4.5.3.1 Alignment with OWASP TOP 10 threats for mobile applications

OWASP Threat
Correspondence
M1: Improper Credential Usage
Tokens are stored using encrypted storage mechanisms on the device. 
Android: EncryptedSharedPreferences and Secure Storage.
iOS: Keychain Services for storing tokens and sensitive data.
See: Security Design Document - MOBILE_TOKEN_THEFT
M2: Inadequate Supply Chain Security
Supply chain security measures are detailed in a chapter 9 of this document (Solution Delivery).
M3: Insecure Authentication/Authorization
There are multiple layers of authentication and authorization mechanisms in place that prevent unauthorized access as well as DoS and endpoints enumerations and other form of information disclosure:
API Gateway: Checks token validity (signature) and enforces access control policies on requested services/URLs.
IAM: Uses IAM solutions to manage user identities and access to services.
Wallet Service: Validates the specific request and conditions to perform the requested operation.

See: Security Design Document -MOBILE_UNAUTHORIZED_ACCESS
M4: Insufficient Input/Output Validation
The mobile application validates QR code format and structure before proceeding with any payments.
It ensures the QR data follows EMVCo standards.
Any malformed QR code results in an error message before the transaction process starts.
M5: Insecure Communication
All communications to/from the mobile app use the TLS protocol to secure communications.
See: Security Design Document -MOBILE_CONNECTION_TAMPERING
M6: Inadequate Privacy Controls
PII data is not currently persisted on the mobile device; however, PII requirements are still under discussion and the design will be updated accordingly.
M7: Insufficient Binary Protections
The application is written in React Native, using the Hermes javascript engine. This framework includes a built-in code obfuscator that protects the mobile application binaries.
See: Security Design Document - MOBILE_REVERSE_ENGINEERING
M8: Security Misconfiguration
The mobile app follows a secure-by-default methodology. Secure configuration will be validated by future assessment exercises.
M9: Insecure Data Storage
Tokens are stored using encrypted storage mechanisms on the device. 
Android: EncryptedSharedPreferences and Secure Storage.
iOS: Keychain Services for storing tokens and sensitive data.
See: Security Design Document - MOBILE_TOKEN_THEFT
M10: Insufficient Cryptography
All communications with IDM are encrypted using HTTPS.
Push notifications from Firebase are HTTPS encrypted.
Standard TLS and cryptographic implementations are used in the solution.
See: Security Design Document - CRYPTO_AGILITY


4.5.4 Internationalization of messages
* Backend Considerations: The Mobile CSB should be agnostic of language and send error and success messages in a way that the front-end can translate them into the appropriate language. The Mobile CSB should return message keys instead of actual text. This way, the mobile application can localize the message on the mobile application.
* Front-end Considerations: The mobile application should maintain a localized set of error messages for all supported languages, so it can display the message in the user’s preferred language. The mobile application can use libraries like React Native i18n, or similar, depending on the platform, to show the error messages. For each supported language, the mobile application will have a dictionary of error messages that correspond to the message keys returned from the backend.
4.5.5 Availability guarantees
The Mobile CSB and the Notification Relay service are containerized for horizontal scalability, allowing them to efficiently handle increases in load. They operate without process affinity, meaning that requests can be handled by different instances if failures occur. APIs are versioned to allow seamless updates without impacting current services, ensuring continuous availability during system upgrades.
4.5.6 Data consistency
4.5.7 Disaster recovery guarantees
Disaster recovery strategies are dependent on deployment specifics. Key considerations include:
* Clear definitions of Recovery Time Objectives (RTO) and Recovery Point Objectives (RPO).
* The deployment topology chosen.
* Comprehensive monitoring and alarm systems for quick issue identification and resolution.
These considerations should also extend to downstream components, particularly the Wallet Service.
4.5.8 Monitoring and alarms
The Mobile CSB and the Notification Relay service utilize the OpenTelemetry Protocol (OTLP) to export logs, metrics, and traces. Configuration is done through environment variables in the application’s container image. It is expected that the deployment includes an observability stack capable of effective monitoring and alarms, although specific deployment configurations and dashboards are beyond this design’s scope.




5 Corda networks
This chapter provides the detailed design for Corda networks. It describes the ingress and egress requirements for the solution, along with the networking within Kubernetes clusters. Greater detail is provided for the API gateway and service mesh that form a part of the solution. The design also covers high-availability, failover, and backup/restore at the solution level, and observability.
5.1 Networking
The high-level design for Corda Networks described the overall network topology. This section provides the next level of detail for the network interactions supported by this topology.
5.1.1 Terminology
* DMZ: Demilitarized Zone
* DR: Disaster Recovery
* WAF: Web Application Firewall
* VPN: Virtual Private Network
* DNS: Domain Name System
* HA: High Availability
* LB: Load Balancer
5.1.2 Background reading
This design should be read in the context of the Corda networks high-level design.
5.1.3 Requirements
5.1.3.1 In scope
* Defining required network connectivity between components in the topology.
5.1.3.2 Out of scope
* This design does not attempt to enumerate the specific details of that connectivity, such as IP ranges, ports, or firewall rules. These will be provided as part of the solution documentation and based on consultation with the client on their existing practices.
5.1.4 Solution design
5.1.4.1 Proposed solution
5.1.4.1.1 Topology
The Corda networks high-level design defined the network topology, as shown in the following diagram.

Figure 53: Network Topology Diagram
The following sections cover networking within each cluster, and required ingress and egress for those clusters.
5.1.4.1.2 Intra-cluster networking
One or more network participants operate within the scope of a Kubernetes cluster. This design does not attempt to dictate how those Kubernetes clusters are installed and configured, but the assumption is that there is a flat network structure across the cluster’s nodes.
Access to pods running within the cluster should be via Kubernetes services and controlled by service mesh authorization policies. As described in the Service Mesh LLD, the default behavior should be to deny access. Each application should define a policy specifying the service identities within the mesh authorized to connect to it. If the application exposes interfaces outside the cluster, this policy should include the API gateway.
These service mesh policies will ensure there is no cross-talk between network participants within the cluster. All traffic between participants is directed out to the load balancer and back in through the API gateway, as covered below.
Note that these policies only specify access at the process level. For example, the API Gateway should be able to call the Wallet Service, and the Wallet Service should be able to call the database. Authentication and authorization of user identities accessing APIs are layered on top of this.
5.1.4.1.3 Ingress
5.1.4.1.3.1 Application ingress
Application ingress covers the following scenarios:
* Calls from one network participant’s applications to another (whether hosted in the same or different clusters).
* Calls from mobile devices on the internet to a network participant’s client-specific backend.
* Serving static content and calls to the client-specific backend for browser-based applications accessed from a financial institution’s internal network.
* API calls to applications from systems external to the solution.


Figure 54: Application Ingress
In all cases, the entry point to the Kubernetes cluster is via the API Gateway. Applications and client-specific backends will define via the gateway’s custom resources the routes exposed on the gateway. Routes should specify a host of the form <APPLICATION>.<PARTICIPANT>.<DOMAIN>. This facilitates running multiple network participants in the same Kubernetes cluster, and avoids path collisions between applications. The choice of base domain is left to the client.
As covered in the API gateway design, there will be multiple instances of the gateway for high availability. These should be fronted by one or more load balancers in the client’s network infrastructure. For example, there may be separate DMZ for internet-facing traffic, traffic from other financial institutions, and internal traffic, each containing separate load balancers. The DNS record for *.<PARTICIPANT>.<DOMAIN> in each scenario should resolve to the appropriate load balancer.
The mechanism to connect to the API Gateway will depend on the specific load balancer. In the most generic case, the API Gateway can be exposed via a node port on each of the Kubernetes cluster’s nodes, and the load balancer can round-robin across these. 
The connection between the API Gateway and upstream service will be protected by the service mesh using mTLS. It is anticipated that the client’s TLS connection is terminated at the load balancer in order to facilitate inspection of request content by the web application firewall. Implementing SSL inspection at the load balancer using a WAF or IPS is the responsibility of the client. R3 applications do not modify request headers or payloads during this process, and therefore application functionality is not impacted by SSL inspection. A new TLS connection between the load balancer and the API Gateway should then be established. The client’s existing standards should determine how this connection is protected.
5.1.4.1.3.2 Control plane ingress
As described in the solution delivery design, the automation server requires access to the cluster’s Kubernetes API to deploy the solution. This requires connectivity to the API from the network segment running the automation server to the cluster’s network.

Figure 55: Control Plane Ingress
Details of the transport-level security and authentication/authorization depend on the Kubernetes deployment. For OpenShift, the API server is exposed via TLS using the cluster’s built-in certificate authority, and OAuth can be used for authentication. API access should be rate-limited and audited.
Multiple administrative accounts with RBAC should be used to limit privileges. An account with cluster-level permissions will be required to set up the initial cluster-level resources, such as operators. Subsequent updates should be made using an account that does not have cluster-level permissions. Operators should also have read-only access to the cluster for problem determination.
5.1.4.1.3.3 Cross-site data replication
The following components require connectivity between the clusters deployed to each data center in order to replicate data for failover:
* PostgreSQL
* NATS
* HashiCorp Vault
The following diagram only shows the connectivity for PostgreSQL, but a similar pattern would be used NATS and HashiCorp Vault.

Figure 56: Replication
The details of the data replication mechanism will determine whether each individual pod needs to be exposed across sites, or whether as is the case for PostgreSQL, a service pointing at the current primary is exposed.
5.1.4.1.4 Egress
The following sections describe the requirements for egress from the network segment hosting the Kubernetes cluster. Where traffic leaves the client’s network infrastructure, the expectation is that this will be via the client’s outbound proxy.
5.1.4.1.4.1 Traffic between network participants
Outbound connectivity from each cluster to the load balancer in the internal DMZ is required to support application traffic between network participants. Within the service mesh, this connectivity should be explicitly enabled by defining egress network resources and associated HTTP routes. As described above, even when two network participants reside in the same cluster, traffic between them should be routed via the load balancer.
Failover between data centers is at the cluster level. Consequently, the load balancer may route traffic from one network participant to another hosted in a different data center. See High availability, failover, and backup/restore for further details.
5.1.4.1.4.2 Connectors
The connectors will require outbound connectivity from the Kubernetes cluster. Specifically:
* From the FLEXCUBE connector to the central bank’s FLEXCUBE system.
* From the mBridge connector for each network participant to the corresponding mBridge API gateway, also hosted in the central bank’s infrastructure.
5.1.4.1.4.3 External identity manager
Where Identity and Access Management is making use of an external identity manager for authentication, there will need to be outbound connectivity from Keycloak to the network of the financial institution hosting the identity manager.
5.1.4.1.4.4 HSM
Where HashiCorp Vault is backed by a hardware security module (HSM), connectivity is required from Vault to the HSM. Typically the HSM will reside in a separate network to provide better isolation.
5.1.4.1.4.5 Cross-site data replication
Data replication is typically bi-directional to support failover and failback. Consequently, it requires both ingress and egress for the components described above.
5.1.4.1.4.6 Artifact repository
Access from the runtime environment to the artifact repository is required for the following scenarios:
* Container runtime pulling images
* Open Policy Agent retrieval of policy documents
5.1.4.2 Monitoring
The solution requires outbound connectivity to push metrics, logs, and traces, to the observability stack. These should not come directly from the applications but from the node-level agent or the OpenTelemetry collector. For example, if using Managed Dynatrace, the OneAgent instances and the Dynatrace Collector would require connectivity to the Dynatrace instance.
5.2 API gateway
An API gateway will be implemented that will enable the management of access control, routing, and monitoring of the services. It is proposed this API gateway will be implementing using Apache APISIX.
5.2.1 Expectations
The expected outcome of this LLD is to inform other teams implementing other parts of the solution of the API gateway design.
5.2.2 Prerequisites
5.2.2.1 Terminology
* Service: Used in the Kubernetes sense, a method for exposing a network application that is running as one or more pods in your cluster.
* Pod: The smallest deployable unit in Kubernetes, representing a single instance of a deployment and contains one or more containers.
* Deployment: A deployment manages a set of pods, with a desired state specified in a deployment configuration.
* Replica: The number of pods in a deployment that should be running at any given time.
* Upstream: In routing, the destination for requests that are received by the API gateway.
* Data plane: The part of the API gateway responsible for processing and forwarding requests.
* Control plane: The part of the API gateway responsible for managing the configuration of the data plane.
* Ingress: Requests that are coming into the network, as opposed to going out of the network (Egress).
* Cluster: Used in the Kubernetes sense, a set of nodes that run containerized applications, each set representing a single business identity.
5.2.2.2 Dependencies
The solution entirely depends on Kubernetes. This proposal relies heavily on the deployment and scaling capabilities of Kubernetes, including the pod topology spread constraints.
5.2.3 Requirements
The main requirement is the apisix/apisix Helm chart provided by apiseven. It has a dependency on bitnami charts. It can also install the ingress controller, but if we need to install it ourselves we can install the apisix/apisix-ingress-controller chart.
5.2.3.1 Out of scope
* Individual plugin configuration
5.2.4 Solution design
5.2.4.1 Proposed solution - edge deployment using decoupled mode
We deploy APISIX in decoupled mode, hosting both the data and control plane, along with an etcd cluster. The API gateway can be deployed at the cluster level, in front of the accessible services, providing a single entry point for all requests. Alternatively, multiple API gateways can be deployed in the same cluster, at the edge of each logical boundary, serving a related collection of microservices.
5.2.4.1.1 Topology

Figure 57: API Gateway - Decoupled
The topology diagram above shows the API gateway deployed at the edge of the cluster, in front of the accessible services.
5.2.4.1.1.1 What is not shown on the diagram
In order to simplify the diagram and keep it readable, the following details have been omitted:
* The three etcd instances that form a cluster and communicate with each other to keep the data in sync. They elect a leader and form a quorum.
* The many platform services and microapps that populate the Kubernetes cluster.
* Requests are routed from the API gateway to the upstream service.
* East/west traffic is not shown on the diagram. It is fully expected that an instance of the API gateway in the primary site can route to a pod in the DR site, and vice versa.
5.2.4.1.2 Remarks
* The API gateway is deployed in decoupled mode. This means that the data plane and control plane are separate.
* Performance testing in the target environment will determine the number of instances required.
* The example provided in the image shows four data plane instances. Any number, spread evenly across the availability zones, can be appropriate depending on the expected load.
* The control plane is a single instance.
* Configuration is not expected to be high-load compared to the data plane.
* Expecting config changes to be infrequent.
* The etcd cluster keeps the applied configuration in sync across the data plane instances.
* The etcd cluster is deployed with an odd number of nodes to ensure a quorum.
* When comparing the decoupled mode with the traditional and standalone:
* The traditional mode means every instance is both data and control plane. This means each instance will be listening on the admin port; this is not as secure as having them closed. Every instance will have the admin credentials configured, allowing more opportunity for misconfiguration.
* The standalone mode means deploying with the config in an instance local YAML file. The benefits of the etcd cluster (consistency guarantees, fault tolerance, and disaster recovery) would be lost.
5.2.4.2 Implementation components
5.2.4.2.1 etcd
etcd is a strongly consistent, distributed key-value store that provides a reliable way to store data that needs to be accessed by a distributed system or cluster of machines. It gracefully handles leader elections during network partitions and can tolerate machine failure, even in the leader node.
5.2.4.2.1.1 Features
* Key-value storage: Store data in hierarchically organized directories, as in a standard filesystem.
* RAFT protocol: etcd uses the RAFT consensus algorithm to ensure that a leader is elected and that all nodes in the cluster agree on the state of the data.
* Watch: etcd supports a watch feature that allows clients to watch for changes to keys in the key-value store.
* Fault tolerance: etcd is designed to be fault-tolerant and can recover from network partitions and machine failures.
* Snapshots: etcd can take snapshots of the data store to allow for easy backup and restore.
5.2.4.2.1.2 Data consistency guarantees
etcd provides strong consistency guarantees, meaning that all nodes in the cluster agree on the state of the data at any given time.
5.2.4.2.1.3 Fault tolerance and disaster recovery guarantees
Operating a cluster of three or more nodes means we can lose a node and still have a quorum. A table is shown on the etcd documentation. By scheduling backups of the data store, we can recover from a blank state in the event of a total outage.
5.2.4.2.1.4 Monitoring and alarms
Prometheus and Grafana are supported for monitoring via a /metrics endpoint; see the etcd documentation metrics page.
Recommended monitoring includes:
* Server health
* Disk
* Network
* Prometheus-supplied metrics
5.2.4.2.1.4.1 Server health
* has_leader indicates if the member has a leader. If a member does not have a leader, it is totally unavailable. If all the members in the cluster do not have any leader, the entire cluster is totally unavailable.
* leader_changes_seen counts the number of leader changes the member has seen since its start. Rapid leadership changes impact the performance of etcd significantly. It also signals that the leader is unstable, perhaps due to network connectivity issues or excessive load hitting the etcd cluster.
* proposals_committed_total records the total number of consensus proposals committed. This gauge should increase over time if the cluster is healthy. Several healthy members of an etcd cluster may have different total committed proposals at once. This discrepancy may be due to recovering from peers after starting, lagging behind the leader, or being the leader and therefore having the most commits. It is important to monitor this metric across all the members in the cluster; a consistently large lag between a single member and its leader indicates that member is slow or unhealthy.
* proposals_applied_total records the total number of consensus proposals applied. The etcd server applies every committed proposal asynchronously. The difference between proposals_committed_total and proposals_applied_total should usually be small (within a few thousands even under high load). If the difference between them continues to rise, it indicates that the etcd server is overloaded. This might happen when applying expensive queries like heavy range queries or large txn operations.
* proposals_pending indicates how many proposals are queued to commit. Rising pending proposals suggests there is a high client load or the member cannot commit proposals.
* proposals_failed_total are normally related to two issues: temporary failures related to a leader election or longer downtime caused by a loss of quorum in the cluster.
5.2.4.2.1.4.2 Disk
* wal_fsync_duration_seconds The latency distributions of fsync called by wal. A wal_fsync is called when etcd persists its log entries to disk before applying them.
* backend_commit_duration_seconds The latency distributions of commit called by backend. A backend_commit is called when etcd commits an incremental snapshot of its most recent changes to disk.
* High disk operation latencies (wal_fsync_duration_seconds or backend_commit_duration_seconds) often indicate disk issues. It may cause high request latency or make the cluster unstable.
5.2.4.2.1.4.3 Network
* peer_sent_bytes_total counts the total number of bytes sent to a specific peer. Usually the leader member sends more data than other members since it is responsible for transmitting replicated data.
* peer_received_bytes_total counts the total number of bytes received from a specific peer. Usually follower members receive data only from the leader member.
* peer_sent_failures_total records the total number of send failures from the peer
* peer_received_failures_total records the total number of receive failures from the peer
* peer_round_trip_time_seconds records the average round trip time between the member and the peer. High round trip times may indicate network issues.
* client_grpc_sent_bytes_total records the total number of bytes sent to grpc clients.
* client_grpc_received_bytes_total records the total number of bytes received to grpc clients.
5.2.4.2.1.4.4 Prometheus-supplied metrics
* process_open_fds records the number of open file descriptors.
* process_max_fds records the maximum number of open file descriptors.
* Heavy file descriptor (process_open_fds) usage (that is, near the process’s file descriptor limit, process_max_fds) indicates a potential file descriptor exhaustion issue. If the file descriptors are exhausted, etcd may panic because it cannot create new WAL files.
5.2.4.2.2 APISIX control plane
The control plane is responsible for managing the configuration of the data plane instances. We send configuration changes to the control plane, which then writes them to the etcd cluster for the data plane instances to read.
5.2.4.2.2.1 Features
* Single instance of APISIX with the deployment role set to control_plane.
* Listening on an admin port, with no public access.
* Expecting the cluster administrator to directly access the target instance, using kubectl port-forward or similar.
* Administrator will use the REST interface to configure the API gateway.
* The REST interface is secured with a username and password.
* cURL statements can be saved and executed as part of the Infrastructure as Code.
5.2.4.2.2.2 Fault tolerance and disaster recovery guarantees
The control plane does not need any fail-over guarantees as it is only needed when a config change is required. After the initial setup, config changes are expected to be infrequent. The instance could be scaled down to 0 replicas and only spun up when needed to save costs. The control plane data is written to etcd: no data is stored locally.
5.2.4.2.2.3 Monitoring and alarms
None, as above.
5.2.4.2.3 Ingress controller
The above control plane is only accessible via the RESTful admin API. The ingress controller enables us to apply configuration via Kubernetes CRDs. This gives us the benefit of not having to encode cURL statements in the Infrastructure as Code, at the cost of running another service, deployment, and pod. The ingress controller will not need to be highly available, for the same reasons as the control plane, and can be scaled to a minimum. The ingress controller can be considered as part of the control plane, living in the same namespace and availability zone.
5.2.4.2.4 APISIX data plane
The data plane is responsible for processing and forwarding ingress traffic. It can scale horizontally to handle more requests. Features are enabled by plugins.
5.2.4.2.4.1 Features
* Path, hostname, and content based routing
* Rate limiting
* Load balancing
* Caching
* mTLS authentication
* SSL termination
* Logging & metrics
* Ability to perform A/B testing, canary releases, and blue-green deployments
* JWT, LDAP, OIDC/OAuth2 authentication
5.2.4.2.4.2 Fault tolerance and disaster recovery guarantees
The data plane instances are stateless, except for caching if enabled, so an instance failure can be tolerated. By having multiple instances, we can handle more requests and provide high availability. Given each host is expected to have two availability zones, it is proposed to have an even number of instances balanced across the zones:
* 2, one in each zone
* 4, two in each zone
* 6, three in each zone, and so on
5.2.4.2.4.3 Monitoring and alarms
Support for various monitoring, alarms, and logging is available. The Prometheus plugin exports the following metrics in Prometheus exposition format:
* http_status HTTP status code returned from Upstream services. Includes the code, route, matched URI/Host, service/consumer/node.
* http_latency Histogram of the request time per service in different dimensions.
* bandwidth Total amount of traffic (ingress and egress) flowing through APISIX. Total bandwidth of a service can also be obtained.
* etcd_reachable A gauge type representing whether etcd can be reached by APISIX. A value of 1 represents reachable and 0 represents unreachable.
* nginx_http_current_connections Nginx connection metrics like active, reading, writing, and number of accepted connections.
* batch_process_entries A gauge type useful when Plugins use batch process to send data. Entries that hasn’t been sent in batch process will be counted in the metrics.
* apisix_upstream_status Health check result status of upstream nodes. A value of 1 represents healthy and 0 represents unhealthy.
* shared_dict_capacity The capacity of each nginx shared DICT since APISIX start.
* shared_dict_free_space The free space of each nginx shared DICT since APISIX start
5.2.4.3 Alternative solution - edge deployment using standalone mode
Instead of deploying the APISIX API gateway in decoupled mode (outlined as an alternative solution below), hosting both the data and control plane, along with an etcd cluster, we instead deploy in standalone mode. Standalone mode means the configuration is stored in a local YAML file on the APISIX instance. The APISIX instance is purely the data plane, and we can scale to meet requirements. The API gateway can be deployed at the cluster level, in front of the accessible services, providing a single entry point for all requests. Alternatively, multiple API gateways can be deployed in the same cluster, at the edge of each logical boundary, serving a related collection of microservices.
5.2.4.3.1 Topology

Figure 58: API Gateway - Standalone
The above topology diagram shows the API gateway deployed at the edge of the cluster, in front of the accessible services.
5.2.4.3.2 Remarks
The benefits of this standalone approach are:
* Cheaper:
* Cheaper running costs as an etcd cluster is not being hosted, and further APISIX instances are not needed to act as control plane or ingress controller.
* Cheaper monitoring costs as those missing instances are not being monitoring, and extra logs are not being ingested.
* The etcd cluster does not require backup
* Compared to the micro-gateway approach, an instance of the API gateway is not required for every microapp.
* Simpler:
* All the configuration is stored in a single file, and there is no need to configure the APISIX instance with etcd or control plane information.
* Only deploying the data plane instances with no dependencies on other services, wait for etcd to be ready, and so on.
* Easier to restore in the event of total failure, as the API gateway can be restored from the YAML file.
* Compared to the micro-gateway approach, this is a more established pattern of using an API gateway.
The drawbacks of standalone mode are:
* Not using the Ingress Controller and defining config as CRDs:
* In a Kubernetes native environment, using CRDs to define configuration is a more natural fit.
* The Ingress Controller would allow each service to define their own endpoints, including parallel deployments to enable testing. Although if the common ConfigMap approach is used as detailed below, a given service can first get the existing config, append their own, and then apply the new config with the gateway is running in standalone mode. However, the automation to do this would need to be investigated, and concurrent updates may cause a problem.
* Defining the config in a YAML file and applying changes to multiple instances; there are two ways to do this:
* Copy the updated file to each instance, using a command like kubectl cp in a script which iterates over the instances. This has the benefit of not needing to restart the pods for the changes to take effect. The YAML file is read every second.
* Use a ConfigMap to store the configuration, and mount it as a volume in each instance. This has the benefit of not needing to copy the file to each instance, but the pods will need to be restarted for the changes to take effect. The restarts can be handled in a few different ways such as triggering a rolling restart, or following the convention of creating a new ConfigMap and updating the deployment to reference the new one.
The drawback of the cluster level approach is:
* Having the configuration centralized means that every change will need to be reviewed and merged by another team. See Centralized configuration vs service owned configuration for more details.
5.2.4.3.2.1 Data consistency guarantees
By defining the config in a single YAML file, and only applying it via Terraform, there should be no inconsistencies. Only in the event of manual intervention, such as editing the file directly on the instance, would there be a risk of inconsistency.
5.2.4.3.2.2 Fault tolerance and disaster recovery guarantees
The data plane instances are stateless, so an instance failure can be tolerated. In the event of total failure, a restore can be easily performed from the YAML file. By having multiple instances, more requests can be handled and high availability provided. Given each host is expected to have two availability zones, it is proposed having an even number of instances balanced across the zones:
* 2, one in each zone
* 4, two in each zone
* 6, three in each zone, and so on
5.2.4.3.2.3 Monitoring and alarms
Support for various monitoring, alarms, and logging is available. The Prometheus plugin exports the following metrics in Prometheus exposition format:
* http_status HTTP status code returned from Upstream services. Includes the code, route, matched URI/Host, service/consumer/node.
* http_latency Histogram of the request time per service in different dimensions.
* bandwidth Total amount of traffic (ingress and egress) flowing through APISIX. The total bandwidth of a service can also be obtained.
* nginx_http_current_connections Nginx connection metrics like active, reading, writing, and number of accepted connections.
* batch_process_entries A gauge type useful when Plugins use batch process to send data. Entries that have not been sent in batch process will be counted in the metrics.
* apisix_upstream_status Health check result status of upstream nodes: a value of 1 represents healthy while 0 represents unhealthy.
* shared_dict_capacity The capacity of each Nginx shared dict since APISIX start.
* shared_dict_free_space The free space of each Nginx shared dict since APISIX start
5.2.5 Solution analysis
5.2.5.1 Centralized configuration vs service owned configuration
5.2.5.1.1 Centralized configuration
Once the overall solution takes shape, we will know the layout of the network and the services that are being offered. Having a centralized configuration allows us to manage the routing and access control in one place. Some configuration will always be centralized as they are not service specific, such as plugins for tokens and authentication, and logging. Having a single source of truth can prevent duplication.
5.2.5.1.2 Service owned configuration
As each service is deployed, it will provide its own configuration to the API gateway via the use of CRDs to the ingress controller. This relies on the API gateway already running, but does mean the API gateway does not have to wait for all the services to be deployed. Branch deployments can deploy a new version alongside existing services in a long-running environment so that wallet/v1 and wallet/testid-123 can coexist, and the tests can route to the new version to verify it works. This alternate routing can also be achieved via headers, cookies, or query parameters. If the routing configuration was centralized, every update would need to involve another team to review and merge the change ahead of deploying the branch.
5.2.5.1.3 Result
Service-owned configuration is the preferred approach.
5.3 Service mesh
We want to enforce consistent communication between applications and services running in Kubernetes while decoupling the details of that communication from the application logic. A service mesh provides such a mechanism. In this design, we recommend using Buoyant’s Linkerd service mesh.
5.3.1 Expectations
The solution is expected to manage synchronous HTTP interactions between applications and services running within a Kubernetes cluster. In particular, it must secure those communications with mTLS, and ensure that only applications authorized to interact are allowed to do so.
Additional benefits that may derive from the use of a service mesh include:
* Monitoring of inter-application traffic
* Intelligent load balancing of requests
* Traffic management, for example, rate limiting and traffic splitting
* Improve resiliency, for example, by implementing retries, timeouts, and circuit breakers
5.3.2 Prerequisites
5.3.2.1 Terminology
* Control plane: The part of the service mesh responsible for managing and configuring the behavior of the data plane.
* Data plane: Handles the flow of traffic between services; often implemented via sidecar proxies.
* mTLS: mutual Transport Layer Security; requires using certificates for both client and service authentication.
* Sidecar proxy: A lightweight service deployed alongside each application instance that intercepts traffic and applies policies from the control plane.
5.3.2.2 Background reading
* What is a service mesh?
* Linkerd documentation
5.3.3 Requirements
5.3.3.1 In scope
* mTLS must be used to secure HTTP communication between applications.
* Only authorized communication must be permitted.
* The solution must scale with application deployments.
* Any additional latency and resource utilization introduced must be minimal.
* Open-source solutions are desirable, but commercial support must be available.
5.3.3.2 Out of scope
* The service mesh is not required to handle cross-cluster communication.
5.3.4 Solution design
5.3.4.1 Proposed solution
5.3.4.1.1 Architecture/context
The proposed solution is to deploy a service mesh (Buoyant’s Linkerd) to each Kubernetes cluster. Most other service meshes (for example, Istio and Consul) use a generic proxy such as Envoy. Linkerd has a custom-built proxy that minimizes the resource overhead and the additional latency. The service mesh will be used to enforce mTLS between Kubernetes pods, and restrict access based on authorization policies.
5.3.4.1.2 Topology
The following diagram illustrates the Linkerd service mesh architecture:

Figure 59: Linkerd’s Architecture
5.3.4.1.2.1 Control plane
The control plane is installed once per Kubernetes cluster using a Helm chart. The components of the control plane are deployed into a single namespace and are as follows:
* Destination service: Used by the data plane proxies to fetch information for service discovery, policies, and service profiles.
* Identity service: Acts as the TLS certificate authority, responding to certificate-signing requests from proxies.
* Proxy injector: A Kubernetes admission controller that adds the linkerd-proxy and linkerd-init data plane container to pods at deployment time.
5.3.4.1.2.2 Data plane
The data plane consists of proxy and init containers injected into every application pod by the control plane’s proxy injector.
The linkerd-init container sets up iptables rules to route all traffic to and from the pod through the proxy. The proxy is a lightweight component written specifically for Linkerd that implements the following capabilities:
* Proxy for HTTP, HTTP/2, and arbitrary TCP protocols
* Prometheus metrics export
* Web sockets support
* Latency-aware layer-7 load balancing
* Automatic mTLS
* Service discovery
* Policy-based authorization checks
5.3.4.1.3 Features
The Retail CBDC solution will use the following features of Linkerd.
5.3.4.1.3.1 HTTP proxy
All internal HTTP communication within the Kubernetes clusters will be proxied via Linkerd. This includes inbound traffic from the API gateway to applications and direct communication between applications.
5.3.4.1.3.2 Automatic mTLS
We will use Linkerd’s default behavior of providing mutual TLS for HTTP traffic. Linkerd uses TLS 1.3 and TLS_CHACHA20_POLY1305_SHA256 as the cipher suite.
The certificates are not exposed outside the cluster, so they do not need to be issued by an enterprise certificate authority. The initial trust anchor, along with the CBUAE certificate and key, should be generated by the cluster’s instance of HashiCorp Vault. The trust anchor’s certificate, and the CBUAE certificate and key, should then be made available to Linkerd via cert-manager. Vault and cert-manager can then automate their rotation, as outlined in this article.
5.3.4.1.3.3 Telemetry and monitoring
Linkerd can collect data about traffic passing through the mesh:
* Request volume, success rate, and latency distributions.
* Reporting metrics per service, per caller/callee pair, or route/path.
* Generating topology graphs that display the runtime relationship between services.
By default, Linkerd deploys its own Prometheus instance to store these metrics for a short period. This should be disabled, and the metrics should be scraped directly by the observability solution deployed in the cluster. The Linkerd documentation provides details of the endpoints to scrape. Note that if the observability solution is not Prometheus compatible, the Linkerd Viz extension’s visualizations will not be usable.
Linkerd can also participate in distributed tracing by installing the Linkerd-Jaeger extension. Despite its name, this extension can be configured to emit trace spans in OpenTelemetry format. The OpenTelemetry collector can then send these spans to the observability backend.
5.3.4.1.3.4 Load balancing
Linkerd will automatically load balance requests across all available service endpoints. It uses an exponentially weighted moving average algorithm to target the fastest endpoints.
5.3.4.1.3.5 Authorization policy
Linkerd provides the ability to restrict traffic using authorization policies. The default policy should be to deny access. Applications should then define policies to enable access for specific identities to HTTP routes authenticated via mTLS. When configuring policies, Kubernetes probes must not blocked.
5.3.4.1.3.6 Egress
Similarly, egress network traffic policies should be defined for the service mesh to restrict outbound traffic. The default behavior should be only to support egress to other participants in the network.
5.3.4.1.3.7 Automatic proxy injection
Linkerd automatically adds the data plane proxy and init container to pods at deployment time via a Kubernetes admission webhook for namespaces, deployments, or pods with a specific annotation. For this solution, proxy injection should enabled at the namespace level, and disabled for specific pods as necessary.
5.3.4.1.3.8 Helm install
Linkerd will be installed via its Helm chart. This Helm chart install will be wrapped in a Terraform module for deployment with the other cluster-level services.
5.3.4.1.4 Availability guarantees
The Linkerd control plane will be installed in high availability mode. This mode:
* Runs three replicas of critical control plane components.
* Sets anti-affinity policies so that these replicas are scheduled on different nodes and, if available, different zones. This requires at least three nodes in the Kubernetes cluster.
* Sets production-ready CPU and memory resource requests on control plane components and data plane proxies.
* Configures the proxy injector admission webhook so it must be invoked as part of a deployment.
5.3.4.1.5 Data consistency guarantees
The service mesh does not persist any data.
5.3.4.1.6 Fault tolerance and disaster recovery guarantees
Within a cluster, fault tolerance is provided by the highly available deployment of components in the control plane and the co-location of proxies within application pods. The service mesh itself is scoped to the cluster and has no runtime state that needs to be replicated to another data center in the event of a cross-site failover. The absence of any state also means that, if necessary, the mesh can be rebuilt from Infrastructure as Code in the event of a disaster.
Applications can use the capabilities of the service mesh to improve the fault tolerance of the solution as a whole; for example, by configuring retries and timeouts on HTTP routes and circuit breaking on services.
5.3.4.1.7 Security guarantees
When configured as described above, Linkerd will guarantee the use of mTLS for HTTP traffic within the Kubernetes cluster. It will also ensure this traffic is only between authorized pods.
5.3.4.1.8 Monitoring and alarms
The availability of the control plane is critical to the successful operation of the service mesh. Kubernetes monitoring should, therefore, be used to detect when control plane components are not healthy.
Rotation of the trust anchor and CBUAE certificates is also vital for correct operation. The metric certmanager_certificate_expiration_timestamp_seconds exposed by cert-manager should be tracked.
5.3.4.1.9 Continuous integration
The service mesh should be transparent to the solution, so the crucial test is that the solution continues to operate successfully when the mesh is enabled. Testing then needs to ensure that the service mesh correctly enforces mTLS by attempting to connect from a pod outside of the mesh and from a pod inside the mesh that is not authorized.
5.3.4.1.10 Technology choice analysis
The following alternatives to Linkerd were considered: Istio, Red Hat OpenShift Service Mesh, Consul, and Cilium. The pros and cons of each are considered in more detail in the following sections, but Linkerd was selected primarily due to its lower latency and resource usage.
5.3.4.1.11 Istio
Istio offers a comprehensive set of features, making it suitable for complex environments requiring advanced traffic management and security capabilities.
5.3.4.1.11.1 Istio pros
* Security features, including mTLS and integration with external CAs
* Extensive and robust traffic management features
* Large, active community which continue to create supported releases every quarter; including patches and security updates.
* Several commercial vendors that offer support for Istio
* Fine-grained service authorization through its Authorization Policies
* Automatic sidecar injection for transparent deployment
* Backed by the Cloud Native Computing Foundation (CNCF)
* Multi-cluster and multi-region deployments out of the box
* Previous R3 experience
* Egress gateway for managing outbound traffic
* Does not require a separate key-value store
5.3.4.1.11.2 Istio cons
* Steep learning curve and higher complexity due to its flexibility and extensive feature set, much of which is not needed by the solution
* Higher latency than Linkerd
* Consumes more resources than Linkerd
5.3.4.1.12 Consul
Consul is known for its strong integration with HashiCorp products and built-in key-value store, providing additional functionality beyond typical service mesh features.
5.3.4.1.12.1 Consul pros
* Security features, including mTLS and integration with external CAs
* Integration with other HashiCorp products, such as Vault and Terraform
* Built-in key-value store, which can be used for dynamic configuration and service discovery beyond simple mesh functionality
* Multi-cluster and multi-region deployments out of the box
* Service-to-service authorization through intentions
* Transparent proxy injection process
* Some previous R3 experience
* Egress gateway (terminating gateway) for managing outbound traffic
* Not limited to Kubernetes
5.3.4.1.12.2 Consul cons
* Performance characteristics are comparable to Istio but not as lightweight as Linkerd
* Steep learning curve for teams not familiar with HashiCorp products.
* Not as widely adopted in the Kubernetes ecosystem compared to Istio or Linkerd
5.3.4.1.13 Red Hat OpenShift Service Mesh
Red Hat OpenShift Service Mesh builds on Istio’s features, offering additional components and seamless integration with the OpenShift ecosystem.
5.3.4.1.13.1 Red Hat OpenShift Service Mesh pros
* Based on Istio, providing many of Istio’s robust features.
* Offers enterprise-grade support from Red Hat.
* Included in the OpenShift Container Platform subscription.
* Provides additional components like Kiali (for visualization) and Jaeger (for distributed tracing) out of the box.
* Integrates well with the OpenShift ecosystem.
* Extends Istio’s Role Based Access Control (RBAC) features, allowing for more advanced header matching using regular expressions.
* Egress gateway for managing outbound traffic.
* Multi-tenant control plane by default, which differs from Istio’s single-tenant approach.
5.3.4.1.13.2 Red Hat OpenShift Service Mesh cons
* Requires opt-in for sidecar injection using an annotation, without labeling projects, unlike Istio’s automatic injection.
* Does not support Istio installation profiles or canary upgrades of the service mesh.
* Higher latency and resource consumption compared to Linkerd, similar to upstream Istio.
* Versions may lag behind upstream Istio.
5.3.4.1.14 Cilium
Cilium stands out for its innovative use of eBPF, providing high-performance networking and security features without the need for sidecars. However, it has faced criticism regarding potential resource contention and security vulnerabilities.
5.3.4.1.14.1 Cilium pros
* Leverages eBPF for efficient networking and security, potentially reducing the need for sidecar proxies and improving performance, latency, and resource utilization.
* Provides robust network observability and security features through Hubble, enhancing visibility into network traffic.
* Backed by Isovalent, which offers commercial support, making it a reliable choice for enterprises.
* Enforces security policies directly in the Linux kernel, using eBPF.
* Integrates with external CAs.
* Egress gateway for managing outbound traffic.
5.3.4.1.14.2 Cilium cons
* Node-level proxies can introduce contention, high memory usage, and the confused deputy problem, affecting performance and security under heavy load.
* Cilium is part of the CNCF ecosystem and has strong community support, but is newer compared to more established meshes like Istio and Linkerd.
* Traditional mTLS and advanced L7 features cannot be done via Cilium’s ‘next-generation mutual authentication’ and must still go via the Envoy proxy.
* Cilium’s ‘next-generation mutual authentication’ is relatively new and may not meet the strict security requirements of a financial organization.
* Cilium faced security issues in the past, which could impact trust and reliability.
5.3.5 Solution analysis
5.3.5.1 Concerns and observations
Introducing a service mesh will increase request latency and resource utilization. Linkerd was selected as the option with the lightest proxy to minimize those overheads.
5.4 High availability, failover, and backup/restore
High availability (HA), disaster recovery (DR), and backup and restore are critical aspects of any system design. This document outlines the HA, DR, and backup strategies for the Corda network.
5.4.1 In scope
* High availability within a Kubernetes cluster
* Disaster recovery across Kubernetes clusters
* Backup and restore of persistent data
5.4.2 Terminology
* RTO: Recovery Time Objective; the maximum acceptable time a system can be down after a failure.
* RPO: Recovery Point Objective; the maximum acceptable amount of data loss after a failure.
* DC: Data center
* DLT: Distributed Ledger Technology
* TTL: Time To Live; the amount of time a DNS record is cached before it is refreshed.
5.4.3 High availability
5.4.3.1 What high availability means
High availability is the ability of a system to remain operational continuously for an extended period. The system’s uptime is a measure of availability, which is the percentage of time that the system is operational. High availability is achieved by eliminating single points of failure in the system, ensuring that the system can continue to operate even if one or more components fail, and automated recovery of failed components. As well as failure, another factor to consider is applying updates to the system without causing downtime. In the context of the proposed solution, where two data centers are running in active and hot standby, we shall consider high availability within each data center and failover between them.
5.4.3.2 High availability within a Kubernetes cluster
In short, high availability within a Kubernetes cluster is achieved by deploying multiple replicas distributed across Kubernetes nodes. The nodes will be physically separate hardware to ensure that a failure in one node does not affect multiple replicas. The deployment manifests of the components will be configured to have multiple replicas, with a policy in place to distribute these replicas across the nodes. Kubernetes will also provide high availability by load balancing requests across replicas and rescheduling any that fail. This approach will provide high availability in the following scenarios:
* A single instance of an application becomes unresponsive
* Primary database fails
* Kubernetes node fails
* Network failure affecting a single node
* Rolling updates
* Canary or A/B testing
5.4.3.3 Component-specific details
5.4.3.3.1 PostgreSQL
There will be one primary PostgreSQL instance and multiple standby instances, with synchronous streaming replication between.
In the event of one of the instances failing, the Cloud Native PostgreSQL (CNPG) operator will automatically restart the instance. For performance, data is persisted to local disk. If a database instance restarts on the same node, it can resume where it left off. If the database instance fails over to another node, it needs to be restored from another instance.
Should the primary instance fail, the operator will promote a standby to be the primary. As data replication is synchronous, and the cluster is configured to operate in a quorum, there is no data loss. Should the number of instances fail below the required number, the database will refuse to accept new commits until the quorum is restored. Database clients use a Kubernetes service that the operator updates to point to the current primary.
5.4.3.3.2 Apache Ignite
There must be an odd number of Apache Ignite instances to achieve a quorum. Ignite does not have the concept of a master or leader; all nodes are equal in the same DC with synchronous replication. On detecting a failure with any instance, Kubernetes will restart the failed instance. Apache Ignite does not automatically manage cluster memberships, but needs to be triggered.
5.4.3.3.3 NATS streaming
An odd number of replicas is required to form a quorum. A NATS cluster operates without an explicit master; all instances are equal in the same DC with synchronous replication. The cluster uses the Raft consensus algorithm to elect a leader for business logic processing. On detecting a failure with any instance, Kubernetes will restart the failed instance. If required the Raft consensus algorithm will elect a new leader.
5.4.3.3.4 Infinispan
A minimum of three replicas is used to provide a highly available service. Infinispan is peer-to-peer and considers all instances as equal (hence no primary/secondary). Infinispan will use synchronous replication between its instances. The Kubernetes kubelet detects a failed readiness probe resulting in the application instance being removed from the service endpoints. HTTP traffic is routed to other available instances. Where the failed instance was the primary key owner, an internal re-configuration is done so that another instance will take over key ownership. Kubernetes restarts the application instance (on another node if the original is no longer available).
5.4.3.3.5 HashiCorp Vault
A minimum of 3 replicas is required in order to provide a highly available service. Data is synchronized between instances using its internal Raft storage which automatically gets replicated between instances. Underlying Vault Raft storage solution detects a failure, and a standby is promoted to be the primary via leader election. Kubernetes restarts the failed database instance (on another node if the original is no longer available). No data loss due to synchronous replication to standby. In the event of one of the standby instances failing, Kubernetes will automatically restart the instance. Standby nodes can perform read-only operations in the Enterprise version of Vault. Write operations, such as credential or key rotation events, are always forwarded to the leader, but these are infrequent in the proposed solution. Write operations are not considered committed; that is, they are not acknowledged as successful to the client unless a quorum of nodes has indicated that the write operation has been successful. This effectively makes this synchronous replication as long as at least one single node with the latest data set remains up at any one time.
5.4.4 Cross-site failover
5.4.4.1 What cross-site failover means
As described above, the solution aims to remain highly available within a single data center. If availability cannot be maintained, then a failover to the standby data center is triggered. Example scenarios include loss of connectivity to a DC or a power outage.
5.4.4.2 How cross-site failover between Kubernetes clusters is achieved
The proposal is to use F5 BIG-IP DNS (previously known as Global Traffic Manager or GTM) to route HTTP traffic. In the event of a failure, any DNS queries will be given an IP for the standby cluster instead of the previously active one, routing traffic to the standby cluster. Previous DNS requests will need to wait for the TTL, and thus this should be made relatively short, but not short enough that clients are continuously making DNS requests.
F5 BIG-IP DNS determines when to fail over through use of what it calls “health monitors”. To accurately determine health, there are a number of predefined out-of-the-box health monitors for different application types, as well as user-defined monitors.
Once failover is triggered for a given cluster, all processing for that cluster will fail over to the standby data center. Some components will be immediately ready to handle new traffic, while others have their own failover mechanisms that need to be invoked. Depending on how F5 BIG-IP DNS is configured, it can send a notification to a webhook when a failover occurs. F5 BIG-IP DNS can also support triggering scripts in the event of a failover/change of state. If this is not possible for some reason, monitoring similar to the health monitors in F5 BIG-IP DNS must be configured as an external concern. This would mean setting up monitors using the chosen observability tooling to watch hardware, services, and network stats to determine health.
It must always be possible to invoke a failover manually; for example, to facilitate maintenance.
Testing the failover process regularly is crucial to ensure that it works as expected when needed. It also keeps the process fresh in the minds of the team, reducing the risk of mistakes being made during a real failover event.
5.4.4.3 Component-specific details
5.4.4.3.1 PostgreSQL
A second PostgreSQL cluster will be configured in the DR site to receive updates via asynchronous streaming replication. The CNPG operator will be running in each data center to manage the failover process.
In the event of a controlled failover where the primary database remains available, the CNPG Operator in the active DC can be used to demote the primary, gathering a token. The CNPG operator in the standby DC can then be used to promote the standby database, using the same token. The token ensures that the replica has caught up before accepting any new transactions, ensuring that there is no data loss.
In the event of a catastrophic failure, the CNPG operator in the standby DC will promote the secondary database without a token. This may result in some data loss due to the replication lag between the two sites.
Monitoring will be in place to watch for common issues like running low on storage space, read/write speed, connection pooling, and pod errors. Determining when to fail over will be handled by the top level trigger detailed in the above section.
5.4.4.3.2 Apache Ignite
Within each DC, the Apache Ignite cache cluster is configured with synchronous replication. There is no replication at all between Ignite clusters in the two DCs. Ignite would have to rebuild the token selection cache from the Postgres ledger database.
5.4.4.3.3 NATS streaming
There will be two NATS clusters, one in each data center. Within each data center cluster the replication is synchronous, but replication between the data centers is asynchronous. RTO is determined by time for async replication to bring the backup data center in sync with the failure point. During a planned failover, the process will trigger a process known as draining. New messages can be directed to the new data center, but the old data center will continue to process existing messages. Once we know all in-flight workflows in data center has been drained, the old data center can be shut down. In the event of a catastrophic failure, messages not yet replicated between the two DCs would be lost. In this situation, business flows could fail and time out and would have to be retried. The system’s idempotency should allow failed flows to be successfully retried from the source, such as a UI or mobile app.
5.4.4.3.4 Infinispan
Where session data is already replicated, logged-in users will see no interruption in service. If session data was not yet replicated, users would appear to be logged out. Logging in again would be required for these users. No persistent data loss would be experienced.
5.4.4.3.5 HashiCorp Vault
There will be clusters of Vault nodes in each data center. The failover mechanism leverages the fact Vault write operations are controlled with only infrequent write events, always limited to a single data center, that being the active one. This control over write operations means that we would likely have a stable system with respect to Vault data during the vast majority of site failover situations. The standby site will take over operations, and it will usually be fully up to date as is at that point. This is irrespective of the type of replication configured between the two clusters. In the unlikely scenario where a write operation was in progress during failover, it would not be considered completed in the data center actioning it, and neither site would be left in a state where data was lost. Where the failing site Vault cluster was still available, replication would continue and they system would return to a stable state eventually.
In edge cases, where an entire DC does find itself behind during a switchover end-entities (signers of data) might attempt to sign with old keys and thus their signatures could end up being considered invalid (if the certificate has expired or been revoked). This would preclude them from being involved in transactions, but it would not lead to any data loss. If old private keys’ certificates are still valid, signing with old private keys for a short period would not present a problem. Certificates which had already been replicated would be available for use in validating transactions. Where certificates were pending replication, signatures might be considered invalid, leading to transactions being rejected until replication was complete.
5.4.5 Backup and restore
5.4.5.1 What backup and restore means
Backup and restore is the process of making a copy of data and storing it in a safe place so that it can be recovered in the event of data loss or corruption. Whilst the system is active and replication is successful, you may feel you have no need to restore. However, there are scenarios where you may need to restore data, such as data corruption, accidental deletion, or a cyberattack.
5.4.5.2 How backup and restore is achieved
The backup and restore process will be automated and scheduled to run at regular intervals. The backup process will create a copy of the data and store it in a secure location, such as Commvault. The restore process will recover the data from the snapshot and restore it to the system. The backup and restore process will be tested regularly to ensure that it works as expected. In most cases, achievable RPO is determined by the backup interval and the time taken to determine the corruption.
5.4.5.3 Component-specific details
5.4.5.3.1 PostgreSQL
In the event of a catastrophic failure, data since the last backup will be lost in the event of a failure. The CNPG Operator will be used to restore the database from the last known good backup. Recovery cannot be performed “in-place” on an existing cluster; recovery is rather a way to create a new Postgres cluster starting from an available physical backup. The recover process will then reapply the WAL files containing the REDO log from the archive. Instead of replaying all the WALs up to the latest one, we can ask PostgreSQL to stop replaying WALs at any given point in time to achieve point-in-time recovery (PITR). Both base backups and WAL files are pulled from the secure location.
5.4.5.3.2 Apache Ignite
Data cached in Apache Ignite is mastered from other sources, data loss or corruption would require the cache to be re-hydrated from the master source: the ledger in Postgres. This process would be automated but initiating it would require manual intervention to trigger it.
5.4.5.3.3 NATS streaming
The workflow data stored in NATS does not require archiving due to its short-lived nature.
5.4.5.3.4 Infinispan
Infinispan’s built-in clustering support will ensure data is replicated from an instance which remained active. Loss of data is low impact and only results in users having to log in again. Resetting the session cache will log all users out, but not result in any loss of persistent data. Users will log in again and proceed as normal.
5.4.5.3.5 HashiCorp Vault
Loss of any private keys generated since last backup. End-entities (signers of data) must be subjected to the key rotation process. Until this is done they would attempt to sign with old keys, and thus their signatures could end up being considered invalid (if the certificate has expired or been revoked). This would preclude them from being involved in transactions, but it would not lead to any data loss. If old private keys’ certificates are still valid, signing with old private keys for a short period would not present a problem. Loss of certificates since last backup could potentially result in signatures of previously committed transactions being unable to be validated. This could prevent unconsumed states being inputs to new transactions: essentially it would stop CBDC being spent. The central certificate store can be repopulated from a network participant’s certificate authority (assuming this is not also corrupted). Mitigation here would come from ensuring certs are backed up prior to any private key being promoted, or making sure to have separate Vault service instances in every place a certificate is stored in Vault.
5.4.6 Open questions
1. How is the F5 BIG-IP DNS configured, and what supporting services are included in the package?
2. What is the current failover process?
3. What DC health monitoring is in place?
4. What is the current backup and restore process?
5. Who is responsible for testing the backup and restore process with Commvault?
5.5 Observability
Observability is the ability to gain insights into the internal state of the solution to ensure reliability, performance, and efficient troubleshooting. This is achieved by collecting, analyzing, and correlating metrics, logs, and traces. This design describes how observability is achieved during development and in production.
5.5.1 In scope
* The technologies the solution uses to expose metrics, logs, and traces.
* The use of observability by R3 during development.
* How the solution can integrate with a client’s existing observability tooling.
5.5.2 Out of scope
* Analysis of different observability solutions.
* Details of the metrics exposed or the alerts that they should trigger: the individual application designs cover these.
5.5.3 Proposed solution
5.5.3.1 Accessing observability data
This section discusses the technologies the solution uses to expose metrics, logs, and traces.
5.5.3.1.1 Metrics
Metrics from R3-authored applications are pushed out over HTTP using the OpenTelemetry protocol (OTLP). An OTLP HTTP endpoint should be provided as part of the solution deployment and this is propagated to all applications. HTTP is preferred over the gRPC alternative as it is supported more widely by observability solutions.
Other services deployed as part of the solution expose HTTP endpoints with metrics in the Prometheus format. These services are typically capable of creating PodMonitor or ServiceMonitor custom resources that an observability solution can use to automatically detect the endpoints to scrape.
5.5.3.1.2 Logs
All applications and services write logs to standard output/standard error. When running on Kubernetes, an observability solution is expected to read the logs from each Kubernetes node.
5.5.3.1.3 Traces
Distributed traces can be used to follow the path of requests as they cross from one application to another. As with metrics, traces are pushed out over HTTP using the OpenTelemetry protocol (OTLP).
5.5.3.2 R3 environments
R3 currently uses the following observability stack during development and testing:
* Grafana: Used for serving dashboards and exploring metrics, logs, and traces. Dashboards are authored by application teams and published to Grafana using Terraform.
* Loki: Used for receiving, storing, and querying logs.
* Tempo: Used for receiving, storing and querying traces.
* Prometheus: Used for receiving metrics.
* Thanos: Used for storing and querying metrics.
Loki, Tempo, and Thanos all use object storage for persisting data.
The following components are currently used to export data to the observability stack:
* Promtail: Used to forward logs for Kubernetes nodes to Loki.
* Prometheus Node Exporter: Used to expose Kubernetes node metrics in Prometheus format.
* Prometheus Postgres Exporter: Used to expose PostgreSQL metrics in Prometheus format.
* Kubernetes Event Exporter: Used to capture Kubernetes events for storage in Loki.
* kube-state-metrics: Used to capture metrics from the Kubernetes API and expose them in Prometheus format.
* Grafana Alloy agent: Used as an OpenTelemetry collector for forwarding OTLP metrics and traces to Prometheus and Tempo, respectively.
In addition to application-specific dashboards, development teams write automated tests that perform assertions based on metric data captured during test execution. These tests use the Prometheus query language PromQL to query the metrics data from Thanos.
5.5.3.3 Client environments
Clients need to provide an observability stack with equivalent capabilities to those available in the R3 environments; that is, offer the ability to:
* Receive OTLP metrics over HTTP.
* Scrape Prometheus-format metrics from Kubernetes pods.
* Scrape pod logs from Kubernetes nodes.
* Collect metrics and events for a Kubernetes cluster.
* Store and query metrics, logs, and traces.
* Create dashboards for metrics.
* Explore metrics, logs, and traces.
For example, Managed Dynatrace could support the requirements for storing and querying metrics, logs, and traces. Dynatrace also provides for dashboards and exploring metrics, logs, and traces.
The Dynatrace Operator Helm chart can be installed in a Kubernetes cluster to collect metrics, events, and logs from the cluster and its pods. The operator uses Dynatrace OneAgent, deployed as a DaemonSet, to collect host metrics. OneAgent can also be used to scrape Prometheus endpoints.
Applications sending metrics and traces via OTLP over HTTP, can either send them directly to the Dynatrace instance, or via a Dynatrace Collector deployed to the Kubernetes cluster. The use of the Collector is recommended, as it means details of the Dynatrace instance only need to be configured in one place.
Verifying the client-specific observability solution should be a part of operational acceptance testing.
5.5.3.4 Testing in client environments
As described above, R3 development teams have created dashboards and automated tests that depend on Grafana and PromQL. If we are required to execute performance testing in client environments, and the client is not using an observability stack with these capabilities, the following sections describe four options for how some or all of this functionality could be retained when testing in client environments; for example, SIT or UAT.
5.5.3.4.1 Option A - R3 observability stack
In this option, we deploy the same open-source stack that is used in R3 environments: Loki, Grafana, Tempo, Prometheus, and Thanos. This is deployed in addition to the client’s observability stack, with data going to both. A single stack instance can be reused across multiple environments, with data tagged with an environment label. Data only needs to be retained long enough to analyze test results.
The benefits of this option are:
* The existing dashboards and tests can be used unchanged.
* The development team’s familiarity with these assets means they can rapidly diagnose performance and functional issues.
5.5.3.4.2 Option B - OpenShift observability stack plus Grafana
OpenShift and OKD come with a built-in monitoring capability. By default, this covers the Kubernetes-level monitoring but also supports monitoring user-defined projects. The metrics capability is based on Prometheus and Thanos, so it supports the PromQL API required by the test assertions.
Although Grafana is not included, it can be installed separately via the Grafana Operator with Thanos as a data source. This would allow the development team to use the existing dashboards.
The benefit of this option over Option A is that there are fewer additional components to manage. As with Option A, data would be sent to both this stack and the client’s observability stack. Data only needs to be retained long enough to analyze test results.
5.5.3.4.3 Option C - Extend development artifacts to other observability stacks
As previously described, the tests currently use PromQL to retrieve metric data. In this option, the framework used by those tests would be extended to support other observability stacks; for example, by adding support for Dynatrace’s query language. Similarly, the dashboards could be recreated for other observability stacks. This change would require significant effort to implement and test. R3 would also require access to an instance of the observability stack, either by acquiring it for internal use, or by using the client’s environment.
5.5.3.4.4 Option D - Update fitness tests to toggle metric querying and asserts
The final option introduces a toggle or feature flag into the tests, which turns off the metric query and assertion. This would allow the existing tests to be used to drive load in an environment that does not support the Grafana stack. This would be a simple change to implement, but it would require manually analyzing the metrics in the client’s observability stack to determine test success.
5.5.3.4.5 Recommendation
Option B is the recommended approach, as it requires the least additional infrastructure and effort to facilitate any necessary testing. In the event that option B is dismissed, option D is the contingency.



6 Corda contracts
6.1 Overview
6.1.1 Summary
This document describes the detailed design of Corda contracts. The document will extend the design proposal outlined in the Corda Contracts High Level Design document.
6.2 Prerequisites
6.2.1 Terminology
* Corda network: A group of interconnected private networks operating network applications that interact with each other.
* Network application: An application running within the Corda network.
* Network identity: The identity of an organization within a Corda network.
* Application identity: The identity of an application within a Corda network.
* Application network identity: The identity of a network application on behalf of a network identity.
* Workflow: A defined sequence of steps within an application.
* JWT: JSON Web Token: used to represent an authenticated network identity.
* IAM: Identity and Access Management module: handles authorization requests for network identities as part of contract management.
6.3 Solution design
6.3.1 Summary
The Corda Contracts application is built to seamlessly integrate and enforce custom business rules within a Corda network. It offers a suite of services for network applications and external systems, enabling the creation, storage, and execution of contracts and rules on application data.
6.3.1.1 Context

Figure 60: System Context
6.3.1.2 Containers
* Contracts Service: Manages the lifecycle of contracts within the network. It provides functionalities for creating, storing, and retrieving contracts. Access is through a comprehensive HTTP API, enabling external systems and network applications to easily integrate for contract definition, storage, and management tasks.
* Contract Engine: Serves as the processing unit, evaluating contracts’ business rules against provided datasets. As a stateless component, it efficiently handles numerous validation requests, delivering high performance and reliability. It utilizes a dedicated rule language that ensures deterministic outcomes, providing consistent validation of business logic according to evolving standards while maintaining backward compatibility.

Figure 61: Corda Contracts Container Diagram
6.3.1.3 Components

Figure 62: Contracts Service API Component Diagram
6.3.2 Detail design
6.3.2.1 Contract Service API
The Contract Service API provides RESTful endpoints for creating, managing, and retrieving contracts and schemas. The following sections describe several of these APIs, although additional ones may also be available.
6.3.2.1.1 Contract Upload
The Contract Upload API allows users to upload a contract definition file that describes specific versions of contracts and data schemas. This operation is idempotent for the individual items within the file,; this allows a file evolve over time, adding new schemas and contracts. When a new version of the file is uploaded, the idempotency rules of the API will ensure only the new items within the file will be created and existing items will be ignored.
The API accepts an HTTP POST with the version as part of the path. The version is the target versions of the API. Future versions of the contract service might support multiple versions of the API; the initial version will be v1. The body of the post is a contract definition file YAML file.
If the upload was successful, the API returns a 200 HTTP response code. This only indicates the file was in a valid format and processed without any unexpected errors. Individual items, within the file, will have a corresponding processing status report in the definition file upload response, message returned by the API.
6.3.2.1.1.1 Workflow SDK Integration
The Contracts Service exposes HTTP endpoints through the Workflow SDK to facilitate seamless integration with other Corda applications.
Data Serialization:
* Requests: Clients must send data as binary content (application/octet-stream), which the Contracts Service deserializes into defined data models.
* Responses: The Contracts Service returns as binary content, which clients must deserialize on their end.
Response Status Codes:
* 200 OK: Returned when the request is successfully received. This does not mean it was successfully deserialized. If business logic errors occur, error details will be in the response body.
* 500 Internal Server Error: Returned when the HTTP Server encounters processing errors before it has passed data to the Workflow SDKs endpoint handler.
Error Handling:
* Technical errors trigger appropriate HTTP status codes (400/500).
* Business logic errors use 200 OK responses with structured error messages in the response body.
6.3.2.1.1.2 Contract definition file
The contract definition file consists of two main sections: schemas and contracts.
* Each section can contain one or more entries.
* Both sections are optional, although the file must contain at least one entry.
6.3.2.1.1.3 Schema definition fields
Field
Required
Description
name
Yes
Unique name for the schema. Used to reference this schema in contract definitions. Must be alphanumeric with optional hyphens and underscores.
version
Yes
Version identifier for the schema defined as an integer (for example, 1).
dataSchema
Yes
JSON schema definition, describing the structure of data that will be validated by contracts using this schema. Must be a valid JSON Schema document.
description
No
Human-readable description of what the schema represents and how it should be used.
Table 24: Schema Definition Fields
Contracts operate on well-known data structures and each contract requires a schema that defines the data structure available to the contract. A data schema is defined independently of any given contract and can be shared by multiple contracts. Each schema is identified by a name and version and, like contracts, they are immutable. Schemas are defined using the JSON Schema standard.
6.3.2.1.1.4 Contract definition fields
Field
Required
Description
name
Yes
Name for a contract. Should be descriptive of the contract’s purpose. Must be alphanumeric with optional hyphens and underscores.
version
Yes
Version identifier for the contract defined as an integer (for example, 1).
description
Yes
Detailed description of the contract’s purpose, constraints, and expected behavior.
tags
No
Array of string labels used for categorizing and searching contracts. Useful for organizing contracts by purpose or domain.
schema
Yes
Reference to a schema definition, containing fields for name of the referenced schema and version of the referenced schema.
languageVersion
Yes
Version identifier for the contract rules language implementation. Used to ensure compatibility with the contract engine.
code
Yes
The actual contract rule implementation written in the contract rules language. Must conform to the specified language version.
archived
No
Set to true to mark the contract as archived. This provides a mechanism to deprecate contracts. Archived contracts will not be returned by queries by name, version and tags.
configParams
No
Array of configuration parameter definitions referenced by contract code. Each parameter has name, type, and description fields.
certificateIdentifier
No
A hash of the Issuing CA identity of the certificate required to validate the signature combined with the certificate serial number. Required when importing signed contracts.
signature
No
The cryptographic signature of the contract, created using the network identity’s private key. Required when importing signed contracts.
Table 25: Contract Definition Fields
Contract definitions are used to create a compiled contract that can be executed by the Evaluation Engine. Contracts are defined by an identity, linking contract code to a specific data schema. They also include meta-data (tags) that can be used for categorizing them into sets and applying access controls. The config_params field contains the user configurable fields present within the contract that must be set when an evaluation is executed. The certificate_identifier and signature fields are optional during initial upload but are required when verifying contract authenticity during import. Additional details around R3’s PKI can be found in the Cryptography and PKI documentation.
See Contract and Schema Export API and Contract Verification sections for additional details.
6.3.2.1.1.5 Schema references
When referencing schemas within contract definitions, both the schema name and version must be specified to ensure deterministic behavior. This allows for schema evolution while maintaining backward compatibility for existing contracts.
6.3.2.1.1.6 File format notes
* The file must be valid YAML syntax.
* Names should follow consistent conventions within an organization.
* Tags should use a controlled vocabulary when possible to ensure consistency.
* The contract rules language version must match one supported by the contract engine.
* Schema definitions should be as specific as possible to ensure reliable contract evaluation.
6.3.2.1.1.7 Versioning guidelines
* Schema and contract versions should be updated when making changes to any contract or schema field.
* Version numbers starts at 1.
* When updating a contract or schema, the version must be incremented by exactly 1 compared to the previous highest version.
6.3.2.1.1.7.1 Contract language
Google CEL has been chosen as the expression language to be used for Corda contracts. The full CEL specification can be found here. CEL provides a secure, efficient, and extensible way to define and evaluate rules, making it well-suited for contract validation. Its strong typing and built-in safety mechanisms help prevent execution errors, while its expressive syntax allows for complex conditions to be written concisely.
Below is a sample rule written in CEL:
transactions.all(t, t.amount <= config.maxSingleTransaction) && transactions.map(t, t.amount).sum() <= config.maxSumTransaction
 && transactions.all(t, !(t.metaData['merchantCode'] in ['invalid', 'anotherInvalid', 'yetAnotherInvalid']))
This rule accepts a list of transactions as input data and a config object:
* transactions.all(t, t.amount != config.maxSingleTransaction) ? Ensures no transaction has amount of maxSingleTransaction
* transactions.map(t, t.amount).sum() <= config.maxSumTransaction ? Ensures total sum of amount is ≤ maxSumTransaction
* transactions.all(t, !(t.metaData[‘merchantCode’] in […] )) ? Ensures merchantCode is not in the invalid set
The following types are supported by the contract language:
* Strings
* Integers
* Boolean
* Floating-point numbers (doubles)
* Lists
* Maps
* Timestamps
* Durations
Contracts are compiled to an abstract syntax tree (AST) upon creation. They will be type-checked against the provided data schema for the rule. If the rule references a field which is not present in the schema, or if the rule attempts an operation on a field that is invalid for its type, then an error will be returned in the create rule response. Contracts may be tested by running rule evaluations using test data by the end users.
It will be possible to evaluate multiple contracts against the same data. See Evaluation API for further details. During contract evaluations, the ASTs and input data are processed by the evaluation engine and executed.
6.3.2.1.1.7.2 Definition file upload response
When a contract definition file is uploaded to the service, it is processed by the service and schema and contract entries are created for all valid entries in the file. As the file can contain multiple entries that can individually succeed or fail, the API outputs an upload response file that details the outcome for each entry.
6.3.2.1.1.7.3 HTTP response
The REST API can return the following HTTP status codes in response to a POST operation:
* 200 (OK): The HTTP request was successfully accepted.
* 400 (Bad Request): The request was not of the expected type. e.g. not valid binary content.
* 500 (Unexpected Error): An unexpected error was thrown while processing the request.
6.3.2.1.1.7.4 200 Response with business logic errors
When a business logic error occurs during processing, the API will return a 200 response. If the error is a caught exception, the API will return a 200 response with HTTP Response headers indicating the Workflow was successful.
HTTP Response Header
Type
Value
Description
Corda-Workflow-Status
String
SUCCESS
Indicates the request was successfully received and process
The response body containing the following fields:
Field
Type
Description
error.errorType
String
An error code associated with the error that occurred
error.message
String
The error message detailing what error occurred
6.3.2.1.1.7.5 200 Response with failed workflow
When a business logic error occurs during processing, the API will return a 200 response. If the error is an unexpected one, which caused the workflow to fail to process completely, the API will return a 200 response with HTTP Response headers indicating the Workflow was successful.
HTTP Response Header
Type
Value
Description
Corda-Workflow-Status
String
ERROR
Indicates the request was successfully received but an unexpected error occurred during processing
Corda-Workflow-Error-Type
String
FLOW_ERROR
Indicates the type of error that occurred
Corda-Workflow-Error-Message
String
Error message
An error message explaining why the workflow failed
The response body will be empty.
6.3.2.1.1.7.6 Item response
Field
Type
Description
Name
String
Name of the item
Version
Integer
Versions of the item
ID
String
The ID assigned by the system; this is only present for contracts
Status
String
See Item Processing States below
Reason
String
Optional reason for an item’s processing status
Table 26: Definition File Upload Response
6.3.2.1.1.7.7 Item processing status
When a contract or schema is processed by the API, the result can be one of the following states:
* SUCCESS - The contract or schema has been stored successfully.
* CONFLICT - The contract or schema already exists but the uploaded versions does not match the stored version. This is considered a failure.
* INVALID - The schema or contract is invalid and the item was not created. Details of the failure will be returned in the Reason field.
6.3.2.1.2 Contract and Schema Export API
The Contract and Schema Export API allows clients to retrieve all contracts and schemas present in the system. The output of this API will be a YAML file in the format of the contract definition file.
When contracts are exported, they will include:
* All standard contract fields
* The certificate_identifier field containing the identity of the institution that created the contract
* The signature field containing the cryptographic signature generated using the network identity’s private key
This enables contract authenticity verification when the definition file is imported.
The API will be versioned via the endpoints path; for example, “v1”.
6.3.2.1.3 Schema And Contract Retrieval API
The Contract Service implements a GraphQL-based API for querying contract and schema information. This approach was chosen over traditional query parameters for RESTful endpoints to provide more flexible and efficient data retrieval.
6.3.2.1.3.1 GraphQL implementation
The service utilizes the graphql-kotlin library and Ktor Server plugin to implement GraphQL functionality. The GraphQL endpoint /graphql complies with the GraphQL over HTTP specification and processes POST requests with proper request/response schemas.
6.3.2.1.3.2 Contract queries
The GraphQL API supports the following contract query capabilities:
* Query by ID: Returns a single contract matching the provided ID
* Advanced filtering: Query contracts by name, version, and/or tags
* Filters are case-insensitive for names and tags
* At least one query parameter must be provided for validity
* Archived contracts are excluded from results
Each contract in the response includes a complete model with all relevant fields as defined in the contract schema.
6.3.2.1.3.3 Schema queries
Schema information can be retrieved via GraphQL queries with:
* Optional name parameter (case-insensitive)
* Optional version parameter
* At least one parameter must be provided
6.3.2.1.3.4 Data flow
The GraphQL query resolver components interact with the Persistence Service layer to fetch the requested data. The implementation follows best practices to avoid over-fetching data by utilizing GraphQLs efficient data selection capabilities.
For each query type, the system returns appropriate responses:
* Empty result sets (no matches found) are treated as valid responses (HTTP 200)
* Appropriate error handling for invalid queries
6.3.2.1.3.5 Performance optimization
* Indexes can be created on name, version, and tags database columns to optimize lookups if required. See Contract Table for more details.
6.3.2.1.4 Contract data model
Once a contract has been uploaded and compiled, it is stored in a structured format to support efficient retrieval, versioning, and execution. The contract storage model consists of the following key components:
6.3.2.1.4.1 Contract lifecycle
1. Upload: A user submits a contract definition file.
2. Validation: The system validates the contract syntax, schema reference, and metadata.
3. Authenticity: For contracts which have been signed, the system validates their authenticity.
4. Compilation: The contract code is compiled into an executable format; for example, bytecode or an AST representation.
5. Storage: The compiled contract, along with its metadata, is stored in a persistent database.
6. Retrieval & Execution: Corda Contract clients can retrieve contracts by ID and execute them against input data.
7. Versioning & Evolution: Contracts are immutable once stored. New versions must be uploaded as a new entry. Existing contracts can be marked as archived without incrementing version.
6.3.2.1.4.2 Contract entity model
Each contract is stored in the relational database with structured entities.
The primary entities are:
6.3.2.1.4.2.1 Contract table
Column
Datatype
Description
PK?
FK?
Nullable?
Constraints
id
VARCHAR(255)
Deterministic ID
Y
N
N
N/A
name
VARCHAR(255)
Human-readable contract name
N
N
N
N/A
version
INTEGER
Contract version (immutable once created)
N
N
N
N/A
schema_id
VARCHAR(255)
Reference to the associated schema
N
Y (1:1)
N
N/A
language_version
VARCHAR(64)
Version of the rule language used
N
N
N
N/A
config_params
JSONB
Array of configuration parameter definitions referenced within a contracts code
N
N
Y
N/A
code
TEXT
Original contract source code
N
N
N
N/A
compiled_code
BYTEA
Serialized bytecode or AST representation
N
N
N
N/A
certificate_identifier
VARCHAR(255)
A hash of the Issuing CA identity of the certificate required to validate the signature combined with the certificate serial number
N
N
N
N/A
signature
VARCHAR(255)
The id signed with the network identity’s private key
N
N
N
N/A
Table 27: Contract Database Table
The deterministic ID for the contract table will be a hash of all fields except:
* signature: This is devised using the deterministic ID
* compiledCode: This is generated after the contract file is uploaded and is excluded to allow for minor changes to underlying boilerplate code and dependency updates which could alter the compiled bytes.
This ensures that identical contracts will have the same ID, facilitating signature verification during import. See Contract Verification.
Indexes for Performance:
CREATE UNIQUE INDEX idx_contract_Id ON contract(id);
CREATE INDEX idx_contract_schema ON contract(schemaId);
6.3.2.1.4.2.2 Contract metadata table
Each metadata update creates a new row, preserving historical records.
Column
Datatype
Description
PK?
FK?
Nullable?
Constraints
id
UUID
Unique ID for the metadata record
Y
N
N
N/A
contract_id
VARCHAR(255)
References immutable contract record
N
Y (1:N)
N
N/A
tags
JSONB
JSON array of tags
N
N
Y
N/A
description
VARCHAR(1024)
Human-readable description
N
N
N
N/A
is_current
BOOLEAN
Indicates if this is the latest version (TRUE for current, FALSE for historical records)
N
N
N
N/A
Table 28: Contract Metadata Table
Indexes for Performance:
CREATE UNIQUE INDEX idx_contract_metadata_current ON contract_metadata(contractId) WHERE isCurrent = TRUE;
CREATE INDEX idx_contract_metadata_contract ON contract_metadata(contractId);
6.3.2.1.4.2.3 Contract archive table
This table records a map of contract IDs to an archive flag. If a contract is archived, a mapping will be present and the archived column will be set to true. Archived contracts will not appear in contract queries by name, version and tags. They will be still be retrievable by contract ID.
Column
Datatype
Description
PK?
FK?
Nullable?
Constraints
id
UUID
Unique ID for the archive record
Y
N
N
N/A
contract_id
VARCHAR(255)
References the immutable contract record
N
Y (1:N)
N
Unique
archived
BOOLEAN
Set to TRUE to archive a contract
N
N
N
N/A
Table 29: Contact Archive Table
Indexes for Performance:
CREATE UNIQUE INDEX idx_contract_archive ON contract_archive(contractId);
6.3.2.1.4.2.4 Schema table
Each contract is tied to a schema that defines the structure of the input data it operates on. An index can be created on the name and version columns to optimize lookup performance for contract retrieval.
Column
Datatype
Description
PK?
FK?
Nullable
Constraints
id
UUID
Deterministic ID for the schema
Y
N
N
N/A
name
VARCHAR(255)
Schema name
N
N
N
N/A
version
INTEGER
Schema version
N
N
N
N/A
definition
JSONB
JSON Schema definition
N
N
N
N/A
created_at
TIMESTAMP
Timestamp when the schema was created
N
N
N
N/A
created_by
VARCHAR(255)
Identity of the user that uploaded the schema
N
N
N
N/A
description
VARCHAR(1024)
Human-readable description
N
N
N
N/A
Table 30: Contract Schema Table
Deterministic ID will be a hash of name, version and definition.
Indexes for Performance:
CREATE UNIQUE INDEX idx_schema_id ON schema(id);
CREATE INDEX idx_schema_name_version ON schema(name, version);
6.3.2.1.4.2.5 Contract audit log table
This table tracks all operations on contracts.
Column
Datatype
Description
PK?
FK?
Nullable
Constraints
id
UUID
Unique ID for each audit event
Y
N
N
N/A
contract_id
VARCHAR(255)
References immutable contract record
N
Y (1:N)
N
N/A
action
VARCHAR(255)
Example values: “CREATED”, “UPDATED_METADATA”, “ARCHIVED”
N
N
N
N/A
performed_by
VARCHAR(255)
The identity of the user performing the action
N
N
N
N/A
performed_at
TIMESTAMP
Timestamp of the action
N
N
N
N/A
Table 31: Contract Audit Log Table
Indexes for Performance:
CREATE INDEX idx_audit_contract ON audit_log(contractId);
CREATE INDEX idx_audit_performed_at ON audit_log(performedAt DESC);
6.3.2.1.4.3 ERD

Figure 63: ERD
6.3.2.1.4.4 Key design considerations
* Immutability: Contracts and schemas are immutable once stored.
* Versioning: New versions require a new entry with an incremented version number.
* Efficient retrieval: Contracts can be indexed for fast lookup by name, version, and tags.
* Security: Contracts are signed over by the network identity that created it to allow for verification of its authenticity.
* Audit: Logs are recorded for all actions taken around creation of schemas and contracts as well as updates for metadata.
* Scalability: Using PostgreSQL JSONB for flexible schema definitions and contract tagging.
6.3.2.1.4.5 Data storage & management
Postgres will be used to store rule and schema definitions. It is expected that the node operator will regularly back up/archive the database for disaster recovery scenarios. Rules and schemas uploaded will contain audit data such as who uploaded and when. Data retention policies will be set by the operator.
6.3.2.2 Access controls and security
The Contract Service API enforces fine-grained access controls to ensure only authorized users can manage and retrieve contracts by the client. Users will submit a JWT describing their identity signed by the IAM system. The token will contain details such as the identity of the user in the session as well as the network identity that they operate on behalf of. A request will be sent to the IAM module to determine what actions the identity is allowed to execute.
Access control is applied based on Attribute-Based Access Control (ABAC):
* Users are assigned claims (also known as attributes) by the IAM system, which describe their characteristics in a fine-grained manner; for example, department, clearance level, or contract type permissions.
* Authorization decisions are made based on these attributes rather than predefined roles.
* Contracts are categorized using tags; for example, “payments”, “finance”, and “compliance”.
* API access is restricted based on user attributes and their association with specific contract tags.
* Authorization checks are enforced by the IAM system, ensuring users can only create, retrieve, or execute contracts permitted by their attributes.
6.3.2.2.1 Contract verification
When new contracts are created without existing signatures, the system signs them using the private key of the service’s network identity. The deterministic contract ID is signed using a key belonging to the network identity. The network identity and signature are stored with the contract. The signature mechanism provides non-repudiation - entities cannot deny having created a contract which they have signed.
6.3.2.3 Evaluation Engine

Figure 64: Contracts Evaluation Component Diagram
The Evaluation Engine is responsible for executing compiled rules against structured input payloads. It is designed to process multiple rules per request efficiently and can be deployed as a sidecar container within the same pod as clients such as wallets or DLT services to further optimize rule evaluation times.
6.3.2.3.1 Contract Evaluation API
This section specifies the request and response formats for the Contract Evaluation API endpoint. The API supports batch evaluation of multiple rules against input data payloads.
6.3.2.3.2 Request format
6.3.2.3.2.1 Overview
The API accepts batch requests for evaluating multiple rules against input data. Each request contains:
* Input data with its schema specification
* One or more compiled rules to evaluate against the input
6.3.2.3.2.2 Request structure
A request structure is given below to illustrate the possibilities of the API.
Field
Path
Required
Description
requests
/
Yes
Array of evaluation request objects
input
/requests[]
Yes
Object containing input data and schema information
input.body
/requests[]/input
Yes
JSON string (escaped) containing the data to be evaluated
input.schema
/requests[]/input
Yes
Object identifying the schema used for the input data
input.schema.name
/requests[]/input/schema
Yes
Name of the schema defining the input data structure
input.schema.version
/requests[]/input/schema
Yes
Version of the schema defining the input data structure
input.schema.dataSchema
/requests[]/input/schema
Yes
The full data schema for the input data
compiledRules
/requests[]
Yes
Array of compiled rule objects to evaluate
compiledRules[].rule_id
/requests[]/compiledRules[]
Yes
Unique identifier for the rule
compiledRules[].config
/requests[]/compiledRules[]
No
Array of config parameters referenced within the contract being evaluated
compiledRules[].compiledRule
/requests[]/compiledRules[]
Yes
Base64-encoded compiled rule
Table 32: Contract Evaluation Request Fields
6.3.2.3.2.3 Request requirements
* Input data must conform to the specified schema.
* Schema name and version must match a previously registered schema.
* Compiled rules must be properly Base64-encoded.
* Rule IDs must be unique within the request context.
* User set config parameter values are passed in per contract.
6.3.2.3.3 Response format
6.3.2.3.3.1 Overview
The API returns a batch response containing evaluation results for each rule. The response includes details such as:
* Status of each rule evaluation
* Error details for failed evaluations
* HTTP status code indicating overall request status
6.3.2.3.3.2 Response structure
Field
Path
Required
Description
results
/
Yes
Array of evaluation result objects
evaluations
/results[]
Yes
Array of individual rule evaluation results
inputData
/results[]
Yes
The input data associated with thus evaluation result
ruleId
/results[]/evaluations[]
Yes
Identifier of the evaluated rule
status
/results[]/evaluations[]
Yes
Status of the evaluation (PASS/FAIL/ERROR)
reason
/results[]/evaluations[]
No
Error message (present only for ERROR status)
Table 33: Contract Evaluation Response Fields
6.3.2.3.3.3 Status codes
6.3.2.3.3.3.1 HTTP status codes
Code
Description
200
Request processed successfully (even if individual evaluations failed)
400
Malformed request
500
Unexpected server error during evaluation
Table 34: Contract Evaluation Status Codes
6.3.2.3.3.3.2 Evaluation status types
Status
Description
PASS
Rule executed successfully and conditions were met
FAIL
Rule executed successfully but conditions were not met
ERROR
Rule evaluation encountered an error
Table 35: Contract Evaluation Status Types
6.3.2.3.3.4 Error handling
* Individual rule evaluation errors do not affect other evaluations in the batch.
* The overall request returns HTTP 200 if the request structure is valid, regardless of evaluation results.
* Each ERROR status includes a detailed error message explaining the failure.
* Common error scenarios include:
* Schema validation failures
* Missing required fields
* Type mismatches
* Invalid compiled rules
* Runtime evaluation errors
6.3.2.3.3.5 Response processing notes
* Clients should check the HTTP status code first.
* For HTTP 200 responses, process individual evaluation results.
* FAIL status indicates business rule failure, not technical error.
* ERROR status requires error message inspection for troubleshooting.
* Response does not include original input data or compiled rules.
6.3.2.3.3.6 Performance considerations
* Response times scale with the number of rules and complexity.
* Batch processing may be parallelized.
* Large response payloads may require pagination in future versions.
* Consider implementing client-side timeout handling.
6.3.2.3.4 Deployment
To achieve low-latency evaluations, the Evaluation Engine can be deployed as a sidecar container within the same pod as the service’s client (or example, wallets or DLT).
This arrangement:
* Minimizes network hops by leveraging in-memory communication between containers.
* Provides dedicated processing resources for rule evaluations.
* Enables scalable horizontal deployment.
6.3.3 Monitoring and instrumentation
The Corda Contract Service utilizes the OpenTelemetry Protocol (OTLP) to export logs, metrics, and traces. Configuration is done through environment variables in the service’s container image. It is expected that the deployment includes an observability stack capable of effective monitoring and alarms. The rule evaluation engine will preserve tracing data from requests to responses. Metrics will be included to record the number of rule evaluations as as-well as time taken to run rules. System errors will be logged as well as errors related to rule evaluations. Details around schema upload and rule creations will be logged such as IDs, name, version, timestamp, tags and the user who uploaded. Successfully processed evaluations will not be logged to avoid unnecessary output.
6.3.4 Resilience and disaster recovery
The system is designed to be highly resilient and to support rapid recovery in the event of failures. Each wallet/DLT pod is deployed with a sidecar container running the Evaluation Engine, ensuring that rule evaluations are processed locally with minimal latency. Evaluation requests can be retried automatically in the event of transient failures. This helps to mitigate issues arising from temporary network disruptions or isolated service failures.
The contract store database should be periodically backed up by the database operator. Any contracts created and lost between backups can be re-uploaded. Contract IDs are deterministic so this should cause no issues.
6.3.5 Performance and scalability
Multiple replicas of Corda Contracts Service are maintained across the cluster to distribute load and ensure fault tolerance. If one replica fails, others remain available to process requests.
The Evaluation Engine is stateless and deployed as a sidecar container, alongside an instance of an application that uses it. The engine executes input payloads against compiled rules without requiring state lookups. This design ensures scalable throughput with low latency execution.
6.3.6 Infrastructure requirements

Figure 65: Corda Contracts Infrastructure Topology
6.3.6.1 Hosting
Each network identity within the Corda network will deploy its own instance of the Corda Contracts Service into a Kubernetes cluster dedicated to that network identity. The Corda Contracts Service will be deployed to its own namespace within the cluster.
6.3.6.2 Storage
6.3.6.2.1 Database
The Corda Contracts Service requires access to PostgreSQL database to store contract data. The service will require a dedicated schema for the network identity it is running as. The Corda Contracts Service requires the database to be configured as highly available and resilient to data loss.
6.3.6.2.2 Messaging
The Corda Contracts service is built using the Corda Workflow SDK, the SDK depends on NATS, a pub-sub messaging platform, for storing workflow state and asynchronous messaging. The service requires NATS resources to be segregated and secured by network identity. The Corda Contracts Service requires the messaging platform to be configured as highly available and resilient to data loss.
6.3.6.3 Downstream service dependencies
6.3.6.3.1 Corda Signing Service
The Corda Contracts Service is built using the Corda Workflow SDK. The SDK uses the Corda Signing Service to sign and validate messages sent between applications. The Corda Signing Service must be dedicated to the same network identity as the Corda Contracts Service and be deployed to the same Kubernetes cluster.
6.3.6.3.2 IAM Service
The Corda Contracts Service uses the IAM service to provide authorization checks for authenticated requests to the API.
6.3.6.4 Networking
The service needs connectivity to other dependent services (signing, database, and so on) within the same Kubernetes cluster.



7 Corda distributed ledger technology
7.1 Overview
7.1.1 Summary
This chapter outlines the technical details for the distributed ledger application (Corda DLT app) underpinning the digital currency. It discusses the approach and technologies chosen for the various components that form the underlying blockchain that will be used for instant settlement of CBDC transactions.
The Corda DLT app provides a simplified version of the distributed UTXO ledger from classic Corda, and packs that into a workflow SDK based microapp. This allows seamless integration within the backend for the CBDC solution. The simplified UTXO ledger provides strong guarantees of finally settled transactions between participants where both sides have cryptographic proof they see the same data. This eliminates the requirement for reconciliation, and the near instant settlement allows electronic transfers between participants without counterparty or credit risk.
7.2 Prerequisites
7.2.1 Terminology
* Block: In the context of this chapter, a block denotes a transaction between two DLT notes that can settle one or more transfers/transactions between end users. In this chapter we use block for ledger transactions and transfer for transactions between end users.
* DLT: Distributed ledger technology
* Issuer: Network participant that is allowed to mint (create) and burn (destroy) tokens. Allowed issuers are configured in the token type and can be enforced by each party as well as the notary.
* Node: A party in the Distributed Ledger Network. In Corda each node has its own view of the total distributed ledger, which may differ from another node’s view. A node’s view of the ledger contains only the transactions it was party to.
* Notary: In the context of the Corda DLT, the notary is a participant that checks that states are used as inputs only once; that is, it enforces that all inputs to blocks are unspent. In this design, we use a contract verifying notary that also enforces that all blocks adhere to the rules of a contract. Therefore, all states that come from a block signed by this notary are valid states without further checking their provenance as this is guaranteed by the notary signature.
* Token: Tokens here denote on-ledger states that represent real world value or assets; for example, monetary value.
* Token type: The type of a token defines all the properties a token has apart from its numerical value, including:
* What asset does this token represent
* Who can mint/create the token (the issuer)
* Who can notarize/confirm blocks containing this token (the notary)
* What additional rules govern blocks containing this token (contracts)
* Transfer: A transaction transferring CBDC between two end users or an end user and a merchant.
* UTXO: Unspent transaction output: a ledger model where all states on the ledger are defined as outputs of transactions. These states can be consumed when used as inputs to new transactions, and unconsumed states are valid/available states.
7.3 Solution design
7.3.1 Overview

[RN1][PM2]Figure 66: Corda 4 DLT Diagram
7.3.2 API
The Corda DLT app has no user-facing APIs. It has three APIs exposed to the wallet’s microapp. These are based on the workflow SKD’s HTTP start flow and the HTTP request/response model.
7.3.2.1 Mint API
The Mint API is a synchronous workflow API that runs a workflow creating tokens, and returns the result (success, or an error message) immediately.
7.3.2.1.1 Mint Request
The Mint Request payload is JSON that can be deserialized into a MintRequest class.
The following table shows the input fields for the request.
Field
Type
Comment
tokenType
String
Token type to be minted; this must match a token type configured on the application
amount
String
Amount to be minted; it must be possible to parse this into a BigInt greater than zero
extraAttributes
map of String to String
Additional data from the upstream system that the DLT app will store on the ledger but not use
Table 36: Mint Request Fields
7.3.2.1.2 Processing
The application instance that executes the mint request will be the issuer recorded on the minted tokens. Technically, any participant instance can mint tokens, but the network will be configured so that only tokens issued by the issuer participant can be used for transfers.
The token type is checked against the configuration. If it is a configured token type that can be issued by the processing participant, tokens with a total value matching the amount are created on the ledger.
7.3.2.2 Transfer API
The Transfer API expects a transfer request via an asynchronous flow message. The incoming transfer will be batched and processed. Once processed, the upstream applications on the sending and receiving side will be notified via an asynchronous notification message.
7.3.2.2.1 Transfer Request
The Transfer Request payload is a JSON string that can be deserialized into the TransferRequest class, which has all required details for the transfer.
The following table shows the input fields for the request.
Field
Type
Comment
id
String
ID of the transfer
sender
String
Network ID of the sending entity
receiver
String
Network ID of the receiving entity
amount
String
String representation of the amount to be transferred; must parse into a BigInteger
tokenType
String
Token type to use for the backing block
extraAttributes
map from string to any
Additional information provided/read by the upstream system; stored on the ledger, but not used by DLT
signature
list of SignatureDto
Signatures of the receiver confirming this transfer is expected
Table 37: Transfer Request Fields
The following table shows the format of a Signature DTO:
Field
Type
Comment
keyIdentity
KeyIdentityDto

signature
String
Encoded bytes of the cryptographic signature
timestamp
Instant
Time of signing
signatureSpec
SignatureSpecDto

Table 38: Signature DTO Format
The following table shows the format of a Key Identity DTO:
Field
Type
Comment
networkIdentity
String
Network identity of the signer/certificate
issuer
String
Identity of the certificate/key issuer
serial
String
Serial number of the certificate
Table 39: Key Identify DTO Format
Field
Type
Comment
signingAlgorithm
String

hashAlgorithm
String

maskAlgorithm
String

maskSpec
String

saltLen
Int

trailerField
Int

7.3.2.2.2 Processing
The DLT app will receive a transfer request for every single transfer originating via one participant of the network (from all end users transferring via this entity). These transfers are queued initially. In regular intervals triggered by a timer, a batching process will kick off and batch all transfers with the same target participant. A block will be created from each batch that transfers token in the value of all the batched transfers to settle the transfers between the participants. Once this is completed, the upstream participants will be notified (on the sender and the receiver side), and all transfers (payments) in the block are finally settled.
7.3.2.3 Burn API
The Burn API is a synchronous workflow API that attempts to burn (remove) tokens matching the requested amount and will return the result (confirmation or error message) immediately. Tokens can only be burned by their issuer and must be owned by the issuer as well. Any attempt to burn tokens that are either issued or owned by a different participant will fail.
7.3.2.3.1 Burn Request
The Burn Request payload is in JSON that can be deserialized into a BurnRequest class.
The following table shows the input fields for the request.
Field
Type
Comment
tokenType
String
Token type to be burned; this must match a token type configured on the application
amount
String
Amount to be burned; it must be possible to parse this into a BigInt value
extraAttributes
map of String to String
Additional data from the upstream system that the DLT app will store on the ledger but not use.
Table 40: Burn Request Fields
7.3.2.3.2 Processing
The Burn Request workflow will try to select the requested amount of the chosen token type. Suitable tokens need to match all of the following conditions:
* They are of the requested token type
* They are issued by the participant running this request
* They are owned by the participant running this request
* The sum of the available tokens matches or exceeds the requested amount.
If suitable tokens are available, they are consumed and thus removed from the ledger. If the sum of the consumed tokens was bigger than the requested amount, the difference will be created as a new token so that exactly the requested amount gets removed from the ledger.
7.3.2.4 Query API
The Ledger offers a query API for retrieving transaction blocks from its persistent store. This API leverages GraphQL, enabling users to define selection criteria and data projections based on the fields available in the Transaction Data Model outlined below.
7.3.3 Transaction data modeling
A number of transfers from one participant to a single other participant will be batched into one block. We will use a UTXO ledger transaction to represent each block. To avoid confusion with other forms of transactions, we will use the word block from here on for ledger transactions. Note that the classes will still use the word transaction for these as it uses existing Corda ledger functionality.
7.3.3.1 Block structure
7.3.3.1.1 In-memory representation
There is a code form of the transaction that holds fully inflated Java respectively Kotlin objects of all the parts of a transactions and can be used to interact with the contents. This is the form used when building blocks, verifying the contents, or reading out information.
The code form can be transformed into a model form that:
* Is immutable over time and across systems
* Can be sent over the wire or stored in persistent storage
* Is used to calculate the hash over the transaction, and thus the block ID
For the model form, blocks are represented as a collection of component groups. Each component group can have zero or more component of the type this group represents. The component group is a list of byte arrays, each holding the serialized data of one component.
The component groups in use for the DLT app are shown in the following table:
Index
Name
Comment
0
Block metadata

1
Notary information
This contains the notary to use, validity time window, and so on.
2
Outputs info
Information about the output states such as type information and restrictions
3
Commands info
information about the block commands such as type information
5
Inputs
References to input states
7
Outputs
Data for the output states
8
Commands
Data stored in commands
Table 41: DLT Component Groups
There is a signed transaction container that containing a model representation of the block plus signatures over the same. The signatures contain the signature bytes, plus all the required information to identify the certificate required to verify the signature.
7.3.3.1.2 Block ID
The block shall be identified by a hash over its component groups - a process that has been used in Corda since version 1; see Merkle trees in Corda. This starts by calculating the hash of each component. From this, we calculate a Merkle hash for each component group by using the components in one group as leaves of a Merkle tree. The overall block hash is then calculated in a second Merkle tree from the component group hashes. To make block IDs unique, but reproduceable, a privacy salt derived from the workflow deduplication logic is used to alt the hashing process.
7.3.3.1.3 Serialization
The content of the components is serialized using canonicalized JSON. This gives us a human and machine-readable language-independent representation of the data; that is, it can be understood by Corda DLT, by humans looking at the data, and by other tools such as those processing downstream or historical data. By canonicalizing the JSON string, we ensure that the content is cryptographically stable; that is, the hash over the content and thus the block ID and signatures cannot be changed by introducing non-significant changes like whitespace or formatting.
7.3.3.1.4 Persisted representation
The DLT application uses a persisted representation and database schema developed from the existing Corda storage approach. Therefore, the schema and entity relations use the phrase UTXO transaction rather than block in this paragraph.

Figure 67: Ledger Database Entity Relationship Diagram
Each block (UTXO transaction) gets stored as exactly one row in the utxo_transaction table. This is keyed on the block ID and holds information about the block.
It links to an entry in the utxo_transaction_metadata table that holds metadata about the block that might be required for processing or verifying later. This could include software versions, or PKI information at the point in time the block is created. The metadata is not supposed to change frequently, hence it is stored in a separate table and referenced by hash.
The main data content of the block is stored in the utxo_transaction_component table. This has a row for each component of each block, indexed by block ID, component group index and leaf index. The component group index determines into which component group the data belongs (for example, inputs and outputs), while the leaf index is the index into the component group (that is, output 0). The data is the content of the component serialized as canonical JSON. Storing the block in this denormalized way allows loading parts of a block without having to deserialize and parse the whole block.
The utxo_visible_transaction_output table stores information that makes it easier to find specific blocks, and the information required for token selection.
Signatures over blocks are stored in the utxo_transaction_signature table, keyed on the block ID and an index of the signature, as one block can and will have more than one signature attached (for example, initiator, recipient, or notary).
7.3.3.2 Block command
Each block will contain a single command that controls what functionality is represented. The commands will be:
* mint: This block will create new tokens on the ledger.
* transfer: This block will transfer the ownership of existing tokens.
* burn: This block will remove (burn) tokens from the ledger.
7.3.3.2.1 Storing transfer details
When finalizing a block, the individual transfer details are only required to verify the current block. They are neither required for validating the inputs of the consuming block nor are they consumed. Hence, there is no need to store the transfer details as states, but they need to be available as data on the block.
As a command needs to be created for each block (mint, transfer, burn), we can store the transfer details in the transfer command object. We just need to note that this will be a many-to-one mapping so each command will store multiple transfer details.
As the sender, receiver, token type and issuer will be the same for all transfers in a block, they will set directly as properties on the TransferCommand. In addition, there will be a map of TransferId to Details, where the Details contain the amount, the signature(s) and the `extraAttributes.
The following table shows the format for the Transfer command:
Field
Type
Comment
transfers
Map of ID to Details
A map holding the individual details of each transfer by transfer ID
sender
String
Network ID of the sender (common for all transfers)
receiver
String
Network ID of the receiver (common for all transfers)
issuer
String
Network ID of the issuer (common for all transfers)
tokenType
String
Token type used for backing the payments
Table 42: Transfer Command Fields
The following table shows the format for transfer details:
Field
Type
Comment
amount
BigInteger
Amount to be transferred
extraAttributes
Map of string to any
Additional information provided/read by the upstream system; stored on the ledger, but not used by DLT
signatures
list of Signature
Signatures of the receiver upstream up, confirming they expect this transfer
Table 43: Transfer Details Fields
7.3.3.2.2 Storing mint details
A similar structure as defined above in Storing Transfer Details will be used for the mint command. Note that there is no batching for mint blocks - we can just configure the amount to be minted. The combination of token sizes to be minted will be determined by the mint flow creating the block and does not need to be recorded on the command. Issuer and token type are recorded in the command so that the result of the mint command can be verified against the requested values.
The following table shows the format for the Mint command:
Field
Type
Comment
issuer
String
Issuer for the tokens to be minted
tokenType
String
Token type to be minted
amount
BigInteger
Value to be minted
extraAttributes
Map of string to any
Additional information provided/read by the upstream system; stored on the ledger, but not used by DLT
Table 44: Mint Command Fields
7.3.3.2.3 Storing burn details
A similar structure as defined above in Storing Transfer Details will be used for the Burn command. No batching is used when burning tokens - the burn flow will select tokens matching the requested amount. The issuer and token type are recorded in the command so that the selected inputs of the burn block can be verified against the requested values.
The following table shows the format for the Burn command:
Field
Type
Comment
issuer
String
Issuer for the tokens to be burned
tokenType
String
Token type to be burned
amount
BigInteger
Value to be burned
extraAttributes
Map of string to any
Additional information provided/read by the upstream system; stored on the ledger, but not used by DLT
Table 45: Burn Command Fields
7.3.4 Privacy and cryptography
7.3.4.1 Privacy in transit
Data in transit is sent via the Workflow SDK, which uses HTTPS/TLS to encrypt message in transit.
7.3.4.2 Privacy at rest
Data at rest is not encrypted - it is up to the operator to protect the ledger data base from outside attacks. The ledger database does not need to be accessible except from the DLT app, so it should be relatively easy to restrict access to it.
All private cryptographic material is handled by the crypto library using a Hashicorp Vault. The ledger app does not have direct access to private key material.
In the implemented UTXO ledger model, each participant app only gets access to information it needs to see to guarantee the integrity of its own ledger. Blocks are strictly only shared between involved participants. In order to validate a new block, participants need to see inputs. However, we use filtered transactions to strip all information from the input blocks that is not required to validate the new block. Using Merkle trees, it is possible to strip everything but the required outputs and the signatures from the input block. The concept has been a longstanding part of the Corda technology known as a transaction tear-off.
As we use a verifying notary, the notary signature over the inputs guarantees that this block has been created according to the rules set out by the network operator and hence can be trusted. There is no need to validate the input blocks as well as long as everyone agrees on trusting the validation and signature of the notary. The only participant that gets to see all blocks is the notary operator, as every block will have to be validated and signed by the notary and stored by the central bank.
7.3.4.3 Cryptography
Encryption keys as well as authentication tokens for data in transit are handled by the Workflow SDK; the ledger app itself is not opinionated on these.
Signing keys, certificates and algorithms are handled by the crypto library and are transparent for the ledger app. Participants and signatories are identified using SPIFFE IDs. The content of the SPIFFE IDs used in the solution is governed by a convention that gives a hierarchy of ids:
* Network ID: IDs identifying an organization’s network. They will have the form spiffe://<trust domain>/<organisation>. An example for “Org A” in the trust domain r3.com would be spiffe://r3.com/org_a.
* Application ID: IDs identifying a specific app within an organization network in the form spiffe://<trust domain>/<organisation>/<app id>. An example would be spiffe://r3.com/org_a/dlt.
* End Entity ID: IDs identifying a specific key within an application. They will have the form spiffe://<trust domain>/<organisation>/<app id>/<key id>. An example for the ledger key of “Org A” above would be spiffe://r3.com/org_a/dlt/ledger.
At the ledger layer, keys and signatures will be identified by end entity IDs. Each flow/app will have a specified app/key ID to sign with; for example, dlt/ledger for DLT participants, and dlt/notary for the notary flow. On-ledger identities will be linked to key IDs. Each organization’s on-ledger identity will be their ledger key ID, such as spiffe://<trust domain>/<organization>/dlt/ledger. Digital signatures will be identified via the entity identities of the signing key. Signing over ownership of states will require a signature with a matching key ID.
Because of the convention mentioned above, it will be possible to match key IDs to org IDs by stripping the key id from the end and create matching key IDs by adding the correct key. This will be used to verify that the signatory and sender of a block for processing match, and can be used to route, for example, notary requests based on the notary identity recorded in a block.
7.3.5 Finality & consensus
Finality is the process which ensures that blocks get agreed on and signed by all participants and get checked and signed by the notary.
7.3.5.1 Consensus model
The DLT app uses a consensual ledger model. In the current implementation, blocks are checked and verified by all parties, but apart from some basic checks like structural integrity of the block, these are not enforceable across the wire. The system does not guarantee that all parties run the same checks, or that an existing block has been checked with the current rules. Each participant checks the block and consents to the block becoming valid by signing it with a key attached to their identity. The final check is done by the notary (that will be under the control of the issuing entity), which verifies two things before signing:
* It runs a uniqueness check to make sure that all input tokens are unspent (so it is impossible to spend a token twice)
* It runs a block verification according to the rules set by the issuer which will include checking that all required participants have signed the block.
With the notary signature, the block becomes a valid block on the ledger, consuming its inputs and creating new states.
7.3.5.2 Notary implementation
The notary is implemented as a synchronous workflow that is called from the finality flow. The notary is run by the issuer of the token and needs to be part of the token definition used for the current block. The payload sent to the notary consists of the proposed block to be notarized, plus all the inputs of the block in the form of filtered transactions.
The notary workflow runs the following steps:
1. Deserializes the payload into a block to be notarized, plus the inputs.
2. Verifies the inputs: for each input, check that:
* It is a valid Merkle tree and the Merkle hash matches the state IDs
* It has been notarized by the same notary identity.
* Its notary signature can be verified
3. Verifies that all participants have signed, and their signatures are valid.
4. Runs block verification code to check that the block is built according to the rules enforced by the issuer.
5. Runs a uniqueness check to ensure states are only spent once:
* Checks that all inputs are in the list of unspent states.
* Removes inputs from list of unspent states.
* Adds outputs to list of unspent states.
6. Signs block with the notary key.
7. Stores block as verified (for reporting purposes).
8. Returns the signature.
As the notary keeps a definite list of unspent states that needs to be checked against, it is important that all notary instances share a database. This database is the golden source of valid states on the network, so needs appropriate protection, failover and back-up.
If either of the verification steps fails, the block gets stored as invalid and an error is returned to the caller.
7.3.5.3 Finality
Finality is implemented as a series of workflow steps that can be called from a business workflow (mint, transfer, burn) in order to get states agreed upon and stored in the distributed ledger.
7.3.5.3.1 Single participant finality
The simplest case is finalizing a block with only one participant (for example, minting or burning tokens). In this case, the business workflow builds the proposed block, and calls finality for this block.
* Finality runs as workflow steps within the context of the business flow, in the app of the initiating participants.
* It will verify and sign the block and store it as Unverified in the data store.
* It will invoke the notary workflow to notarize the block.
* The notary workflow will run as a separate workflow on the designated notary app and will return a notary signature over the block when successful.
* Upon successful notarization, the notary signature will be stored alongside the block, and it will be marked as Verified.

Figure 68: Single Participant Finality Diagram
7.3.5.3.1.1 Error handling
If the verification of the block fails, the finality will terminate early and not call notarization. If either verification or notarization fail, it will be persisted as Invalid, and an error message will be returned to the calling flow.
7.3.5.3.2 Multiple participant finality
If there are more than one participant, the block needs to be sent to all required signatories to be verified and signed. The finality code orchestrates that:
* In this case, finality in the initiating flow verifies, signs, and stores the block as above.
* Then it will send the block to the counterparty participant, which needs to run the matching Receive Finality steps.
* This will receive the block, verify the content and the signature, sign it and store a copy as Unverified.
* It will then send the signature back to the initiator.
* The initiator verifies the signature, stores it, and then invokes the notary workflow.
* Upon successful notarization, the initiator will verify the notary signature, store it along with the block, and mark the block as Verified.
* Then it will send it to the counterparty, which will verify the notary signature and store it along with the block, and mark that as Verified.

Figure 69: Two Participant Finality Diagram
7.3.5.3.2.1 Error handling
In the case of a transfer workflow, it is crucial that failures (that is, invalid blocks that cannot be retried) are reported back to the upstream app, as transfers or payments are waiting for the block to be settled. They will time out eventually, but we want to signal failures as quickly as possible so that payments can be retried or canceled safely. Therefore, error handling in finality distributes error messages. If a block is invalid (that is, an unrecoverable failure has happened), the flows will terminate early as soon as the error has been distributed, and the block stored as Invalid.
* If a block fails initial verification:
* A failure message with the block details will be sent to the counterparty.
* Finality will notify the upstream system and terminate the initiator flow.
* The Receive finality flow will store the invalid block.
* It will notify the receiving upstream app and terminate.
* If a block fails verification on the counterparty:
* It will be stored as invalid on the counterparty.
* An error is sent back to the initiator.
* The counterparty flow will notify its upstream and terminate the flow early.
* The initiator flow will store the block as invalid.
* It will notify its upstream app and terminate the flow early.
* If the counterparty signatures fail to verify in the initiating flow:
* It will send an error message to the counterparty.
* It will store the block as Invalid.
* It will notify its upstream app and terminate the flow.
* The receiving flow will store the block as invalid.
* It will notify its upstream and terminate.
* If notarization fails or the notary signature does not match/verify:
* The initiating flow will store the block as invalid.
* It will send a notary failure message to the counterparty.
* It will notify the upstream app and terminate.
* The receiver flow will store the block as invalid.
* It will notify the upstream app and terminate.
7.3.6 Contract validation
The distributed ledger is based on a consensual ledger model: the parties agree on a block by signing it. Once a block is signed by all required participants and the notary, it will be assumed to be valid without further checking.
7.3.6.1 Agreeing a block
* Each party/node runs contract code that is configured locally against a block before signing it.
* The contract to run is configured in the local definition of the token type used in the block.
* The node will keep a record of which contract was used to verify which block for audit purposes.
* By signing the block, the node accepts this block as valid.
* For the initiator node, this will be run from the finality step, for a recipient node from the receive finality step.
* The notary runs contract code that is configured by the network operator against each block.
* The contract is configured in the notary’s definition of the token type.
* This contract must ensure that the block adheres to the rules of the CBDC network.
* Once the notary signs a block, it becomes a valid block, and its outputs become valid tokens on the network. No further checks will be run when consuming these in further blocks.
* The notary will also keep a record of contracts run against blocks for audit purposes.
Importantly, the contract is not part of the UTXO model, and thus not signed over as part of the block.
7.3.6.2 Use of Corda contracts
Some basic checks for the tokens are built into the Corda DLT app as a basic contract:
* Only mint requests can create tokens.
* Only burn requests can destroy tokens.,
* A transfer request can only change the ownership of tokens, not:
* The notary
* The issuer
* The sum total of tokens
There will be further checks required; for example:
* The token has been issued by an acceptable issuer.
* The token has an accepted notary.
On top of that, there are business-specific rules that might apply to blocks; for example, value limits.
These can be enforced by Corda contracts that are configured in the token definition and will be run against the block on verification. Note that different nodes on the network can easily configure different rules for the same token type: only blocks that succeed on all nodes will become valid.
7.3.7 Token selection
Token selection is the process of selecting tokens to prevent other processes from attempting to spend the same tokens. Successfully selected tokens are then spent within the ledger. For example, when performing a transfer, tokens are selected from the sending participant to be spent and new tokens are created that the receiving participant then stores.
* Preventing multiple processes from selecting the same tokens is an optimization.
* If a process attempts to spend an already spent token, that process will fail, without impact on the ledger itself.
Token selection is a core process that the DLT performs as part of transferring tokens between participants. The process is responsible for selecting tokens of at least the value of the amount requested, and lock those tokens so they cannot be selected by a parallel process. Token selection is on the critical path for performing transfers. Its performance is therefore crucial to the overall performance of the DLT and the system as a whole.
With a focus on performance, the token selection processor will leverage partitions (pools) of tokens that are claimed by token selection instances. With each instance managing unique tokens that are held within the pools they own, the majority of a selection will be processed in-memory, reducing the back-and-forth between the instances and the shared datastore while also preventing contention that would arise between instances attempting to select the same tokens. Each pool operates independently from the others.
Selected tokens are locked for a period of time. During this time, they cannot be selected again. If they are not consumed (no longer selectable) during this time, they become available for selection again. This process repeats whenever a selection is made until a token is consumed.
The following diagram visualizes the process of selecting tokens from the block processor (used for processing transfers).

Figure 70: Selecting Tokens
Partitions/pools are claimed as token selection instances are started as well as periodically when running. A claimed pool will only be interacted with by the claiming token selection instance and are only claimed for a defined period before being released and becoming available to claim by any instance. This gives the instances resilience as a pool is never abandoned and is only removed once all the tokens in the pool are consumed.
Tokens are created and consumed (no longer selectable) by subscribing to respective message topics.
New tokens are received and are added to a new pool. While a pool is new, no instances can claim it. After enough tokens have been placed into the pool, it becomes ready and can be claimed. The threshold to transition a pool into a ready state is controlled by configuration that specifies the number of tokens or total value that the pool must reach before transitioning.
When a token is consumed its state is updated in the token selector’s datastore. This is the end state of a token, permanently marking it as used and preventing it from being selected. When all of the tokens in a pool are consumed, the pool is removed and cannot be claimed anymore.

Figure 71: Creating and Consuming Tokens
7.3.8 Data storage & management
7.3.8.1 Data storage (ledger and notary databases)
The DLT will store its ledger data in a PostgreSQL database. PostgreSQL is suitable for the expected load, with the batching of transfers keeping the complex processing load low, leaving only simple inserts and updates of transfers occurring with a load comparable to the total expected load.
Read replicas must be used to meet the resiliency requirements. This will be expanded upon in Resilience and disaster recovery.
7.3.8.2 Data storage (token selection)
Token selection data will be ephemeral.
Token selection uses Ignite in a configuration that does not write to persistent storage, keeping the token selection data purely in memory of the Ignite instances, thereby increasing the overall performance of the Ignite cluster.
To handle the scenario of the whole Ignite cluster being down, the ledger’s data will be used to reconstruct the token selection data. This will be expanded upon in Resilience and disaster recovery.
7.3.8.3 Retention policy
The DLT can archive the following while keeping an operational system:
* Ledger database: Consumed states and the transactions related to them.
* Notary database: Hash of consumed states.
* DLT operational database: Transactional data related to ongoing and completed operations.
Custom workflows will trigger at a given time or interval to extract data that occurred before a configurable period and export them to another datastore for archive/cold storage.
The retention policy, including the period that data is kept and the frequency that data is archived, must be carefully managed to strike a balance between keeping a suitable volume of historical data and reducing live data that impacts the application’s performance. Archiving data also impacts the idempotency of the DLT as it cannot reply to a request that is repeated multiple times if data relevant to the request is removed some time between the original and subsequent calls. Similar to managing the retention policy, data must be kept long enough to allow the DLT to continue processing requests in an idempotent manner.
7.3.9 Monitoring and instrumentation
7.3.9.1 Logging
The DLT will apply the general logging guidelines for the solution.
In addition to this, the DLT will log:
* Primary business-related information at info; for example, the beginning and end of processing a mint, burn or transfer request.
* Additional detail, primarily for debugging ongoing issues, at debug.
* Failures that do not affect the overall running of a DLT instance or non-critical failures at warn; for example, a connection error or failed validation of a transfer.
* Failures that lead to the shutdown of a DLT instance or a critical failure that affects the ledger at error.
7.3.9.2 Metrics
The DLT will record metrics related to its core functionality as well as additional metrics to better measure the performance of the system. The core metrics will always be enabled to ensure operators have visibility into the system. The performance metrics will be disabled by default and enabled by configuration.
The core metrics include:
* Duration metrics:
* Completing a transfer
* Processing a block of transfers
* Completing a mint
* Completing a burn
* Notarizing a block
For each of the metrics above, the status will be included as a tag when recording a metric reading. This allows tracking of both successful and failed operations.
The performance metrics include:
* Duration metrics:
* Token selection
* Serialization
* Size metrics:
* Selected tokens
Note that all captured metrics also allow a count of the operations to be tracked. For example, capturing the duration of a transfer also allows the number of transfers to be tracked.
The core metrics focus on the SLAs required from the system. While the DLT only constitutes part of each important process (for example, transfers), visibility into how the DLT is performing gives operators the chance of intervening before the SLAs themselves are not met. Alerts can be set up using the core metrics to assist operators in addressing slowness or other issues that can impact the systems SLAs.
7.3.10 Resilience and disaster recovery
7.3.10.1 DLT instances
The DLT instances are stateless. The instances read and write from PostgreSQL, allowing any instance to process new requests, and any instance to continue processing existing requests; providing resiliency as all requests can still be processed as DLT instances scale up and down without affecting other instances (excluding changing the load between instances).
PostgreSQL will use read replicas to ensure that multiple copies of the ledger and notary databases exist, allowing instances to be lost while keeping the system functional.
7.3.10.2 Token selection instances
Token selection instances claim partitions of tokens that are then used for making selections. This is done for performance reasons as explained in Token selection.
When a token selection instance goes down, other instances will claim the downed instance’s partitions. The system will still function when only a single instance is running with that instance claiming all partitions. The token selection functionality allows any instance to process new selection requests; however, the selected tokens depend on the instance processing a request. The requests will still be idempotent despite this, allowing any instance to handle duplicated requests in an idempotent manner.
The token selection instances will use Ignite to store its data. Ignite will be storing data in-memory and not in persistent storage. It can handle losing and restarting some instances without data loss, but it is possible to lose data when all replicas of a partition are down at the same time. This scenario is acceptable as the token selection data can be reconstructed from the ledger data. To recover in this scenario, data relevant to token selection is extracted from the ledger data sent to the token selection instances to repopulate the Ignite cluster.
The Ignite cluster will have replicas of each partition to alleviate the likelihood of entering the recovery scenario described above.
7.3.11 Performance and scalability
The DLT and token selection instances will be horizontally scalable, addressing both performance and resilience requirements.
Due to the stateless nature of the DLT instances, any instance can process new requests, and any instance can continue processing existing requests. Transfer requests will place the highest load on the DLT as it needs to ingest each incoming request; the load then decreases as the transfers are batched, with the majority of the DLT’s functionality executing after this point. While the highest load comes from ingesting transfers, each individual request will be handled quickly as it stores a transfer and hands it off for further processing.
7.3.12 Infrastructure requirements
7.3.12.1 Topology

Figure 72: Corda DLT Infrastructure Topology
7.3.12.2 Database
* A PostgreSQL database to store ledger data.
* An Apache Ignite database to store tokens.
7.3.12.3 Messaging
The DLT is built using the Corda Workflow SDK. The SDK depends on NATS, a pub/sub messaging platform, for storing workflow state and asynchronous messaging.
7.3.12.4 Corda Contract Service
The DLT uses the Corda Contract service to validate blocks sent between network applications as part of the DLT’s functionality.
7.3.12.5 Coda Signing Service
* The DLT uses the Corda Signing Service to sign and validate transfers and blocks sent between network applications as part of DLT’s functionality.
* The DLT is built using the Corda Workflow SDK. The SDK uses the Corda Signing Service to sign and validate messages sent between applications.
7.3.12.6 Networking
* DLT instances need connectivity to other network applications as part of the DLT’s functionality.
* The DNS provided by the Kubernetes cluster must support resolving host names of network applications running in the remote clusters.
* DLT instances need connectivity to other dependent services (signing, database, and so on) within the same Kubernetes cluster.
 


8 Corda Workflow SDK overview
8.1 Summary
This chapter outlines the detailed design of the new architecture for the Workflow SDK.
To support large-scale business workflows that can span multiple applications, a new microapp architecture has been introduced. This architecture will allow a network of applications to choreograph the reliable execution of workflows that span many applications, parties and physical networks.

Figure 73: Corda Workflow SDK Topology
8.2 Prerequisites
8.2.1 Terminology
* Corda network: A group of interconnected private networks operating one or more network applications that interact with each other.
* Network application: An application, built using the Workflow SDK, running within a Corda network.
* Network identity: The identity of an organization within a Corda network.
* Application identity: The identity of an application within a Corda network.
* Application network identity: The identity of a network application executing on behalf of a specific network identity.
* Workflow: A defined sequence of steps within an application.
* Workflow step: A defined unit of execution for a workflow.
* Workflow receive step: A point in a workflow that can receive an event from an external source.
* Software development kit (SDK): A set of libraries that can be used by an application to build and execute workflows within a Corda network.
* User code: Unless specified otherwise, “user code” refers to code written by application developers as part of their workflow implementations, typically for the purpose of parameterized workflow steps.
8.3 Solution design
8.3.1 Overview
The Corda Network Application implements the business logic required for application workflows. It also leverages various components of the Workflow SDK, which are responsible for constructing, registering, and reliably coordinating the execution of business workflows. This coordination is achieved through HTTP communication between applications.
The workflow components will provide an API for creating workflows, along with an engine and controller to execute and manage their coordination.
The network components support distributing processing across multiple nodes to ensure reliable message delivery. They also host HTTP API endpoints for workflow steps, facilitate HTTP communication between applications, handle the sending and receiving of workflow messages during flow initiation and intermediate steps, and provide metadata for the Corda Network Identity. Applications using the SDK must supply their identity information, which is typically configured once during application startup.
Workflow states will be stored persistently in a distributed key-value store. These checkpoints enable scalability (a workflow execution can be run on several nodes) and resilience (recovery in case of process failure or unreliable node). The SDK will automatically create checkpoints at specific stages of workflow processing, while users also have the option to manually checkpoint after any execution step.
The signing service is a component deployed within a Corda network that performs data signing on behalf of the network identity and verifies signatures.
The following diagram shows each sub-component within the Corda Network Application and outlines their relationships within this structure.
[RN3][PM4]
Figure 74: Corda Workflow SDK Components
The components shown in the diagram will be explained in detail throughout this chapter.
8.3.2 Workflow API
The Workflow API is a Kotlin library which provides com.r3.corda.sdk.api package to any application written in Kotlin to interact with other applications using workflows. The API provides a set of functions to define workflows, steps, and actions to save state.
A staring point to use the API is a method workflowBuilder to create an instance of workflow engine. The following workflowBuilder code sample is shown in pseudo-code for simplicity:
workflowBuilder(<CONFIG>, <WORKFLOWS_DEFINITIONS>)
This method takes a configuration and a function that defines workflows. The configuration includes the following entries:
* Section networkApplicationIdentity with configuration entries for identity management:
* applicationIdentity: Application name; for example, payments
* networkIdentity: SPIFFE ID of identity name; for example, spiffe://bank-of-alice.com/payments/payments-service
* networkIdentityShortName: Identity short name; for example, bank-of-alice
* Section http-server with configuration entry for HTTP hosting:
* port: HTTP port for exposing workflows (starting, messaging between workflows); for example, 8081
* Section nats with configuration entries for internal networking and workflow execution:
* host: Host of the NATS service for internal messaging and key-value store; for example, nats-service
* port: NATS service port; the default port is 4222
* streamName: Unique identifier for a stream, which is a collection of messages grouped under a specific subject or set of subjects; for example, charles.payments.async-messages
* asyncMessagesSubjectName: Subject of the NATS messages handling asynchronous message processing; for example, charles.payments.async.messages
* syncRequestsCompletionsSubjectName: Subject of the NATS messages handling synchronous requests completions; for example, charles.payments.sync-requests-completions
* The section also contains other configuration options for internal storage and networking services related to performance tuning.
* Section checkpoint-store with configuration entries for workflow execution:
* bucketName: The application space to store workflow state (checkpoints); for example, payments-charles
* The section also contains other configuration option for internal storage.
Workflows are added inside the  function by invoking the addWorkflow method:
addWorkflow(<NAME>, <VERSION>, <APPLICATION_IDENTITY>, <WORKFLOW_STEPS>)
The addWorkflow method can be called multiple times to add multiple workflows. The WORKFLOW_STEPS function provides an entry point with a fluent builder API to define workflow’s steps. The builder API consists of several methods: flowStart, exec, send, receive, sendReceive, doIf, elseDo and endFlow. Each method adds a step to the workflow. 
The steps are building blocks, each with the following predefined functionality:
* Exec: Enables arbitrary user code to be run.
* send and receive: Used to send and receive messages (asynchronously).
* sendReceive: Used to call a workflow synchronously.
* endFlow: Used to set a workflow result and terminate a workflow.
* doIf and elseDo: Used for branching flow control, which internally can nest other steps.
Workflow steps can be composed in various ways; in most cases, steps define interactions between workflows. Workflow steps are invoked in a linear order (except branching). Two sample workflows follow that showcase different inter-workflow communication/collaboration patterns. 
In the simplest form, synchronous, a workflow can call other workflows and wait for those other workflows to return their results. In the following example, there are two steps of type sendReceive which call workflows “sell-flow” and “invoice-flow” (most code inside the steps is omitted for brevity):
addWorkflow("buy-flow", "v1", networkApplicationIdentity) { builder ->
    builder.flowStart("start", WorkflowType.SYNC)
        .sendReceive("purchase") {
            // create message to start "sell-flow" and await for result
        }.exec("process-confirmation") {
            val messageFromSellFlow = getReceivedMessage()
            // process message
        }.sendReceive("invoice") {
            // create message to start "invoice-flow" and await for result
        }.endFlow {
            val messageFromInvoiceFlow = getReceivedMessage()
            // process message, creating a result for a flow caller
        }
}
The following diagram shows the above synchronous example:

Figure 75: API Synchronous Example
A workflow can also call other workflows asynchronously (that is, without waiting for a result). The execution of a workflow will continue until explicit await for a result step is added. This allows two workflows to exchange several messages and cooperatively advance their processing. 
In the following example, the first send starts another workflow, then the receive step waits for a return message from that workflow. The second send step sends again a message to a given step in the other workflow, and the second receive waits on our side for a return message (most code inside steps is omitted for brevity):
addWorkflow("sell-flow", "v1", networkApplicationIdentity) { builder ->
    builder.flowStart("start", WorkflowType.SYNC)
        .send("purchase") {
            // create message to start "sell-flow"
        }.receive("purchase-confirmation")
        .exec("process-confirmation") {
            val messageFromSellFlow = getReceivedMessage()
            // process message
        }.send("payment") {
            // create message to "receive" step of "sell-flow"
        }.receive("payment-confirmation")
        .endFlow {
            val secondMessageFromSellFlow = getReceivedMessage()
            // process message, creating a result for a flow caller
        }
}
The following diagram shows the previous asynchronous example. The steps of the sell-flow workflow are omitted for clarity.

Figure 76: API Asynchronous Example
The Workflow API provides a context data structure which contains contextual information about the flow invocation such as the invoking application name and the deduplication ID. The context also contains a key-value store which serves as the working memory of the workflow. The Workflow API provides the means to write arbitrary data to the key-value store such that it can be read in subsequent steps.
8.3.3 Identity management

Figure 77: Corda Workflow SDK Example Network
The example above shows a simple Corda network with two Corda network identities and two Corda network applications.
An application network identity describes an instance of a Corda network application running under a Corda network identity. Both Corda network identity and application network identity are expressed as a hierarchical SPIFFE ID. When an application uses the SDK to create an instance of a workflow engine, it must provide a network identity and a URL of the Signing Service. The SDK will then use these two pieces of information to add a signed JWT to all outgoing messages sent to other applications. This provides an authentication check for the receiving application to validate the sender of the message. The Identity HLD document provides more details of identity management within the Corda network.
When a Corda network application uses the Workflow SDK to execute workflows, it does so within the context of a Corda network identity. This is a well-known network wide-identity for an entity operating within the network.
When the application uses the Workflow SDK, it must pass in the following identity information (typically this will be done once at application startup):
* Application name: The name of the application; for example, payments
* SPIFFE ID of identity name: The SPIFFE ID of the identity the application is running under. The SPIFFE ID should be unique within the entire application network; for example, spiffe://bank-of-alice.com/payments/payments-service.
* Identity short name: A short form of the identity name. This is used for the service host name and message subjects, where the SPIFFE ID would be inappropriate. This value also has to be unique within the entire application network; for example, bank-of-alice.
* Signing Service URL: A service with access to the application’s private keys, used to sign JWT tokens and message payloads.
For more information, see Workflow Engine configuration entries.
The Workflow SDK, before sending a message (both HTTP Request and HTTP response), performs the following steps to add authorization and authentication data to the message:
1. The SDK connects to the Signing Service to sign a JWT token (using the application’s private key).
2. The SDK sends a payload (or hash of the payload) to the Signing Service to calculate the signature of the payload (using the application’s private key).
3. The SDK encrypts the payload (binary data).
4. The SDK adds authorization and authentication headers (Content-Type and other unrelated headers are omitted) and the payload to a HTTP request:
Authorization: 'Bearer <JWT>'
X-Payload-Signature: <signature-of-payload>
X-Signature-Algorithm: <value>

<encrypted-payload>
where X-Signature-Algorithm header may be optionally added by the SDK.
The JWT token includes claims:
* sub: SPIFFE ID of the sender’s identity name
* aud: SPIFFE ID of the recipient’s identity name
* exp: Expiration timestamp
For example:
{
  "sub": "spiffe://bank-of-alice.com/payments/payments-service",
  "exp": 1735689600
}
The Workflow SDK, upon processing an incoming HTTP request, authenticates and authorizes the message:
1. The SDK verifies the “sub” and “exp” claims, ensuring the token is valid.
2. The SDK validates the JWT token using the sender’s public key; the key is looked up via the SPIFFE ID from the “sub” entry.
3. The SDK decrypts the payload.
4. The SDK verifies the payload signature using the sender’s public key.
8.3.4 Workflow execution
8.3.4.1 Overview of workflow structure
Workflows consist of a sequence of workflow steps, of which there are several types. Each step type has a different meaning and will perform a specific operation like executing some user-defined code or sending a message to another workflow. Steps execute sequentially in order until an error is encountered or the workflow terminates. Each step is also named by the flow author for logging and tracing purposes.
8.3.4.1.1 Workflow steps descriptions
* startFlow: Begin the workflow. Also carries information about whether the flow is synchronous or asynchronous.
* send: Send a message to another workflow. This message may initiate a workflow, or it may be received by an already running workflow.
* receive: Receive a message either sent using send from another workflow, or from the app rest interface.
* sendReceive: Invoke a workflow synchronously and receive the flow result.
* exec: Execute arbitrary app-author defined code.
* doIf: Execute an arbitrary sequence of steps if a condition is met.
* elseDo: Execute an arbitrary sequence of steps if the preceding doIf did not execute; must follow doIf.
* endFlow: Produce a flow result and terminate the workflow.
A workflow must also conform to some rules in order to be valid:
* The workflow must begin with a startFlow step.
* The workflow must end with an endFlow step.
* Steps must be uniquely named.
* An elseDo step may only follow a doIf step.
Additionally, workflows are defined as either synchronous or asynchronous. Synchronous workflows, when called, will block the caller until they complete. By contrast asynchronous flows are “fire and forget” and will run concurrently with other flows until completing at some point in the future. Workflows also have a predefined TTL which is configured by the flow author. Workflows which run for longer than the TTL will be failed; see Error handling.
Prior to execution, a workflow is converted from a hierarchical representation containing lists of steps (referred to as the workflow “definition”) into a directed acyclic graph of “nodes” which represent low-level functionality within the SDK. Graph nodes can be thought of as low-level “instructions” for the workflow executor. This translation process provides an abstraction between the specific details of the API and the internal functions of the workflow executor, allowing these components to evolve independently as the project progresses.
In the graph representation, each node points to the next node to execute. The end of the workflow is represented by an absence of an edge pointing to the next node. The graph representation also includes the notion of an “entry point” node, from which execution will begin.
Step type
Node type
Description
startFlow
Receive
Receive node with the same name as the step, and set as the graph entry point.
send
Send
Send node which sends a message asynchronously to a workflow defined address.
receive
Receive
Receive node which will suspend until a message arrives.
sendReceive
Call
Call node which invokes a synchronous flow and waits until completion workflow synchronously.
exec
Exec
Exec node, same function as the step.
doIf
Branch
Branch node which will return a different nextNode depending on the provided condition (evaluated at runtime).
elseDo
Branch
Sub-steps will be connected to the “else” side of the preceding doIf branch node.
endFlow
Exec
Implemented as an exec node which sets the flow result in the context.
Table 46: Workflow Step Types

Figure 78: Example Workflow with Control Flow Graph
8.3.4.2 Workflow checkpoints
Checkpoints are a total representation of the state of a running workflow instance which evolve throughout the lifecycle of a workflow. The workflow executor will generate checkpoints at various stages during execution to record of workflow state or to suspend the workflow in such a way that it can be resumed at a later time (such as to receive a message).
Checkpoints contain the following information:
* Deduplication ID of the flow instance
* The status of the workflow:
* SUCCESS: The workflow terminated successfully.
* ERROR: The workflow terminated with an error.
* STARTED: The workflow is running.
* The current state of the workflow context
* The name of the next node in the control flow graph to execute
* Workflow error information (if an error has been encountered):
* Error message
* Error type:
* FLOW_ERROR: The error was encountered in app defined code.
* SYSTEM_ERROR: The error occurred in SDK code.
* Buffer of undelivered messages
Checkpoints are stored in an external key-value store with a key which incorporates the application name, workflow name, workflow version, and the deduplication ID of the flow instance. In this way, multiple flows and applications are able to share storage if required.
8.3.4.3 Workflow lifecycle and execution
The lifecycle of a workflow begins with the delivery of a message. Messages may originate from other workflows, or from external sources via HTTP. Messages always include the deduplication ID, which along with the flow name and version, uniquely identify a particular instance of a running flow.
When a flow begins, a new “flow context” is created for the instance. The flow context contains metadata relating to the flow instance such as the identity of the initiator and the deduplication ID. The flow context also contains a key-value store which flow authors can modify at runtime and which serves as the working memory of the flow instance.
Once a flow has started, steps will be executed sequentially until one of several conditions are met:
* The flow has reached a receive step, and must wait for an incoming message.
* The flow has encountered an error and cannot continue.
* The flow has completed and there are no more steps to execute.
When any of these conditions are met, a new checkpoint is generated and written to the checkpoint store and the workflow either suspends or terminates. In this way, the arrival of each message can be thought of as “updating” the checkpoint in some way depending on the content of the message and the current state of the workflow.
Apps developed using the Workflow SDK will run in a highly-available environment and messages will be subject to at-least-once delivery semantics. Because of this, the workflow executor needs to be tolerant of multiple replicas trying to update the same checkpoint concurrently. To support this, an optimistic locking scheme will be implemented through the checkpoint key-value store.

Figure 79: Message Processing Concurrency
When a checkpoint update is complete, the workflow executor will attempt to store the updated checkpoint in the checkpoint store. If a conflict occurs because the checkpoint has already been updated by another replica or thread, then the checkpoint will be re-fetched and workflow processing will be repeated with respect to the new checkpoint. In this way, race conditions caused by concurrent processing of workflows or repeat delivery messages can be avoided.
Concurrency and at-least-once message delivery semantics also mean that messages may be delivered more than once or out of order. Because of this, the workflow executor must also be capable of deduplicating incoming messages and buffering out-of-order messages for later processing. This will be accomplished by storing unprocessed messages in the checkpoint along with other workflow state.
The following diagram shows the algorithm which will be implemented by the workflow executor for updating a checkpoint in response to an incoming message:


Figure 80: Checkpoint Update Logic Flowchart
The following is a summary of the checkpoint update logic:
1. If the message is addressed to the node at which the workflow is currently suspended:
a.  Retrieve the next node from the checkpoint.
b.  If the node is a receive node for which no message is available (either received or buffered), then return an updated “suspension” checkpoint.
c.  Otherwise, execute the node.
d.  Follow the control flow graph to the next node.
e.  Return to step b.
2. Otherwise, if the message is not addressed to the next node, but is addressed to a reachable node later in the workflow:
a.  Add the message to the message buffer in the checkpoint for later processing (discard if already present).
b.  Return the updated checkpoint containing the newly buffered message.
3. Otherwise, if the message is addressed to a node that is not reachable from the current node (the step has already executed, or is in an unreachable part of the graph):
a.  Discard the message and do not create any updated checkpoint.
With this algorithm, the workflow executor can tolerate both repeated and out-of-order delivery of messages. If a message is repeatedly delivered, then the node to which the message is delivered will be “in the past” and unreachable on the control flow graph, and the message will be discarded. If a message is delivered early, it will be stored in a buffer in the checkpoint and processed once the workflow reaches the step to which it was addressed.
8.3.4.4 Workflow messaging
Workflows may communicate with or invoke each other by way of the send, receive, and sendReceive nodes. When executing these nodes, app-provided code will create a message that consists of an address and an arbitrary payload. The SDK will then route the payload to the appropriate app/workflow/step using a suitable protocol. The workflow executor will not be aware of the specific details of message delivery, and will instead perform messaging tasks by interacting with a separate networking service.
Message addresses will consist of the following components:
Address element
Description
Application network name
The name of the application to which the message should be delivered (unique within a network)
Workflow name
The name of the workflow within the specified app to send the message to
Workflow version
The version of the workflow to which the message should be delivered
Deduplication ID
The deduplication ID of the flow instance to which the message should be delivered
Table 47: Message Address Elements
The interface between the workflow executor and the networking service will consist of four main operations:
* Networking service:
* Send a message to another workflow and await flow completion.
* sendAsync: Send a message to another workflow without blocking.
* flowComplete: Notify networking service that a flow has completed.
* Workflow executor:
* processMessage: Process inbound message from the networking layer.

Figure 81: Network Service Calls
The above diagram shows interactions between the networking service and workflow executor. When a message is received from another app, the networking service will send the message to the workflow executor, which will then fetch the appropriate checkpoint and process workflow logic until the flow either completes or suspends (see Workflow lifecycle and execution). While processing the workflow, the workflow executor may execute messaging nodes, which it will process by calling the networking service.
The following diagram shows interactions between the messaging service and the workflow executor while executing a short example control flow. In this flow a message is sent, and then the workflow suspends awaiting the next message.

Figure 82: Workflow Messaging Service and Workflow Executor Interactions
8.3.4.5 Reliable execution model
One of the primary purposes of the SDK is to implement reliable execution of workflows. This will be achieved through a combination of active-active fail over, checkpointing and at-least-once message delivery.
* Active-active fail over: An app deployment will consist of a number of concurrently executing replicas, any of which are able to service requests. If one or more of the replicas go offline, requests may be serviced by one of the other replicas.
* Checkpointing: Workflows will write checkpoints at various stages of execution so that workflows can be resumed. Checkpoint storage is shared between replicas allowing workflows to be resumed on any replica.
* At-least-once message delivery: By stipulating that messages are guaranteed to be delivered at least once, rather than exactly once, the reliability model is simplified and robustness of applications is improved.
Because of at-least-once delivery semantics, the app and underlying messaging infrastructure has the latitude to redeliver messages in cases where it is unknown if the request was successfully handled or not. This simplifies the reliability model substantially. This might happen, for example, if a connection is lost before processing is complete. To support this however, workflow code (including code provided by app authors) must be idempotent.
8.3.4.5.1 Synchronous requests
If a replica goes offline while processing a sync request, then the connection will be broken and the client will receive an error. At this point, the client can retry and the request will be routed to a different replica.
8.3.4.5.2 Asynchronous requests
In the case of an async message, the message will first be written to a queue managed by a message broker. The message broker will then deliver the message to one of the replicas for processing. If the replica does not acknowledge the message has been processed within a predefined time window, then the broker will redeliver the message to another replica.
In either sync or async case, it may happen that the workflow continues to be processed after the connection is terminated or message is re-delivered. In these cases, the workflow execution code will deduplicate the repeat-delivered messages in accordance with its own internal logic (see Workflow execution).
8.3.4.6 Error handling
Exceptions may occur within the flow executor for a variety of reasons:
* An error in flow author-provided code (outside the control of the SDK).
* An error occurred in flow executor code (internal error).
* An external request failed IOException or similar.
* A workflow timed out.
When an exception occurs during flow execution, the workflow executor will catch the exception and write a checkpoint containing error information. In the case of synchronous flows, the caller will be unblocked and error information will be returned to them.
Flow errors fall into one of three categories:
Error cause
Checkpoint error type
Description
Exception in SDK code
SYSTEM_ERROR
An error occurred in the flow executor while executing a workflow
Exception in app code
FLOW_ERROR
An error occurred in user code while executing the workflow
Timeout
TIMED_OUT
The workflow was terminated after exceeding its predefined maximum TTL
Table 48: Flow Errors
Workflow error information consists of three fields:
* Workflow status: Indicates whether an error has occurred.
* Error type: Indicates the type of the error (see table above).
* Error message: Message containing human-readable error information.
See Workflow checkpoints section for more information.
8.3.4.6.1 Timeout behavior
Each workflow will have a predefined TTL which is supplied by app authors when the workflow is defined. (see Workflow structure). If a workflow spends too long “in-flight”, including time spent suspended, the workflow will be terminated forcefully and an error checkpoint will be written with the error type “TIMED_OUT” and an error message indicative of the duration of the timeout and the calling flow.
8.3.5 Networking
8.3.5.1 Addressing
Application network addressing allows messages to be routed to a specific receive step in an application’s workflow. Each application instance will have an affinity with a specific identity on the network. For example, if we had a payment application run for both Bob and Alice then the network would need a minimum of one instance of the app for Bob and one instance for Alice. Addressing can be broken down into a host and route, the host is defined by the application identity and network identity and the route is defined by the workflow name, workflow version and workflow step.
8.3.5.1.1 Address attributes
* Application network identity: Application identity and network identity of an application.
* Workflow name: The name given to the workflow.
* Workflow version: The workflow’s version.
* Step name: The name of the workflow step.
8.3.5.2 Host resolution
Network applications are known at application level as a pair of application identity and network identity, as previously mentioned. As an example, an application identity could look like wallet-app and a network identity look like Alice. However, when it comes to sending out a message, the network layer does not understand application identity and network identity. It understands hosts and ports. So it comes naturally there needs to be a mapping between application identity and network identity to host and port. This host resolution is achieved through one such mapping of known identities passed down to applications on start-up. This way, user applications built with the SDK can conveniently reference other network applications by their application and network identity and then the SDK takes care of the host resolution under the hood.
8.3.5.3 HTTP endpoints (sync/async)
HTTP is used for communication between applications. Workflows receive endpoints are exposed via HTTP.
More specifically, the network layer exposes workflow receive steps as HTTP POST endpoints. POST because as the name “receive step” suggests, they expect to receive information/ data. The HTTP POST endpoints come in two flavors, synchronous and asynchronous.
Asynchronous endpoints accept incoming client requests and report back to the client call with HTTP Accepted (202).
Synchronous endpoints execute a call in a synchronous fashion and return the result to the client.
Workflows start flow receive steps can be registered as either synchronous or asynchronous. The rest of the workflow’s receive steps can only be registered as asynchronous. The reasoning why start flow receive steps alone can be registered as synchronous is, we consider a workflow to be a minimum unit of execution which returns a result back to a calling client.
8.3.5.4 Get workflow status endpoint
In case of starting an asynchronous flow, the workflow is being executed in an asynchronous way. It comes naturally there needs to be a workflows status endpoint for clients to be able to get asynchronous workflows result. One such endpoint is available to the system. This is a GET endpoint returning back the flow’s result.
8.3.5.5 Structure of HTTP messages
The HTTP messages exchanged involve HTTP requests and responses for:
* Synchronous receive endpoints
* Asynchronous receive endpoints
* Workflows status endpoint
8.3.5.5.1 Synchronous receive endpoints HTTP request and response
8.3.5.5.1.1 Synchronous receive request
Header
Description
Corda-Workflow-Sender-App
Sender application identity
Corda-Workflow-Sender-Identity
Sender network identity
Corda-Workflow-Sender-Workflow
Sender workflow
Corda-Workflow-Sender-Version
Sender workflow version
Content-Type
MIME type for the request
Table 49: Synchronous Receive Request Header
Body
Description
Serialized message
A message meant for the receiving sync end, serialized. Deserialization is user’s responsibility
8.3.5.5.1.2 Synchronous receive response
HTTP code
Description
200 OK
Successful execution
Table 50: Synchronous Receive Response
Header
*Description
Corda-Workflow-Status
Workflow execution outcome (STARTED, SUCCESS, ERROR)
Corda-Workflow-Error-Type
Error type during workflow execution
Corda-Workflow-Error-Message
Error message
Content-Type
MIME type for the response

Body
Description
Serialized response
The response to the synchronous call, serialized
8.3.5.5.2 Asynchronous receive endpoints HTTP request and response
8.3.5.5.2.1 Asynchronous receive request
Header
Description
Corda-Workflow-Sender-App
Sender application identity
Corda-Workflow-Sender-Identity
Sender network identity
Corda-Workflow-Sender-Workflow
Sender workflow
Corda-Workflow-Sender-Version
Sender workflow version
Content-Type
MIME type for the request
Table 51: Asynchronous Receive Request
Body
Description
Serialized message
A message meant for the receiving sync end, serialized. Deserialization is user’s responsibility
8.3.5.5.2.2 Asynchronous receive response
HTTP code
Description
202 Accepted
Request successfully accepted
Table 52: Asynchronous Receive Response
Headers
Description
N/A
No response headers
Table 53: Header Details
Body
Description
N/A
No response payload
Table 54: Body Details
8.3.5.5.3 Workflows status endpoint HTTP request and response
8.3.5.5.3.1 Workflows status endpoint request
Header
Description
N/A
No request headers
Table 55: Workflow Status Endpoint Request
Body
Description
N/A
This is a GET endpoint
8.3.5.5.3.2 Workflows status endpoint response
HTTP code
Description
200 OK
Request successfully completed
Table 56: Workflow Status Endpoint Response
Header
Description
Corda-Workflow-Status
Workflow execution outcome (STARTED, SUCCESS, ERROR)
Corda-Workflow-Error-Type
Error type during workflow execution
Corda-Workflow-Error-Message
Error message
Corda-Workflow-Start-Time
Time when the workflow started
Corda-Workflow-Updated-Time
Time when the workflow was last updated
Content-Type
MIME type for the response
Table 57: Header Details
Body
Description
Serialized workflow result
The workflow result, serialized
Table 58: Body Details
8.3.5.6 Asynchronous HA and reliable messaging model
The SDK offers a highly available (HA) and reliable infrastructure for asynchronous communication.
HA in the context of asynchronous receivers means an application should be deployed in a multi-replica way. This way, if a replica becomes unavailable, another one will be there to serve requests incoming to the endpoints. A load balancer sits in front of them, routing the requests to replicas.
Reliability in the context of asynchronous receivers means an asynchronous request being resilient against disaster cases; for example, a replica being killed while processing a request. However, the request processing needs to somehow be able to overcome such case and proceed.
Reliability in the asynchronous receivers is achieved by a certain sequence of events. The receiver puts the asynchronous request onto the message broker (NATS). Once NATS acknowledges it holds on to the message, the receiver responds back to the HTTP client with 202 Accepted. This ensures that when the HTTP client holds on to a 202 Accepted response the system holds on to their request reliably. The asynchronous request will be picked up for processing by one of the replicas. It will only get acknowledged to NATS if fully processed. If something goes wrong during processing the request, NATS will re-deliver the request.
Please note that NATS comes in a HA and Reliable mode therefore NATS acknowledging a message means it holds on to it reliably.

Figure 83: Corda Workflow SDK - Networking HA and Reliable Async Request Processing
8.3.5.7 Synchronous HA messaging model
The SDK offers a highly available (HA) infrastructure for synchronous communication.
HA in the context of synchronous receivers means an application should be deployed in a multi-replica way. A synchronous request should be able to be served by any replica.
A workflow’s lifecycle typically includes asynchronous communication. However, from a client’s perspective it makes sense for a workflow to be able to call it in a synchronous fashion. The SDK’s networking layer comes to bridge the two worlds. So, it offers the ability for synchronous communication to switch onto asynchronous communication on the backend. The challenge arising here is that because the synchronous receivers are also deployed in a multi-replica fashion. It can be that the sync HTTP request lands on a certain replica (say Alice 1), but then the workflow completes on a different replica (say Alice 2). So then replica Alice 2 needs to somehow notify replica Alice 1 to respond back the sync HTTP call to the client with the result. The Workflow SDK uses NATS again to have the replica completing the workflow notify the replica holding the synchronous HTTP call. That way, to the client, it still is all synchronous communication while on the backend it has been asynchronous.
In case the replica holding the HTTP call dies, then the client would have to retry the synchronous HTTP call.

Figure 84: Corda Workflow SDK - Networking HA and Reliable Sync Start Flow
8.3.5.8 NATS messaging, headers, payloads, topics
The SDK makes use of two NATS topics: one for the asynchronous communication and one for completing the synchronous HTTP calls.
* For asynchronous communication the SDK gets the HTTP message, converts it to a NATS message and puts it onto NATS. The converted NATS message contains the HTTP headers and the HTTP payload. In addition to these it contains an extra header. This header is the address of the incoming call. This piece of information is important to determine the handler to route the request to.
* For completing the synchronous HTTP calls all replicas listen to the synchronous HTTP calls completions topic. The NATS message in this case contains the result serialized along with HTTP headers to be included to the response. It also contains an identifier of the synchronous HTTP call awaiting to be completed, which is used to match the corresponding HTTP call. To avoid having to publish the same message to all listening replicas, a unique identifier per replica is introduced called the instance ID. Replicas subscribe to the stream to listen only for messages that concern their instance ID. Then publishers are aware of the instance ID, and thus they know which instance to publish the message to.
The subject name looks like sync-requests-completions.*. Consumers register to the subject suffixed with their instance ID: sync-requests-completions.<INSTANCE ID>. Publishers publish to NATS using the subject name suffixed again by the instance ID: sync-requests-completions.<INSTANCE ID>.
8.3.5.9 NATS topic naming for isolation and sharding
NATS topics will be dedicated per application network identity. It means that NATS topics will be addressed by application ID and network ID followed by their use case. For example, sync calls completions topic for Alice in wallets-app should look like Alice.wallets-app.sync-requests-completions. This offers topic isolation.
NATS scales by having multiple streams. NATS identifies multiple streams within the cluster and will assign a different leader node to each stream. This means different nodes to handle incoming requests for each stream. That is how NATS scales. In the event that a stream found to deteriorate due to the load of data, data could be partitioned or sharded sensibly and spread among different NATS streams.
8.3.6 State management
The state management component is responsible for storing workflow checkpoints. User data is stored within the workflow context which is used by user code to pass state between workflow steps. Checkpoints capture the current state of a running workflow, allowing it to be resumed from the same point in case of failures. When a workflow is completed, the final state is stored to provide a record of the workflow output that can be accessed via the status HTTP endpoint. The state store entry contains all the information required to restart a workflow, of which include the flow state, flow name, flow status, deduplication ID and expiry time.
The state store entry is serialized using protocol buffers (Protobuf) to ensure efficient and compact storage. The state store entry will be the compiled form of a protocol buffer defining it.
Data consistency is guaranteed by optimistic concurrency control. Each state store entry is stored with a version number provided by NATS. When updating an entry, the version number is checked to ensure it matches the latest version of the key in the store. If the version does not match, the update is rejected by NATS, and the operation will be retried by the workflow controller with an up-to-date version.
NATS JetStream is used as the underlying key-value store for state management. The workflow’s state is stored in a NATS key-value (KV) bucket. NATS provides atomic create and update operations through the use of CAS (compare and swap). NATS KV store buckets can set some parameters such as the maximum overall size of the bucket, the maximum value size for a key, the TTL of a key and the maximum history of a key. A notable limitation is that the maximum configurable history per key is 64.
A NATS KV bucket is created per application instance and the bucket name should be unique per instance. Therefore, the bucket name is derived from the application identity and the network identity. The admin user is able to manually create KV buckets with their own naming.
8.3.7 Monitoring and instrumentation
The SDK utilizes an observability framework to collect, process, and export traces, metrics, and logs. It provides a vendor-neutral approach to instrument applications and send telemetry data to various backends such as Jaeger, Zipkin, Prometheus, and Dynatrace for performance monitoring.
8.3.7.1 Logging
Logs add detail for debugging specific issues or analyzing data.
The following log levels are used within the SDK:
* info: Normal events
* error or warn: Exceptions
* debug: Detailed traces in special deployments
Logs are organized in a way to easily correlate a lifecycle of a whole workflow execution by an identifier, which is present in each log line (except stack traces). Identifiers can be a deduplication ID along with the step address (which includes workflow name and version) or a concatenation of application identity, workflow name, workflow version and deduplication ID. By default, log level is set to INFO providing only most essential flow information.
Warning and error messages also contain IDs so that they may be correlated to specific requests.
High level and basic logging can be found at info level; for example, receiving HTTP requests, registering endpoints, completing requests, and so on. However, most flow processing details are logged at the debug level. Debug logging is disabled by default to avoid performance overhead, especially in high-throughput scenarios where detailed logs could introduce significant overhead.
8.3.7.2 Tracing
The Workflow SDK will trace data that captures the workflow execution across application instances. Trace data help system administrators gather insights of workflow lifecycle in empathize of duration of individual activities.
A trace consists of spans that capture the duration and timing of internal operations. Spans will be structured hierarchically, with sub-spans representing lower-level operations within the code. This allows spans to more accurately capture the work done in an application. The root span is created when an HTTP async or sync request arrives and completes when the flow processing ended (in case of sync, when the HTTP call has been returned). Another type of root span will be requesting status, where the start will be receiving the HTTP request and the end will be returning the flow result via HTTP.
Sub-spans will be typically smaller processing units within the whole processing of a workflow, such as async or sync message handling, flow step processing, checkpoint store operations, flow completions, and so on.

Figure 85: High Level Trace Example with Spans for Synchronous Flow
Requests may be handled by different application replicas and if spans are created independently, the trace might break unless explicitly linked. Hence, the SDK needs to ensure continuity of tracing across these replicas using trace propagation and span linking. Without propagation, each service would generate separate, disconnected traces, making it impossible to analyze request flows end-to-end.
8.3.7.3 Metrics
Metrics help to spot bottlenecks or failures from an aggregated view: request count, error rates, and so on. They provide quantitative insights that help detect issues early, optimize resource utilization, and improve user experience.
The following metrics will be provided for the Workflow SDK:
* HTTP request level metrics: Includes:
* Number of incoming HTTP requests (both synchronous and asynchronous)
* Time taken to process requests (p99, p95, p50 latencies)
* Percentage of failed requests due to application errors or timeouts
* Number of requests handled per second/minute
* Flow execution metrics: Includes:
* Duration from the start to the completion of a flow
* Time spent in each step of the flow execution
* Number of failed flows due to errors or timeouts
* Number of flows that have not yet completed execution
* Checkpointing metrics: Includes:
* Time taken to write a checkpoint to the key-value store
* Time taken to fetch a checkpoint, frequency of checkpoint updates
* Infrastructure and system health metrics: Includes:
* CPU and memory usage
* Checkpointing performance
* Count of unexpected errors, retries, and failures
8.3.7.4 Data format and collection
The SDK is going to use OpenTelemetry to create traces and metrics. OpenTelemetry follows a push model for sending telemetry data (traces, metrics, logs) to a variety of observability tools.
OpenTelemetry SDKs and Collectors transmit the data using OTLP (OpenTelemetry Protocol), which supports both gRPC (binary) and HTTP (binary or JSON) transports. Traces and metrics are sent in Protobuf (Protocol Buffers) format, ensuring efficient data transmission. Logs can also be sent via OTLP.
To push data to the preferred observability tool, an OTLP endpoint must be properly configured.
8.3.8 Resilience and disaster recovery
The SDK deployment will include multiple application replicas to ensure high availability (HA), a system design that minimizes downtime and ensures continuous operation. Workflows run on multiple application instances. If one application instance fails, another instance will seamlessly take over, ensuring uninterrupted request processing.
If a workflow starts and crashes due to wrong data or logical error, the SDK does not automatically reschedule it, it is the responsibility of the client code (the workflow caller). However, if the workflow starts but the application process experiences unexpected downtime, the Workflow SDK will endeavor to complete such workflow.
The resiliency guarantees between application instances within the SDK are done via our internal request handling:
* For asynchronous requests: Requests are placed onto messaging queue at the beginning of processing and only acknowledged after the processing has been finished. If an application instance fails, another sibling instance will pick up the unacknowledged request from NATS to continue processing.
* For synchronous requests: No automatic failover mechanism exists for this scenario. If the receiving instance fails, it will hold onto the request, preventing another instance from processing it. To ensure successful processing, users should retry the same HTTP request, allowing it to be handled by a healthy instance. If a synchronous step fails in the middle of the flow, the SDK will re-try this step.
For this internal messaging and request handling, the SDK relies on NATS JetStream, a persistent messaging system built on NATS. JetStream supports high availability (HA) through clustering, making it ideal for ensuring message durability and replayability.
To support workflow state recovery, the SDK records workflow progress in checkpoints at various stages while executing. Checkpoints are stored in a distributed key-value store to ensure data integrity and consistency. A key-value store allows efficient storage and fast retrieval of large amounts of data. This enables restoring workflows after interruptions.
Whenever a flow event arrives, the workflow engine:
* Checks if a checkpoint exists for the specified flow.
* If no checkpoint exists, a new workflow starts with a default-constructed context.
* If a checkpoint exists, the workflow undergoes sanity checks before resuming execution.
To store the checkpoints, the SDK leverages NATS Key-Value Store, a distributed, replicated, and highly available storage system built on NATS JetStream, enabling applications to store, retrieve, and monitor key-value pairs in real time.
The SDK relies upon third-party technologies chosen for the message bus and key-value store to provide fault tolerance or disaster recovery. Workflow states and results are maintained in a distributed key-value store with multiple replicas. While synchronous messaging involves short-lived HTTP requests that may time out, asynchronous messaging benefits from the underlying messaging system’s replication, enabling recovery without requiring manual intervention.
8.3.9 Performance and scalability
Workflow SDK allows to run workflows concurrently and in parallel on multiple application instances. Workflow SDK can scale processing horizontally. Scalability is achieved by load balancing of incoming messages and distributed store for workflow state management.
Both HTTP communication (for synchronous and asynchronous flows) and internal message bus (to facilitate asynchronous message delivery) provide load balancing and high availability. For load balancing of HTTP requests, a standard load balancer routes incoming requests to any of the available application instances; see the following diagram:

Figure 86: Scalability - Synchronous Messaging
Asynchronous message delivery is facilitated by internal message bus (NATs JetStream) with at-least-once delivery semantics. Workflow SDK will record a HTTP request for an asynchronous flow in the message bus. Then any application instance can pick up a message and process it (start or resume a flow). This processing is shown in the following diagram:

Figure 87: Scalability - Asynchronous Messaging
Each workflow’s state is persisted in NATS Key-Value store. Storing state externally ensures that a workflow is never “pinned” to a single container. A workflow can begin processing on one instance and later be resumed on another instance if needed. In the following diagram, a workflow triggered by an HTTP request is processed by Container A, which runs several steps (start flow, exec, send) and then checkpoints the workflow state to the Key-Value store. When another message arrives, it may be routed to Container B, which retrieves the saved state from the Key-Value store and continues processing the remaining steps (receive, exec), ultimately writing the final result back to the store.

Figure 88: Horizontal Scaling
The store can shard data per each application and network identity via key-value buckets. An application will use a separate bucket, which means store can scale to many instances and applications avoid contention over data access, see State Management.
Both the durable workflow mechanism and the NATS messaging components (queues and key-value store) support high read/write throughput. Messages and data are serialized to a binary format (protocol buffers) for efficient network usage. By offloading a workflow’s state to the key-value store, each application instance remains stateless between workflow steps. This allows easy redistribution of workload and scaling.
8.3.10 Data management
NATS is used as a high-performance message broker, to process async flow requests and distribute flow completion events. NATS JetStream is used by the Network Service to publish received, asynchronous requests. NATS KV store is used to store and checkpoint the state of the workflow execution.
NATS JetStream supports data replication and persistence, which ensures data durability and availability. Automatic recovery can create replacement stream replicas when running with three or more replicas. Manual recovery can backup data by taking snapshots of the stream at regular intervals. In case of data loss or corruption, these snapshots can be restored to the same or a new NATS cluster.
The retention policy is a configurable set of criteria for NATS data per stream that will evict messages from storage. The criteria include a limits policy, work queue policy and interest policy. The limits policy can set the maximum messages, maximum storage size, or maximum message age. The work queue policy will remove the message as soon as the consumer receives an acknowledgment. The interest policy will remove the message as soon as all consumers of the stream for that subject have received an acknowledgment for the message. The limits policy will apply before the work queue and interest policies if one of its limits are met. The discard policy sets whether the oldest message is removed or the newest messages are refused if a limits policy is met.
The NATS KV store has similar limits to the stream limits policy as it is backed by NATS JetStream. The limits are specified in State Management. The completed flow data is stored in the NATS KV store and its retention period is decided by the TTL of a key for the corresponding bucket. This allows the admin user to configure the retention period of flow data during bucket creation. The SDK provides a configurable Kubernetes job that will create the streams and buckets before the application starts.
8.3.11 Infrastructure requirements
Workflow SDK is used as a library for an application. However, it requires a supporting infrastructure. The infrastructure can span across two or more data centers. The following services are required:
* NATS cluster with five nodes for messaging: This cluster can be connected via gateway connection with a NATS Cluster in other data center
* NATS KV store for state management: This can run on the same cluster as messaging. Depending on load, it can be deployed to a separate NATS cluster (with gateway connection to a cluster in other data center).
* Signing Service: A cluster of minimum three servers with access to Cryptographic Keys vault (Hashicorp).
* Standard load balancer: A cluster with several instances, the number depending on the infrastructure and load balancer being used.
Depending on the deployment requirements each organization (identity) can deploy to a separated infrastructure or shared infrastructure. Separate requirements for applications’ deployments are covered in their respective documentations; a general rule would be to have a minimum three servers for resiliency per data center.

9 Solution delivery
This chapter describes the processes used to deliver the Retail CBDC Solution to a client. Specifically, it covers:
* The scanning of source and binary artifacts and the delivery of those scan results to the client.
* The different deployment environments and the process used to promote a version of the solution between them.
* The approach to synchronizing artifacts from R3 to the client.
* The mechanism used to deploy the solution in any given environment.
* The configuration of the solution for a specific environment.
The chapter should be read in the context of the Solution delivery pipeline and Solution delivery infrastructure chapters in the Retail Solution Components High-Level Design.


9.1 Source and binary scanning
This section describes how R3 scans our source code and binary files, and how the results of these scans will be shared with the client.
9.1.1 Overview
9.1.1.1 Background reading
* Snyk products
9.1.1.2 In scope
This section defines:
* Our current usage of Snyk tools for internal source code and binary security scanning.
* The internal process that occurs when a vulnerability is found.
* How we will share scanning results with the customer.
9.1.1.3 Acceptance criteria
* Our usage of Snyk tools explained.
* Process for sharing report results explained.
9.1.2 Solution design
9.1.2.1 Current solution
9.1.2.1.1 Architecture/context
The current solution leverages a number of Snyk tools as outlined in the Security section of the Solution delivery infrastructure chapter in the high-level design.
* Snyk Code: Used to scan code for security vulnerabilities using source code analysis. Once scanned, this product returns a report of the vulnerabilities found for inspection by a developer.
* Snyk Open Source: Used to build up a Gradle dependency graph and then to evaluate the dependencies for security vulnerabilities. Once scanned, the Snyk report results are sent to the Snyk server to be monitored and any new vulnerabilities found are reported.
* Snyk IaC: Used to scan the Terraform code for security vulnerabilities. Similar to Snyk Open Source, the results are sent to the Snyk server to be monitored and any new vulnerabilities found are reported.
* Snyk Container: Integrates the Snyk server with the R3 container registry and scans container images for security vulnerabilities. These results are reported on the Snyk server and are also monitored for any new vulnerabilities found.
9.1.2.1.1.1 Jenkins nightly pipeline/PR gates
As part of our repository creation automation, a Jenkins file is included that runs nightly Snyk scans for Snyk Open Source, Snyk IaC, Snyk Code, and Snyk Container. Jenkins builds for pull requests execute a Snyk Delta stage. This runs a comparison of test results from the PR build compared to the latest scan from the nightly build available from the Snyk server. The merge is then blocked if any new Snyk issues are introduced in this PR change. If this occurs, the developer must take corrective action to have their change merged. All R3 GitHub repositories used to develop the Retail CBDC solution will have these security scans running.
9.1.2.1.2 Sequence and interactions

Figure 89: Vulnerability Process
When a vulnerability is found on a Jenkins build by Snyk, it is added to the R3 Snyk server, and internal automation creates a JIRA ticket. A Slack message is also sent to a designated channel for new Snyk vulnerabilities. A developer will pick up this ticket and either fix the code vulnerability or, in certain instances where the vulnerability is not relevant to our usage of the code, it may be wavered. After this, the issue will no longer be flagged on the Snyk server.
9.1.2.2 Proposed solution
When a version is promoted from our internal unstable repository to the stable repository, this will generate Snyk reports and send them to our Snyk server where they will be stored under its respective project tag. Before a version is promoted to the client environment, there will be a QA sign-off process where the Snyk reports will be analyzed. If there are any high or critical issues present, this version will not be a suitable candidate to be promoted. In the case of a successful candidate, the Jenkins promotion and syncing pipeline will be run as described in the section Artifact syncing. This version promotion pipeline will have a stage that makes the Snyk reports available alongside the binary artifacts. From here, the client Jenkins will pull these reports where they can then be verified by the client. Once a version has been released to the client, we will continue to scan the binaries for newly introduced vulnerabilities on our Snyk server. In the event where a new vulnerability is detected after a version is released to the client, we will follow the same process as above in the Vulnerability Process diagram to resolve the vulnerability. Depending on the severity of the vulnerability that was introduced, a decision will be made internally between the necessary stakeholders about whether the resolution will be shipped in the next scheduled version, or if an emergency patch release will be necessary.
9.1.2.2.1 Topology
The following diagram shows the process of sharing vulnerability reports to the client:

Figure 90: Snyk Report Sharing Process
9.1.2.2.2 Remarks
A version will not be released to the client with any open vulnerabilities. All code shipped must meet the client's security requirements.
9.2 Solution promotion
Solution promotion refers to the process of moving deployable artifacts and associated configuration through multiple environments, typically from development to production. One or more activities may be performed in each environment, the results of which contribute to the decision as to whether an artifact should be promoted to the next environment.
9.2.1 Overview
9.2.1.1 In scope
* Promotion of artifacts through environments
* Promotion of artifacts through the artifact repository
* Promotion of artifacts into the client environments
9.2.2 Solution design
9.2.2.1 Environments and activities
An environment is a collection of resources used to host one or more instances of the solution; that is, it is where artifacts are deployed.
When discussing environments, we should consider which activities will be performed in each environment. Activities include static analysis and both functional and non-functional testing. One environment may host multiple activities or be dedicated to one activity. The output of the activities can be used by a gate for promotion to the following environment.
9.2.2.2 Artifact tracking
Activities within an environment are not necessarily run sequentially; they may take place in parallel. A newer version of an artifact may become available before all activities have completed for the previous version. As a consequence, not every version will be promoted through all environments. A mechanism is needed to track the output of the activities performed for a given version of an artifact.
9.2.2.2.1 Proposed solution
The proposal is to attach metadata to each artifact, including the output of the activities it has completed in each environment. We will use a tool like JFrog Artifactory to store the artifacts. Artifactory has a feature called “Properties”, which can be used to store metadata about the artifact. These properties can be updated as the artifact moves through the environments, using the REST API. The presence of a property indicates that an activity has completed, and the value indicates the outcome. When the activity is completed, the metadata will be updated during the post/success stage.
Property names should combine the environment and activity using the format env_activity, ensuring each name is unique; for example, dev_unit_test or fitness_scalability. The value might be a simple pass/fail or have some numeric value, such as a pass rate.
We can then create a policy for a given environment that uses the metadata associated with an artifact to determine whether to proceed with its deployment. Manual testing results may also be added as metadata, either via the Artifactory UI or via a manually triggered job that uses the REST API to set one of a limited set of properties.
When syncing artifacts to the client repository, this metadata will not be transferred. R3 guarantees that any artifact in the client artifact repository has been promoted through the R3 internal process. The client pipelines then annotate the artifact with new metadata in their repository.
9.2.2.2.2 Alternative solutions
Another solution would be to write the metadata to a database. Storing the artifact name, version, and fingerprint (git commit hash) alongside the metadata, we can keep accurate records. The drawback of this approach compared with the proposed solution is the additional effort to set up the database, implement the API to write to it, and the cost of running the database.
9.2.2.3 Environment promotion policy
We require the ability to define a policy for each environment that specifies the activity results needed for the artifact to be deployed to that environment.
9.2.2.3.1 Proposed solution
In the proposed solution, the policy is stored in the deployment branch (see GitOps). The policy will define the acceptable set of activity results required for promotion. If we are using JFrog Artifactory, the pipeline can use AQL to query the metadata of the artifact. As Open Policy Agent (OPA) is already used to define policies elsewhere in the solution, it is proposed that it is also used to define the promotion policies.
9.2.2.3.2 Alternative solutions
The policy could be stored centrally in a database, and the CI pipeline could query the database for it. This approach would add greater complexity to the delivery pipeline: we would need to store and maintain a policy per environment, and the CI would need to know which policy to apply.
9.2.2.4 Artifact storage
We will use JFrog Artifactory to store artifacts within R3. A single Artifactory instance can support multiple repositories.
9.2.2.4.1 Proposed solution
We will differentiate between early, unstable artifacts and later, stable artifacts. Having the -unstable and -stable repositories will allow us to easily differentiate an artifact’s maturity without having to manage too many repositories. Artifacts are initially published to the -unstable repository. These -unstable artifacts are considered temporary, and will be deleted after a certain period of time. The -stable repository will be used for artifacts that have passed the activities required for promotion to the client UAT environment. They will be kept for a longer period of time/indefinitely.
A dedicated pipeline will be created to promote the artifact from -unstable to -stable. It will be configured to run on a schedule (for example, nightly) and will consider all artifacts that have an updated timestamp since the previous successful run for promotion. Each run will execute the policy, and only promote the artifacts that meet the criteria. An artifact will only be promoted once. We can use the artifact’s BOM to determine which dependencies also need to be promoted.
9.2.2.4.2 Alternative solutions
Alternatively, we could use more repositories. We could create a one-to-one mapping between the environments and the repositories. The benefit of doing this is a clearer separation of the artifacts and their level of maturity. This would be a workaround if we find ourselves in a situation where we cannot use metadata. The drawback is the increased complexity of maintaining the additional repositories and the associated pipelines.
9.2.2.5 GitOps
GitOps refers to using Git to store deployment and configuration declarations in version control, further ingraining the concept of Infrastructure as Code. There is no direct access for an administrator to perform manual deployments/changes. Instead, the desired state is committed to Git. An automated process then reads the desired state from Git, and reconciles it with the target environment. This enables traceability of changes made to an environment and easy rollback and recovery.
9.2.2.5.1 Proposed solution
9.2.2.5.1.1 Layering the solution
First, let us clarify the difference between an application project, a solution project, and the solution deployment project. An application project is where a project builds an application into an executable binary. The application projects will follow a traditional CI process where the binary is built, tested, and released into the internal artifact registry.
Contrast this with a project that integrates multiple applications and configures them to work together: a solution project. The solution project will be a Terraform project, sourcing multiple application Terraform modules, and itself published as a binary module. The solution deployment project will take the solution binary and deploy it into the target environment with appropriate configuration. Tests need to be portable, and deployable into the target environment, suggesting they are containerized and published too.
It is the solution deployment projects that follow the GitOps model. The deployment project will follow a multi-branch strategy, where each branch represents a different environment. Each branch meets the needs of the environment it represents; that is, Production and Fitness branches will have configuration for more replicas and resources than the other branches concerned with functionality. This approach has the advantage that the branch will contain the exact configuration values necessary for the environment, reducing complexity and debugging time. Each branch will also have a separate commit history for audit trail and rollback if needed.
9.2.2.5.1.2 Raising a PR into the solution project
To introduce a new version of one of the underlying applications into the solution project, a PR will be raised.

Figure 91: Solution PR
That PR will trigger an initial CI pipeline, which will trigger several downstream pipelines that will perform various tests we deem appropriate as quality gates ahead of merging. The initial CI pipeline will build and publish an artifact into the -unstable artifact repository, tagged with the PR number, so the other pipelines can make use of the built artifact. Not all tests are suitable as a PR gate: longer running tests, for example, will only be executed after the PR has merged. We expect some tests to occur in the client SIT environment before the PR is merged. This artifact and its dependencies will be synchronized to the client artifact repository to facilitate this testing.
The application development team is responsible for resolving any failures in the tests. The PR can only be merged once the status checks have passed. This merge may be automated.
The following diagram shows how the PR artifact can be used in a downstream pipeline that provides a status check. These deployments will be ephemeral, and each run will create its own isolated space in the environment.

Figure 92: Running Tests as Part of PR
9.2.2.5.1.3 Deploying the solution
Merging into the main branch will publish another release into the -unstable artifact repository, but now tagged without the PR suffix.

Figure 93: Solution Project Main Branch
An automated dependency management tool like Renovate will raise a PR against the solution deployment project’s environment-specific branches. We will rely on the attached metadata to determine if the artifact has passed the required activities. The environments pulling from the -unstable repository will not have a prohibitive policy as we want to test early, and gather fast feedback. Longer-running and resource-intensive activities may have a policy in place that prevents artifacts that do not pass the basic functional tests from entering the environment.
We will have a more restrictive policy for deploying into the -stable served environments and will likely only be able to deploy with a manual approval.

Figure 94: Stable Deployments
The first thing the branch, and any PRs into the branch, will do is validate that the artifact’s metadata meets the required policy as entry criteria. This policy check will be run early and fast, so that it can be re-run as often as necessary without excessive costs. The deployment and any automated tests will occur after merging, not on the PR. Once merged, the artifact will be deployed and testing activities will be run.
9.2.2.5.2 Alternative solutions
A single branch approach can be used, with the different environment configurations stored in different files/folders, or using templating to generate the config files for a given environment. This would make it quicker to propagate a change across all environments via a single commit at the cost of adding complexity. The complexity arises from storing different environment configuration in different files/folders and then knowing which configuration to apply to which environment. Having all possibilities available in a single branch increases the risk of human error and the time taken to debug and fix any issues.
With templating we have to manage the templating engine, with the appropriate variables, and possible conditional logic. Using a template to generate the config at runtime also introduces the risk of a misconfiguration, as the actual config used is not stored in the repository; that is, this is not declarative.
9.2.2.6 Artifact promotion into the client registry
Passing the artifact from the R3 internal artifact repository to the client, and triggering a client pipeline to deploy the artifact, are two separate steps. Details for syncing the artifact to the client artifact repository are discussed in the section on synchronization.
9.2.2.7 Artifact promotion into client environments
Once the artifact exists in the client artifact repository, we need to deploy it into the client environments.
9.2.2.7.1 Proposed solution
The solution deployment project in the client’s version control, will have a branch for each client environment. Similar to the R3 approach, each branch will have a policy protecting the environment from accepting an artifact that does not meet the required criteria. When an artifact is synchronized from the R3 internal -stable artifact repository to the client’s repository, a PR will be raised into the first environment’s branch. After satisfying all criteria in the policy, the change will be merged. This triggers the client CI to run the pipeline that deploys the artifact into the client environment. At the end of the pipeline, after any automated tests have passed, the pipeline will create the PR in the next environment’s branch, chaining the environments together to production.
9.2.3 Solution analysis
9.2.3.1 Open questions
* Will R3 Jenkins have visibility of the client Jenkins pipelines so that we can report the success/failure of the tests in the SIT environment?
9.3 Artifact syncing
This section describes the process of syncing artifacts between R3 and the client via intermediate services. It will cover the steps in the process, the tools used, and the pipelines involved.
9.3.1 Overview
9.3.2 Prerequisites
9.3.2.1 Terminology
* Artifacts: Files produced internally by R3. These include binary files such as Helm charts, Docker images, Terraform modules, and Terraform providers, as well as bundled (zipped) pipeline and deployment scripts.
* Solution: The packaged software developed by R3 and provided to the client.
* SIT: System Integration Testing
* UAT: User Acceptance Testing
* Solution Environment: A collection of Kubernetes resources used to deploy and run one or more instances of the solution. Examples of environments may include internal test environments, SIT environments, or UAT environments.
* SCM: Source Control Management; a system used to manage source code/scripts.
* SBOM: Software Bill of Materials; a detailed inventory of all the components, dependencies, and libraries that make up a piece of software.
9.3.2.2 In scope
This section defines:
* Pipelines used in the syncing process
* Tools used in the syncing process
* Infrastructure components involved in the syncing process
* Artifact syncing between internal R3 environments and intermediate services
* Artifact syncing between intermediate services and client environments
9.3.2.3 Out of scope
Artifact promotion processes, which are covered in the section on solution promotion.
9.3.3 Proposed solution
9.3.3.1 Artifact syncing
The artifact synchronization process transfers artifacts from R3’s internal environment to the client’s infrastructure. As part of this process, both stable artifacts for client consumption and unstable artifacts for integration testing in the client’s SIT solution environment must be transferred. The same separation of artifacts on the R3 side should be mirrored on the client side with stable and unstable artifacts should be stored in separate repositories.
To ensure all required artifacts are transferred, the process will utilize a generated SBOM to identify the complete set of dependent artifacts associated with the solution, ensuring consistency and completeness during the syncing process. Once artifacts are transferred to the client, they will be scanned via the client’s own security suite.
9.3.3.1.1 Unstable artifacts syncing process
The process for syncing unstable artifacts is driven by the requirement to run integration tests for pull requests (PRs) raised against R3 GitHub repositories. These tests will be executed in the client’s SIT solution environment to ensure compatibility and functionality.
As part of the internal R3 process for a PR to be merged into a GitHub repository, the PR must first pass a PR gate CI pipeline check. The pipeline assembles, tests, and publishes the PR artifacts to an unstable repository in R3’s internal Artifactory. The unstable artifacts will also be copied to a dedicated R3 Nexus repository for internal testing and verification. The artifact syncing process will utilize the solution artifacts published to the unstable repository in R3’s internal Artifactory.
The unstable artifact syncing process is initiated by a Jenkins pipeline, which will copy the solution artifacts published to the unstable repository in Artifactory and send them to Globalscape Workspaces, an intermediate service between the R3 and client environments. Prior to sending the artifact to Globalscape Workspaces, the pipeline will assess an SBOM associated with the solution artifacts to ensure any dependent artifacts, such as deployment and pipeline scripts, are also available for syncing. Once the solution artifacts have reached Globalscape Workspaces, the mirroring process to the client’s environment can commence. Upon completion of the mirroring process the solution artifacts are available in the client’s Nexus repository for deployment to their SIT solution environment.
The client’s Jenkins deployment pipeline will then be responsible for deploying the PR versioned solution into their SIT solution environment for integration testing. The security scanning will be asynchronous and will not block the deployment. Once testing is completed, the results from the client’s deployment pipeline are reported back to the artifact syncing GitHub PR pipeline which will poll the results of the deployment pipeline.
The outcome of the pipeline determines the status check result associated with the PR. Based on this result, the PR will either be eligible for merging or require further modifications.
9.3.3.1.2 Unstable artifacts syncing pipeline
The synchronization process for unstable artifacts is driven by a Jenkins pipeline. The pipeline can be triggered manually or will be a downstream pipeline to the standard PR gate pipeline. The pipeline will be polled by a GitHub status check. The pipeline is responsible for the following tasks:
* Copy PR versioned artifact from the internal R3 Artifactory instance.
* Assess solution artifact SBOM for any dependent artifacts required.
* Initiate transfer of the PR versioned artifact to Globalscape Workspaces.
* Follow transfer of PR versioned solution artifact from Globalscape Workspaces to client’s Nexus repository.
* Follow transfer of dependent artifacts, such as deployment and pipeline scripts, from Globalscape Workspaces to client’s Bitbucket instance.
* Poll build result for the client deployment pipeline for PR versioned solution artifacts to client’s SIT solution environment.
* Report relevant notifications about the process and pipeline results.
9.3.3.1.3 Unstable artifacts syncing diagram
The following diagram illustrates the unstable artifact syncing process:

Figure 95: Unstable Artifact Syncing
9.3.3.1.4 Stable artifacts syncing process
This process for syncing stable artifacts is initiated by the same R3 Jenkins pipeline solution promotion process. This will be a scheduled pipeline but can also be triggered on-demand. When triggered, the pipeline evaluates artifact policies from artifacts in R3’s unstable Artifactory repository to determine if they qualify for promotion to the stable repository. Once qualified artifacts are determined, they are transferred from the unstable to the stable Artifactory repository. In addition, these artifacts are copied to an internal R3 Nexus repository for internal testing.
Once artifacts have been promoted internally, they are then copied and sent to Globalscape Workspaces, an intermediary service that bridges R3’s infrastructure and the client’s environment. This transfer is initiated by the Jenkins pipeline through an API call to Globalscape Workspaces. The pipeline will also evaluate the SBOM to ensure that all dependent artifacts required for the solution have also been transferred.
After the solution artifacts reach Globalscape Workspaces, they are scanned and prepared for mirroring into the client’s environment. The mirroring process is triggered by the client’s Jenkins syncing pipeline, which retrieves the artifacts from Globalscape Workspaces and copies solution artifacts to the client’s Nexus repository and pipeline and deployment scripts to the client’s Bitbucket SCM. These artifacts will be consumed by the client’s Jenkins deployment pipeline which will be responsible for deploying the solution into their UAT solution environment.
9.3.3.1.5 Stable artifacts syncing pipeline
A Jenkins pipeline orchestrates the stable artifact synchronization process. It runs on a configurable schedule or can be triggered on demand and is responsible for the following tasks:
* Assess which artifacts qualify for promotion to the stable R3 Artifactory repository.
* Evaluate the SBOM to identify all dependent artifacts required for the solution to be deployed.
* Retrieve solution artifacts from the internal Artifactory repository.
* Copy artifacts from the internal Artifactory repository to the dedicated R3 Nexus repository.
* Initiate the transfer of solution artifacts to Globalscape Workspaces.
* Follow the transfer of solution artifacts from Globalscape Workspaces to the client’s Nexus repository/Bitbucket instance.
* Poll results of the deployment pipeline to the client’s UAT solution environment.
* Report relevant notifications about the process and pipeline result.
9.3.3.1.6 Stable artifacts syncing diagram
The following diagram illustrates the stable artifact syncing process:

Figure 96: Stable Artifact Syncing
9.3.3.1.7 Client artifact syncing process
As part of the client-side artifact syncing process, there will be separate Jenkins pipeline definitions for syncing and deployment. Specifically, there will be one syncing pipeline definition, implemented separately for stable and unstable artifacts, ensuring that each instance only requires access to the appropriate repositories within the client’s Nexus instance. Additionally, there will be a single deployment pipeline definition with separate implementations for SIT and UAT solution environments. The SIT deployment pipeline will use unstable solution artifacts, while the UAT deployment pipeline will use stable solution artifacts. This structure provides clear segregation and ensures appropriate access control for the repositories and solution environments.
The artifact syncing process will involve syncing solution artifacts from Globalscape Workspaces to the client’s Nexus repository and syncing deployment and pipeline scripts from Globalscape Workspaces to the client’s Bitbucket instance. The pipeline will also evaluate the solution SBOM to ensure that all dependent artifacts required for the solution have also been transferred. Artifacts will need to be stored in separate repositories based on their stability; stable artifacts will be stored in one repository, while unstable artifacts will be stored in a different repository so that they can be easily distinguished.
An R3 Jenkins pipeline will poll both pipelines to ensure that the syncing and deployment process is completed successfully. If applicable, the results of these builds will be reported back to the triggering R3 pipeline.
9.3.3.1.8 Client artifacts syncing pipeline
The client-side artifact syncing process is driven by a Jenkins pipeline. The pipeline is responsible for the following tasks:
* Syncing solution artifacts from Globalscape Workspaces to the client’s Nexus repository.
* Syncing deployment and pipeline scripts from Globalscape Workspaces to the client’s Bitbucket instance.
* Evaluating the SBOM to ensure all dependent artifacts required for the solution have also been transferred.
* Routing artifacts to separate Nexus repositories based on their identity (stable/unstable).
* Deployment of the solution into the relevant solution environment.
* If applicable, reporting pipeline results back to the triggering R3 pipeline.
9.3.3.1.9 Client artifacts syncing diagram
The following diagram illustrates the client-side artifact syncing process:

Figure 97: Client Artifact Syncing
9.3.4 Solution analysis
9.3.4.1 Open questions
This artifact syncing process assumes that there is functionality for R3 Jenkins pipelines to poll or await build status to be returned from the client-side syncing/deployment pipelines.
* Is there a way for a pipeline triggered outside the client environment to poll/retrieve/receive build notifications from the client-side pipeline executions?
9.4 Solution deployment
This section outlines the deployment process for the retail CBDC solution. The process involves deploying the solution to the Kubernetes cluster using Jenkins CI/CD pipelines. It includes the deployment pipeline, Terraform state management, availability of Terraform providers, deployment upgrades, and rollback process.
9.4.1 Prerequisites
9.4.1.1 In scope
* Retail CBDC solution deployment process using Jenkins CI/CD pipelines
* Management of Terraform backend state
* Availability of Terraform providers
* Deployment for short-term (SIT) and long-term (UAT, Staging, and Production) environments
* Deployment upgrades and rollback process
9.4.1.2 Out of scope
* Deployment or configuration of infrastructure components used to orchestrate the deployment process; for example, Jenkins, Nexus, Bitbucket, and Kubernetes cluster
9.4.2 Solution design
9.4.2.1 Solution deployment diagram
The following diagrams illustrates the solution deployment:

Figure 98: Solution Deployment
9.4.2.2 Infrastructure components
* CI/CD Platform: Jenkins: Used to orchestrate deployment pipelines, integrate with SCM, artifact repositories, and the Kubernetes cluster for automating the deployment process.
* Source Code Management (SCM): Bitbucket: Used to store pipeline scripts and deployment scripts for the retail CBDC solution.
* Artifact Repositories: Nexus: Stores retail CBDC solution artifacts, such as Docker images, Helm charts, and Terraform dependencies, and also serves as a backend for managing Terraform state files.
* Kubernetes Cluster: Red Hat OpenShift Kubernetes platform: The platform where containerized microapps will be deployed and run.
9.4.2.3 Assumptions
Retail CBDC solution artifacts have been promoted/synced to the client-side artifact repository (Nexus) as described in the designs for artifact promotion and syncing.
All infrastructure components are already deployed and configured. These components include:
* CI/CD system (Jenkins)
* Artifact management system (Nexus)
* Source Control Management (SCM) (Bitbucket)
* Kubernetes cluster (Red Hat OpenShift cluster)
Additionally, integrations must be in place between infrastructure components. These include:
* Jenkins integration with Bitbucket: Jenkins must be able to authenticate and check out pipeline scripts from the client’s Bitbucket repository.
* Jenkins integration with Nexus: Jenkins must be able to integrate with Nexus to download retail CBDC solution artifacts from the Nexus repository and to use Nexus as a Terraform backend to manage Terraform states.
* Jenkins integration with the Kubernetes cluster for deploying the solution: Jenkins must be able to deploy the retail CBDC solution to the OpenShift Kubernetes cluster using Terraform. To do this, Jenkins will need:
* A Jenkins agent with the necessary tools to interact with the Kubernetes cluster; for example, terraform, kubectl, and helm.
* A service account with the necessary permissions to interact with the Kubernetes cluster.
* A kubeconfig file, generated by the service account, which will be used to configure access to the Kubernetes cluster via Terraform.
* To import the created kubeconfig file into the Jenkins credential store so that it can be used in the deployment pipeline script.
9.4.2.4 Solution deployment process
The Retail CBDC solution deployment process is driven by a Jenkins pipeline that is integrated with the SCM system. The Jenkins project is configured to check out the pipeline scripts from the Bitbucket repository. These pipeline scripts define the stages of the deployment process and ensure automation across environments.
9.4.2.4.1 Deployment pipeline configuration and artifact management
A Jenkins deployment pipeline will be the orchestrator for the deployment process. The pipeline will be configured to check out the deployment scripts from the Bitbucket repository and use them to deploy the Retail CBDC solution to the Kubernetes cluster. The deployment pipeline will also be responsible for managing the artifacts required for the deployment. The artifacts will be pulled from the Nexus repository and used to deploy the solution to the Kubernetes cluster.
The target environment determines the type of artifacts, such as CBDC solution Terraform modules and associated container images and Helm charts, that will be pulled from the Nexus repository.
* For SIT (System Integration Test) environments, unstable artifacts will be used. Unstable artifacts used for deployment to SIT environments are synced as part of R3 PR gate checks. See the section on the artifact syncing process for more details.
* For higher environments (such as UAT), stable artifacts will be deployed. Stable artifacts will have gone through full R3 internal testing and verification cycle before being synced to the Nexus repository. See the section on the artifact syncing process for more details.
9.4.2.4.2 Deployment mechanism with Terraform
The deployment mechanism for these artifacts is managed using Terraform. Terraform is chosen for its declarative approach, where the desired state of the environment is specified as input. The deployment process involves the following Terraform commands:
* terraform init: Initializes the Terraform configuration and pulls the necessary providers and modules.
* terraform plan: Generates an execution plan to review the changes before applying them.
* terraform apply: Applies the changes to bring the solution environment to the desired state.
9.4.2.4.2.1 Deployment layers
* Cluster level: This layer will deploy cluster-level add-ons such as Kyverno and Linkerd.
* Shared services: This layer will deploy services such as Postgres, Ignite, and NATS, that are shared across network participants.
* Network participants: This layer will deploy network participants such as the Central Bank and Large Financial Institutions.
Each layer will have its own Terraform configuration and deployment logic. The deployment logic will be triggered by the Jenkins pipeline, which will check out the Terraform configuration from the Bitbucket repository and execute the Terraform commands to deploy the solution.
9.4.2.4.2.2 Terraform state management
The Terraform state files are stored in the Nexus repository, enabling consistent tracking of infrastructure changes across environments.
9.4.2.4.2.3 Terraform provider management
To ensure smooth integration, the required Terraform providers for deployment will be available in the client’s Nexus instance. This ensures that all dependencies are accessible within the client’s environment so there will be no reliance on external registries. R3 will be responsible for providing the binaries for the Terraform providers to the client to sync to their Nexus repository and use for deployment. These Terraform providers will be synced to the Nexus repository in a similar manner to how the solution artifacts are synced to the Nexus repositories. See the section Artifact syncing for more details.
9.4.2.4.3 Deployment upgrades
The process for upgrading a version of the CBDC solution will depend on the type of the deployment. The two types of deployments are:
* Long-running deployments (UAT, Staging, Production): For long-running deployments, the upgrade process will involve upgrading the existing deployment with minimal downtime. The process will involve the following steps:
* Terraform plan: Generate a plan to review the changes before applying them.
* Terraform apply: Apply the changes to bring the solution environment to the desired state.
* Rolling update: Perform a rolling update of the deployment to minimize downtime.
* Short-lived/ephemeral deployments (SIT): For short-lived deployments, following on from test executions, the deployment will be destroyed. The process will differ from the long-running deployments as the deployment will have been destroyed previously and so can be recreated with the new version. The process will involve the following steps:
* Terraform plan: Generate a plan to review the changes before applying them.
* Terraform apply: Apply the changes to bring the solution environment to the desired state.
* Test execution: Execute tests to validate the deployment.
* Terraform destroy: Destroy the deployment to ensure a clean environment for the next deployment.
9.4.2.4.4 Deployment rollback process
The deployment rollback process will involve rolling back to the previous version of the deployment. The process will involve updating the Terraform configuration to the previous version and applying the changes to bring the solution environment to the desired state. Considerations for the rollback process include:
* Rollback plan: Generate a plan to review the changes before applying them.
9.4.2.4.5 Conclusion
By leveraging this approach, the deployment pipeline ensures seamless, repeatable, and consistent deployments across environments, with clear separation between unstable and stable artifacts for solution environments.
9.5 Configuration
Configuration refers to the settings, parameters, and scripts required to configure and run a service in a given environment. Managing configurations across multiple environments requires a balance between security, efficiency, and operational overhead.
9.5.1 Overview
9.5.1.1 Problem statement
The solution consists of custom applications written by R3 and third-party off-the-shelf applications wrapped in Terraform. The custom applications are written to support configuration via Kubernetes config maps, populated from Terraform variables. Not all third-party applications are compatible with how Terraform works, requiring additional configuration steps post-deployment. Not all configuration is known ahead of time; some is expected to be provided by another service, and other configuration is applied at runtime.
A concrete example would be the API Gateway:
* There are some static settings configured ahead of time like the deployment mode and role.
* Some settings are expected to be created during the deployment process, like passwords saved in known locations as Kubernetes secrets.
* Route configuration is expected to be provided by upstream services sitting behind the API Gateway and stored as Kubernetes CRDs or ConfigMaps.
9.5.1.2 Expectations
Configuration should be integrated into the deployment process as much as possible, and any post-deployment configuration should be automated. Services should be configured via input variables within the IaC modules. In some cases, the IaC provider can handle post-deployment configuration using resources specifically designed for configuration or through a more generic capability to apply config after deployment. A declarative approach is preferred to ad-hoc scripts or commands for configuration management. Even consistent usage of scripts and commands can be difficult to trace and reason about as opposed to a declarative approach. Configuration should be versioned and tracked in VCS. There should be a mechanism to promote any configuration changes from one environment to another. Services should be set up in such a way that enable configuration to be changed without restarting.
9.5.1.3 Terminology
* Service configuration: Configuration settings that are specific to the service, such as:
* Feature flags
* Logging levels
* Performance tuning
* Security settings
* External services configuration
* User interface settings
* Infrastructure configuration: Configuration settings that are specific to the infrastructure, such as:
* Network settings
* Security settings
* Load balancers configuration
* API gateway configuration
* Auto-scaling settings
* Storage settings
* Configuration management tools: Tools that help automate the process of managing configurations across multiple systems and environments.
* IaC: Infrastructure as code
* Declarative configuration: A method of defining the desired state of the system, and the system automatically makes the necessary changes to achieve that state.
* VCS: Version control system
9.5.1.4 In scope
* Infrastructure configuration
* Configuration for microapps
9.5.1.5 Out of scope
* Applications running outside the Kubernetes cluster
9.5.2 Solution design
9.5.2.1 Proposed solution
9.5.2.1.1 Terraform first
Terraform is the IaC tool chosen by R3. Where services allow, configuration should be managed by Terraform at the time of deployment. Service-specific providers and modules can be used to provide detailed configuration. Services that use Helm charts can use templating to make the creation of dynamic entries in a values.yaml file easier. Applications and microapps being created by R3 should be written with Terraform in mind; see Microapp configuration. The advantage of using Terraform is that a single tool is used to deploy and configure applications and components. The same version can be deployed (using the same Terraform state) such that only the configuration changes are applied.
Advantages:
* A single tool is used for both deployment and configuration.
* Declarative configuration is used.
* Terraform state reflects the actual state of the service and can be used to show proposed changes.
Disadvantages:
* Not all services are compatible with Terraform.
* For services which cannot do the full install and setup in one go, and multiple passes are required, this creates a complex deployment process and maintenance overhead.
9.5.2.1.1.1 Microapp configuration
For microapps being created by R3, configuration should be managed using YAML files. This is because YAML is human-readable, supports a wide range of data types, and meets our requirements for flexibility and ease of use. Terraform can use these YAML files to create Kubernetes ConfigMaps or secrets, defined in the application’s Terraform with values as Terraform variables. Configuration files could also be injected into the application’s container by a secret manager (for example, Vault Agent Injector) but that would require application specific design. This should also help when deploying into an existing environment where the applications are already running, allowing configuration updates to be applied.
We will use the following configuration structure:
* YAML format for file-based configuration: We will use the YAML (YAML Ain’t Markup Language) format for our configuration files. YAML is human-readable and supports a wide range of data types, making it suitable for our needs.
* Embedded resource file for default configuration: The default configuration will be embedded as a resource file within the application. This ensures that the application has a baseline configuration to fall back on if no external configuration is provided.
* Override configuration with file locations: Overrides can be passed into the application as a list of file locations. When multiple files are provided, the configuration values from files on the right-hand side will override those from files on the left-hand side. This allows for flexible and layered configuration management.
* JVM system properties and environment variables for overrides: JVM system properties or environment variables can be used to provide additional overrides if required. This allows for dynamic configuration changes without modifying the configuration files.
9.5.2.1.2 Post-deployment configuration: avoiding local-exec
Where services are not created in a way which is compatible with how Terraform works, post-deployment configuration can be handled by Terraform in several ways. A common approach is to mirror what a developer would do manually using the command line, inside a null_resource block with a local-exec provisioner. This approach is not recommended as it is not idempotent, and the Terraform state will not reflect the actual state of the service. Local-exec is also not platform agnostic and can be affected by a developer’s local environment. The recommendation is that developers actively avoid relying on local-exec for configuration.
Advantages:
* Quick to implement
Disadvantages:
* Not idempotent
* Terraform state does not reflect the actual state of the service
* Not platform-agnostic
* Enables developers to create complex and difficult to maintain scripts
9.5.2.1.3 Post-deployment configuration: Kubernetes resources
Instead, we should create a Kubernetes job that can be run post-deployment to configure the service. This job can be written in such a way that it checks if the configuration has already been applied, and if not, applies it, with success criteria to set the status of the job. If the configuration simply needs to be read somewhere, Kubernetes secrets or ConfigMaps can be used to store the configuration, and the service can read from these. This has the advantage of being dynamic, and the service can pick up changes; depending on how the service is written, it may need to be restarted to pick up changes.
Advantages:
* Flexibility: Jobs can be configured to perform various configuration tasks, such as modifying configuration files, interacting with APIs, or executing commands on application pods.
* Developer platform-agnostic: Kubernetes resources are platform-agnostic and can be run on any Kubernetes cluster.
* Idempotent: Jobs can be written in an idempotent way to ensure that they can be run multiple times without causing issues.
* Status reporting: Jobs provide status information, logs, and metrics to track the progress and completion of configuration tasks.
Disadvantages:
* More resources: Additional Kubernetes resources are required to manage configuration tasks.
* Limited to Kubernetes: This approach is only applicable to services running in a Kubernetes cluster.
9.5.2.2 Alternative solutions
9.5.2.2.1 Why not use Ansible for all configuration?
Whilst we are not covering how applications outside the Kubernetes cluster are configured, it is worth mentioning that Ansible could be used here. Ansible is a powerful tool for configuration management and can be used to configure services running inside and outside the Kubernetes cluster. R3 has experience with Ansible, and it is a well-known tool in the industry. Ansible has been used by the client in the past. However, it is more effort to create and maintain Ansible playbooks for services which do have Terraform support, given we are committed to using Terraform for the deployment.
9.5.2.2.2 Puppet
Puppet is another configuration management tool, like Ansible, which could be used to configure services. However, given R3 and the client’s experience with Ansible, it is not recommended to introduce another configuration management tool.
9.5.2.2.3 Key-value store for configuration
A distributed key-value store can serve as a centralized configuration management solution. Applications can directly read their configurations from this store, which acts as a single source of truth across the infrastructure.
Advantages:
* Centralized management: Single point of configuration for all applications, reducing configuration drift and management overhead.
* Consistency: Built-in distributed consensus ensures configuration consistency across all availability zones in a distributed context.
* Cross-AZ support: Native support for multi-AZ deployments with strong consistency guarantees.
* Scalability: Can handle large number of applications and configuration updates efficiently.
* Integration: Most key-value stores provide client libraries for various programming languages.
Disadvantages:
* Additional infrastructure: Requires deploying and maintaining additional infrastructure components.
* Integration with applications: Applications need to be modified to read configurations from the key-value store which, depending on if we are developing the application or using existing third-party application, can be a big disadvantage.
9.5.2.2.4 Configuration server
A configuration server provides a centralized and dynamic way to manage configuration settings for applications and services. It acts as a central repository for storing and distributing configurations, allowing updates to configuration without redeploying. Applications retrieve their configuration settings from the configuration server at startup or on demand. The configuration server can push updates to applications in real-time or through periodic refreshes.
Advantages:
* Same as KV store
Disadvantages:
* Complexity: Setting up and maintaining a configuration server can add complexity to the infrastructure.
* Performance: The configuration server needs to be highly available and performant to avoid impacting application performance.
* Versatility: A configuration server is not a one-size-fits-all solution for Kubernetes and non-Kubernetes components; components like load balancers, API gateways, and so on have separate configuration mechanisms.
* Overhead: The features offered by a configurations server (such as dynamic feature toggle) should be required by the applications; otherwise, it can be an overhead.


10 Cryptography and public key infrastructure
10.1 Overview
The R3 Platform requires cryptography services to sign data and verify signatures in the context of a protected identity. These services depend on asymmetric key pairs and necessitate a public key infrastructure (PKI) to distribute public keys securely across networks, ensuring they are linked to the correct identities.
The cryptography and PKI services are used to sign both data at rest and data in transit within the R3 Platform at the application layer. Data at rest includes ledger transactions, although does not have to be limited to that. Where secure communications are implemented at the network level (for example, a service mesh/network comms proxy which applications hand off mTLS comms to), it is expected the service mesh will use its own internal key management mechanism. The application layer PKI can be used to provide trust anchors in the form of certificates to that service mesh if required; this is considered an operational concern and is not covered by this document.
R3 employ industry-standard off-the-shelf solutions and use well-known open protocols wherever possible. Cryptography services and the PKI solution is no exception to this. The R3 Platform uses HashiCorp Vault as the basis of all cryptography and PKI services. HashiCorp are experts in this area and strive to ensure Vault continuously complies with industry best practices and the requirements of common standards bodies. HashiCorp Vault functionality is subdivided into “engines”. Only the engines which provide required functionality for any particular platform need to be enabled. In the case of the R3 Platform, the following engines are enabled:
* Transit for cryptography services
* PKI for PKI services
* Key/Value (KV) for certificate storage
Cryptography services and PKI are bound concepts. However, each offers a fundamentally different service:
* Cryptography services manage cryptographic keys, including asymmetric key pairs, and operations against these keys, such as signing and verifying signatures.
* PKI services ensure the public key components of asymmetric keys can be distributed around multiple parties whilst offering guarantees that those public keys are affiliated to some known identity.
This chapter details both services and also any interaction between the two where this is necessary.
10.2 Architecture/context
An overview of the entire cryptography and PKI service architecture for a single network participant and the platform operator network is shown in the following diagram. Each section of this chapter will detail the various functional blocks of this diagram in more detail.

Figure 99: PKI and Crypto Overview
10.3 Deployment infrastructure
The following diagram shows the components above projected onto a deployment infrastructure. Here we see two network participants running private networks and their interactions with the platform operator private network. Services in the blue boxes are running as containers in Kubernetes. There may be multiple instances of some containers, to facilitate a highly available system (not shown).

Figure 100: PKI and Crypto Deployment
10.4 Compliance
The R3 cryptography solution conforms to the NIST Key Management Guidelines in the following ways:
* HashiCorp Vault uses 256-bit AES-GCM encryption; reference: Security Model | Vault | HashiCorp Developer
* The R3 Platform currently uses 2048-bit RSA keys for all asymmetric key pairs. This is also the HashiCorp Vault default and the R3 platform takes HashiCorp’s lead in this respect.
* FIPS standards for post-quantum cryptography are currently a work in progress with respect to HashiCorp Vault; reference NIST’s post-quantum cryptography standards: Our Plans.
On the last point, it is well documented that quantum computers today are nowhere near powerful enough to break algorithms with sufficiently wide keys; for example, RSA 2048-bit keys, which are commonly used for internet encryption. Once post-quantum algorithms become available in HashiCorp Vault, we are able to switch over to them, and this is projected to be at least a decade sooner than required. In the R3 Platform application layer we have two requirements for the use of cryptographic algorithms to sign data: data at rest and data in transit. Data in transit is not affected by the switching of cryptographic algorithms; it is simply a case of starting any new communication using the new algorithm. Communications, and more specifically the lifetime of JWTs, is short. To accommodate data at rest, algorithm switching the distributed ledger supports a flexible approach as to which algorithms are used to generate signatures such that the platform can support many at the same time. However, data at rest would still persist, signed with old algorithms, until such data was replaced.
In the case of immutable ledger transactions, replacing this data is not a case of trivially rewriting it, but it is still possible. Transactions (or backchains of them) which eventually have no unconsumed states (all CBDC tracked by them is redeemed) become unreachable to the ledger. At this point they can be removed (or archived) from the ledger and it is no longer of concern whether they are tampered with (archived data could be protected from tampering in other ways). This can be leveraged if we wish to switch away transactions from any older algorithm in the future. We can redeem all issued CBDC signed by old algorithms and reissue it with new algorithms. This is out of scope for the current iteration of the product given the timescales involved, the focus today is on future proofing only.
10.5 Prerequisites
10.5.1 Terminology
* PKI (Public Key Infrastructure): A framework for managing digital certificates.
* CA (Certificate Authority): An entity that issues and manages digital certificates.
* CSR (Certificate Signing Request): A request sent from an applicant to a CA to apply for a digital identity certificate.
* Root CA: The top-most CA in a hierarchy that signs its own certificate.
* Intermediate CA: A CA that is signed by the root CA and can issue certificates to end entities.
* HashiCorp Vault: A tool for securely storing secrets.
* Transit Engine: A feature of HashiCorp Vault used for cryptographic operations.
* PKI Engine: A component of HashiCorp Vault that provides PKI functionalities.
* Key/Value (KV) Engine: A component of HashiCorp Vault that provides key value store functionalities.
* Signing Service: A service that signs data using cryptographic keys.
* Terraform: An infrastructure as code software tool that provides a consistent CLI workflow to manage cloud services.
* SPIFFE: A standard for attribution of identities to arbitrary entities in a network.
* JSON Web Key (JWK): A JSON data structure that represents a cryptographic key.
* RBAC: Role-Based Access Control; a security mechanism to restrict access based on user roles.
10.5.2 Background reading
It is assumed the R3 Cryptography and PKI High Level Design is read prior to reading this chapter. The following links provide optional background reading for subjects touched on in this chapter, although they are not mandatory reading.
* HashiCorp Vault Documentation
* HashiCorp Vault Authentication
* PKI Basics
* PKI Engine considerations
* PKI Trust chains (aka chain of trust)
* SPIFFE
* JWK Format: RFC 7517
* RSA PSS Salt Length on MDN
* Getting started with Ktor Client / Create a client application
* RFC 5280 - Internet X.509 Public Key Infrastructure Certificate and Certificate Revocation List (CRL) Profile - 4.1.2.2. Serial Number
* Raft Consensus Algorithm
10.6 Cryptographic key management
10.6.1 Overview
We have a requirement for a secure and efficient cryptographic service for key management and signing operations. Our solution leverages a cryptography-as-a-service solution. Our approach provides strong security, easy integration, and maintainability.
The key facets of our solution are:
* Use HashiCorp Vault Transit secrets engine for cryptographic signing. Vault Transit offers secure storage of keys, encrypted at rest with the ability to store the decryption key in a separate security domain.
* The HashiCorp Vault deployment must be highly available to ensure continuous key management and signing operations.
* The deployment should support automatic failover to maintain service availability in case of node failures.
* The system must be able to handle high volumes of cryptographic operations efficiently, taking only single digit millisecond response times for signing.
* All data stored within Vault must be encrypted at rest and in transit.
* The deployment should include monitoring and alerting mechanisms to detect and respond to issues promptly.
* The system should be resilient to network partitions and other infrastructure failures.
* The deployment must support secure authentication and authorization mechanisms to control access to cryptographic keys.
* We will use Vault for signing only, not for verifying signatures which can be done locally inside the application.
* The deployment must have the ability to generate industry standard CSRs from asymmetric key pairs in order to integrate with the PKI.
10.6.1.1 In scope
* Use off-the-shelf services to provide key management and cryptographic signing. That is so that the customer creates a support/purchaser relationship with the supplier of the technology and not R3. R3 is not in the business of reinventing existing technology, and support is best left to the experts supplying the technology.
* Private key management for secure key storage:
* Generate key pair at application deployment time.
* Generate CSR at application deployment time. This is an input to the PKI solution; see later sections.
* Application authentication with Vault for limiting access to signing service on a per private key basis.
* Versioning of key pairs for rotation purposes.
* Control over which version of a private key is used to sign.
10.6.2 Dependencies
* Certificate Store/lookup service: This forms part of the PKI solution; see later sections. In the context of key management, the dependency is simply that an application has access to public keys of entities across all network participants for which signature validation might have to take place.
* HashiCorp Vault Transit secrets engine
10.6.2.1 Out of scope
The following are the responsibility of the customer.
* Management of the root decryption key.
* Unsealing of Vault; this is typically done via a process of Shamir key sharing among employees, or via a separate HSM deployed in a separate security domain.
10.6.3 Solution design
The basis of the solution is to leverage HashiCorp Vault Transit secrets engine due to its robust security features and ease of integration:
* Security: HashiCorp Vault provides a secure environment for key management and cryptographic operations. Use it in a way that private keys are never exposed to the client applications, reducing the risk of key compromise.
* Scalability: Vault is designed to handle high volumes of cryptographic operations efficiently. This makes it suitable for applications that require frequent signing operations.
* High Availability: Vault supports high availability configurations, ensuring that cryptographic operations are available even in the event of node failures.
Key features of the solution:
* Vault will securely store key pairs.
* Vault will sign data sent to its REST service. This incurs the cost of a network hop, but that is a cost we are willing to pay for the reduced risk of key compromise.
* Vault can, but will not, be used to verify signatures. Verification of signatures is a mathematical operation which can be done entirely locally as long as the public key component of the signatory is available. Avoiding the use of Vault for signature verification avoids the cost of a network hop.
The use of Terraform for deployment ensures that the infrastructure is reproducible and maintainable, facilitating seamless integration and scalability.
The root encryption key is stored externally so if the device(s) on which Vault is deployed is compromised, it is impossible to decrypt the private keys. Even Vault on its own cannot decrypt the keys without the external key which is always kept in a separate security domain to the Vault device (for example, a HSM).
We will use Vault policies to control access to the Transit Engine. Vault policies are based on REST paths allowing us to control access to individual keys or entire secret engines. Each use case will have its own key pair. The key pair is stored in Vault under a name that the application will use to access the key pair for use. An application can use more than one key pair. Authentication with Vault is explained more fully in a chapter below.
10.6.3.1 Key versioning
HashiCorp has a concept of key versions. Each version of a key is a unique key pair stored under the name of the key. Keys under different versions are unrelated except for the name they are stored under. When Vault creates a new version of a key, it immediately generates a new key pair and makes it available as the latest version under the key name. We control which version of the key we sign with because we need to have issued a certificate for the key before we can use it. To control which version we use, we use an attribute of the key called min_encryption_version. This attribute is set to the new key version only when the key is ready to use. On setting this attribute, requests to use the previous version fail with an error response from the Vault. When the library sees this error response, it fetches the latest value of min_encryption_version and retries the sign operation with the version stored within. In normal operation, fetching the min_encryption_version is performed before the first sign operation a process performs and is cached until the value changes.
Multiple threads in the same application are prevented from fetching the min_encryption_version value at the same time, making fetching min_encryption_version thread safe.
Key versioning is at the heart of the key rotation mechanism; see Key versioning.
10.6.3.2 Architecture/context
Applications wishing to sign content or verify signatures interact with Vault and the certificate store via a Cryptography SDK, see Cryptography SDK for more information on the SDK and certificate store. They are not detailed further in this section.

Figure 101: System Context
In terms of deployment, the application, Vault and the certificate store are running in different containers in a Kubernetes cluster. Vault can run as a multi-tenanted service with regards to the isolation of private keys with a single Transit engine, but also with regards to multiple engines, including multiple engines of the same type within the same server host. Vault operates a high availability service by means of running multiple replicas concurrently. The following diagram illustrates three Vault instances running a single Transit engine each:

Figure 102: Deployment
See Availability guarantees for more information on replication.
10.6.4 Implementation components
10.6.4.1 Component 1 - HashiCorp Vault Transit secrets engine
10.6.4.1.1 Overview design
HashiCorp Vault Transit secrets engine is used for key management.
We will use the following operations of the Vault REST API:
* Create Key
* Rotate Key
* Set min_encryption_version
* Get min_encryption_version
* Sign
* Sign CSR
10.6.4.1.2 Availability guarantees
Vault achieves high availability (HA) through its integrated Raft storage backend, which uses a consensus algorithm to replicate data across nodes in a single cluster. Each node stores data locally, and the leader node handles writes while ensuring strong consistency. Standby nodes are ready to take over automatically if the leader node fails, ensuring minimal downtime and continuous operation. This setup provides redundancy within a single cluster and can span multiple availability zones (AZs) for added resilience. The standby nodes will forward the requests to the leader node.
With enterprise Vault comes support for a feature called “performance” standby nodes. This feature allows standby nodes to handle read operations themselves directly rather than forwarding them. Write operations are still forwarded to the leader node. This setup improves latency for read operations, which are far more frequent than write operations, because it avoids an extra network hop. This mode of operation also has the effect of distributing much of the load across the standby nodes in the cluster. Vault also supports performance replication, which distributes read operations across geographically distributed clusters, providing global scalability and fault tolerance.
The Terraform modules provided by R3 described later support deploying a highly available (HA) Vault cluster with integrated Raft storage. However, enterprise features like performance or DR replication require customer-specific configurations.
A recommended HA setup can be found here.
More details on the Raft storage can be found here and here.
More details on the Performance Standby nodes can be found here.
The expectation is that the customer deploys in HA mode for production. The customer should discuss with HashiCorp as part of their enterprise support license the recommended configuration for deployment of a HA system.
10.6.4.1.3 Data consistency guarantees
Key pairs stored inside Vault are read-only for most of their lifetime. Updates happen when creating a new key pair and enabling it for use by setting min_encryption_version. When creating a new key pair, the existing key pair continues to be used until the new key pair is fully ready to be serving all sign requests. That ensures applications always have a working key pair.
If secrets are rotated, only one AZ takes responsibility for running the rotation event; for instance, on a particular automated cadence. During a partition event where clusters in different data centers are isolated from one another, only the active data center’s cluster will be making updates to secrets. In this case, only one leader is ever made aware of the new key, which should not cause contention issues. The new key will be replicated as normal to the standby data center once the partitioning event is over.
10.6.4.1.4 Fault tolerance and disaster recovery guarantees
See section Resiliency and recovery below.
10.6.4.1.5 Security guarantees
* Encryption: Vault provides encryption at rest and in transit for all the data it manages.
* Offline root encryption key: Vault uses a root encryption key stored in a different security domain, such as an HSM, to encrypt the data at rest.
* Separation of duties: Different key pairs are created for each use case.
* ACL policies: Vault policies are defined to control access to each key pair.
10.6.4.2 Component 2 - Key Pair Generation Agent
The key pair generation agent is rolled into certificate issuance, which is described in Certificate and asymmetric key lifecycle. The nature of this agent means that key-pair generation can be split apart by the customer should they wish, but as this agent acts as an end-to-end process which manages keys, certificates and key promotion towards the Cryptography SDK, it is detailed below.
10.6.4.3 Component 3 - Terraform modules and deployment
10.6.4.3.1 Overview design
HashiCorp Vault is deployed using a dedicated Terraform module for deployment of the Vault service only. This module does not instantiate or configure any engines. It is used wherever a Vault service is required and is a prerequisite for deploying further Terraform modules which enable engines. Production deployments cannot use the Business Source License version of Vault which is used by this module. We expect customer production systems to have their own licensed enterprise Vault deployed. This Terraform module can potentially offer a template for a customer enterprise deployment, but this will need attention by the customer. The Terraform module deployment includes HA configuration. Vault needs automatic unseal to support a HA configuration. We leave flexibility in how this is achieved so customers can choose the best method for their deployment.
HashiCorp Vault Transit secrets engine is enabled using a separate Terraform module. The path of the Transit secrets engine is configurable; multiple Transit secrets engines could be deployed on the same Vault service. This module can be used to enable the Vault engine on enterprise Vault deployments.
A single Vault deployment can support multiple storage engines. We create usernames and passwords for applications to use and define Vault policies to restrict access to the keys so each application only has access to its own keys. The usernames and passwords are created at application deployment time. Authentication with Vault is explained more fully in a chapter below.
10.6.4.3.2 Features
* Terraform deployment
* HashiCorp Vault deployed
* Transit secrets engine enabled
* HA configuration enabled
* Username and password for application
* Vault policy for application
Optional features for test or development deployments only:
* Script for key and certificate creation
* Certificate signed by CA
10.6.4.3.3 Limitations
Unsealing is the process of reconstructing the master key necessary to decrypt the data stored in Vault. The approach to unsealing the Vault is left to the customer to define. Vault supports multiple unseal methods. This process can be manual, where key shares are entered by operators, or automated with the help of an HSM (hardware security module).
10.6.4.3.4 Security guarantees
Security guarantees are created by the DevSecOps pipeline and accompanying infrastructure; for example, to ensure modules are not tampered with, rather than the modules themselves.
10.7 Public key infrastructure
10.7.1 Overview
This document presents the architecture for establishing a public key infrastructure (PKI) using HashiCorp Vault. PKI services ensure the public key components of asymmetric keys can be distributed around multiple parties whilst offering guarantees that those public keys are affiliated to some known identity.
The PKI includes key components such as:
* The root and intermediate certificate authorities (CAs)
* A certificate signing request (CSR) processing service (certificate issuance)
* A certificate store
These components work together to issue, store, and manage certificates for network participants, ensuring cryptographic authenticity for transaction signatories and providing a scalable and secure PKI system for the platform.
This section gives a topology and overview of the entire PKI. The details of these components are further elaborated in the following sections of this chapter.
The R3 Platform uses certificates which conform to the X.509 standard, as per industry norms. Where the term “certificate” appears in this chapter, it can be assumed that it always refers to an X.509-format certificate.
10.7.1.1 In scope
* A public key infrastructure (PKI) is present, to issue certificates to network participants.
* An intermediate CA is present, that can issue end-entity certificates in response to certificate signing requests (CSRs).
* Certificate storage in a central repository is available and accessible via a queryable API.
* Issued certificates should be used for verifying transaction signatories.
* The solution must ensure robust security.
* The system must be designed to accept a root certificate issued by a third-party root CA.
* The storage and retrieval of certificates must be scalable and highly available.
* The system must be designed to accommodate features such as certificate revocation, renewal, and management.
* The solution should ensure the auditability of all the certificates issued even after the network participants have left the system.
10.7.2 Dependencies
* HashiCorp Vault PKI and KV engine
* Terraform
10.7.3 Solution design
Creating and managing certificates is a complex process. Implementing a traditional certificate authority (CA) or developing a custom in-house solution from scratch would not be practical. HashiCorp Vault offers a scalable, secure, and automated approach to certificate management. Its PKI engine can be used to set up both root and intermediate CAs, providing a flexible and automated solution for issuing and managing certificates. There will be a separate PKI engine instance for each network participant’s intermediate CA, providing isolated and independent certificate issuance for each participant.
Features of Vault:
* Vault has a PKI engine which can be deployed as a root or intermediate CA.
* The PKI engine as an intermediate CA is able to issue end-entity certificates based on CSRs.
* The intermediate CA can be signed by the root CA.
* Roles for both the root and intermediate CAs can be defined to manage certificate issuance.
* The Vault Key Value store can be used to store certificates securely.
The root CA does not have to be deployed using Vault. Customers can bring their own root CA, but it has to be able to sign the intermediate CA’s certificate. The R3 deployment of Vault is typically used for root CA purposes only in automated test pipelines.
A Terraform script automates the deployment process, configuring HashiCorp Vault, initializing the PKI engines, and setting up certificate issuance.
10.7.3.1 Architecture/context
The following diagram shows basic components of PKI including key management (detailed in the previous section) to better illustrate interactions between them. The root CA is also shown which exists outside the R3 Platform. Components in green are replicated inside every network participant’s network, those in blue exist once only at the platform operator network.

Figure 103: PKI Topology
* Root CA: The root CA is the top-most CA in the hierarchy, and it signs its own certificate. It is used to certify the intermediate CAs. The recommended option is to bring your own root CA.
* Intermediate CA (PKI Engine): The intermediate CA certificates are signed by the root CA and are responsible for issuing end-entity certificates to network participants. Each network participant will have its own intermediate CA. A single Vault instance can host multiple intermediate CAs, each with its own PKI engine.
* Certificate issuance/registration authority: The function that fetches and processes the certificate signing requests (CSRs) submitted by network participants when new key pairs are generated, and facilitates the storage of certificates in the certificate store. On completion, the key store is notified of success, and the private key can be promoted to the active key. Key generation, certificate issuance, certificate storage, and private key promotion are always performed in that strict order. As such, these three functional components are combined into a single script for convenience.
* Certificate store: A storage module for storing the certificates and retrieving certificates in a secure scalable way. This component is hosted in both the platform operator network and each network participant network. When a certificate is requested from the network participant store and it does not yet exist there, it is pulled from the platform operator store.
10.8 Certificate authority, certificate trust chain, and validation
10.8.1 Overview
This document details the design for a certificate authority (CA) component within a public key infrastructure (PKI) setup, which is responsible for issuing the end-entity digital certificates to the network participants. These digital certificates authenticate and verify the identities of digital signatories in transactions, ensuring that only validated participants can sign data within the platform.
Data consistency is a fundamental feature of certificates in the sense a chain of trust is established from what is known as a trust anchor down through a chain of certificates, each of which signs the next, until you reach an end-entity certificate. Trust chains are a well established and documented feature of PKI and will not be discussed at length here; see Background reading for external reading material on this subject.
In a PKI setup, a root CA serves as the top-level authority. The root CA certificate is self-signed and trusted by all participants. Root CAs are responsible for issuing certificates for its subordinates, and these subordinates might include further organizational CAs. That is, an organization might have a more complex authoritative certificate chain that just a single root CA. The last CA in this certificate chain is responsible for issuing certificates for intermediate CAs, which in turn issue end-entity certificates to participants.

Figure 104: Root CA Hierarchy
Subordinate CA certificates are signed by the previous link in the certificate chain and so on, establishing a foundational trust chain. For simplicity, where we refer to a root CA or a root CA certificate in this document, we are referring to the last subordinate in the organizational chain: essentially, the certificate delivered to the platform which it uses as a trust anchor. Where there are multiple subordinates in the organization’s chain, or no subordinates at all, is not a concern of the CBDC platform.
The R3 platform has an intermediate CAs for each network participant (the diagram above shows a single network participant) to allow for scalable certificate issuance with isolated management for different network participants. This is an industry norm, as described in the following references:
A separate, intermediate CA, should be used per technology or organizational function: https://www.ncsc.gov.uk/collection/in-house-public-key-infrastructure/pki-principles/use-a-separate-intermediate-ca-per-technology
Dedicated intermediate CAs (ICAs), sometimes referred to as subordinate or issuing CAs, are used to issue end-entity certificates exclusively for one specific company: https://www.globalsign.com/en/custom-ca-private-pki
Specific functions of the intermediate CA within each network participant include:
* Generation and regular rotation of ledger keys’ certificates
* Generation and regular rotation of application identity keys’ certificates
* Generation and regular rotation of network specific service mesh certificate
It is not scalable for the platform operator to get involved in certificate issuance every time a network participant needs a certificate. Having the platform operator issue a certificate to a network participant can be an expensive process which requires organizational in-person ceremonies to be conducted. It also may require the platform operator to bring their root CAs online if they are ordinarily kept offline for security reasons. This process cannot usually be automated and therefore would have a severe limiting effect on the cadence of key rotation.
From an internal network perspective, the act of generating a certificate is an act of certifying trust to different services within its own organization. This “self-issuance” consists of a trusted entity at the network participant being made responsible for certifying a specific service running in the network. The intermediate CA is thus a privileged and trusted entity which has a particular focus for being managed securely. By having its intermediate CA sign a certificate, the network participant is giving its seal of approval that it trusts that end entity as part of its organization.
The system architecture could support integration with existing customer CAs if preferred. However, this document focuses on setting up intermediate CAs using HashiCorp Vault’s PKI engine. By leveraging HashiCorp Vault’s PKI engine, we aim to streamline certificate issuance, enhance security, and align with industry standards for digital signature verification.
The need for crypto agility means that different signing operations (and different end-entity certificates) might require different cipher suites, and therefore potentially require them to be issued under separate roots. The R3 PKI design outlined here can accommodate this, although we do not consider it in any more detail in this document. The Vault services running as part of the PKI solution can accommodate multiple instances of the PKI engine with trust anchored in different roots, which allows significant flexibility for future features of this kind.
Features like certificate revocation and renewal will be covered in separate sections.
10.8.2 Chain validation
An entity in possession of an end entity certificate can validate:
* The end entity identity bound to a public key is trusted by way of being signed by the CA of the network participant which owns the end entity.
* The CA of the network participant is authorized by the platform operator to sign end entity certificates.
Root keys are trusted platform wide as they are circulated securely at deployment time and baked into an immutable configuration. This is the same approach used to embed pre-trusted certificates into browsers or operating systems.
The R3 Platform employs what we can think of as an at least two-tier certificate hierarchy. The exact number of tiers depends on the number of subordinates in the organization’s “root chain” as described above, but we can think of the first tier as this entire chain.
* The first tier subdivides identities into network participants.
* The second tier disambiguates key pairs within the network participants used for different signing operations.
This way you get a unique end-entity certificate per type of signing operation across the entire platform. This offers the following advantages in terms of mitigation of the effects of compromised keys:
* If a private key of a network participant CA is compromised, it only affects this network participant’s end entity key pairs. These must be rotated; however, we do not need to rotate end entity key pairs from other network participants because they are signed by CAs which are not compromised. If all certificates were issued by the same CA, a private key compromise would require all key pairs in the entire CBDC platform to be rotated.
* The platform operator’s root CA can be better protected from compromise by not having it exposed to signing requests from network participants on a continuous basis. The private key component can be completely isolated from the platform, thus keeping it safe.
This document does not provide the low-level details of certificate profiles, but these profiles are made available in a separate document which is required at platform deployment time. These profiles are particularly important when it comes to the intermediate certificate issued by the root CA, because it is the constraints added to this certificate at the time it is generated by the platform owner which form an important part of the security architecture of the PKI.
One aspect of the profile which is important to highlight is that of name constraints. Name constraints stop a CA from creating certificates for subordinates whose names do not match certain criteria, preventing member node spoofing. A nameConstraints field must be added to all intermediate CA certificates which specifically prohibit the intermediate CA from issuing certificates to end-entities which lie outside the network for which it is authoritative. Certificate identities in the R3 platform are hierarchical such that the end-entity identity is a “child” of the CA identity. This facilitates this check. Identities follow the SPIFFE standard which is a URI based scheme which easily allows for hierarchical naming in the form SPIFFE://platform/parent_ca/end_entity. More on this is covered in the Network identity chapter of this document.
This name constraint protects identity which cannot be circumvented by elements of the PKI. If a certificate for an end-entity did not conform to the name constraint set by the platform owner, the certificate would be considered invalid by other network participants. On top of this, the intermediate CA for each network is itself is configured such that it will not issue certificates from end-entities that are not hierarchical children in terms of their SPIFFE ID. Although this is a network local lockdown, it is not on its own enough for other networks to trust its certificates. Entities which have permissions to use the CA APIs to issue certificates from a CSR are not permitted to reconfigure the CA; configuration is a highly privileged operation which is done at network deployment time. The name constraint is also verified by the Cryptography SDK, which gives a third level of protection.
The Cryptography SDK (described more fully in Cryptography SDK) applies the following checks to the trust chain. While these are explicit software-based checks, they are essentially checking the standard rules of trust chain validation. Off-the-shelf certificate libraries are expected to provide much of this validation out of the box:
* Each certificate in the trust chain must be signed by the associated private key of the previous link in the chain. The public keys within each certificate can be used to verify each signature.
* Traversing up the chain must eventually lead to a trusted root certificate. Root certificates are circulated securely at deployment time to each network.
* The certificate must be within its valid period at the time of signing. Comparing the signature timestamp to NotBefore and NotAfter certificate attributes. Note that it is valid to use expired certificates to verify signatures of data at rest which was written at the point in time the certificate was still valid as long as the data at rest is timestamped. This ensures that time elapsing cannot by itself make signatures invalid - more on this below.
* The certificate cannot have been revoked at the time of signing. The certificate store metadata will indicate the revocation status of the certificate. As with expiry, revoking a certificate after signed data was stored at rest is not enough to invalidate that signature. Where certificates are revoked, it is recommended that an audit of data signed by the certificate is undertaken by the customer. For example, if it is determined that a private key has been leaked, the customer should revoke the certificate but cannot make assumptions about which signed transactions might have been made fraudulently, and the R3 platform cannot determine this. Instead, the customer must make their own decisions about suspicious transactions.
* The end-entity signing certificate identity matches the issuer identity to ensure intermediate CAs only issue certificates for their own organization. Certificate identities in the R3 platform are hierarchical such that the end-entity identity is a “child” of the CA identity. This facilitates this check. Identities follow the SPIFFE standard which is a URI-based scheme which easily allows for hierarchical naming in the form SPIFFE://platform/parent_ca/end_entity. More on this is covered in the Network identity chapter of this document.
* The end-entity certificate’s identity must match the identity within the signature. The Cryptography SDK concatenates identity to the data prior to signing and the signing then covers both.
These rules being met form the basis of non-repudiation of authenticity with respect to signed data within the R3 Platform.
10.8.3 Timestamping
Typically, in PKI solutions, timestamping is performed by a timestamp service which itself signs over the timestamp with a private key for which there is a certificate and chain of trust to validate the timestamp. The R3 platform does not have such a service. Instead, timestamp integrity is a function of the sub-system, which is either persisting the signed data, or validating the signatures. In the case of the R3 platform this is the distributed ledger. The ledger is responsible for ensuring that spoofed timestamp data would not result in verifiable transactions. In essence, this spoofing would be blocked by virtue of the fact any network participant can only spoof timestamps in their own network’s data store.
When a transaction is validated by another party, there would be no record of the spoofed data at that party, and the ledger would not have consensus on the states originating from this transaction. There is always at least one other party in any transaction in the platform: this is the notary which runs in the platform operator’s private network. Where it is not possible for a network participant to write data into the notary’s data store, spoofing timestamps would not result in verifiable transactions.
Irrespective of the timestamp or certificate implementation, timestamps on data presents a conceptual problem. Just how far in the past you can trust signed data is an open issue for the organizations which are using the data in question. This is not a question the R3 platform can answer as a technical detail, instead the platform provides reporting and monitoring solutions which allow customers to query and track the state of transactions.
Where an organization believes data was signed too far in the past, it must take some corrective action which would be bespoke to the specific customer deployment of that platform. This could include, for example, consuming and reissuing some state. It might be something more user experience-centric; for example, informing a user that they had “old” currency in a CBDC wallet and returning it to the customer’s fiat account.
10.8.3.1 In scope
* Establish a public key infrastructure (PKI) to issue certificates using a root and intermediate CA.
* Implement a root CA to sign intermediate CAs, which are responsible for issuing end-entity certificates to network participants. Root CAs are deployed by R3 only in test environments.
* If there are existing CAs at the client side, the system should be flexible enough to integrate with them.
* Setting up the CA should be modular enough such that the client can choose only the components they need.
* The system should support onboarding the CAs for new network participants.
* Ensure certificates issued authenticate network participants and are usable for verifying digital signatures within transactions on the platform.
* Security: Implement robust security measures, especially around Root CA management, including role-based access control.
* Scalability: The CA setup should handle an increasing number of network participants without performance issues.
* High availability: Ensure the CA is highly available to meet platform demands.
10.8.4 Dependencies
* HashiCorp Vault: The PKI engine within Vault is used to set up and manage the Root and Intermediate CAs.
* Terraform: Infrastructure as Code tool used to deploy and configure the Vault PKI engine.
10.8.5 Solution design
The certificate authority (CA) component is expected to establish a robust, flexible PKI for issuing the digital certificates, ensuring that each network participant can be authenticated and verified in platform transactions. Certificates should conform to PKI standards and be issued based on validated certificate signing requests (CSRs).
The expected outcomes include:
* Secure issuance and storage of digital certificates in compliance with industry standards.
* High availability and scalability of the CA to meet platform demands.
* Extensibility to support future certificate lifecycle features, including revocation and renewal.
As described in other sections of this chapter, Vault is deployed with a Terraform module which enables none of its engines. We then use separate modules for enabling a root CA (used in automated test pipelines) and for enabling an intermediate CA.
10.8.5.1 Architecture/context
The system architecture is designed to accommodate both existing client-side PKI and the creation of new PKI as needed. It also supports a hybrid mode, enabling the integration of specific existing CAs while setting up additional required CAs. For instance, a client may have an offline root CA that they wish to use for signing intermediate CAs. The system is built to seamlessly integrate with such configurations.
In HashiCorp Vault, PKI engines are a type of secret engine component that can act as certificate authorities. A single Vault instance can host multiple secret engines, allowing for the creation of a flexible and scalable CA structure.

Figure 105: Certificate Authority Overview
10.8.6 Component 1 - Root and intermediate certificate authority
10.8.6.1 Overview design
The root CA (and any subordinates) is the top-level authority in the PKI hierarchy and is responsible for signing intermediate CA certificates. The root CA is self-signed and trusted to sign intermediate CA certificates. The Terraform root CA module will set up a single root CA by enabling an instance of the PKI engine in an unsealed Vault instance. It expects the Vault instance to be already deployed and unsealed by the Terraform Vault module. This module is not intended for production use cases: it exists to facilitate CI pipelines for testing and development. The script will also tune the engine, generates the root CA certificate, and creates a role for the root CA. The role defines the permissions for the certificates issued by the root CA. One important consideration during the verification process is that the end application should check the chain of trust to ensure that the certificate is signed by the root CA. This requires securely propagating the Root certificate to each network participant, which is a critical step but falls outside the scope of the PKI setup itself.
More details on the root CA creation can be found in HashiCorp Vault’s documentation here.
The Terraform intermediate CA module will set up the intermediate CA by enabling an instance of the PKI engine. This module is intended for production use cases. The intermediate CA certificate is signed by a root CA (either a customer’s own or one generated by the previously mentioned module for CI purposes) and the intermediate CA can issue end-entity certificates. Certificates are issued with a TTL of one year. The certificates are secured with a 2048-bit RSA key.
More details on the intermediate CA creation can be found here.
Vault is configured by the Terraform module in a HA configuration. Different CAs are always configured as separate PKI engines, even when they are hosted within the same Vault instance or in the same network. This ensures a clear separation of duties, allowing distinct access control lists (ACLs) to be applied to each engine. This separation is fundamental to maintaining security and trust boundaries within the PKI hierarchy, irrespective of the deployment architecture.
10.8.6.2 Fault tolerance and disaster recovery guarantees
See section Resiliency and recovery below.
10.8.6.3 Security guarantees
* Offline root CA: The root CA can be kept offline to ensure further security.
* Separation of duties: The root CA and intermediate CAs are always configured as separate PKI engines, even when they are hosted within the same Vault instance or in the same network. This ensures a clear separation of duties, allowing distinct access control lists (ACLs) to be applied to each engine.
* Roles: The roles defined for the intermediate CA enforce the certificate issuance policies.
* ACL policies: Vault allows the definition of ACL policies for each secret engine, which gives more control over certificate creation and management per participant.
* The CA runs in a trusted network of its owner and only the process/operator which triggers certificate issuance has the necessary privileges to issue a certificate.
* A CA can only sign certificates for its own sub-end-entities as per the rule on identity hierarchy above. This means a malicious signing within the trusted network could, at most, sign a certificate to validate the signature of some end-entity running inside the same trusted network. A CA cannot be maliciously used to sign certificates for other network participants.
10.8.7 Component 2 - Terraform modules and deployment
10.8.7.1 Overview design
HashiCorp Vault is deployed using a dedicated Terraform module for deployment of the Vault service only. This module does not instantiate or configure any engines. It is used wherever a Vault service is required and is a prerequisite for then deploying further Terraform modules which enable engines. Production deployments cannot use the Business Source License version of Vault which is used by this module.
We expect customer production systems to have their own licensed enterprise Vault deployed. This Terraform module can potentially offer a template for a customer enterprise deployment, but this will need attention by the customer. The Terraform module deployment includes HA configuration. Vault needs automatic unseal to support a HA configuration. We leave flexibility in how this is achieved so customers can choose the best method for their deployment.
Intermediate CAs are deployed via a separate Terraform module. It will instantiate a PKI engine inside a running Vault service and initialize it for use as an intermediate CA accordingly.

Figure 106: Intermediate Certificate Authority
A second Terraform module is available for enabling and configuring a root CA. This is typically used for automated test pipelines or development where a real root CA is unavailable or unnecessary.

Figure 107: Intermediate CA
10.8.7.2 Features
* Terraform deployment
* HashiCorp Vault deployed
* PKI Engine enabled
* HA configuration enabled
* Username and password for application
* Vault policy for application
Optional features for test or development deployments only:
* Root CA
* CA certificate signed by root CA
10.8.7.3 Limitations
Unsealing is the process of reconstructing the master key necessary to decrypt the data stored in Vault. The approach to unsealing the Vault is left to the customer to define. Vault supports multiple unseal methods. This process can be manual, where key shares are entered by operators, or automated with the help of an HSM (hardware security module).
10.8.7.4 Security guarantees
Security guarantees are created by the DevSecOps pipeline and accompanying infrastructure; for example, to ensure modules are not tampered with, rather than the modules themselves.
10.9 Certificate propagation: platform operator and local certificate store
10.9.1 Overview
The platform operator network has a central store of every certificate ever issued in the platform. This is required in case a network participant ever leaves the network or becomes unreachable. The central authority managing the network, or other network participants, should not be blocked from verifying signatures of transactions in this situation. It is therefore critical that a reliable and robust source of certificates is available as a central source of truth. All network participants’ local stores of certificates pull from this central store if a certificate is not available to them locally.
Certificate propagation is a critical functional area within the platform’s PKI, designed to ensure seamless, secure, and efficient management of certificates across both the platform operator and network participant environments. At its core, lies the certificate store, a flexible system comprising two key components:
* Back-end Vault KV store: A scalable, and durable key-value storage system based on HashiCorp Vault.
* Front-end REST Service: A lightweight service layer that facilitates validation, certificate storage, retrieval, and propagation through RESTful APIs.
The certificate store is replicated in two environments, serving distinct purposes:
* Centralized store (platform operator environment): Acts as the authoritative repository for all platform-issued certificates, ensuring long-term storage, compliance, and auditability. It provides the backbone for certificate issuance and management.
* Localized store (network participant environment): Designed for fast certificate retrieval, reduced latency, and fault tolerance at the network participant level.
The certificate store operates in the standardized JSON Web Key (JWK) format to maintain compatibility with cryptographic standards and ensures robust role-based access control (RBAC), audit logging, and scalability. Together, these components form the foundation for efficient certificate storage, retrieval, and propagation across the platform.
The certificate propagation system ensures seamless distribution of certificates from the centralized certificate store at the platform operator to the localized stores at network participants. The system is expected to provide secure and scalable storage using a backend solution that supports high availability, scalability, durability and role-based access control. It enables efficient, low-latency retrieval of certificates at the localized store, ensuring quick access for transaction verification. Certificates are stored in JSON Web Key (JWK) format to maintain compatibility with widely used standards.
10.9.1.1 In scope
* Centralized certificate storage: The certificate store should provide a centralized repository for storing and retrieving certificates issued by the platform’s PKI.
* Durable storage: The storage solution should be secure and durable to ensure long-term access to certificates.
* Local certificate store: The certificate store should act as a local store for network participants for faster retrieval of certificate and fault tolerance.
* Metadata storage: Along with immutable certificates, the storage solution should allow for the storage of mutable metadata necessary at the time of verification (for example, revocation status) or for operational reasons of the store itself (for example, metadata refresh cadence).
* RESTful API: The certificate store should provide RESTful APIs for retrieving certificates based on unique identifiers.
* Data validation: The certificate store should validate the certificate data against predefined standards before storing it, ensuring consistency.
* Scalability: The storage solution should be able to scale horizontally to accommodate a growing number of certificates and network participants.
* Low latency: The certificate store should provide fast retrieval of certificates to minimize latency for network participants.
* Disaster recovery: The storage solution should support disaster recovery mechanisms to ensure data availability in case of failures.
* Auditability: The certificate store should maintain a clear audit trail of certificate access and modifications, allowing for easy auditing and compliance checks.
* Compatibility: The storage solution should support the JWK format for certificates, ensuring compatibility with widely used cryptographic standards.
* Access control: The storage solution should enforce fine-grained access control policies to ensure that only authorized users can write/modify certificate metadata.
10.9.1.2 Out of scope
* Configurable cache invalidation strategies: The local certificate store’s metadata works based on the basic cache expiry based on TTL. Advanced features like customizable cache invalidation strategies are out of scope.
10.9.2 Dependencies
* HashiCorp Vault: The certificate store relies on HashiCorp Vault’s Key-Value store for secure and scalable storage.
10.9.3 Solution design
10.9.3.1 Architecture/context
Certificate propagation encompasses the systems and components responsible for ensuring secure, scalable, and efficient management of certificates within the platform’s PKI. At the core of this architecture is the certificate store, a dual-purpose solution deployed in both the platform operator’s environment and the network participant’s environment, serving distinct roles tailored to their contexts.
At this level, three logical systems interact with each other:
* Certificate issuance system: Responsible for issuing the certificate and packaging it in the JWK format.
* Platform operator system: Responsible for storing the certificate in the certificate store.
* Network participant system: Responsible for retrieving the certificate from the certificate store and using it to verify the transactions.
The following topology diagram the interaction between these systems:

Figure 108: Certificate Management
The container topology diagram drills down to the containers within the above software systems that are relevant to the storage and retrieval of the certificates. Though the certificate issuance system consists of various containers like the certificate authority, the one component most relevant to the storage and retrieval of the certificates is the CSR processing service, which is shown in the below diagram. Certificate issuance is broken down and detailed in the next section of this document and so will not be detailed further here.
The most important container for certificate propagation is the certificate store. The certificate store will be deployed in both the platform operator’s environment and the network participant’s environment. At the platform operator’s side, it acts as a central repository for storing certificates. At the network participant’s side, it acts as a local store, storing certificates for faster retrieval. The Certificate Store is further divided into two components: the Back-End Vault KV Store and the Front-End Rest Service.

Figure 109: Certificate Propagation Container
* Back-end Vault KV Store: The storage component that stores certificates in the JWK format along with metadata.
* Front-end REST service: Sits in front of the Vault KV store and enforces data validation before storing certificates in the Vault KV store, when deployed in the platform operator’s environment. In the network participant’s environment, it ensures that the certificates are retrieved from its back-end Vault KV store, if available, before retrieving it from the central certificate store.
10.9.3.2 Sequence and interactions
10.9.3.2.1 Certificate storage
The detailed breakdown of the certificate issuance system is the focus of the next section in this document. In this section it is enough to know that the certificate issuance system is responsible for providing a certificate and that this certificate must be made available to all network participants for the validation of signatures.
1. The certificate issuance system generates a certificate in the JWK format and sends it to the platform operator’s certificate store.
2. The front-end REST service in the platform operator’s environment validates the certificate data against predefined standards.
3. If the certificate data is valid, the front-end REST service stores the certificate in the Vault KV store.
4. The certificate issuance system receives a success response indicating that the certificate has been stored successfully. The certificate issuance system will also update the certificate in the issuing participant’s transit engine and update the minimum encryption version of the key.
10.9.3.2.2 Certificate retrieval
1. The network participant requests a certificate from the local certificate store.
2. The front-end REST service in the network participant’s environment checks if the certificate is available in the local Vault KV store.
3. If the certificate is not available in the local store, the front-end REST service retrieves the certificate from the central certificate store. The certificate is then stored in the local store for future use.
4. The certificate is returned to the network participant for verification.

Figure 110: Certificate Propagation Sequence
10.9.4 Component 1: Back-end Vault KV store
10.9.4.1 Overview design
The back-end Vault KV store component is responsible for the storage of the certificates in the JWK format along with the metadata. When deployed in the platform operator’s environment, it acts as a central repository for storing certificates. This storage provides the long-term access to the certificates, even after the network participants exit the system. The central storage also simplifies the retrieval process while ensuring the scalability, availability, and durability of the certificates. The certificates will be stored and fetched via the open standard JWK format.
In the network participant’s environment, this component acts as a local storage for the faster retrieval of certificates. The front-end REST Service is responsible for checking the local store for the certificate and, if it is not present, retrieving it from the central certificate store and updating the local store with the certificate for future direct retrievals.
The back-end storage is based on HashiCorp Vault Key-Value store, which offers several key advantages:
* Vault is the technology choice for the key management and PKI. So, by using its KV store, we are using one type of technology across the board.
* Role-Based Access Control (RBAC) for fine-grained access control for write operations.
* High availability and scalability, making it ideal for storing certificates of multiple network participants.
* Leverage existing Vault disaster recovery mechanisms to ensure data availability in case of failures.
* Audit logging to track access and modification, providing a clear history of certificate usage.
10.9.4.2 Features
* Certificate storage: Stores certificates issued by the Vault PKI engines of all network participants.
* Certificate retrieval API: Provides RESTful APIs to retrieve certificates by their unique identifiers. More details on the Certificate Key are covered below.
* Metadata storage: Along with certificates, the service stores metadata necessary for certificate management and auditing. The service should allow updating metadata for the authorized users. More details on the metadata are covered below.
* Scalable and secure storage: Utilizes Hashicorp KV store to ensure security, scalability and fast retrieval of certificates.
* Auditing: Facilitates certificate auditing by storing all certificates, including those for network participants that may no longer be active.
10.9.4.2.1 API and Data Model
Two important types of data stored in the Vault KV store are the certificates and the metadata. The certificates are stored in the JWK format and the metadata is stored as a JSON object. The certificates are immutable and the metadata can be updated by the authorized users. To enforce this distinction, they are stored in separate paths:
* Certificates: /v1/CertStore/data/certificates/{networkParticipantId}/{certificateKey}
* Metadata: /v1/CertStore/data/metadata/{networkParticipantId}/{certificateKey}
This allows fine-grained access control policies to be applied at the path level and avoids accidental modification of the certificates. The details about access control are covered in Authentication with Vault.
In most cases, both these sets of data are retrieved together. The front-end REST service combines both into a single response for network participants.
10.9.4.2.2 Metadata
The metadata field stores additional information about the certificate, including the revocation status and date (if any) of the certificate. The revocation status is a Boolean value indicating whether the certificate has been revoked or not. If the certificate is revoked, the revocation date is also stored in the metadata. At the time of certificate verification, the revocation status and date are used to determine the validity of the certificate based on whatever timestamp the signed data is associated with. Data which was signed after any revocation date is considered invalid.
10.9.4.3 Fault tolerance and disaster recovery guarantees
See section Resiliency and recovery below.
10.9.4.4 Security guarantees
Certificates are a protected entity in our platform because their continued existence is required to validate transactions already stored in the ledger. Certificates are also entirely immutable once issued. Thus, only entities with privileged access should be able to write to the certificate portion of the KV store, whilst writing metadata is much less of a risk and can be performed by users with lower levels of privileges.
The primary security mechanisms in play in the certificate store are:
* Separation of paths: The certificates and metadata are stored in separate paths in the Vault KV store to ensure that the metadata can be updated without modifying the certificates.
* Access control: Vault’s KV store allows fine-grained access control policies to be applied at path level. This ensures that only authorized users are allowed to write certificates to specific paths. As proposed above, the path should include the network participant ID. More details on the access control are covered in Authentication with Vault.
* Audit logging: Vault logs all access and modification to the KV store, providing a clear audit trail of usage.
10.9.5 Component 2: Front-End Rest Service
10.9.5.1 Overview design
The front-end REST service is a component deployed as a middleware service in front of the Vault KV store. It serves slightly different purposes depending on the environment it is deployed in. When deployed in the platform operator’s environment, it ensures that the incoming certificate data adheres to the platform’s standards before storing it in the Vault KV store. In the network participant’s environment, it acts as a proxy service, which checks if a certificate exists in the local store and, if it does not exist or has expired, retrieves it from the central certificate store. The certificate is then stored in the local store for future use.
10.9.5.2 Features
* Schema validation: Enforces JSON schema validation on incoming certificate data to guarantee compliance with the JWK format and other structural standards.
* Manage local store data: When the network participant requests a certificate, it checks the local store for the certificate before retrieving it from the central certificate store. The certificate will also be retrieved from the central store, if the certificate at the local store has expired. The certificate expiry is determined by the ‘lastUpdated’ field and the pre-configured TTL value. The certificates are then stored in the local store for future use.
* RESTful API: Provides RESTful APIs for retrieving certificates and metadata based on unique identifiers. Both these types of data are retrieved from the backend store and exposed as a single response to the network participant. The service also passes the bearer token it receives unaltered, allowing the underlying Vault authentication solution to handle access control and authorization.
10.9.5.2.1 Schema validation
The front-end REST service enforces JSON schema validation on incoming certificate data to ensure that it adheres to the platform’s standards. The data is expected to be in the JWK format, which includes fields like ‘kty’, ‘n’, ‘e’, and ‘x5c’. The service validates the structure, data types, and constraints of these fields before storing the certificate in the Vault KV store. This can be achieved with the help of serialization libraries like kotlinx-serialization.
10.9.5.3 Fault tolerance and disaster recovery guarantees
See section Resiliency and recovery below.
10.9.5.4 Security guarantees
Authentication and authorization of the incoming requests to update the metadata is handled by the Vault KV store. This is covered in Authentication with Vault.
10.10 Certificate and asymmetric key lifecycle
10.10.1 Overview
Asymmetric key pairs are required for every entity in each network in the platform which needs to sign data. Applications can contain one or more functional areas which need their own signing keys. For instance, the ledger application requires to sign its own transactions but also has a requirement for sending messages to another application and therefore needs to sign a JSON Web Token. Different key pairs are used in each case, as they are not shared between functional areas. The PKI itself does not insist that ownership of a key pair is bound to any particular entity in the platform. There is no strictly enforced requirement from the PKI that every micro-service must have a key pair, nor will one automatically be allocated by the PKI. Entities which do require key pairs have a requirement to ensure their deployment configuration must accommodate the generation of key pairs and associated certificates using the tools provided by the PKI.
Concretely, this will mean services delivered to the platform use a PKI Terraform module to interact with the PKI at deployment time to generate the necessary assets in the PKI and Cryptography services. This must be done after PKI and Cryptography services are deployed for obvious reasons. From then on, keys can be rotated through successive versions by triggering the same process. Enabling automatic rotation scheduling is also a responsibility of the associated service deployment and is achieved via another Terraform module. The module defines the rotation cadence and thus the versioning of this module constitutes the versioning of a rotation policy.
There is no software API to create key pairs from within service or application code. All key pair generation is considered an operational concern.
10.10.1.1 In scope
* Key pair generation: The certificate issuance component should generate a new key pair for an entity in the platform.
* Certificate signing request creation: The component should create a certificate signing request (CSR) based on the key pair.
* Certificate signing: The component should request the issuance of the certificate by the intermediate CA based on the CSR.
* Certificate storage: The component should store the certificate in the certificate store for future retrieval.
* Key management: The component should manage the association between the key pair and the certificate and update the key’s encryption version to allow for secure data signing.
* Compatibility: The component should ensure that certificates are stored in the JSON Web Key (JWK) format for compatibility with industry standards.
* Error handling: The component should handle errors gracefully and provide detailed error messages to the requester.
* Configuration: The component should allow for easy configuration of the certificate authority (CA) and certificate store endpoints.
10.10.2 Dependencies
* Access is required to the key management system for generating a new key pair and creating a CSR.
* Access is required to the intermediate CA to sign the certificate.
* Access to the certificate store is required to save the generated certificate.
* Access is required to the key management system to associate the certificate with the previously generated key and to update the key’s encryption version.
10.10.3 Solution design
At the system level, the certificate issuance system interacts with three logical systems:
1. The key management system, where a key pair and a CSR are generated, and the issued certificate is associated with the key pair.
2. The certificate authority system, which handles the signing of the certificate.
3. Finally, the certificate store, where the certificates are saved.
10.10.3.1 Architecture/context
The following topology diagram shows the interaction between these systems.

Figure 111: Certificate Issuance - System Context
10.10.3.2 Certificate expiry
All certificates have an expiry date, as it is part of the X.509 standard. It is common to assume more generally in PKI systems that once a certificate has expired it needs to be renewed. However, that is not the case in the CBDC platform. Data remains valid as long as the certificate was valid at the time the data was signed, irrespective of whether the certificate expired in the meantime. A certificate expiring does not invalidate a signature just because time passed. See Certificate authority, certificate trust chain, and validation for more information about how the expiry date forms part of our signature validation requirements.
Certificate expiry is then regarded by the CBDC platform not as a trigger to generate a new certificate, but instead as a trigger to rotate the key pair. Rotating the key pair will of course have the effect of generating a completely new certificate for the new public key of the key pair. Certificate expiry dates are set such that they exceed the maximum expected use of a key pair by a considerable margin. For example, if the key rotation cadence for a particular key is six months, the certificate might not expire for a year. The platform does not automatically detect soon-to-expire certificates; it is a requirement that the platform key rotation cadence be decided at deployment time to ensure signing is never attempted using keys for which the certificate already expired. Failure of the rotation process would be an issue for monitoring and alerts.
As such, there is only ever one certificate per key pair in the certificate store of the R3 Platform under normal operation. Technically, all components of the system could cope with multiple certificates per key pair, even ones where the time window overlaps with others, but this is only ever going to happen in some erroneous situation. It would be possible, for example, for a human operator with the relevant permissions to force this situation, but it would not be considered operationally problematic on a technical basis.
Note that when signatures are written, the identity the certificate holding the public key that can be used to verify the signature is pulled from the Vault Transit engine at the time of signing. The Transit engine holds a single certificate associated with each private key. It is this certificate which those parties wishing to verify a signature would use.
10.10.3.3 Component 1 - Certificate issuance and registration authority agent
10.10.3.3.1 Overview design
The certificate issuance component manages the issuance of certificates to network participants within the platform’s public key infrastructure (PKI). It serves as a bridge between network participants and certificate authorities (CAs), streamlining the process of generating certificates from standardized certificate signing requests (CSRs). In this sense it assumes the role of registration authority within the R3 Platform’s PKI solution. Additionally, it stores the certificates in the JSON Web Key (JWK) format, ensuring compatibility with industry standards.

Figure 112: Certificate Issuance Components
10.10.3.3.2 Sequence and interactions - generating new key pairs or rotating existing key pairs
The functional areas of certificate issuance are:
* Key generation (function of cryptography service)
* Certificate issuance (function of PKI/CA)
* Certificate propagation (function of PKI)
Because these stages must always follow on from one another in strict order, despite the cross cutting-concerns, the R3 Platform rolls all three functions of the “agent” together into one script. The script can be executed as a single workflow or divided into multiple stages, depending on the operator’s level of access to the systems.
Making this agent a script, rather than say a software service with a REST API, also makes it trivial to schedule as an automated task; see section Component 2 - Terraform modules below. The shell script is also designed to be executed manually by a privileged operator, making it particularly useful for emergency certificate rotations. If the customer prefers that this is not a matter for a script at all, but for a human operator to manually perform each step, the script is a reference tool for the order and nature of each step. Finally, a script is visible to the customer at the point of execution. The customer can be confident when the script is executed as a privileged user, the privileges are not being used for anything outside the scope of the functions required by this process.
The stages of the agent are:
Step 1: Key pair generation:
1. Generate a key pair in the key store of the key management system.
2. Create a CSR based on the key pair in the key store.
Step 2: Certificate issuance:
1. Send the CSR to the intermediate CA of the certificate authority system for signing.
2. The intermediate CA signs the certificate and returns it.
Step 3: Certificate propagation:
1. Store the certificate in the certificate store.
Step 4: Key promotion:
1. Associate the certificate with the key pair in the key store.
2. Update the key’s minimum encryption version in the key store.

Figure 113: Certificate Issuance Components
Storing the certificate in the certificate store first is crucial to ensure it is available to other participants before associating it with the key pair. Once the key’s minimum encryption version in the key store is updated, the key becomes ready for signing. Since the certificate must be accessible to network participants for verification at the time of signing, maintaining this order of operations is essential.
More details on the key’s encryption version can be found in Cryptographic key management.
10.10.3.3.3 Data consistency guarantees
The script does not persist state and relies on the Vault PKI engine to issue certificates. The Vault PKI engine provides strong consistency guarantees for the certificates issued.
If the corresponding public key is not available in the PKI before attempts are made to sign using the private key component of a key pair, other entities across the networks will experience a short period where they cannot verify the signature. This script guarantees the strict ordering requirement.
If any part of the script fails, it can be executed again without a huge impact. The worst-case scenario would be some artefacts existing within the various Vault engines which are never used, a key pair in the transit engine, or a certificate in the PKI. These can be cleaned up manually at any point in the future. In reality these are no more costly on disk capacity than any other key rotation event, which is minimal.
10.10.3.3.4 Fault tolerance and disaster recovery guarantees
In the event of a disaster, the requester can rerun the script which will resubmit the CSR request and new certificate will be issued. Until the certificate is associated with the key and the minimum encryption version is updated, the key will not be available for signing data.
If the script partially completes, the operator(s) are responsible for cleaning up any completed parts of the process. The script will report any errors during its operation, but there is nothing to recover from in the event of a DR situation being triggered. Failing to perform a cleanup does not impact operations but may result in unused resources in the PKI. Cleaning up requires deleting assets from the key management service (Vault Transit engine) and certificate store (Vault KV engine) which is a significantly privileged operation it should not be placed under the remit of an automated “agent”.
In practice, unless there is a repeating failure, the amount of orphaned data left behind by a script failure would be minimal, at most no more than any key rotation, and should not be cause for concern.
10.10.3.3.5 Security guarantees
Access permissions are required for the following interactions:
* Key pair generation and CSR creation in the key store
* Certificate signing in the intermediate CA
* certificate storage in the certificate store
* Key association and minimum encryption version update in the key store
The script operates as the role of registration authority, and is secured by the follow mechanisms:
* The use of CA APIs is strictly limited with ACLs. It is not possible to push a CSR to a CA without being granted the appropriate network privileges.
* A genuine and non-malicious CA cannot (by configuration as discussed in the CA section above) issue certificates for entities outside its network. Deploying a malicious CA would only be possible with access to the root key which exists outside the CBDC platform.
Privileges are also required by the script for the following APIs in the Vault Transit (Key Management) engine:
* Generate a key pair.
* Extract a CSR for the key pair.
If split into multiple stages, it may be necessary to verify the sender of the CSR before submitting it to the Intermediate CA for certificate issuance. The operator with certificate issuance permissions should ensure the CSR is sent to the appropriate Intermediate CA for signing, based on the sender’s identity. In practice the mechanisms designed to secure the CA above make issuance of a malicious or accidentally ill-configured end-entity certificate highly improbable.
The most serious attack vector on the PKI would be from issuing a certificate for a ledger key which does not contain a public key which is part of a key pair issued to the ledger legitimately. Such an event would leave an attacker with a private key which could be used to maliciously sign transactions and inject them into the ledger on behalf of a network participant. For this to occur, the following systems must have been compromised:
* The attacker must have gained access to the network participants trusted network.
* The attacker must have gained access privileges to the intermediate CA in order to have it sign a certificate for its private key it intends to use to sign ledger transactions.
* The attacker must have gained access privileges to the platform operator central certificate store in order to push their malicious certificate there.
* The attacker must have repeated the three steps above for another key pair which will be used for application identity.
* The attacker must have gained privileged access to the ledger in order to write transactions directly and be able to spoof the necessary database records in the ledger.
* The attacker must be able to spoof ledger to ledger messages and sign a JSON Web Token to authenticate itself with the ledger.
* The attacker must have gained access to the service mesh in order to configure it to route messages from its own process to both a counterparty and the platform operator notary ledger services which would process these messages.
The takeaway points here are that four of these seven points are not related to compromising the PKI. It is not possible to spoof transactions only by malicious manipulation of the PKI.
10.10.4 Component 2 - Terraform modules
10.10.4.1 Overview design
The certificate agent is executed via a Terraform module, and it runs as a one-shot process to completion before terminating, as opposed to be a continuously running service. There are two Terraform modules which execute the agent.
1. A module used at deployment time or for any other manually instigated key rotation event.
2. A module which deploys a Kubernetes CronJob which triggers agent execution periodically.
10.10.4.2 Features
* Terraform IaC deployment to generate key pairs.
* Terraform IaC deployment to trigger key rotation at a configured cadence.
10.10.4.3 Fault tolerance and disaster recovery guarantees
For the automated period execution, kube-state-metrics will be used to monitor the CronJob’s status and report failure or success to the reporting and monitoring platform. Where the one-shot execution is triggered, errors are reported directly from the agent and the operator which triggered it is responsible for actioning any cleanup as per the previous component description.
10.10.4.4 Security guarantees
Security guarantees are created by the DevSecOps pipeline and accompanying infrastructure; for example, to ensure modules are not tampered with.
10.11 Cryptography SDK
10.11.1 Overview
We have a requirement for a secure and efficient cryptographic service for key management and signing operations within our applications. As described above, our solution leverages the capabilities of HashiCorp Vault Transit secrets engine as a cryptography-as-a-service solution. To abstract away the product choice and shield the business logic from implementation details, we develop a library that interfaces with Vault. This library integrates cryptographic operations into our applications, while keeping the underlying implementation details hidden. Our approach provides strong security, easy integration, and maintainability.
The basis of the solution is to facilitate:
* Abstraction: By developing a library that interfaces with Vault, we abstract the cryptographic operations away from the business logic. This ensures that the business logic remains focused on its core functionality, while the library handles all cryptographic concerns.
* Scalability: Vault is designed to handle high volumes of cryptographic operations efficiently. This makes it suitable for applications that require frequent signing operations. Configured correctly, Vault will achieve single-digit millisecond response times for signing.
* Flexibility: The library can be designed to support multiple cryptographic backends in the future, not just Vault. This provides flexibility to switch or integrate additional cryptographic services without changing the business logic.
* Efficiency: The Cryptography SDK will perform its own signature validation in order to avoid having to make a network request. Certificates are fetched from the network participant local certificate store.
10.11.1.1 In scope
* Sign using key in Vault, returning signature and key identifier.
* Sign using the last version of the key which was promoted to operation by the certificate issuance system only.
* Verify signature locally using public key.
* Authentication with Vault.
* Fetching certificates from a network service.
10.11.2 Dependencies
* HashiCorp Vault Transit secrets engine
* Certificate store, a service which provides a REST API from which certificates can be fetched given a unique key. See sections above.
* Ktor inside the Kotlin Cryptography SDK for making HTTP requests.
10.11.3 Solution design
10.11.3.1 Architecture/context
The library used by business logic hides the use of Vault from the client application as much as possible. No backends other than HashiCorp Vault are supported so there is no option to choose different backends behind this abstraction, but under the usual principles of separation of concerns, the application code should not know anything about Vault.
The library provides sign and verify steps. The library interface is kept independent of the backend implementation.

Figure 114: Cryptography SDK High Level Overview
When a service which links against the Cryptography library starts up, the library configuration is loaded by the Corda Workflow SDK configuration system just like all service configuration. This is the point where Vault specific details like URL and username/password are configured. The application does not need to understand the configuration: just load it from the configuration file and pass it to the library. The library configuration schema further avoids using Vault specific configuration names in place of generic ones.
Once the service is running, there comes a need to use the library to sign and verify data. A factory returns the Vault implementation of the SigningService/VerifyService interfaces. These interfaces provide methods to sign and verify signatures of data.
10.11.3.2 Deployment
The library is deployed with the micro-service that uses it. The library is a dependency of the micro-service.
10.11.3.3 Key versioning
HashiCorp Vault has a concept of key versions where each name can have multiple key pairs stored within. It can be thought of as multiple independent key pairs where each pair is identified by name and version number. The library does not permit signing with the latest version of a key until the certificate issuance system notifies it of key version readiness. That is, the library does not leave the choice of key version to Vault Transit; instead, it is “pinned” to a known version in the PKI. This way, the SDK will use a new private key for signing only when there is a public key available to every network participant. The SDK implements a key selection algorithm that selects the version matching min_encryption_version which is an attribute of the key in the Vault which can be externally set by certificate issuance. The library fetches min_encryption_version before the first sign operation and continues to use that version. If min_encryption_version is increased by certificate issuance, the library observes a failure on the next attempt to sign (as it is now trying to sign below the minimum allowed key version) and so fetches the new value of min_encryption_version and re-runs the sign operation.
There are no external components monitoring key versions for the SDK; rather, each instance of the Cryptography library manages its own keys in a lightweight fashion, requiring just one extra network hop for any key which was rotated during the lifetime of the service which links to the library. Given that rotation events are rare in comparison to signing operations, the relative overhead in network traffic created by this solution is negligible.
Within the library, multiple threads are prevented from fetching and updating the local min_encryption_version value at the same time, making the update operation thread safe.
10.11.3.4 Validation
The SDK performs a number of checks on the certificate and trust chain in accordance with the rules set out in the CA section.
10.11.4 Component - Key management library
10.11.4.1 Overview design

Figure 115: SDK Container
A Kotlin library is provided for the applications to perform cryptographic functions. The library features a factory that returns an interface. The factory accepts a data object holding configuration. The factory method takes a key name as input so applications can choose to use more than one key if required by instantiating multiple instances.
The returned interface has methods for signing and verifying data. The methods support an asynchronous implementation in the form of Kotlin coroutine suspendable methods. The sign method accepts a parameter representing the data to sign and returns a signature object holding the cryptographic signature and a key identifier. The verify method takes the signature object plus data and returns true or false. The application is responsible for the persistence of the signature object alongside the data which was signed, and how this takes place will depend on the exact use case of the signing operation.
An implementation of the interface is developed for HashiCorp Vault Transit secrets engine. The implementation uses the Vault REST API to sign data. It does not use the Vault REST API to verify signatures. The implementation uses the Vault REST API to fetch the min_encryption_version of the key. It uses this version only to sign data.
The implementation fetches certificates from the certificate store over the network. It uses the public keys stored within certificates to verify signatures. It builds an in-memory store of public certificates in a map with the key being the issuer and serial number.
The hash algorithm, signature algorithm and salt length are configurable at the point of calling the signing function. The salt length depends on key size. This MDN article has this formula for calculating the maximum salt length for a given key size:
// from https://developer.mozilla.org/en-US/docs/Web/API/RsaPssParams
Math.ceil((keySizeInBits - 1) / 8) - digestSizeInBytes - 2;
Parameters for signing are returned as part of the return value for the sign operation. These parameters are used to verify the signature.
10.11.4.1.1 Certificate chain validation
The following checks on the certificate chain are performed before accepting a signature. These are the same as listed in the CA section above.
* The certificate was within its valid period at the time of signing. Comparing the signature timestamp to NotBefore and NotAfter certificate attributes.
* The certificate chains up to a trusted root certificate. The set of trusted root certificates are present in the library configuration.
* None of the certificates in the chain have been revoked. The certificate store metadata will indicate the revocation status of each certificate.
* The end-entity signing certificate identity matches the issuer identity to ensure intermediate CAs only issue certificates for their own organization.
* The end-entity certificate’s identity must match the identity within the signature.
10.11.4.1.2 Async via Kotlin coroutines
The library uses ktor-client for accessing the REST API. The sign and verify methods are marked as suspendable to make them coroutine aware.
10.11.4.1.3 Public key identifier
Enough information is returned to identify the key pair that was used to sign the data. The key identifier returned from the sign operation takes the form of the certificate issuer and serial number. This combination is unique and allows us to look up the certificate for verification. The information needs to be suitable to act as a single ID field that identifies the certificate uniquely even if multiple certificates are issued for the same key. To return this information, we need the certificate at time of signing. Vault has an option to store the certificate along with the key and this is performed as part of the certificate issuance process. The library fetches the certificate from Vault at the same time it fetches the version information for the key.
10.11.4.1.4 Certificate store
The validation component of the SDK keeps certificates in memory. They are refreshed periodically in order to fetch any new revocation data. It is not necessary to block validation whilst the refresh is in process: refresh is done on a worker thread to prevent this. Certificates themselves are immutable and never need to be dropped from the cache.
10.11.4.2 Features
10.11.4.2.1 Interface
* Interface with sign and verify methods
* Factory method to return implementation of interface
* Asynchronous methods for sign and verify
* Key identifier returned with signature
10.11.4.2.2 Implementation
* Implementation of SigningService/VerifyService interface
* Uses Vault REST API to sign data
* Uses Vault REST API to fetch min_encryption_version and public key
* Implementation of verify method
* Loads public certificates from certificate store and caches them in memory
10.11.4.3 Availability guarantees
This is a client library, not a service: availability guarantees are within the responsibility of the services themselves.
10.11.4.4 Data consistency guarantees
This is a client library, not a service: data consistency guarantees are within the responsibility of the services themselves.
10.11.4.5 Security guarantees
Communications to Vault are via mTLS which is provided by the underlying service mesh and is not an application layer concern.
The library requires a username and password to fetch an access token from Vault. These are injected as secrets; see the chapter Secrets management for more information on how this achieved within the R3 Platform. The access token is then used in signing all REST requests. When the access token expires, the library refreshes it by fetching a new one using the same username and password.
10.11.4.6 Fault tolerance and disaster recovery guarantees
We must maintain network access to the certificate store for loading certificates. In the first instance, this means the local certificate store must be reachable at a point where a certificate is not already cached in-memory by the library. Where the certificate does not exist in the local store, the local store pulls it from the central store - see the certificate store section for more details.
The implementation handles faults from the services it calls. On error, the implementation fetches the min_encryption_version and retries the sign operation. This is the mechanism by which the library is able to switch key versions after the min_encryption_version is increased on a new key.
The library also automatically considers all verification operations as failed where the min_encryption_version is set to zero in Vault. A value of zero means Vault will always use the latest version of the key which cannot be supported by the R3 Platform in case the associated public certificate is not yet pushed to the central store. The value is set to zero for all keys when they are first generated, meaning we reject signing operations on new keys until certificate issuance has completed using the same error handling.
If an authentication error occurs, the implementation fetches a new access token using the username and password.
Disaster recovery is not a responsibility of the client library, but the underlying services.
10.12 Authentication with Vault
10.12.1 Overview
Applications require secure authentication with HashiCorp Vault for a few distinct purposes:
* Accessing credentials stored as secrets. The credentials are used by runtime services to access resource on the platform such as databases or message buses.
* Accessing Vault for other (runtime) operations:
* Signing via the Transit engine.
* Key management in the Transit engine after key rotation/certificate issuance.
* Pushing a certificate to the central certificate store.
This section describes the approach to secure authentication with Vault for these purposes. Services need to authenticate for the purposes of pulling secrets, but for security purposes, using the same authentication details for the other operations should be avoided following the principle of least privileges (secrets are pulled at the container level, application processes are only exposed to secrets’ content). Vault itself supports Kubernetes authentication which provides a simple, secure way of allowing Kubernetes Pods access to Vault. It is a good way to access the secret store and solves the problem of needing a secret to access secrets. Not every service supports Kubernetes authentication, so we still need a traditional username/password secret for the services that use that type of authentication.
The secret store is read in Pod init at startup and the secrets stored inside the environment. This keeps the applications free of dependencies on Kubernetes and Vault, and ensures a predictable behavior when changing secrets. The process for modifying a secret is to create a new username and password in the target system and change the secret store to hold these new credentials. The existing Pods will still be running with the previous credentials, while new Pods will pick up the new account. A rolling restart of Pods will trigger all Pods to pick up the new secrets. This will give us secret rotation with no downtime. Once all Pods are using the new user account, the previous account can be removed.
The other (runtime) services we require from Vault are accessed with username/password authentication. This aligns with the use of username/password for other resources on the platform which require credential-based access. This reduces the need for complex re-configuration logic within long running applications. Using Kubernetes authentication for these runtime Vault operations would require handling of the JWT expiring by fetching a new token from Kubernetes.
For Vault runtime services, Vault takes the username/password and returns a token for future requests. That token will expire and when it does the application will use the same username/password to get a new token.
Kubernetes authentication cannot be used everywhere because many of our services do not support it, and where these are provided by a third party (for example, databases), we cannot change that.
This mechanism provides a secure and efficient authentication mechanism that fulfills the following criteria:
* Uses Kubernetes JWT tokens for initial secret retrieval at pod startup.
* Utilizes username/password authentication for accessing the Vault transit and PKI engines in the same way other runtime services are accessed.
* Ensures tokens are not reused across different services.
* Provides a seamless process for updating credentials without downtime.
The logic behind the solution is to enhance security by segregating authentication mechanisms. Using Kubernetes JWT tokens for secrets retrieval ensures that tokens are short-lived and discarded after use. Username/password authentication for signing operations allows for easy token renewal and management. This separation of concerns ensures that tokens are not reused across different services, reducing the risk of security breaches.
The scope of this chapter is limited to authentication in terms of fetching secrets from the Vault KV engine. The full design for secrets management, including architecture and client-side mechanisms for secret fetching, is described in Secrets management.
10.12.1.1 In scope
* Implement Kubernetes authentication for secrets retrieval from the KV engine.
* Implement username/password authentication for all other Vault operations.
* Ensure secure storage and management of credentials.
* Provide a process for updating credentials without downtime.
* Implement Vault policies and poles for the signing service.
10.12.2 Solution design
The solution uses Kubernetes authentication for secrets retrieval and username/password authentication for Transit/PKI operations. This ensures that tokens are not reused across different services.
Secret rotation is achieved by creating a new username/password pair and updating the secrets stored in Vault. Applications pick up the new credentials via a rolling restart. The existing username/password should be kept valid until all applications have been updated with the new credentials. Once all applications have been updated, the old credentials can be revoked. The reason we use a restart rather than a dynamic update is to manage the downtime of services. If the update were dynamic, all services could potentially go down simultaneously while they reconfigured themselves.
Rotating credentials with specific services such as databases and the message bus is a concern for the operation of those components. It follows that the same is then true for runtime operations against Vault (such as signing and PKI) which are treated as the same kind of service in the R3 platform. We do not automate this process because this would potentially obfuscate the auditing/monitoring activities. It is good practice to have a handle on the sets of active credentials of each service at any one time. This means that auditing logs for access events can be correlated with known credentials to ensure an attacker has not created their own credentials. If the rotation process is automated, it is much more difficult to do this correlation and spot potential attacks against services.
Note that NIST guidelines no longer recommend regular arbitrary password rotation, at least for human users, except where there is evidence of compromise. It is up to the customer of the R3 Platform to impose their own policies in this area. Services within the R3 Platform are of course all protected by their deployment within a trusted network. The customer must ensure the network remains secure and this is the primary defense against attackers compromising a service.
The proposed solution addresses the security concerns by segregating authentication mechanisms and ensuring no downtime during secret rotation.
10.12.2.1 Architecture/context

Figure 116: Vault Authentication Context
10.12.2.2 Sequence and interactions

Figure 117: Vault Authentication Sequence
10.12.2.3 Component 1 - Kubernetes authentication for secrets retrieval
10.12.2.3.1 Overview design
More information on the exact mechanism used to fetch secrets is provided in Secrets Management chapter. Here, we provide a brief summary to set the context in terms of authentication.
Kubernetes authentication is used to retrieve secrets from Vault at pod startup using an InitContainer. Pods are associated with a Kubernetes ServiceAccount that has the necessary permissions to access the secrets in Vault. The Kubernetes TokenRequest API is used to retrieve a token for the service account by the Kubernetes kubelet and injected into the pod via a serviceAccountToken mount. This mechanism is described by Google as bound tokens. This token is available in the mount to containers running in the pod, and in the R3 Platform it is the InitContainer which reads it and uses it to authenticate with Vault to pull credentials.
Whilst it is technically possible to steal this token from the underlying Kubernetes filesystem (all files are ultimately stored in plain text on a device somewhere, which is why we never use Kubernetes Secrets for storing credentials directly), the token would be no use to an attacker because it can only be used by the pod to which it is issued. This binding to a pod is guaranteed by the inclusion of the pod name in the issued token, and the validation of the pod name in the TokenReview API implementation, which is the API that consumers of tokens (in this case, Vault) use to validate tokens.
Compare this with storing non-expiring or non-bound tokens or credentials in Kubernetes Secrets. In that case, an attacker who can read the filesystem can access the service using the token or credentials they have stolen in the same way the pod can.
A ServiceAccount is created per application (micro-service) that requires the fetching of credentials to give us fine-grained control over the secrets that each application can access in Vault. The service account will need a Kubernetes Role and RoleBinding that grants access to Vault.
Vault needs a service account of its own to validate tokens.
10.12.2.3.2 Features
* Secure retrieval of secrets at pod startup.
* One-time use of JWT token, discarded after use.
10.12.2.3.3 Fault tolerance and disaster recovery guarantees
See Resiliency and recovery below.
10.12.2.3.4 Security guarantees
Security is provided by Kubernetes.
* Secure authentication using Kubernetes JWT tokens
* Kubernetes JWT tokens are short-lived and discarded after use in pod initContainer.
* Kubernetes JWT tokens are not written to the filesystem: they are read from the TokenRequest API and held in memory.
10.12.2.4 Component 2 - Username/password authentication for signing operations
10.12.2.4.1 Overview design
Username/password authentication is used to access the Vault Transit and PKI engines for signing and verification operations. Applications use the credentials to obtain an access token, which will be renewed upon expiry.
Policies and roles are created in Vault on a per-use case basis, where a use case is an application that wants to access some runtime service provided by Vault. Vault protects services via their URL which also includes the name of the engine instance. This means tenants represented in Vault by segregated instances of engines cannot access other tenants’ engine instances. It also means one application cannot not access Vault managed resources for other applications even in the same trusted network. Examples include keys for signing: an application is not able to sign with keys owned by another, or credentials in the KV store, nor can an application log in to services using other applications’ credentials.
An example of the fine-grained nature of the way Vault allows us to create policies for an individual role is shown below. This should not be considered an exhaustive set and is for illustration purposes. Placeholders beginning with a $ would be replaced by actual names pertaining to the specific network deployment.
path "$vaultUrl/v1/$transitEngineName/keys/$keyName" {
  capabilities = ["read"]
}
path "$vaultUrl/v1/$transitEngineName/export/certificate-chain/$keyName/$keyVersion" {
  capabilities = ["read"]
}
path "$vaultUrl/v1/$transitEngineName/sign/$keyName" {
  capabilities = ["create", "update"]
}
path "$vaultUrl/v1/$pkiEngineName/cert/${keyIdentity.serial}" {
  capabilities = ["read"]
}
path "$vaultUrl/v1/$pkiEngineName/cert/ca" {
  capabilities = ["read"]
}
10.12.2.4.2 Features
* Secure access to the Vault Transit engine.
* Secure access to the Vault PKI engine.
* Easy token renewal process.
* Long-running applications supported by non-expiring credentials.
* Fine-grained access control to specific engines and APIs within those engines.
10.12.2.4.3 Fault tolerance and disaster recovery guarantees
See Resiliency and recovery below.
10.12.2.4.4 Security guarantees
* Credentials are stored in HashiCorp Vault, which means like all other data managed by Vault they are encrypted at rest, protected by Vault’s authentication mechanisms, and unsealed by keys stored only in a separate security domain.
10.13 Resiliency and recovery
10.13.1 Overview
In this chapter we detail the resiliency and recovery concerns and strategy for each of the major subsystems that comprise the Cryptography and PKI services. We do not consider the agents or libraries here, as they are not continuously running services that need consideration of recovery on failure outside the usual error handling mechanisms employed in source code.
10.13.2 Service instances and availability
Every deployment of Vault (note in Kubernetes terms, Vault is deployed as a StatefulSet rather than a Deployment) consists of multiple running instances. A Kubernetes Service load balances requests to each instance. When an instance dies, the underlying Kubernetes controller will restart it. Given that there is a short period of time while the Kubernetes liveness probe might not detect failures, the Cryptography SDK retries failed requests for a limited period to work round these transient issues. No loss of service is expected during this process, only a small potential delay to requests being serviced.
This is the basis of resiliency in the Cryptography and PKI services and covers all engines, which in terms of the R3 platform means:
* Signing and key management service
* Intermediate certificate service
* Central platform operator certificate store
* Local network participant certificate store
The certificate stores are fronted by dedicated stateless services backed by Vault. These services are deployed as a scalable Kubernetes Deployment and Service to load balance between them.
10.13.2.1 Read and write operations
The following operations against Vault are read operations. An Enterprise Vault deployment will load balance read operations across all nodes in the same AZ.
* Signing data (Transit engine)
* Fetching credentials (KV engine)
* Fetching certificates (KV engine)
Signing data is the most time critical operation, because it happens multiple times in the flow of committing a transaction to the ledger. Every party signs the transaction prior to writing to the ledger. Signed JWTs are also required during this flow to facilitate communication between the parties. However, signing operations are not required on a per instance of communication basis. Rather, the JWT is cached and refreshed based on its configured expiry, which is in the order of seconds. In practice, just a handful (low single digits) of extra JWT signing events would be incurred per party every expiration period.
The next most time critical event would be fetching certificates. Fetching certificates is required for any signature validation event, which is also incurred during a transaction. However, certificates are cached by the PKI in two places. The first is in the local network certificate store, but more importantly certificates are cached within the signature validation component of the SDK. Certificates are small and many can be kept in memory without incurring significant memory overhead. Certificate metadata is refreshed periodically to get the latest revocation information, but this does not block the validation function. Otherwise, new certificates are fetched again only when a key rotation occurs. This is expected to be significantly less frequent relative to the millisecond duration of transaction processing and therefore considered negligible.
Fetching credentials only occurs on pod startup and can be disregarded in terms of the flow of a transaction.
The following operations against Vault are write operations. This will always be handled by the leader and trigger a replication event to the other instances.
* Generating a new key pair (Transit engine)
* Certificate issuance (PKI engine)
* Certificate storage in the central store (KV engine)
* Certificate pull from a local store (KV engine)
* Rotating credentials
Apart from pulling certificates, already mentioned, these are all infrequent operational aspects of the PKI. Their being actioned would not interfere with transaction throughput or latency.
10.13.3 HashiCorp Vault storage
The signing, CA and certificate data persistence services are realized by various HashiCorp Vault engines. Irrespective of the engine, the Vault storage implementation is the same. Vault provides fault tolerance through its storage backends. The instances of Vault in the R3 Platform all use the integrated Raft storage solution provided by Vault. Raft storage backend supports data replication and redundancy across multiple nodes within a high-availability (HA) cluster, allowing it to span multiple availability zones (AZs). This setup ensures that data remains accessible even if one AZ goes down.
Vault employs the Raft consensus algorithm to ensure that writes are committed only after a majority (quorum) of nodes in the cluster have replicated the data. This guarantees durability even in the event of a leader node failure or during leader re-election. If a leader fails during a write operation, the new leader will ensure the consistency of the data by continuing the replication process. While this eventual consistency model may occasionally result in transient verification failures, it significantly enhances the system’s performance, scalability, and fault tolerance.
10.13.3.1 Cross-site replication
Where multiple data centers exist, the expectation is that key promotion (incrementing the minimum encryption version) is blocked until replication across data centers is confirmed. The R3 Platform leverages the fact Vault write operations are tightly controlled either via a manual operator or automated agent performing only infrequent write operations. Irrespective of the nature of replication, this operation must only be performed in the active data center at any one time. This control over write operations means that we have a more stable system during any site failover situation, and we can use this fact to more easily ensure there is no data loss in Vault.
Assuming a write operation was not in process during a failover scenario, the configuration of Vault replication between data centers is largely moot because latency of these infrequent operations is not a concern. The standby site will take over operations and be fully up to date as is.
An edge case might exist where the active site promotes a key and signing operations against it begin and the standby site is not yet replicated: specifically, the standby site does not have access to the accompanying certificate. This would result in the standby site potentially being unable to validate signatures. This edge case should be managed at the point of rotation rather than failover such that any standby site is considered completely up to date before the active site promotes keys.
It is possible to deploy Enterprise Vault using asynchronous replication between data centers in what they refer to as a DR replication feature. More details can be found here.
10.13.3.2 Raft References
* Raft consensus algorithm: Raft
* More details on Vault’s consistency guarantees can be found here and here.
10.13.3.3 Backups
Vault services can be backed up and restored via a built-in snapshot feature. It is expected that backups are performed regularly. An extensive backup plan is out of scope of this document.
Where a backup is restored, the following considerations should be taken into account, and possible manual intervention is required to mitigate them.
* Loss of any private keys generated since last backup: End-entities (signers of data) must be subjected to the key rotation process. Until this is done, end-entities would attempt to sign with old keys, and thus their signatures could end up being considered invalid (if the certificate has expired or been revoked). This would preclude them from being involved in transactions, although it would not lead to any data loss. If old private keys’ certificates are still valid, signing with old private keys for a short period would not present a problem.
* Loss of certificates since last backup: This could potentially result in signatures of previously committed transactions being unable to be validated. This could prevent unconsumed states being inputs to new transactions: essentially, it would stop CBDC being spent.
10.13.4 Two-tier certificate store architecture
The central certificate store can be repopulated from a number of places as well as a backup:
* The combination of all network participants’ certificate authorities.
* The combination of all network participants’ Transit engines.
* The combination of all network participants’ local certificate stores, although it is not guaranteed this is the entire superset of certificates.
The two-tier storage architecture ensures that the certificates are stored centrally in the platform operator’s environment and locally in the network participant’s environment. This setup provides high availability and fault tolerance, ensuring that certificates are accessible even if one of the storage components fails.
When a network participant leaves the network permanently, it is recommended to make a separate backup of all their certificates.
It is also highly advisable that where shared Vault services are used to host multiple engines, there is still a split such that certificates end up being backed up by different Vault service instances. The worst-case scenario would be to have a single Vault service and backup where the backup becomes corrupted to the point all certificates are lost, and all copies of certificates are within the same backup.
The two-tier storage architecture adopts an eventual consistency model for read operations, particularly in the network participant’s environment. The local store may contain stale data if the certificate’s metadata has been updated in the central certificate store, but not yet synchronized with the local cache. This trade-off is acceptable for the benefits of improved performance and reduced latency. Additionally, Vault’s specific data consistency guarantees described above apply to the back-end storage.
10.14 Security information and event management (SIEM), monitoring and alerting
10.14.1 Overview
This section details the various methods available to monitor, report and alert on system metrics relating to Cryptography and PKI services. The R3 Platform implements a platform-wide solution for all monitoring, reporting and alarm functionality which is outside the scope of this section. Instead, it focuses on the nature of the log events that the application layer of the Cryptography and PKI services will generate.
10.14.2 Dependencies
* A configured SIEM or reporting solution which can scrape logs, parse the entries and issue alerts in some form.
* A configured alerting tool for Kubernetes health checks.
* A configured time series telemetry capture tool.
10.14.3 Vault monitoring
Monitoring refers to the use of time series telemetry data to analyze trends over time. All Vault services provide telemetry data no matter which engines are enabled. The following data is available for monitoring:
* CPU usage
* CPU I/O waiting for completion time
* Network traffic, bytes received and transmitted
* Memory usage
* Open and available file handles
HashiCorp support a number of common formats in which these metrics are produced, more information is available here.
10.14.4 Kubernetes health checks
As well as application layer events, services that make up the Cryptography and PKI services, like all services in the R3 Platform run in containers deployed inside Kubernetes clusters. The expectation is that these containers and any mounted storage are monitored for health using reporting tools which integrate directly with Kubernetes. This is out of scope of this chapter.
10.14.5 Log analytics
Typically, any reporting system, including SIEM systems, does not integrate directly with the application layer but instead is configured to scrape logs and make sense of the data asynchronously after the fact. An example of how this might be achieved is given here for illustration purposes to give a flavor of how this fits into the platform architecture; for more details and to set up configuration, the reporting or SIEM documentation must be consulted directly. That is out of the scope of this document.
* Some kind of decoder is set up which decodes specific content in log lines based on a regular expression.
* The SIEM/reporting solution is configured to pick up this decoder.
* A rule is created with the SIEM/reporting solution to bind the decoder to an alert.
* Alerts can be monitored using a dashboard or other means provided the SIEM/reporting solution.
From the above, it should be clear that the application layer’s responsibility towards SIEM/reporting is to ensure the necessary log events are generated. The application is not bound to any particular SIEM/reporting solution and is completely abstracted from it.
Integration of the platform with a specific SIEM solution is the responsibility of the integrator of the platform into the specific customer infrastructure. It is expected that the customer brings their own SIEM system and most likely this is integrated already with existing systems. The various components of the application layer should publish information about the format of events and the platform operator can decide which events to write rules and create alerts around.
The next sections describe the nature of log events generated out of the box by Vault and also any sub-systems of the R3 platform which sit on top of Vault.
10.14.5.1 Vault Service
These log events are generated by the Vault service irrespective of the engines enabled.
* All requests, including complete path describing the engine and end point.
* All responses, matched to requests.
* The type of operation: read, create, delete.
* Errors generated by an engine.
See here for more information.
Specifically, unauthorized access attempts or unexpected changes to the PKI configuration should be flagged and made visible to the platform operator, including:
* All Vault policy changes.
* Any changes to Vault secrets held in the KV store: these must match an expected credential change to some other part of the system (for example, database user being rotated).
10.14.5.2 Central certificate store
* Certificate write failures: they could indicate misconfiguration or unauthorized access attempts.
* Certificate fetch failures: they could indicate problems with certificate issuance.
10.14.5.3 Participant certificate store
* Certificate write failures: they could indicate misconfiguration or unauthorized access attempts.
* Certificate proxy fetch events towards the central store: repeated fetch events for the same certificates could indicate local store failures.
* Certificate fetch failures: they could indicate problems with the reachability of the central store.
10.14.5.4 Key generation
* All key pair generation events, successful or failing
* All CSR generation, successful or failing
* Certificate issuance events, successful or failing
* Key promotion, successful or failing
10.14.5.5 Cryptography SDK
* Failure to fetch certificates for validation purposes
* Signature validation failures
* Failed signing events



11 Secrets management
11.1 Overview
The R3 Platform has a requirement to manage secrets. Secrets are sensitive information which must be known to a running service or application, but should otherwise be protected so that unauthorized entities cannot access them. Secrets are typically associated with a particular service and used to store credentials to access other parts of the system, such as the database or the message bus.
This chapter outlines the solution for managing secrets within the R3 Platform. The goal is to provide a secure and efficient secrets management system for our applications, leveraging Kubernetes for authentication and ensuring high availability and security. The platform relies on a HashiCorp Vault secret store to manage secrets. This is realized by the Vault Key-Value (KV) secrets engine. The KV secrets engine is really just a key-value store, protected via Vault’s authentication solution and also encrypted like any other data store inside HashiCorp Vault. Secrets will be read once at pod startup and stored in environment variables.
Authentication with Vault is dealt with extensively in the Cryptography and PKI chapter. Rather than repeat this information in this chapter, here we deal with the secrets management in terms of the client-service architecture and deployment of these facilities. Please refer to the Cryptography and PKI chapter for specific information on Kubernetes authentication and how this allows us to fetch credentials from the secrets service (KV engine).
The benefits of using HashiCorp Vault for secrets management are:
* Security: HashiCorp Vault provides a secure environment for secrets management encrypting data at rest.
* Scalability: Vault is designed to handle high volumes of requests efficiently.
* High Availability: Vault supports high availability configurations.
* Kubernetes Integration: Kubernetes authentication simplifies the integration with Vault.
* Monitoring: Vault provides monitoring and alerting mechanisms to detect and respond to issues promptly.
The root encryption key is stored externally so if the devices on which Vault is deployed are compromised, it is impossible to decrypt the secrets. Even Vault on its own cannot decrypt the keys without the external key, which is always kept in a separate security domain to the Vault device (for example, an HSM). This is in contrast to Kubernetes-based secrets, which are written in plain text to the underlying filesystem on which Kubernetes resides. Whilst the underlying storage could be encrypted, there is still the issue of where to store the decryption key. Often this is placed alongside the encrypted data or in another cloud storage facility, where the credentials for access are then stored alongside the encrypted data. Both of these methods are prone to compromise, because in both cases it is possible to extract the decryption key from the device in much the same way the platform does.
11.2 Architecture/context
The solution uses HashiCorp Vault KV store as a centralized secrets store, with Kubernetes authentication to securely access secrets at pod startup inside an InitContainer. Secrets are read once and stored in files mounted in memory for applications to read either directly or once pushed into environment variables. An alternative approach is to fetch secrets directly in the App Container by wrapping the service executable in a call to Vault Agent, which populates environment variables on the fly.

Figure 118: Secrets Management Overview
The functionality of secrets management is thus split between the client-side mechanism for fetching secrets and the server-side management of secrets. Each of these is dealt with in its own sub-chapter.
11.3 Sequence and interactions

Figure 119: Secrets Management Sequence and Interactions
11.4 Deployment infrastructure
The diagram below shows the components above projected onto a deployment infrastructure:

Figure 120: Secrets Deployment
Here we see two network participants running private networks and the platform operator private network. Services in the blue boxes are running as containers in Kubernetes. There may be multiple instances of some containers, to facilitate a highly available system (not shown).
As an example, a database is shown in each network to give context to the fetching of credentials from the secrets store. Secrets are not limited to credentials and are not limited to database access either. This is shown just for illustrative purposes.
There is no interaction between secrets stores outside the private networks, although potentially secrets could be used to access an external system to the R3 Platform (also not shown).
11.4.1 Compliance
The R3 Cryptography solution conforms to the NIST Key Management Guidelines by using 256 bit AES-GCM encryption (reference: Security Model | Vault | HashiCorp Developer). This is considered acceptable for the storage of secrets.
11.5 Prerequisites
11.5.1 Terminology
* HashiCorp Vault: A tool for securely storing secrets.
* Kubernetes authentication: A method of authenticating to Vault using Kubernetes JWT tokens.
* Key-value (KV) store: A type of database that stores data as pairs of keys and their corresponding values, allowing quick retrieval of values using their unique keys.
* Vault Agent Injector: A Kubernetes mutating webhook that injects secrets into pods at runtime.
* Audit logs: A record of all access and operations made to the secret store.
* Vault policies: A set of rules that define the permissions for accessing API paths in HashiCorp Vault.
* Vault roles: A set of policies that define the permissions for accessing secrets in HashiCorp Vault.
* Soft deletion: A process of marking a secret as deleted therefore preventing further access without actually removing it from the storage, allowing for potential recovery.
* InitContainer: A special type of container that runs before the main application container in a Kubernetes pod.
11.5.2 Background reading
It is assumed the R3 Secrets Management High Level Design is read prior to reading this chapter. The following links provide optional background reading for subjects touched on in this chapter, although they are not mandatory reading.
* HashiCorp Vault Documentation
* Kubernetes Authentication with Vault
* Vault Agent Injector vs. Vault CSI Provider
* Vault Agent Injector
* OpenShift Helm Chart Certification Rules on absence of CSI Objects
11.6 Secrets management service
11.6.1 Overview
This chapter outlines the detailed design for the Secrets Service component within the Secrets Management framework. This service is responsible for securely storing the secrets required by the solution applications and services during startup. The R3 Platform utilizes HashiCorp Vault’s Key-Value (KV) Store for this purpose. Vault’s KV Store V2 (version 2) offers a secure and flexible solution for managing secrets. It allows for the retention of multiple versions of keys, providing the ability to retrieve both data and metadata from previous versions. In addition, Vault provides detailed audit logs of all access and operations made to the secret store. These capabilities make Vault’s KV Store the ideal choice for securely and efficiently managing secrets at scale. HashiCorp Vault’s policies provide a declarative way to grant or forbid access to certain paths and operations in Vault. This feature can be leveraged to ensure fine-grained access control to the secrets stored in the KV store.
The Secrets Service component has the following key facets:
* Securely stores secrets, preventing exposure to any non-authorized entities.
* Ensures fine-grained access to the secrets protected by authentication and authorization via Vault policies.
* Provides possibility to rotate, revoke (soft-deletion) or permanently delete secrets without impacting the applications using them.
* Maintains a detailed audit log of all access and operations made to the secret store.
* Integrates out-of-the-box with Kubernetes Vault Agent Injector to automatically inject relevant secrets into the application pods upon startup (covered more in next section).
11.6.1.1 In scope
* HTTP(s) API for managing secrets, policies and roles.
* Authentication mechanism that authenticates clients (including the agent) for retrieval of secrets.
* Authorization mechanism inbuilt to the service to keep track of which secrets are available to which services; this is done in the form of Vault policies.
* Secret management to create, rotate, revoke and securely store secrets.
11.6.1.2 Solution design
The secrets management solution uses HashiCorp Vault’s Key/Value (KV) version 2 store API for secure secret management. Administrators or agents (for automation of credential rotation or automated deployment) with privileged access authenticate with Vault and are granted exclusive access to the secrets KV store path within the Vault backend. They have the authority to perform CRUD (create, read, update, and delete) operations on secrets, roles, and policies.
Roles are defined by these agents for applications or services, specifying which secrets their associated secret client-side agents are permitted to access. Each role is linked to a set of policies, with each policy detailing the specific secret path in Vault where the client-side Vault Agent Injector can be read from. The application’s client-side secrets agent is responsible for fetching the secrets from the KV store and injecting them into the application pods upon startup.
When changes are made to secrets in the KV store by the administrator/agent, applications will retrieve the updated secrets via a rolling restart. During this process, the old secrets will remain active until all applications have been updated with the new versions. Once all applications are updated, the previous secrets will be revoked. By using a rolling restart rather than a dynamic update, we minimize downtime for applications that would otherwise be unavailable for reconfiguration.
11.6.1.2.1 Architecture/context

Figure 121: Secrets Management Service Context
11.6.1.2.2 Sequence and interactions

Figure 122: Secrets Management Service Sequence Overview
11.6.1.3 Implementation components
11.6.1.3.1 Component 1 - HashiCorp Vault’s Key-Value (KV) store V2
11.6.1.3.1.1 Overview design
Vault KV Store comes in two versions: V1 and V2. The R3 Platform uses V2. The API is broadly similar to many key-value store APIs. In the case of the R3 Platform, the key is the identifier that the application/service uses to look up a secret, while the value is the secret, usually a credential such as username or password.
The administrative agent can write secrets to the KV store by issuing a POST to a Vault REST API with a path which follows the convention of /v1/<kv_engine_mount_path>/data/<secret_path>. Note the v1 in the path is the versioning of Vault’s general HTTP API and does not relate to the version of any engine. Secrets are returned in JSON format which contains, along with the value, metadata about the KV pair. The <kv_engine_mount_path> refers to the Vault backend path where the KV store secrets engine was mounted. Vault services can host multiple engines, including multiple engines of the same type. <secret_path> is the sub-path within the KV store where the particular secrets of interest are stored.
The administrative agent can update secrets in the KV store by issuing a PATCH to the same Vault REST API. This creates a new version of the secret and thus allows for rollbacks to previous version. The administrative agent can rollback secrets in the KV store to a previous version by issuing a DELETE to the same Vault REST API.
Secrets can be revoked by marking a particular secret as deleted in the KV store with a path along the lines of /v1/<plugin_mount_path>/delete/<secret_path>. In other words, this is a form of soft delete. Secrets can be destroyed from the KV store with a path along the lines of /v1/<plugin_mount_path>/destroy/<secret_path>.
11.6.1.3.1.2 Hashicorp Vault’s Policies API
Before configuring the secrets that an application may need access to upon startup, the administrator must first define policies. These policies specify which secrets engine paths should be made available to the secrets agent responsible for retrieving the secrets. An example is shown below:
# Policy to allow reading secrets
path "secret/data/<secret_path>/*" {
  capabilities = ["read"]
}
Policies are pushed to Vault via the v1/sys/policy API.
11.6.1.3.1.3 HashiCorp Vault’s Roles API
Roles are essential for authentication. Applications that require secrets will need to use the Vault Agent Injector (detailed in Secrets management service) within the Kubernetes cluster to communicate with Vault and authenticate on startup. To achieve this, Vault’s Kubernetes authentication method is used to define roles for these secret agents. These roles can then inherit the policies that were previously configured in Vault.
11.6.1.3.1.4 Availability guarantees
Vault achieves high availability (HA) through its integrated Raft storage backend, which uses a consensus algorithm to replicate data across nodes in a single cluster. Each node stores data locally, and the leader node handles writes while ensuring strong consistency. Standby nodes are ready to take over automatically if the leader node fails, ensuring minimal downtime and continuous operation. This setup provides redundancy within a single cluster and can span multiple availability zones (AZs) for added resilience. The standby nodes will forward the requests to the leader node.
With enterprise Vault comes support for a feature called performance standby nodes. This feature allows standby nodes to handle read operations themselves directly rather than forwarding them. Write operations are still forwarded to the leader node. This setup improves latency for read operations, which are far more frequent than write operations, because it avoids an extra network hop. This mode of operation also has the effect of distributing much of the load across the standby nodes in the cluster. Vault also supports performance replication, which distributes read operations across geographically distributed clusters, providing global scalability and fault tolerance.
The Terraform modules provided by R3 (see below) support deploying a highly available (HA) Vault cluster with integrated Raft storage. However, enterprise features like performance or DR replication require customer-specific configurations.
A recommended HA setup can be found here.
More details on the Raft storage can be found here and here.
More details on the Performance Standby nodes can be found here.
The expectation is that the customer deploys in HA mode for production. The customer should discuss with HashiCorp as part of their enterprise support license the recommended configuration for deployment of a HA system.
11.6.1.3.1.5 Data consistency guarantees
If secrets are rotated, only one availability zone (aka data center) takes responsibility for running the rotation event. This might happen, for instance, on a particular automated cadence. During a partition event where clusters in different data centers are isolated from one another, only the active data center’s cluster will be making updates to secrets. In this case, only one leader is ever made aware of the new key. The new key will be replicated as normal to the standby data center once the partitioning event is over.
11.6.1.3.1.6 Security guarantees
* Encryption: Vault provides encryption at rest and in transit for all the data it manages.
* Offline root encryption key: Vault uses a root encryption key stored in a different security domain, such as an HSM, to encrypt the data at rest.
* Separation of duties: Different secrets are created for each use case.
* ACL policies: Vault policies are defined to control access to each key pair.
11.6.1.3.1.7 Fault tolerance and disaster recovery guarantees
See Resiliency and recovery. 
11.6.1.3.2 Component 2 - Terraform modules
11.6.1.3.2.1 Overview design
HashiCorp Vault is deployed using a dedicated Terraform module for deployment of the Vault service only. This module does not instantiate or configure any engines. It is used wherever a Vault service is required and is a prerequisite for then deploying further Terraform modules which enable engines. Production deployments cannot use the Business Source License version of Vault which is used by this module. We expect customer production systems to have their own licensed enterprise Vault deployed. This Terraform module can potentially offer a template for a customer enterprise deployment, but this will need attention by the customer. The Terraform module deployment includes HA configuration. Vault needs automatic unseal to support a HA configuration. We leave flexibility in how this is achieved so customers can choose the best method for their deployment.
HashiCorp Vault KV Engine is enabled using a separate Terraform module. The path of the KV Engine is configurable; multiple KV Engines could be deployed on the same Vault service. This module can be used to enable the Vault engine on enterprise Vault deployments. A single Vault deployment can support multiple KV engines.
Specific roles and policies which allow access to credentials, and the nature, form and content of credentials themselves, are a function of deploying individual services rather than the secrets management service. Only services can declare which credentials they need access to. It is expected that the secrets management service is deployed prior to services, and services’ Terraform modules configure the necessary secrets and credentials accordingly.
11.6.1.3.2.2 Features
* Terraform deployment
* HashiCorp Vault deployed
* KV Engine enabled
* HA configuration enabled
11.6.1.3.2.3 Limitations
Unsealing is the process of reconstructing the master key necessary to decrypt the data stored in Vault. The approach to unsealing the Vault is left to the customer to define. Vault supports multiple unseal methods. This process can be manual, where key shares are entered by operators, or automated with the help of an HSM (hardware security module).
11.6.1.3.2.4 Security guarantees
Security guarantees are created by the DevSecOps pipeline and accompanying infrastructure; for example, to ensure modules are not tampered with, rather than the modules themselves.
11.7 Secrets management client
11.7.1 Overview
This section outlines the detailed design for the reading secrets from a HashiCorp Vault KV Secret Store using Kubernetes authentication. The goal is to securely read secrets from the Vault KV service at pod startup and make them available to the application through environment variables or potentially a RAM-based configuration file. The exact mechanism of injection is dependent on client application/service requirements. Files containing secrets are never stored on a persistent file system.
The client-side technology is provided by the HashiCorp Vault Agent Injector.
HashiCorp Vault KV engine with Kubernetes authentication provides a secure method for managing secrets in a Kubernetes environment. Vault’s robust security features and the Vault Agent Injector, ensure that secrets are securely read and made available to applications without introducing an application dependency on the Vault or Kubernetes APIs.
Key points:
* Secrets are securely read from the HashiCorp Vault KV engine at pod startup via a HTTPS REST API.
* Secrets are copied into environment variables or a RAM-based configuration file.
* Application code does not depend on Vault or Kubernetes APIs for reading secrets. Integrating Vault directly with application code would have a number of downsides:
* The application code needs to be modified to read secrets from Vault.
* Running the application without Vault deployed becomes difficult.
* Updates to the Vault client require a rebuild of the application.
HashiCorp also provides a means to access secrets using a Vault CSI Provider. The Vault CSI Provider and Vault Agent Injector both avoid the need to modify application code. They are similar in how they work, but the CSI Provider is discouraged by OpenShift because the way it mounts the secret store requires granting privileged access to pods. That leaves the Vault Agent Injector as the best choice for reading secrets from Vault.
Rotating secrets therefore requires a rolling restart of service deployments. As explained in Secrets management service, this is considered an overall benefit of the solution because it avoids situations where the entire deployment (every service instance) is reacting to a configuration change concurrently, which can lead to service downtime. It also means that we can inject secrets into applications once, and that running instance considers this immutable data without having to write potentially complex application code to handle refreshes.
11.7.1.1 In scope
* Authenticate with Vault using Kubernetes authentication.
* Run an InitContainer on each application pod to read secrets from HashiCorp Vault KV engine using Vault Agent Injector.
* Store secrets in environment variables or a RAM-based configuration file for application to use.
* Abstract secrets fetching solution from application code.
11.7.2 Dependencies
* HashiCorp Vault KV Engine
* Vault Agent Injector
11.7.3 Solution design
11.7.3.1 Architecture/context
The R3 Platform uses Vault Agent Injector inside a Pod InitContainer to read secrets from Vault at pod startup. The secrets will be stored in environment variables or an in-memory file for the application to use.

Figure 123: Secrets Management Overview for Client
11.7.4 Implementation components
11.7.4.1 Component 1 - Vault Agent Injector
11.7.4.1.1 Overview
Vault Agent Injector is configured to inject secrets into pods at startup. Vault Agent Injector is documented fully here.
The platform configures the agent such that secrets are only injected into the pod once at startup, and continued monitoring for updates is turned off. This means the solution incurs zero continuous resource overhead on the Kubernetes cluster once the services are up and running. Rotating secrets therefore requires a rolling restart of service deployments as explained above.
11.7.4.1.2 Features
* Secrets injected into pods at startup
* Secrets stored in environment variables or a file
11.7.4.1.3 Availability guarantees
Pods using Vault Agent Injector will need the Vault service to be running for the pod to complete startup. Pods must be configured to retry to start if the InitContainer fails to complete. This is handled in the normal manner by Kubernetes.
11.7.4.1.4 Fault tolerance and disaster recovery guarantees
This design is concerned with individual pods which are not fault-tolerant as standalone entities. Only the wider system is fault-tolerant. If the Vault KV Engine which holds secrets is unavailable, the pod will not start until it comes back online. Already-running pods will continue running as normal in the event of a Vault KV Engine shutdown or restart.
11.7.4.1.5 Security guarantees
The R3 Platform uses Kubernetes authentication to authenticate with Vault. How this provides pod level security is described more fully in the Cryptography and PKI chapter. Network communication is over a service mesh using mTLS. The pod itself is treated as a trusted environment. The secrets will be available for the application to read.
Vault will give control over which pods can access which secrets. Secret access can be granted/denied at the Service Account level.
11.7.4.1.6 Monitoring and alarms
Success and failure of the InitContainer will be monitored as per the wider Kubernetes monitoring solution; see Service instances and availability for more details. Failures of the InitContainer should trigger an alert.
11.7.4.2 Component 2 - Terraform modules
11.7.4.2.1 Overview design
A Terraform module will configure Vault Agent Injector to inject secrets into pods at startup, by hooking into the InitContainer functionality of Kubernetes pods.
11.7.4.2.2 Features
* Terraform deployment
* Vault Agent Injector configured in application pod InitContainer
11.7.4.2.3 Security guarantees
Security guarantees are created by the DevSecOps pipeline and accompanying infrastructure; for example, to ensure modules are not tampered with, rather than the modules themselves.
11.8 Resiliency and recovery
11.8.1 Overview
In this chapter we detail the resiliency and recovery concerns and strategy for secret management services. We do not consider the agents or libraries here, as they are not continuously running services that need consideration of recovery on failure outside the usual error-handling mechanisms employed in source code.
11.8.2 Service instances and availability
Every deployment of Vault (note in Kubernetes terms, Vault is deployed as a StatefulSet rather than a Deployment) consists of multiple running instances. A Kubernetes Service load balances requests to each instance. When an instance dies, the underlying Kubernetes controller will restart it. Given that there is a short period of time whilst the Kubernetes liveness probe might not detect failures, the client side reties failed requests for a limited period to work round these transient issues. No loss of service is expected during this process; rather, only a small potential delay to requests being serviced.
Fetching credentials (KV engine) is a read operation, while the generation or rotation of credentials is a write operation. An Enterprise Vault deployment will load balance read operations across all nodes in the same AZ. Write operations, which are less frequent, will always be handled by the leader and trigger a replication event to the other instances of Vault.
11.8.3 Cross-site replication
The R3 Platform leverages the fact Vault write operations are tightly controlled either via a manual operator or automated agent performing only infrequent write operations. Irrespective of the nature of replication, this operation must only be performed in the active data center at any one time. This control overwrite operations means that we have a more stable system during any site failover situation, and we can use this fact to more easily ensure there is no data loss in Vault.
Assuming a write operation was not in process during a failover scenario, the configuration of Vault replication between data centers is largely moot because latency of these infrequent operations is not a concern. The standby site will take over operations and be fully up to date as is.
It is possible to deploy Enterprise Vault using asynchronous replication between data centers in what they refer to as a DR replication feature. More details can be found here.
11.8.4 Raft references
* Raft consensus algorithm: Raft
* More details on Vault’s consistency guarantees can be found here and here.
11.8.5 Backups
Vault services can be backed up and restored via a built-in snapshot feature. It is expected that backups are performed regularly. An extensive backup plan is out of scope of this document.
Where a backup is restored, it is important to consider any credentials rotated since the backup will be lost, and manual intervention will be required to restore them.
11.9 Security information and event management (SIEM), monitoring and alerting
11.9.1 Overview
This section details the various methods available to monitor, report and alert on system metrics relating to the secret management service. The R3 Platform implements a platform wide solution for all monitoring, reporting and alarm functionality which is outside the scope of this section. Instead, it focuses on the nature of the log events the application layer of the secret management services will generate.
11.9.2 Dependencies
* A configured SIEM or reporting solution which can scrape logs, parse the entries and issue alerts in some form
* A configured alerting tool for Kubernetes health checks
* A configured time series telemetry capture tool
11.9.3 Vault monitoring
Monitoring refers to the use of time series telemetry data to analyze trends over time. All Vault services provide telemetry data no matter which engines are enabled. The following data is available for monitoring:
* CPU usage
* CPU I/O waiting for completion time
* Network traffic, bytes received and transmitted
* Memory usage
* Open and available file handles
HashiCorp support a number of common formats in which these metrics are produced; more information is available here.
11.9.4 Kubernetes health checks
All services in the R3 Platform run in containers deployed inside Kubernetes clusters. The expectation is that these containers and any mounted storage are monitored for health using reporting tools which integrate directly with Kubernetes. This is out of scope of this chapter.
11.9.5 Log analytics
Typically, any reporting system, including SIEM systems, does not integrate directly with the application layer but instead is configured to scrape logs and make sense of the data asynchronously after the fact. An example of how this might be achieved is given here for illustration purposes to give a flavor of how this fits into the platform architecture. For more details and to set up configuration, the reporting or SIEM documentation must be consulted directly. That is out of the scope of this document.
* Some kind of decoder is set up which decodes specific content in log lines based on a regular expression.
* The SIEM/reporting solution is configured to pick up this decoder.
* A rule is created with the SIEM/reporting solution to bind the decoder to an alert.
* Alerts can be monitored using a dashboard or other means provided the SIEM/reporting solution.
From the above, it should be clear that the application layer’s responsibility towards SIEM/reporting is to ensure the necessary log events are generated. The application is not bound to any particular SIEM/reporting solution and is completely abstracted from it.
Integration of the platform with a specific SIEM solution is the responsibility of the integrator of the platform into the specific customer infrastructure. It is expected that the customer brings their own SIEM system and, most likely, this is already integrated with existing systems. The various components of the application layer should publish information about the format of events, and the platform operator can decide which events to write rules and create alerts around.
The next sections describe the nature of log events generated out of the box by Vault and also any sub-systems of the R3 platform which sit on top of Vault.
11.9.5.1 Vault service
The following log events are generated by the Vault service irrespective of the engines enabled:
* All requests, including complete path describing the engine and end point
* All responses, matched to requests
* Read, create, and delete operations
* Errors generated by an engine
See here for more information.
Specifically, unauthorized access attempts or unexpected changes to the secrets service should be flagged and made visible to the platform operator, including:
* All Vault policy changes
* Any changes to Vault secrets held in the KV store; this must match an expected credential change to some other part of the system (for example, database users being rotated)
In order to track all requests made to the secrets service, an audit device needs to be enabled. This can be done via a Vault REST API, where the output for audit logs is specified.


12 Identity and access management (IAM)
12.1 Overview
The IAM solution in the R3 Platform allows an end user of the platform to authenticate with the platform and determines which resources and services within the platform they are entitled to access.
The Authentication and Authorization sub-systems of the R3 Platform are split from one another and only loosely coupled. The Authentication system is realized by a third-party component, Red Hat Keycloak. The Authorization system is primarily released by a third-party component, Styra Open Policy Agent (OPA).
An end user login session is represented by the Authentication system as a transferable user context, which is given by the IAM system to the client application in the form of a token. This user context token contains a description of the user in the form of key-value pairs, and it is this description which is used by the Authorization aspect of IAM to determine whether this end user can perform certain actions or access certain resources or not. The Authorization service only needs to know the (open) protocol of the token it is provided: it has no interest in the service which generated it. Likewise, the Authentication solution provides tokens but has no knowledge of the Authorization service which reads them.
OPA provides the ability to configure authorization policies based on static and dynamic data. Static data is embedded in authorization policies. These can be thought of as configuration towards OPA, and although we consider them as static, the policies can be changed during the lifetime of the OPA service. An example of static data might include defining that certain types of user cannot access certain APIs in the platform. For example, a policy might dictate that a retail user cannot create a CBDC wallet. We consider it static because the runtime operation of the platform does not change this data.
Dynamic data is pulled from a database, is expected to change frequently throughout the runtime operation of the platform and is changed by the platform itself. For example, when a wallet is created, use of that specific wallet is bound to specific users, and this is a dynamic binding. We do not want to add such information into policies permanently because it is not scalable to reconfigure OPA each time a retail user opens a CBDC wallet.
12.2 Additional tech choices
OPA does not integrate with any particular data source directly and instead requires a HTTP JSON-based API to fetch data. To bridge the gap between the Postgres database holding dynamic data and the HTTP JSON API, another third-party component called Hasura GraphQL Engine is deployed. Hasura exposes the Postgres database schemas as a GraphQL HTTP-based API which returns JSON responses. The OPA policy uses Hasura’s HTTP GraphQL API directly.
12.3 Architecture/context
An overview of the IAM architecture for a single network participant and the platform operator network is shown in the following diagrams. Each section of this chapter will detail the various functional blocks of these diagrams in more detail.
12.3.1 Authentication
Authentication is the process of securely identifying a user (for example, via a user entering credentials or providing some biometric information) and determining which capabilities that user has. The identity management block is also commonly known as an Identity Provider (IDP) or Identity Manager (IdM). In this document we use the term IdM to refer to the whole concept of user management, and the term IDP when we wish to specifically highlight the means of validating identity. The capabilities are described in abstract form. It is up to the Authorization component of the IAM solution to allow or disallow specific requests to the platform based on the user capabilities and the nature of the request. In the R3 Platform, the Authentication and Authorization solutions are split and loosely coupled only via these abstract capabilities.

Figure 124: Authentication Overview
The Identity Management System (IdM) interacts with the following external components:
* API gateway: To protect services exposed by the R3 Platform, the API gateway prevents unauthenticated access to protected endpoints. Upon successful user authentication, an authentication token is issued by the IdM. The token is cryptographically signed using a private key only known to the IdM. The public key for the private key is enclosed in a certificate is shared with the API gateway in advance. The API gateway performs verification of any request and checks the presence of a valid authentication token signed by the IdM.
* Identity management system for organization: To enable existing users of the organization use the R3 Platform, the IdM uses identity federation to enable organization users to log in.
* External identity management system: Similar to the identity management system for the organization, this IdM uses identity federation to enable external users (such as customer end users) to log in.
* User directory: The central record keeper for users in any organization. Identity management systems in an organization rely on user directories as the single source of truth for user information.
* User directory management tool: A tool that aids in managing and housekeeping the user directory.
* Customer account information system: This is much like the user directory but keeps track of all customers and their data associated with an organization.
* Transit: The cryptography signing engine, used to sign private keys of the IdM. See the chapter Cryptography and PKI for more details.
* Certificate store: The PKI’s definitive store of any certificates required throughout the platform. See the chapter Cryptography and PKI for more details.
* Log Capture: A third-party log capture solution.
* Secrets manager: The encrypted store of secrets used throughout the platform. See the chapter Secrets Management for more details.
12.3.1.1 Federation
The authentication solution within the R3 platform has the capability of federating with external systems. There are two types of federation, user federation and identity federation. They are different use cases fulfilling different requirements and should not be conflated. You can configure the solution for either type of federation independently of the other or configure both at the same time.
User Federation is the process of connecting an IAM system to an external user directory such as an LDAP directory to synchronize user data. This approach is commonly used when an organization maintains a central user directory, and the goal is to allow user data to be accessible across multiple applications. In a typical user federation setup, the IAM system either synchronizes user data periodically or queries the external directory on-demand to fetch user data. While the external directory remains the source of truth for user identities, the IAM system may still manage roles and permissions locally. An example is Keycloak integrating with Active Directory to sync employee accounts. In the R3 platform, synchronization of user data is not about offering the ability for all users to log in automatically because a user logging into the platform would not have been allocated resources (for example, a CBDC wallet) managed within the platform automatically anyway. Instead, it is centered around:
* Ensuring users being onboarded to the system are also already known to the corresponding organization.
* Facilitating the IAM system’s access to any pre-defined user details useful to other parts of the end-to-end solution.
Identity Federation focuses more on trusting an external Identity Provider (IdP) for authentication. It is often used to enable Single Sign-On (SSO) across different systems and organizations. With identity federation, authentication is delegated to an external IdP using standards like SAML, OpenID Connect, or OAuth. Users of federated IdPs do not necessarily need to be known up front to the IAM system; instead, identity assertions or tokens are passed after successful authentication with the external IdP. This allows users to access various applications without creating separate accounts, as their identity is validated by a trusted third party. For instance, logging into an application using a government pass or existing back-office IdP is a common form of identity federation. The key point of Identity Federation is that no user data is synced, just authentication trust is established via an external log in mechanism.
Both approaches can coexist in an IAM environment. A user can login via a federated IdP, and details about the user can be fetched from a federated user directory. In this case the IAM system needs some unique identifier to match the logged in user to an entry in the synchronized user data. The R3 platform facilitates the login of multiple types of user via multiple IdPs at the same time and has different requirements of user data in each case. As such it uses a combination of user and identity federation coupled with a system of user onboarding to enable log in. The extent to which each of these facets plays a part in the user onboarding process depends on which type of user is onboarded to the platform and customer requirements pertaining to integration with their existing systems. More on this is detailed later in the chapter.
Note that even when identities and/or users are federated with Keycloak, Keycloak has records of these users in its own database. As such, federation of any kind is not a means to eradicate PII from Keycloak’s storage device.
Federation is explained in more details in the dedicated federation chapter below.
12.3.2 Authorization
Authorization is the process of allowing an identified user access to resources or services within the platform. Rather than focusing on the end users themselves, the Authorization sub-system emphasizes the capabilities they possess.
The user capabilities are often defined in IAM systems as roles or claims. This leads to the terms RBAC (Role Based Access Control) or CBAC (Claims Based Access Control). The R3 Platform prefers claim-based access control, as claims give finer grained authorization flexibility. For example, a user might have a claim to be able to create a wallet, and this would grant them access to that API. The platform has no reason to know which role this user is fulfilling, nor if that role changes, except where a different role might lead the user context to contain different claims. This keeps administration of users decoupled from the access they have in the R3 Platform. Having to add roles permanently into authorization policies exposes authorization directly to the structure of roles in an organization. 
Some solutions push responsibility of authorization and authentication into a single entity, but the R3 Platform separates them to provide greater flexibility. The entire IdM could potentially be switched for another without affecting the rest of the platform. Notably, once authentication is complete, the IdM is not involved again until the token expires. This takes load off the IdM. Involving the IdM in every request towards the platform would make it a potential bottleneck. The Authorization service, hence, can be scaled independently.

Figure 125: Authorization Overview

12.3.2.1 Mapping customer-specific attributes to claims
The paradigm of the platform is that claims allow customers to fine-tune the permissions that any authenticated user has in the context of the platform. Thus, the customer-integrated IdP is the most flexible and maintainable place to be considered as the source of truth of claims. That said, a pragmatic approach needs to be taken to accommodate customers' existing systems. We consider the fact that a customer's IdP may not be flexible enough to accommodate issuing claims to be understood by the R3 platform.
If a customer must provide a coarse, descriptive attribute of a user in their authorization tokens, then we do not adjust the platform policies to accommodate something other than the expected fine-grained claims. Instead, before evaluating an authorization policy, we allow the customer-specific attribute to be mapped to a set of claims.
This functionality is provided by a utility in the policy declaration which first expands any custom attributes in a token to claims that can be understood by the platform. The custom attributes-to-claim mappings can be uploaded as a static configuration to Open Policy Agent, our authorization policy engine.
Using this approach, a customer-integrated federated identity provider can push existing roles via attributes into the R3 platform. The platform can then expand them into claims which it understands when provided with the correct configuration mapping. Keeping these claim mappings dynamic, and expanding them at policy evaluation time, as opposed to hardcoding them into the platform's authentication system record of each user, means they can be easily mutated at runtime by a platform operator.
12.4 Deployment infrastructure
The diagram below shows the components above projected onto a deployment infrastructure. It illustrates two network participants running private networks and their interactions with the platform operator private network. Services in the blue boxes are running as containerized workloads in Kubernetes. There may be multiple instances of some containers, to facilitate a highly available system (not shown).

Figure 126: IAM Deployment
12.5 Compliance
Red Hat Keycloak can be configured in FIPS 140-2 compliant mode, which pertains to the way it manages cryptographic keys internally. However, in the R3 Platform, Keycloak is configured to integrate with the R3 Platform Cryptography and PKI infrastructure. This infrastructure conforms to the NIST Key Management Guidelines which brings FIPS 140-2 compliance. See the Cryptography and PKI LLD Chapter for more information.
The security concerns regarding the Keycloak deployment are discussed in greater detail in a section below.
Open Policy Agent allows organizations to achieve compliance through its facilitation of centralized definition and enforcement of policies across a cloud-native solution. It operates under the principle of “compliance as code” through its policy language, which can be used to implement specific compliance requirements and enforce them across different parts of the tech stack.
12.6 Prerequisites
12.6.1 Terminology
* IAM: Identity and access management; a framework for managing authentication and authorization.
* IDM: Identity Management; the system that manages users, including lifecycle of users, onboarding, claim attribution, and so on. Because the R3 platform has loosely coupled authentication and authorization solutions, in this document IDM is used to describe the entire user management layer, but not the decoupled part of IAM which performs the authorization function.
* IDP: Identity provider; a function of authentication, a solution for providing identity to a platform or software system. The term IDP is used to specifically refer to the function of validating identity, and not the more general discipline of IDM.
* SSO: Single Sign-on; the ability to sign on to a number of services using the same access token without the need to re-enter credentials.
* IaC: Infrastructure as Code; declarative description of infrastructure which can be used to deploy resources in an automated fashion.
* Keycloak client: Clients are entities that can request Keycloak to authenticate a user. Normally, clients are applications and services that use Keycloak to secure themselves and provide a single sign-on solution. Clients can also be entities that want to request identity information or an access token so that they can securely invoke other services on the network that are secured by Keycloak.
* JWT: JSON Web Token; a type of token which uses JSON for the payload. The JSON payload will contain a set of claims (key/value pairs) which describe the identity of the requestor.
* Refresh tokens: Tokens that enable renewal of identity and access tokens when they are close to expiring. Read more about them here.
* OIDC: OpenID Connect; an open standards protocol for authentication.
* Terraform: An infrastructure as code software tool that provides a consistent CLI workflow to manage cloud services.
* SMTP: Simple Mail Transfer Protocol; a protocol used for sending email.
* SPI: Service Provider Interface, a customization interface for Keycloak.
* LDAP: Lightweight Directory Access Protocol
* SAML: Security Assertion Markup Language; a commonly used alternative protocol to OIDC.
* PII: Personally Identifiable Information; any information which can be used to identity a person.
* SIEM: Security Information and Event Management; a solution for capturing security and other events and exposing them to network operators (for example, via alerts).
* SLO: Service Level Objective
* RBAC: Role Based Access Control; a mechanism where access to resources and services is based on a user’s defined role.
* CBAC: Claim Based Access Control; also known as ABAC (Attribute Based Access Control) a mechanism where access to resources and services is based on claims about the user, where a claim is some description of a property of a user. These tend to be more fine-grained and abstract than roles.
12.6.2 Background reading
It is assumed the R3 IAM High Level Design is read prior to reading this chapter. The following links provide optional background reading for subjects touched on in this chapter, although they are not mandatory reading.
* Keycloak Server Administration Guide
* Keycloak Server Developer Guide
* Identity Brokering using Keycloak
* Single Sign On vs Federation
* OpenID Connect Core
* OpenID Connect Specifications
* RFC-9068 JSON Web Tokens
* RFC-6749 OAuth Authorization Framework
* RFC 6750 OAuth 2.0 Bearer Token Usage
* Fitness Function Driven Development
* Building Evolutionary Architectures
* Building blocks for highly available Keycloak deployment.
* Multi-site deployment of Keycloak
12.7 Identity management system fundamentals
12.7.1 Overview
The section describes how a single organization will structure Keycloak as an identity management system that facilitates authentication of various categories of end users. The entire set up is replicated per organization. Keycloak provides its own ability to manage users internally, where end users enter credentials via a web page served by Keycloak itself. It also federates with other IdMs (internal and external to the organization) to facilitate single sign-on across the entire R3 Platform’s set of services. This section focuses on the basic deployment and internal user management configuration as these are more fundamental basics of Keycloak. Federation has its own section below.
Keycloak integrates with the rest of the R3 Platform using a modern authentication protocol called Open ID Connect (OIDC). Open ID Connect (OIDC) is an extension of open authorization protocol (OAuth 2.0). This design discusses various configuration aspects of the OIDC like clients, relying parties, tokens, and user configuration. Modern mobile and responsive single page web applications support OIDC well.
12.7.1.1 In scope
* User onboarding to Keycloak’s internal identity management
* User attributes and claims
* User offboarding/deactivation
* Authentication negotiation protocol
* Scopes
* Tokens and token lifetime
12.7.2 Personally identifiable information (PII)
Keycloak hosts user information to uniquely identify a user, along with attributes that aid authorization decisions for the R3 platform. The R3 Platform aims to host the minimum amount of user information possible to minimize PII issues, but hosting some PII is inevitable. Even the unique ID which identifies each user is considered pseudonymous data, which counts as PII in regulatory terms. As this PII is hosted ultimately by the customer, the customer is responsible for ensuring regulations around the storage of PII are addressed in their own network. Where Keycloak is federated to an external user directory, it copies attributes from that user directory into its own database when the user is onboarded to Keycloak. The exact attributes which are copied are dependent on the client application’s need to receive certain attributes in the identity token sent by Keycloak to the client application on user login. More details on identity tokens are included below; however, in the context of PII note that Keycloak will always store this PII inside the network participant’s network.
12.7.3 Dependencies
* Red Hat build of Keycloak
* Keycloak Admin CLI
* Keycloak Java Admin Client
12.7.4 Solution design
12.7.4.1 Realms
Realms are Keycloak’s solution to multi-tenancy. Keycloak defines a realm as follows:
A realm manages a set of users, credentials, roles, and groups. A user belongs to and logs into a realm. Realms are isolated from one another and can only manage and authenticate the users that they control.
This document focuses on the following:
* Creation and configuration of realms: setting realm name, display logo, language, and so on.
* Configuring authentication in realms:
* Authentication protocol: Elaborates the usage of the OpenID Connect protocol.
* Authentication flow: Elaborates standard flows like browser login flow, account management flow, reset/forgot password flow, and new user registration flow.
* User schema configuration
Every Keycloak service instance runs one or more realms. For the purposes of this document, we consider a realm to be the fundamental unit which serves as an identity provider service. Keycloak also has a master realm, which is a special realm that manages users that can be granted permission to administer other realms.
12.7.4.2 Architecture/context
The following component diagram shows the different components that make up the Identity Management & Federation system (IdM).
[RN5][PM6]
Figure 127: IdM Context Diagram
There are three types of realms that make up the IdM. A deployment of Identity Management & Federation system (IdM) will consist of one or more realms representing different configurations:
* Identity Management Realm: The basic realm that manages users exclusive to the R3 Solutions Platform.
* Org IdM Federation Realm: This realm manages all valid users in the organization. These could be back-office users, employees, and so on. This realm enables single sign-on for such users and authenticates them using their existing credentials similar to the Identity System for Organization.
* External IdM Federation Realm: The realm authenticates users external to the organization. These users could be customers, guests, and so on. This realm enables single sign-on for such users and lets them log in using their existing credentials similar to the External Identity Management System.
This document does not make assumptions about the specific realms that the network participant may or may not require in its operation. Because Keycloak is deployed per network participant, and each network participant in the R3 Platform deployment may have different realm needs. The superset of realm types is described; it is a matter for each network participant deployment how realms are utilized.
The User Directory Synchronization Service listens for changes in the User Directory and add events to a pub-sub (publish-subscribe) message queue. These messages are consumed reliably and effectuated in the relevant Keycloak realm, in terms of adding new users, modifying existing users or deleting users.
As noted above, in this section we focus on Keycloak service deployment and configuration of the Identity Management Realm. This is a subset of the components that are shown in the context diagram above. The remaining components are detailed in the following section on Identity Federation.
12.7.4.3 Authentication protocol and configuration
This section elaborates on how to configure the authentication protocol that clients using a realm will use to authenticate users. As mentioned above, client applications will use OpenID Connect v1.0. The protocol describes several flows. R3 Platform Apps will only use the Authorization Code flow. Resource Owner Password Credentials will be only temporarily enabled for ease of testing and disabled in production. We also specify how to do session configuration: token lifetime, refresh tokens, and so on.
* Clients may be confidential clients or public clients. Public clients (like mobile apps or web UIs) must use SHA256; see Proof Key for Code Exchange (PKCE).
* A separate Keycloak client will be required for each type of public or confidential client.
* A successful token exchange as a part of authentication will return an identity token (id_token), access token (access_token), and a refresh token (refresh_token), all in JWT (JSON web signature) format. Tokens will be signed (alg in JWT) using RS256 by default. Supported algorithms will be available for further explicit configuration.
* The identity token is to strictly represent the user identity on the client (mobile device) and should not be accessible to upstream services. Only the access token will represent user claims that aid in authorization of user requests.
* The standard OpenID Well-Known URI registry configuration for the identity provider will be available at /realms/<realm-name>/.well-known/openid-configuration relative to the root URL of Keycloak.
12.7.4.4 Configuring a client application
The newly created realm will require a client application to authenticate. User information available in the realm is available to clients using OpenID scopes. Clients will be OpenID Connect type.
* Standard Flow must be enabled, while Direct Access Grants must be disabled.
* Standard Flow corresponds to the Authorization Code Flow in OpenID Connect.
* Direct Access Grants corresponds to the Resource Owner Password Credentials Grant in OpenID Connect.
* Authorization is opted out when creating a client, as fine-grained access control is not required.
* URLs for the client need to be set accurately; a relative path addressing scheme will be used.
* The Root URL will be a https URL configuring the base URL for the R3 Platform as exposed by the DNS. The user will see this URL of the R3 Platform on their browser. All the following configurations except Web Origins URI will be set relative to this path.
* Home URL needs to be set to the home redirect page of the R3 Platform.
* Valid Redirect URIs will be explicitly set to all possible post-login landing pages the R3 Platform support.
* Valid Post Logout URIs will be explicitly set to the logout page of the R3 Platform.
* Web Origins URIs configure the CORS origins. This will set this to + to add all the Valid Redirect URIs.
* The following advanced settings will be pushed to the client application setup:
* Access Token Signature Algorithm: RS256
* ID Token Signature Algorithm: RS256
* User Info Signed Response Algorithm: RS256
* Under OpenID Connect Compatibility Modes > Use Refresh Tokens: Enabled
* Advanced Settings > Proof Key for Code Exchange Code Challenge Method: S256
12.7.4.5 Scopes and tokens
While the identity token is strictly for representing the identity of the authenticated user, the access token contains information that helps decide the resources the user is allowed to access. This is done by the Policy Decision Service (part of Authorization) using the claims available on the access_token along with other pertinent information about the resources available with the Resource Service. The default scope openid will be used when authenticating. This scope internally includes other scopes like profile, email and rsp_user_meta (custom client scope) that returns the combined JWTs with all claims. Other scopes are not supported and should not be used.
The scope openid yields different claims in the identity token, access token, userinfo endpoint and introspection endpoint. The identity token is strictly limited to the device negotiating authentication (client - mobile app/web app). The identity token never leaves the device. The identity token is used to render the UI on the user’s device. The user’s name, theme, and sections of the UI are all rendered based on the contents of the identity token. The refresh token strictly remains on the client device and is only exchanged with Keycloak (the identity provider) as the expiry of the access token nears.
The access token is passed upstream and is used by the API gateway, the policy decision point, and other R3 Platform services. Note that the intent of the following diagram is not to dictate which of the backend R3 services make policy decisions, it is simply to illustrate any backend service could potentially make authorization decisions based on its requirements.

Figure 128: Reach of Tokens
The following table contains the mapping of claims in different tokens and the corresponding scope they are available in.
Scope
Claim
Mapped user attribute
Available in default openid scope
In ID token?
In access token?
In userinfo endpoint?
Desc.
profile
name
firstName + ” ” + lastName
?
?
?
?
Combined first name and last name of the user
profile
preferred_username
username
?
?
?
?
Username
profile
given_name
firstName
?
?
?
?
First name
profile
family_name
lastName
?
?
?
?
Last name
email
email
email
?
?
?
?
Email address
rsp_user_meta
user_type
userType
?
?
?
?
User type
email
email_verified
-
?
?
?
?
Whether the email is verified. Always defaults to true.
rsp_user_meta
org_identifier
orgIdentifier
?
?
?
?
The ID of the organization with which the current user is associated
Table 59: Claim Mappings
JWTs are configured as follows:
* Default Signature Algorithm: Used for signing JWT tokens, set to RS256.
* Access Token Lifespan: Determines the token lifespan of the JWT identity token. Before this period expires, a new JWT identity token must be acquired by the client using the refresh token.
* Refresh Token Lifespan: Automatically calculated based on the SSO Session Idle timeout value discussed in the next section.
* User-Initiated Action Lifespan: Determines the lifetime for user-initiated action tokens; for example, reset password within 5 minutes.
* Default Admin-Initiated Action Lifespan: Determines the lifetime for admin-initiated tokens; for example, initial reset password within 7 days.
12.7.4.6 Configuring sessions and timeouts
The Access Token Lifespan field defines the lifespan of a JWT token. Identity (id_token) and access tokens (access_token) both share the same expiry. This is set to a value of 1 minute. Given JWTs, once issued, are maintained separately to the IdM entirely in the client application, immediate invalidation of a user session will not effectuate until the expiry (exp on JWT token [RFC7519]) of the access and ID tokens. The verification of the access token on the API gateway is via the exp field on the token and the bearer token signature. Situations requiring immediate invalidation of user sessions would require pivoting from bearer token signature verification to usage of Token Introspection RFC7662 and apt configuration on the API gateway. The R3 Platform does not do this to avoid excessive load on the IdM.
To configure session timeouts, set:
* SSO Session Idle: Denotes the time a session is allowed to be idle; set to 30 minutes.
* SSO Session Max: Denotes the time a session is allowed to exist irrespective of activity before the user is logged out forcefully; set to 10 hours.
* Login Timeout: Denotes the maximum time the user must complete a login after a login page is rendered. If not completed, the page must be re-requested by navigating back to the home page. Set to 30 minutes.
* Login Action Timeout: Denotes the maximum time the user must complete a login action like reset password. Beyond this time, the page must be re-requested. Set to 5 minutes.
* The refresh token timeout is the minimum of SSO Session Idle and SSO Session Max. In the case of the R3 Platform, it will be 30 minutes.
12.7.4.7 Login and logout
The browser flow configures basic login and facilitates the OpenID Connect 1.0 Authorization Code Flow.
Logout of a user is done using a standard OIDC endpoint realms/<realm-id>/protocol/openid-connect/logout. The endpoint terminates the session of the currently active user but does not invalidate previously issued identity and access token JWTs. refresh_token for invalidated sessions will not issue new identity and access tokens. Typically, clients would drop tokens if they initiated the logout process.
12.7.5 Implementation components
12.7.5.1 Component 1 - Master realm
The master realm is created automatically when the Keycloak service is deployed. More information about this can be found in the Keycloak documentation.
Any other realm is created by authenticating as the super admin user of the master realm. A new user is created and permissions are granted that enable the user to manage the newly created realm. All subsequent operations on the new realm are done with the new user. Granular permissions can be granted to the user such that they are able to do specific operations in the realm only. All realm permissions are listed here. Fine-grained authorization is encouraged by the creation of realm management users that have specific roles that allow them to perform the required realm management operations. To implement this, groups of users are created who have similar requirements for realm management and are assigned simple or composite realm management roles.
The newly created realm consoles will be available at /admin/{realm-name}. Preconfigured themes can be also applied. Localization configuration enables the realm to belong to a specific locale by default or to work with multiple locales as configured.
12.7.5.2 Component 2 - Identity provider realm
12.7.5.2.1.1 Overview design
Keycloak needs a realm when serving as an identity provider for itself. This is a realm that services end users who are not part of some externally federated IdM. When using Keycloak as an identity provider, Keycloak will store and manage user information. It will neither fetch nor store any user information elsewhere, other than its own database.
12.7.5.2.2 User schema
The user schema defines how the user will be represented in Keycloak so that clients, when they authenticate users with Keycloak, get a representation of the authenticated user. The user schema is composed of multiple attributes described in the following table:
Field
Type
Validations
Remarks
username
string
3-255 Unicode chars
Username of the user
email
string
255 chars max
Email address: this is mandatory in Keycloak; however, the R3 Platform does not include SMTP server integration, so it is never used as an email destination
firstName
string
255 chars max, name chars
First name
lastName
string
255 chars max, name chars
Last name
userType
select
Options: employee, retail_user, retail_user_child, merchant
Type of user: either an employee, retail user, retail user’s child, or merchant
orgIdentifier
string
255 chars max
Identifier of the user in the organization
Table 60: User Schema
12.7.5.2.3 User onboarding and offboarding
User onboarding and offboarding is the mechanism by which a user will be enrolled or de-activated. User self-registration will be disallowed. Users will be onboarded programmatically as per the above schema, using Keycloak’s APIs. All attributes are mandatory and will be provided during onboarding. The administrator must set a temporary password for the user which they are forced to change on their first login. Users can be deactivated using user update (setting enabled:false) by the administrator using the Keycloak API. Users will not be deleted. User deletion will follow data retention policies.
12.7.5.3 Component 3 - Terraform modules and deployment
12.7.5.3.1 Overview design
Keycloak is deployed using IaC, in the form of a Terraform module. This module does not perform instantiation or configuration but is used wherever a Keycloak service is required. It is a prerequisite for deploying further Terraform modules which enable and configure realms and other configuration in Keycloak. We expect customer production systems to have their own licensed instance of Red Hat Keycloak.
This IaC Module offers a template Keycloak deployment and can be further customized according to network participant requirements.
Realms are configured using separate IaC modules. As mentioned earlier, a single Keycloak deployment can support multiple realms.
12.7.5.3.2 Features
* IaC-based deployment
* Realm configuration
* An external PostgreSQL database used by Keycloak for persistent storage
12.8 Identity and user federation
12.8.1 Overview
This section outlines the low-level design of configuring the R3 identity management system to enable identity and user federation.
Identity federation allows users access to applications and resources across multiple organizations or domains using a single set of credentials over the standard Open ID Connect 1.0 Protocol. This document outlines how R3 IdM will enable users belonging to adjacent organizational domains (that is, using IdMs foreign to R3 Platform) to access R3 Platform resources and services. By enabling users from these adjacent IdMs access to R3 Platform resources using their existing IdMs and user credentials, we reduce the cognitive and management effort of our customers.
Foreign IdMs are classified as:
* Organization IdMs: IdMs that authenticate employees and internal users of the organizations. Such IdMs are usually within the organization’s domain.
* External IdMs: Enable external users and customers of the organization to authenticate. Such IdMs are external to the organization’s domain.

Figure 129: Identity Federation Overview
Customers of the R3 Platform may have various types of users. We can broadly classify them as internal and external users. Internal users are users of the organization that use pre-existing services/resources in the organization (within the enterprise IT boundary), using a standard identity management system employed specifically for the organization. External users are end customers who may pay for products or services of the organization. Such users could be represented in an IdM separate to that of the IdM used for internal users. This could also be a commonly accessible public IdM (outside the Enterprise IT boundary) such as unified government pass authentication systems.
Standard protocols like OpenID Connect 1.0 (OIDC) and SAML make single sign-on and identity federation easier to implement as most off-the-shelf IdMs support them.
12.8.1.1 External users
Not all external users who have an identity in the external IdM would be valid users of the R3 platform. For example, not all users who are citizens and have an account on the government IdM will be users of the platform’s services. We therefore need to establish the authoritative source of users from within the organization and not outside. Such an authoritative source is any user data source managed by the organization. We assume user directories owned and managed by the organization are the authoritative source of truth for user’s association with the organization. This is the domain of user federation. Users within these organizational user directories must then be explicitly onboarded individually to the platform by calling Keycloak APIs. In a sense we have a hierarchy:
* All users in the externally federated IdM; for example, all citizens of a country registered with a government pass.
* The subset of users in the organization’s user directory; for example, all account holders in a bank.
* The bank’s existing account holders who were also onboarded to the R3 Platform; for example, all CBDC wallet holders.
Typically, the existence of an external user in an organization’s user directory is used as a gate to allow or block the user to be onboarded to the R3 platform. External users are inseparable from one another in terms of roles or claims, organizations do not commonly assign different organization wide roles to their customers in the way they do to their employees. As such, claims are not copied from an external user directory for the purposes of access control. Instead, a claim is automatically applied during onboarding designating them an external user. The authorization system must use other non IAM provided data to determine how to authorize external user access to individual resources and services within the platform. More on this in the authorization chapter below.
Attributes can be synced from external user directories to the IAM system if required, however these attributes make it into the identity token but not the access token supplied by the IdM when a user logs in.
12.8.1.2 Internal users
Internal users will already have some sort of identity within an organization’s internal user directory. Onboarding these users to the platform might be a more automatic process within the domain of user federation. The mechanism behind user synchronization implemented within the R3 platform is described more fully below, but Keycloak offers some flexibility here too. Rather than syncing users via an on demand pull system towards the user directory it would be possible to do full background LDAP sync support. It is ultimately up to the customer to determine how they want to synchronize users to the R3 platform IAM system, and to provide access to a user directory, however the mechanism outlined below works via an on-demand user sync service rather than synchronizing all users automatically.
Typically, the record of an internal user in an organization’s user directory is used to provide user claims which describe the resource and services this internal user has access to. Although it is possible to use non IAM sourced data in internal user authorization decisions, unlike external users, this data would not be bound to a specific user. For example where an external user might be dynamically bound to individual resources as they come and go in the platform (for example, this external user has access to this CBDC wallet) an internal user is more likely to be assigned a claim which gives them access to many wallets via some descriptive attribute (for example, an external user with a certain claim has access to all wallets of a certain type).
12.8.1.3 In scope
* Enable authentication for users of both Organization IdM and External IdM.
* Decoupling of foreign IdMs from R3 Platform.
* Identity brokering using Keycloak using standard OpenID Connect 1.0 protocol.
* Disable automatic user creation in R3 IdM on first login from foreign IdMs and invert control of user creation to the organization managing them.
* Mapping of user claims from IdMs foreign to R3 platform in R3 IdM.
* Supplement user profile.
* User onboarding in R3 IdM including completion of User Profile as per schema.
12.8.2 Dependencies
* A running Keycloak service
* Configuration of Keycloak with API gateway for secure access to R3 Platform resources
* Credentials, access, and documentation for foreign IdMs
* (Optional) User directory and interfaces which expose user change events
12.8.2.1 Out of scope
* This document does not relate or discuss implementation of OpenID Federation. It is an unrelated concept.
* The management of foreign IdMs.
* Identity brokering using any other protocol than OpenID Connect 1.0.
12.8.3 Solution design
Keycloak is configured as an identity federation and single sign-on enabler for organizations. The deployment of Keycloak will contain at least one realm aside from the master realm. Realms are configured to federate identities from other, foreign, IdMs. Users from foreign IdMs would be represented in Keycloak, containing claims that provide context of that identity in the R3 platform, chiefly facilitating authorization decisions. Such representations would be devoid of sensitive information (like passwords and one-time passwords) and personal information, unless specifically required on a case basis.
A user synchronization service can optionally listen for changes (like user addition/modification/deletion) in an already existing user directory (for example, Active Directory/LDAP) belonging to the organization and replicate those changes in the designated Keycloak realm representing those users for the R3 Platform.
12.8.3.1 Architecture/context
The following shows a container diagram with only the pertinent parts for identity federation.
[RN7][PM8]
Figure 130: Federated IdM Context
12.8.3.2 Sequence and interactions
The authorization flow for a user logging into a foreign IdP is shown below.

Figure 131: Foreign IdP Authorization Flow
It might be undesirable for the user to go through the two-step process of choosing an external identity provider and then use credentials of that IdM. For example, instead of having the option to Log in via <government pass> for some sites, it might be useful for the user to specify the preferred IdM using a specific URL string. Keycloak offers such mechanisms to choose a preferred identity provider using a special URL query parameter. Such flows make R3 IdMs transparent to the end-user to provide a seamless experience.
The sequence of setting up the federation process is as follows. Because Realms create paths within the Keycloak HTTP service, the API gateway must also be configured appropriately to forward requests to the correct realm URL.
[RN9][PM10]
Figure 132: Federation Sequence
The following steps must be taken:
* Registration of Keycloak with foreign IdM as a valid client: This enables Keycloak to receive the authentication tokens from the foreign IdM and proceed with authenticating the user. This step happens behind the scenes and is bespoke to the foreign IdM. We do not show this in the sequence as it is outside the scope of the R3 Platform.
* Configuration of Keycloak with the foreign IdM: registers Keycloak to federate identities from the foreign IdM.
* Configuration of the First Login flow: configures the behavior of Keycloak when a user logs in through identity brokering. Keycloak uses authentication flows to configure the behavior of the login mechanism. comprising of screens and actions during log in, registration, And so on. Configuring the first login allows changing the default behavior of Keycloak, which is to create user representation in Keycloak’s own database if it does not exist. We override this behavior to only allow users who have been pre-registered on Keycloak. This inverts the control of user creation from foreign IdMs back to the network participant organization.
* Creation of users in Keycloak: configure how users known in foreign IdMs will be onboarded/offboarded from Keycloak. We show three options: manual onboarding using Keycloak UI, programmatically using Keycloak API, and using a user synchronization service that listens for changes and effects them on Keycloak using its API. Note this last alternative will require integration effort; this is described below.
* Configuration of API gateway to respect authentication tokens issued by the R3 IdM.
* Resource access via the API Gateway.
12.8.4 Implementation components
In a federated setup, the components can be divided into two categories. The first category deals with Keycloak configuration: specifically, setting up Realms. The second category focuses on synchronizing outside user data with Keycloak. The synchronization components are only necessary if a network participant requires them.
Moreover, the R3 Platform provides numerous integration points with external IAM systems. This flexibility may call for a custom integration effort for each network participant. The following description outlines one such integration effort. However, it is not possible to predict the exact requirements for every customer in advance; this example is intended merely to illustrate the potential range of services needed.
12.8.4.1 Realm architecture/context
Components of the Realm configuration are shown below.
12.8.4.2 Component 1 - Identity brokering

Figure 133: Identity Brokering
12.8.4.2.1 Overview design
Identity brokering is achieved by configuring a separate realm per foreign IdM. Although this is not a hard requirement, it helps keep users imported from an IdM secluded in the realm. Foreign IdMs supporting OpenID Connect using the Authorization Code Flow are supported only. Keycloak is the client for the foreign identity provider. Secure connectivity between the foreign IdM and Keycloak will be established through client authentication. We configure the identity provider for brokering in Keycloak as follows:
* Configure alias and the enabled flag for the foreign IdM.
* Specify Authorization URL and Token URL and, optionally, Logout URL and User Info URL with the values from the foreign IdM.
* Optionally, set Issuer (CBUAE) to the claim value obtained from the authentication response (JWT) of the foreign IdM.
* The default scope Keycloak requests is openid. Others can be set as per foreign IdM’s scopes.
* Configure Keycloak to validate signature of the foreign IdM’s authentication token, as per good practice. Validate Signatures, Use JWKS URL and JWKS URL enable Keycloak to fetch the public key of the foreign IdM. Alternatively, a validating public key can be set in PEM format.
* Disable Account Linking as we want the foreign IdM to be authoritative for user authentication.
* Set sync mode to Import or Force depending on whether the user details from foreign IdM should be imported only on first login or on every login. The recommended value is Import.
* Set Trust Email to true, as it can be assumed email addresses in the foreign IdM have already been verified.
* Additionally, essential claims can be verified on the authentication token issued by the foreign IdM using Essential Claim.
* Set the prompt parameter (from the OIDC spec) if security protocols suggest that the user will always be required to login. Correspondingly Accepts prompt=none forward from client can be set to true to ensure that clients of Keycloak cannot suppress forced login to the foreign IdM.
* Set Case-sensitive username to avoid ambiguity in username resolution.
12.8.4.3 Component 2 - Attribute mapper
12.8.4.3.1 Overview design
The attribute mapper is the component responsible for mapping user attributes from the foreign IdM to Keycloak during import. This is essential to map roles/claims/attributes to users for use by R3 platform based on the authentication token issued by the foreign IdM. A number of mappers are available depending on the requirements of the specific foreign IdM.
Mapper type
Remarks
Attribute importer
Maps a claim from the token of a foreign IdM into the User Profile of R3 IdM
Claim to role
Grants a role to a user on the R3 IdM if a claim with a value exists on a foreign IdM
Hardcoded attribute
Hardcodes a user attribute with a given value
Hardcoded role
Hardcodes a role to a given user
Advanced claim to role
Grants a role to a user on the R3 IdM if a set of claims based on (actual or regex) claim values
Table 61: Attribute Mapper Types
12.8.4.4 Component 3 - Authentication flow configuration
12.8.4.4.1 Overview design
Authentication flow configuration is the component responsible for changing the authentication flow; that is, the sequence of actions that Keycloak performs during authentication of any user lifecycle. We change the authentication flow when a user from a foreign IdM is authenticated and does not have a representation in Keycloak. The first broker login flow governs this behavior. The identifier used for the user from the foreign IdM is, by default, their email but this can be changed. Such custom implementations are plugged in as an SPI to Keycloak.
12.8.4.5 Component 4 - User directory synchronization service
12.8.4.5.1 Architecture/context
The user directory synchronization service is a component external to the realm configuration. It is a component provided by R3 and, as described above, is an integration effort which must be tailored to a specific implementation of a network participant’s existing user directory. It is not possible to know up front exactly what that integration effort would be for every bespoke network participant. However, the following diagram illustrates one such configuration.

Figure 134: User Directory Synchronization Service
12.8.4.5.2 Overview design
This component will ensure that the organization’s user directory, the authoritative source of truth, is able to determine which users from external IdMs are able to use the R3 platform when they log in. As stated above, only users explicitly known to Keycloak may log in. Users known to the federated IdM but not known to Keycloak have authentication requests rejected.
The solution above shows an automated process for onboarding users to Keycloak, should this be required. Alternatives would be for network participants to retain manual control over this onboarding process as they prefer.
The solution key points:
* User change events like user addition/modification/deletion as they happen on the user directory are made available to the user directory synchronization service; alternatively, the service polls for such events.
* The user directory synchronization service comprises four subcomponents:
* User directory change listener: Listens for changes in the organization’s user directory. This component is protocol-specific and is expected to know of user change events as they happen. This component is capable of both polling or being notified of user change events. Implementations specific to user directory technology are pluggable and publish user change event objects that are published to a pub-sub message broker.
* Pub-sub message broker: Used for storing standardized user change event objects, providing at-least-once delivery guarantees.
* User change handler: Consumes messages from the message broker and translates them into user creation/modification/deletion API calls on Keycloak. API calls to Keycloak are reliable and use retries to handle failures.
* User directory reconciliation scheduled task: Runs at regular intervals to reconcile that users in the user directory are in sync.
* Messages published by the user directory change listener consist of non-user directory specific standard objects (representing user change events) with a unique identifier (de-duplication ID). This means each user change corresponds to a unique object.
* It is assumed that the user directory can query, poll, and notify the user directory change listener of user change events. Take care when configuring the user directory to filter users of interest to the R3 application or specific Keycloak realm.
* Occasionally, due to failures of components that result in omission of events, a scheduled task must be run to perform reconciliation of users in Keycloak as they exist in the user directory.
The goal of synchronization of user data is to ensure any data stored within the IAM system is kept up to date. Primarily this means ensuring any claim changes made externally are reflected within the platform IAM system and to ensure any user which is deleted from the user directory is also deleted from the platform IAM system.
12.8.4.5.3 Availability guarantees
* The Listener and User Change handlers need will be deployed via Kubernetes providing for self-healing in case of failures.
12.8.4.5.4 Data consistency guarantees
* Omission of events can happen as events from the user directory may be lost. To mitigate this, the reconciliation task is run at regular intervals to track omission faults.
* Both the reconciliation task and the change listener component must ensure at least once delivery of messages using a deduplication identifier.
* The change handler must ensure messages are acknowledged only after successful call to Keycloak.
12.8.4.5.5 Fault tolerance and disaster recovery guarantees
* The user directory synchronization service must run in a HA setup running in multiple availability zones.
* Graceful degradation: in absence of events from the user directory, the scheduled task must take over to query the user directory and emit user change events.
12.8.4.5.6 Monitoring and alarms
* The following strategies are implemented to ensure proactive oversight and quick response to any anomalies or issues:
* Performance metrics:
* Number of user change events emitted, and number of user change events propagated to Keycloak
* User change emission and consumption rate
* Number of instances where event processing has failed.
* Bucket - Latency of user change event completions (p95, p99)
* Gauge - event count in message broker
* Health monitoring of component and user directory service:
* CPU, memory, disk monitoring
* Health probes
* Alerts:
* When the frequency of events emitted by the reconciliation scheduled task have exceeded a threshold.
* When the threshold of events in the pub-sub message broker has been exceeded, indicating that events were not processed.
12.9 Securing the identity provider
12.9.1 Overview
The identity management and federation system is the entry point for valid users to use the platform. Securing this system is crucial to stopping unknown and malicious users and keeping the rest of the R3 Platform secure. This design outlines the steps to secure the R3 IdM system. Although non-exhaustive, this document outlines the facets that require security fortification, its importance and methods for implementation.
It is up to each participating organization to evaluate and decide on the facets of Identity Management and Federation that require security in consultation with organization’s go-to security team.
While implementations prescribed in this document are measures based on prior knowledge of attack vectors, the constant evolving threat landscape demands active vigilance and prevention. For comprehensive security we recommend customers to employ a combination of the following:
* A security information and event management (SIEM) system for micro-monitoring individual components for compromise. It collects and monitors data from multiple sources to provide a comprehensive view of network security.
* An intrusion prevention and detection system for the automatic monitoring, detection and prevention of attacks via network interfaces or host activity by generating alerts.
Securing an identity management and federation system is a multi-faceted problem. Each facet requires one or more of the following types of interventions: prevention, vigilance, and correction. While most of these interventions would result in implementations guided by this document, some require manual intervention, especially the latter two. It is recommended that the network participant employs personnel who can act with corrective actions as guided by the document in accordance with the organizations’ guiding Information security protocols. The recommendation is that such personnel have access and are familiar with UIs required for intervention. Such UIs include the Keycloak Admin console, Grafana dashboards, and the SIEM solution chosen for the platform (SIEM is a customer integration effort and not part of the R3 Platform).
We use a combination of standards and off-the-shelf solutions that already contribute some degree to our secure implementation. OpenID connect 1.0 already offers a set of security considerations. In addition, the Financial-grade API (the baseline and advanced), offers a highly secure OAuth profile and can be applied to APIs that require a higher level of security. Usage of Keycloak makes compliance with these standards and security profiles easier.
Below are two tables that classify the various facets of security for identity management and federation. The first table discusses specific requirements of identity management and federation that are implementation outcomes. The second table lists broader security goals of the R3 platform deployment for network participants.
Facet
Measures
Data protection
Encrypting data at rest and in-transit using strong algorithms, secure storage of credentials, secrets and identifiers.
Network security
Rate limiting, segregated networks
Application security
Vulnerability scanning, using secure session management, content security policies
System hardening
Disabling unnecessary services, patching, using minimal privileges
Disaster recovery and incident response
Minimize damage and recover quickly after an incident such as the compromise of keys/secrets
Table 62: IdM Requirements
We address each of the above facets with various security requirements for Keycloak and adjacent components. Holistically, the following facets require attention and implementation from a broader R3 platform perspective spanning individual/collective deployment for network participants.
Facet
Measures
Compliance and governance
Adherence to legal and regulatory standards like ISO 270001, FAPI, and so on.
Monitoring, logging and alerting
Using SIEM, detailed logging, responding to security incidents, maintaining audit trails
User education and awareness
Reduction in risk of human error
Security testing
Identification and mitigation of vulnerabilities proactively
Secure configuration management
Maintenance of consistent and secure state across environments; usage of IaC tools
Supply chain security
Ensuring dependencies and third-party components are secure
Privacy
Protection of user data and compliance with privacy laws
Table 63: Security Goals
Keycloak credential storage has password hashing using bcrypt/Argon2 with salt and iteration count to make it computationally expensive to brute-force passwords.
12.9.1.1 In scope
* Securing Keycloak and adjacent components composing the identity management and federation system.
* Securing data and personal information.
* Adhering to regulations of organization and jurisdiction.
12.9.2 Dependencies
* Encrypted Postgres or encrypted storage on which Postgres resides
* Security information and event management (SIEM) system provided and integrated by the customer
* Intrusion prevention and detection system provided by the customer
12.9.2.1 Out of scope
* Broader security recommendations for the R3 platform.
* Security details of dependencies: these should be detailed elsewhere in documentation pertaining to the specific technology.
12.9.3 Keycloak data
This section describes data security at rest and in transit, usage of algorithms, security of credentials and identifiers.

Figure 135: IdM Data Protection
12.9.3.1 Data in transit
The IAM solution has various communication paths for both egress and ingress communication. All communication will be secured by using mutual Transport Layer Security (mTLS). mTLS will chiefly be administered and configured from the service mesh (Linkerd). Each container will be accompanied by a sidecar that resides along with the container and will secure the communication between the container and a foreign service.
12.9.3.2 Data at rest
Data from Postgres will be encrypted at rest, provided by the underlying k8s storage class. Backups also need to be encrypted. For example: Postgres by default does not encrypt backups. Additional tooling is required to encrypt database backups. gpg can be used to encrypt backups or a password protected archive of the backup file(s) is also a simple alternative. Postgres is out of scope of this chapter.
12.9.4 Certificate and key management
The Cryptography and PKI chapter outlines the design for the PKI system for use by applications (like Keycloak) to securely sign and verify data. The signing service for the network participant would be used by Keycloak to sign JWTs (collectively referring to ID token, access token, refresh token) using specified algorithm(s). An asymmetric keypair and a certificate is generated for each realm for JWT signing and verification. The private key resides in the signing service (Hashicorp Vault transit) and never leaves the signing service. Keycloak uses it to obtain signature on the JWT tokens.
The public key is extracted and wrapped in an X.509 certificate signed by the intermediate certificate of the network participant. The validity of the certificate governs the validity of the asymmetric key pair. All certificates are stored in the certificate store as described in R3 Platform PKI chapter. The certificate is consumed by Keycloak and exposed as a part of OIDC Discovery and JWKS URI which is a part of the OIDC specification. This endpoint is used for JWT verification purposes in dependent services (like the API gateway or Open Policy Agent) that want to verify and validate the user’s token. Given all certificates are actually stored in the certificate store (see the Cryptography and PKI LLD), Keycloak acts as a proxy to such certificates. The reason for such proxying is attributed towards conformance to the OIDC discovery specification.
12.9.4.1 Sequence of generation of keys and certificates for JWT signing
Prior to Keycloak installation, key pair and certificate generation for each realm would have to be followed along the same lines as any other service as described in the Cryptography and PKI chapter. Details of transit service, key aliases (corresponding for each realm), and certificates are then fed into Keycloak, completing realm configuration. Keycloak by default lacks the capability to outsource the signing of a payload (in our case a JWT) to a remote service. Therefore, Keycloak is extended to enable this functionality using a Service Provider Interface plugin.
12.9.4.2 Certificate trust chain augmented token checks
It is expected that services within the R3 Platform would verify the JWT token against the public key present against the certificate all the way up to the root of trust. On top of this, identities in each link in the certificate trust chain are checked to make sure end-entity certificates (in this case Keycloak is the end-entity) are issued by the network’s CA which is authoritative for this instance of Keycloak. These are the standard augmented certificate trust chain checks for the R3 platform, implemented by the Crypto SDK, and more details of such verification can be found in the Crypto and PKI chapter.
These additional checks ensure that even if the Keycloak instance was compromised to the point an attacker could generate their own tokens (that is, by injecting a private key and associated certificate they controlled into Keycloak), tokens signed with this key would not pass validation by the Crypto SDK used by each service. This is because the attacker would not have control over the network’s CA to generate a certificate which was authoritative for the end-entity. Gaining access to the network’s CA would present several more significant security challenges including escalation of privileges. See the Cryptography and PKI chapter for more details on the CA.
Requests which did not pass the additional checks might get past the API gateway (which only does limited signature checks on the end-entity certificate public key) into the private network but would never end up getting processed by an actual service. In other words, if downstream services use the platform Crypto SDK to validate token signatures, attackers cannot compromise the platform via taking control of the IdM alone.
12.9.4.3 Key rotation
Key pair rotation cadence is governed as per customer choice. Key rotation will be automated as per the design specified in the Cryptography and PKI chapter OIDC specification that discusses the mechanism for rotation of keys. On key rotation, we ensure that old keys are available in the JWK’s URI exposed by Keycloak’s OIDC discovery endpoint. Dissemination and effectuation of new keys shall be done by Keycloak. New tokens and session cookies are signed with new keys. For existing sessions, new access and identity tokens are signed with new keys during token refresh. Eventually, all tokens and cookies use the new keys. Old keys will continue to be made available in Keycloak until the maximum session lifetime (refresh token duration).
12.9.5 Secrets management
Keycloak uses various secrets to connect to internal/external systems. Examples of internal services are databases, caches, and crypto services. Examples of external services are foreign IdMs. In this section, the word server is representative of such internal or external systems, while client is representative of either Keycloak or a user directory synchronization service. The client authenticates itself with such servers using secrets.
R3 Platform deploys a dedicated secrets manager module to store and rotate secrets. Secrets used by Keycloak must follow the principle of least privilege. As an example, the database secrets configured for Keycloak should only allow DML access to Keycloak-specific tables only. DDL queries to create initial database schema for Keycloak should only be used during initial setup, and Keycloak must be restarted to use secrets granting reduced DML privileges. Some of the pertinent secrets used by Keycloak along with their relevance are as follows:
Secret
Used by
Relevance
Rotation
Database credentials
Keycloak
Used to authenticate with Postgres DB
As per org policy or every six months unless defined
Infinispan credentials
Keycloak
Used to authenticate with the Infinispan cache.
As per org policy or every 6 months, unless defined
(Optional) LDAP binding credentials
Keycloak (per realm)
Used to connect to an LDAP for user federation, LDAP in this case is acting as the user directory
No rotation; not generated/managed within R3 platform
OIDC provider credentials
Keycloak (per realm)
Used to authenticate with a foreign identity provider for identity brokering.
No rotation; not generated/managed within R3 platform.
(Optional) SMTP credentials
Keycloak (per realm)
Used to authenticate with the SMTP server for sending emails
No rotation; not generated/managed within R3 platform
NATS (pub-sub) message broker credentials
Optional user directory sync service
Used to authenticate with message broker.
As per org policy or every six months unless defined
User directory/LDAP binding credentials
Optional user directory sync service
Used to authenticate with LDAP for user federation; LDAP in this case is acting as the user directory
No rotation; not generated/managed within R3 platform
Keycloak credentials for API access to realm
Optional user directory sync service (per realm)
Used to authenticate with Keycloak realm for user fetching/creation/update/delete
As per org policy or every six months unless defined
Keycloak realm credentials for IaC service account
IaC (per realm)
Used to configure each realm
No rotation required
Table 64: Keycloak Secrets
12.9.5.1 Secret rotation
Secret rotation requires both server side and client-side rotation. In a distributed system, simultaneous events cannot realistically be managed, so it is a requirement that old secrets remain valid for a grace period and co-exist with new secrets. Secret rotation requires client restart. The R3 Platform adopts rolling update-based secret rotation to minimize service disruption. This approach assumes that connections established with the server with older secrets will continue to operate until they are disposed from the client and server.
For cases where the server is hosted as a part of the R3 Platform (for example, database or cache) and requires rotation, we will rely on the provided Secrets Engine. Further details about the secret rotation mechanism are described in the Secrets Management chapter.
12.9.6 Network security
Identity management and federation components will be deployed in a private subnet with direct ingress and egress connectivity shutdown from the internet. All traffic must route through organization firewalls and gateways first.
* Traffic restrictions
* Firewall at the edge of the internet would perform filtering and rate-limiting of requests to Keycloak (via API gateway).
* Inbound traffic to Keycloak would be proxied via API Gateway component.
* APISIX API Gateway will not impose any security restrictions on traffic en route to Keycloak.
* Using Service Mesh (Linkerd) authorization policies, we restrict incoming traffic to/from Keycloak as per the container diagram (as found in the Authentication Topology design).
* Disable access to the admin console from the internet, only whitelisted to trusted IP addresses/CIDRs or via MPLS based networks.
* For comprehensive security, it is recommended to deploy an Intrusion Detection system to monitor network and host activity to generate alerts on suspicious network activity.
12.9.7 Application security
12.9.7.1 Keycloak application security
This section describes Keycloak-specific security requirements based on OAuth 2.0 Threat Model and the OAuth 2.0 Security Best Current Practices.
12.9.7.1.1 Setting the hostname
* Mobile and web apps require an OIDC Discovery endpoint to construct requests to the Keycloak (OIDC Server).
* Keycloak discloses its own URLs through the OIDC Discovery endpoint. If the hostname is dynamically interpreted from a hostname header, it could provide a potential attacker with an opportunity to manipulate a URL, redirect a user to the attacker’s fake domain, and steal sensitive data such as action tokens, passwords, and so on. By explicitly setting the hostname option, it avoids a situation where tokens could be issued by a fraudulent issuer.
* The hostname of the Keycloak application is set specifying https protocol using startup parameters --hostname https://my.keycloak.org/auth, where /auth is the context path where Keycloak is accessible via the API Gateway.
* Where network participant access to the admin console is required, it is also recommended to set up the admin console access via the API gateway at a separate subdomain, example: https://admin.my.keycloak.org. Setting the --hostname-admin https://admin.my.keycloak.org flag will instruct Keycloak to expose the admin console at a different subdomain. The access to such URLs would be expected to be further locked down by routing through protected channels such as specialized MPLS-based networks rather than over the public internet.
* Keycloak is also configured with --hostname-backchannel-dynamic true because we want the API Gateway to talk to Keycloak via the internal network for obtaining public keys for verification via the OIDC well-known discovery endpoint.
12.9.7.1.2 Clickjacking prevention
* Clickjacking is a technique of tricking users into clicking on a user interface element different from what they perceive. A malicious site loads the target site in a transparent iFrame, overlaid on top of a set of dummy buttons placed directly under important buttons on the target site. When a user clicks a visible button, they are clicking a button on the hidden page. An attacker can steal a user’s authentication credentials and access their resources by using this method.
* Keycloak is configured with X-Frame-Options and Content-Security-Policy to prevent this from happening.
* Keycloak configures X-Frame-Options to SAMEORIGIN. Using ALLOW-FROM is discouraged as all custom elements like themes, images, CSS, are recommended to be bundled as Custom Themes.
* The Content Security Policy allows serving content from Keycloak’s domain: Content-Security-Policy: default-src 'self'; script-src 'self'; style-src 'self'; img-src 'self'; font-src 'self'; connect-src 'self'; frame-src 'self'; base-uri 'self'; form-action 'self';
12.9.7.1.3 Cross-site request forgery (CSRF) protection
* A cross-site request forgery (CSRF) attack uses HTTP requests from users that websites have already authenticated. Any site using cookie-based authentication is vulnerable to CSRF attacks. You can mitigate these attacks by matching a state cookie against a posted form or query parameter.
* The OAuth 2.0 login specification requires that a state cookie matches against a transmitted state parameter. Keycloak fully implements this part of the specification, so all logins are protected.
* Whitelisting URIs
* All redirect URIs, Web Origins and Valid Post Logout URIs must be as specific as possible.
* Registering vague redirect URIs for Authorization Code Flows can allow malicious clients to impersonate another client with broader access.
* URIs set for development/tests must be removed before they are shipped to UAT/production.
* By using Client Policies, clients cannot register open redirect URI such as * or URIs with wildcards.
* Access token and refresh token security
* Keycloak includes several actions to prevent malicious actors from stealing access tokens and refresh tokens. The crucial action is to enforce SSL/HTTPS communication between Keycloak and its clients and applications.
* Another action to mitigate damage from leaked access tokens is to shorten the token’s lifespans. We set the token lifespans to be as short as possible.
* If an admin detects a leak, the admin can log out all user sessions to invalidate these refresh tokens or set up a revocation policy.
* (Operational) If an access token or refresh token is compromised, access the Admin Console and push a not-before revocation policy to all applications.
* (Operational) It is also possible to disable specific applications, clients, or users if they are compromised.
12.9.7.1.4 Timeouts
* Short timeouts are set for access tokens and refresh tokens. Details of timeouts for realms as described in the Keycloak as an Identity Provider design and are set in the terraform-keycloak-instance-config IaC module.
12.9.7.1.5 Authorization code leaks and timeouts
* For the OIDC Auth Code Flow, Keycloak generates a cryptographically strong random value for its authorization codes. An authorization code is used only once to obtain an access token. Setting a length of time of less than 10 seconds is long enough for a client to request a token from the code.
* Prevention of leaked authorization codes must be done by applying Proof Key for Code Exchange (PKCE) to clients. It is described in the Keycloak as an Identity Provider design and is set by the terraform-keycloak-instance-config IaC module.
12.9.7.1.6 Preventing token misuse by clients: setting aud claim
* Audience of access tokens is set to be the R3 platform only.
* Audience checks are made in the R3 Platform Authorization policies to ensure that the platform does not accept tokens with different audiences.
* Password policies [Only applicable when Keycloak is used as an Identity Provider]
* When using Keycloak as an Identity Provider, setting a strong password policy is of utmost importance for ensuring users choose strong passwords.
12.9.7.2 Client-side security
This section is a requirement for clients (web/mobile apps) of Keycloak. Requirements discussed here will not result in any implementation or configuration in the Identity Management and Federation System.
* Ensure refresh tokens always stay private to the client and are never transmitted.
* Access tokens and refresh tokens need to be securely stored (never in plaintext) in the client (Web/Mobile Apps) and need to be transmitted over HTTPS to the server side. Following are broad-level considerations for secure storage of such tokens at the client side:
* Web - Using Cookies with HttpOnly:true, Secure:true, SameSite:Strict configurations to store JWTs.
* Android - Using encrypted SharedPreferences.
* iOS - Using Keychain.
12.9.7.3 Vulnerability scanning
Vulnerability scanning will be done as a part of the CI pipeline to ensure deliverables from R3 and suppliers are free from vulnerabilities. Vulnerability scan also includes continuous scan of released artefacts for vulnerabilities and flagging the vulnerable artefacts or dependencies that the artefacts depend on.
12.9.8 Hardening
12.9.8.1 Admin console access
Each realm created on Keycloak has a dedicated Admin Console from which that realm can be managed. The master realm is a special realm that allows admins to manage more than one realm on the system. Access to the admin console should be strictly restricted. Enabling administrative operations for users have required features for user management and is via a dedicated Keycloak provided UI. For example, a dedicated back-office administrative UI could enable selective user management operations (like role/attribute assignment) that relays requests to Keycloak using REST API access.
Where there is a requirement to access the admin console, the following security requirements apply.
* Access to dedicated administration console per realm can be accessed at /admin/{realm-name}/console or https://admin.my.keycloak.org/<realm-name>/console/ if the --hostname-admin option is set.
* As described in the Network Security section, access to admin consoles shall be restricted to the whitelisted IP addresses/networks/CIDRs and/or via MPLS based networks.
* Blast radius can further be limited by using multiple (realm-specific) admin console users which can be configured with selective privileges/fine-grained to perform specific operations in the admin console. The types of privileges are subjective to a specific organization’s policies.
* Granting of selective privileges enable audit trail of operations logged and monitored in a centralized monitoring solution.
12.9.8.2 Disabling dynamic client registration
Keycloak supports registration of OpenID clients (relying parties) dynamically with the end-user’s OpenID provider as per the spec. While this is desirable for web applications where there are multiple types of clients (both confidential and public), it is not suitable for restricted environments where the types of clients are restricted by the identity provider.
To disable such feature in Keycloak, the R3 Platform has a Client Policy of type Max Clients Limit, that restricts the maximum number of clients for a realm. This approach has an obvious downside, requiring the maximum client count to be changed every time a new client is registered. There is no other way to disable dynamic client registration offered by Keycloak.
12.9.8.3 Security patching and upgrades to Keycloak and its dependencies
* List of (up to date) of CVEs reported against Keycloak can be found here.
* Details of Keycloak releases are available on their GitHub releases page. It contains details of bugs/security vulnerability fixes.
A Vulnerability scanning tool is used to scan for vulnerabilities in R3 Platform deliverables and the supply chain of artefacts that goes into the deliverables of Identity Management (including Keycloak, IaC modules, providers, OCI images, charts, operators, and so on.). R3 uses Snyk for scanning security vulnerabilities in the CI pipeline.
While R3 leverages code from open-source repositories and vendors, responsibility for such software (including security) lies with the vendor. R3 expects that the customer obtains a paid subscription with Keycloak vendor Red Hat to manage and provide security patches.
12.9.9 Platform security remit
These requirements are part of the broader R3 platform security remit, the implementation of which is governed by the overarching requirements of the R3 platform security along with the Information security requirements of the network and network participant. These requirements are not to be construed as exhaustive R3 platform security requirements but as an Identity Management specific checklist complementing R3 platform security requirements.
12.9.9.1 Compliance and governance
The security requirements must align to the Information security guidelines of the geographical jurisdictions, the network participant/operator organization and the overall R3 platform security guidelines. Below are a few pointers that needs attention when considering the requirements detailed in the design.
* Compliance measures
* Applicable regulatory requirements must be identified and implemented. For example: GDPR, PCI DSS, SOX.
* Compliance to standards/specific frameworks/guidelines like Financial API (FAPI) subject to guidelines and due-diligence requirements of organization/jurisdiction.
* Access control and least privilege - implementation of access control mechanisms and enforce least-privilege access during assigning permissions to entities. For example, a service account concerned with configuring a realm should not be granted access to the master realm in Keycloak.
* Defining clear policies for identity lifecycle operations covering onboarding and offboarding.
* Governance
* Imposition of identity governance already practiced by the organization; for example, onboarding and offboarding.
* Assessment of information security periodic reviews and certifications.
* Compliance to data minimization and retention: adhere to data retention policies enforced by the organization, and ensure that only minimal or non-PII data is stored in the Identity Management & Federation system.
* Governing third party integrations: integration of R3 identity management and federation system with existing identity management systems of the organization must be governed by governance polices set forth by organization.
* Training and awareness: provide guidance on identifying phishing and social engineering attacks.
12.9.9.2 User education and awareness
Organizations that are network participants should consider the following points:
* Training and educating back-office users about incidents and actions to be planned and implemented by network operator and network participants.
* General education about device security, keeping credentials secret, and so on, to be planned and provided by network operator and network participants.
* Such awareness about cybersecurity is often part of a nations or organization’s objective and would be imparted to users on a regular basis.
12.9.10 Security testing
To ensure that each identity management system remains secure and is not exposed to attacks, conducting regular security tests should be made mandatory by the organization of the network participant, and is expected to be driven by the wider organizational policies. The following are some areas where security tests for Identity Management and Federation can be performed. These are guidelines and not an exhaustive list:
* Authentication testing: Password strength policies, multi-factor authentication enforcement, and session management.
* API security testing: Rate limiting, JWT Security, cross-site scripting, and SQL injection attacks.
* Vulnerability scanning: Scanning for outdated software dependencies, testing third-party libraries and plugins.
* Penetration testing: Exploiting weak encryption or mechanisms, bypassing authentication with brute force or replay attacks, broken access controls, and input payload sanitization.
* Compliance testing: Ensuring adherence to standards and regulations.
* Cryptographic testing: Validating implementation of cryptographic protocols.
* Identity federation testing: Testing OIDC misconfigurations.
* Security configuration testing: Secure default configurations like default passwords, usage of security headers Content-Security-Policy, X-Frame-Options, minimizing exposed services and ports.
* Data protection testing while in transit and at rest
* Secure handling of PII data
* User enumeration and error message testing: Checking if sensitive information like user IDs is exposed in logs, and so on.
* Incident response testing: Evaluating the effectiveness of an incident response plan.
* Scalability and load testing: Ensuring that no security features fail under load.
12.10 Identity management performance, scalability & resiliency
12.10.1 Overview
This section discusses the approaches to cater for the following non-functional requirements of Identity Management and Federation:
* Performance: Ensure system can respond to requests quickly enough and is able to make efficient use of resources (CPU, memory and IO).
* Scalability: Ensure system can handle increased demand to accommodate more user requests. Chiefly, we explore Horizontal scalability which ensures that load is distributed across running instances of services avoiding performance bottlenecks and single point of failure.
* Resilience: Ensure system can recover from failures to adapt and handle failure disruptions to prevent downtime.
* High availability: Ensure system can maintain continuous operation and eliminate single points of failure through redundancy mechanisms.
Strategies to implement each of these non-functional requirements overlap. The central idea being replicating instances of Identity management and federation system components as is the norm for scalable web services running in a Kubernetes environment.
The technical requirements specified by this design are an attempt to optimize the system to achieve certain objectives (aka SLOs). To achieve these objectives, it is imperative that they are identified first. The non-functional requirements and deployment for a specific network participant is a joint initiative between R3 and the customer. Identification of such requirements will determine the extent of such optimizations. We use the R3 Operational Readiness Review (ORR) framework to evaluate the IdM during our development and deployment lifecycle and to make necessary optimizations to achieve our goals.
Service Level Indicators/metrics help us determine whether the system is meeting the non-functional requirement targets. Some of the metrics pertinent to each of the non-functional requirements are listed in the table below. Some are quantitative while others are qualitative. The goal as a result of implementation of the requirements presented is to provide evidence that the system exhibits adherence to the metrics. The extent to which quantitative metrics and Service Level Indicators (SLIs) are met depends on the requirements of the product and network participants. However, qualitative metrics must always be demonstrated through the proper implementation of these requirements.
Non-Functional requirement
Metric type
Metrics (SLI)
Performance
Quantitative
Response time (including and excluding network latency), Throughput (Transaction per second), resource Usage (CPU, memory, IO), Error rates
Availability
Quantitative
Uptime.
Resiliency
Qualitative
Ability for the system to tolerate failures.
Scalability
Qualitative
Horizontal scalability, load distribution across app instances, switching of data flow across instances, throughput increase with scale
Table 65: Non-Functional Requirements and Related Metrics
Qualitative and quantitative metrics require continued monitoring starting with fitness function results in PR gates all the way into operation of the product. Usage of the ORR framework during development ensures that fitness function tests quantitatively measure the system continually.
Low level design of high availability and disaster recovery of supporting components like databases, message queues and caches can be found in the R3 Platform High Availability and Disaster Recovery material and is not covered here.
12.10.1.1 In scope
* Acceptable response times for user facing operations like login/logout.
* Zero downtime high availability in a single region/Kubernetes cluster.
12.10.2 Dependencies
* Sufficient nodes in a Kubernetes cluster to achieve distribution of workloads across nodes to mitigate single point of failure.
* Database availability:
* Highly available database cluster with database schema created for Keycloak for specified network participant.
* Synchronous replication of Keycloak database schema from primary to standby replicas in the same Postgres cluster.
* Highly available internal load balancers with provisions to add custom health check endpoints and routing based on health of upstream services.
* Highly available durable message queue with messages (required only for User Directory Sync Service, which is optional depending on customer configuration - see Identity and user federation).
* Framework for running fitness function tests in the CI pipeline.
* Observability framework for monitoring logs, metrics and traces of Identity Management and Federation components.
12.10.2.1 Out of scope
* Gathering of quantitative SLOs. SLO definition is based on organization and network requirements and agreements with the customer.
12.10.3 Solution design
* The following architecture illustrates how the R3 Platform creates a scalable and highly available deployment of Identity Management and Federation components.

Figure 136: HA Overview
The diagram shows Keycloak and the optional User Directory Sync service along with dependencies like the database, session cache and message queue. The overall topology shows two sites, one active and one hot-standby. Traffic between the active site and the standby is routed using DNS-based routing using a Global Load Balancer. Requests from external clients are first routed through the Global Load Balancer. It distributes requests to the active site in the absence of site failures. The health of a site is determined by monitoring the health of the site-specific load balancer. More details on this can be found in R3 Platform HA and DR material - it is out of scope of this chapter. For the rest of the section, we will be focusing only on single data center high availability (that is, within a Kubernetes cluster).
A load-balancer, deployed for each network participant monitors the health of Keycloak through health check endpoints and routes requests to active Keycloak instances only. Load balancing is further optimized to use sticky sessions (hash based) to take advantage of local Keycloak caching to improving response times.
The Infinispan cache cluster is for storing information about sessions rendering Keycloak stateless, mitigating performance bottlenecks and single points of failure. Infinispan is deployed using its dedicated operator. Cache data is replicated asynchronously between Infinispan clusters across sites.
A pre-provisioned database for Keycloak will be used in a Postgres Cluster. Such clusters will guarantee high availability through primary-standby replication setup within the same datacenter.
A highly available multi-replica NATS MQ cluster would be available for the User Directory Sync Service.
12.10.4 Scaling identity management and federation
Keycloak is a stateless component and can be scaled horizontally. Keycloak uses a combination of local and remote cache (Infinispan) to improve performance and reduce disk latency. Using Session affinity at the Internal Load Balancer (using algorithms like consistent hashing) reduces costly database lookups as Keycloak locally caches user, realm and other information yielding better response times.
Horizontal scaling of the User Directory sync service is not required as we do not anticipate a high load on it as user deletions will be rarer than login/logouts. We can resort to vertical scaling if required.
Kubernetes resource requests shall be set according to the above requirements to meet the vertical scaling needs of Keycloak.
12.10.5 Resiliency strategies
To reduce load on any one instance of Keycloak a system of Load shedding is utilized. The http-max-queued-requests parameter for each instance of Keycloak is set to the number of requests Keycloak can handle times the allowed response time. For example: If a Keycloak instance can handle 15 requests per second, and the platform allows response times up to 3 second, we set this parameter to 45.
Requests exceeding the number of queued requests will result in an HTTP 503 error. Such errors can be re-routed and retried on other upstream Keycloak instances. The Internal Load Balancer will also be configured to re-route the user request to alternate instances if a given instance takes too long to respond.
12.10.6 High availability strategies
Keycloak offers various Service Level Indicators to monitor the health of Keycloak, which can be configured in observability tools like Grafana. Keycloak provides liveness and overall health probes for an Internal Load Balancer to determine the health and liveness of the Keycloak service.
As per the norm for Kubernetes deployments consisting of multiple replicas, Kubernetes will restart pods if a Keycloak or User Directory sync service failure is detected via the stated health check endpoints. To protect from node failures, Keycloak instances will be spread across multiple servers/Kubernetes nodes using Kubernetes Pod topology and spread constraints.
12.10.7 Upgrades
As of version 23, Keycloak will not support rolling upgrades when upgrading to major versions. Upgrade between minor and patch versions can be handled by rolling updates. Keycloak will hence require downtime when upgrading between major versions. What this means, and the strategy for upgrade, cannot be determined in advance as it depends on the nature of the Keycloak changes and upgrade process. Whether it is a requirement to upgrade Keycloak to a new major version is also impossible to determine in advance and that decision must be made on a case-by-case basis, in alignment with Keycloak’s own upgrade process plan.
12.10.8 Resource sizing for identity management and federation
* Keycloak runs in a JVM and requires 1250MB for managing 10K user sessions with an added 300MB of non-heap memory. The base memory required to run a Keycloak pod is 1250MiB. If requests are load balanced across multiple pods, the resources get divided accordingly per pod.
* The Quarkus (the framework that Keycloak is built on) thread pool should be explicitly set to the number of vCPUs x 4. This will enable Keycloak to handle requests and health probe requests.
* The values for database connection pool settings: db-pool-initial-size, db-pool-min-size and db-pool-max-size should all be set equal to avoid the stampede effect. Such connection settings must also be correlated and evaluated with those on Postgres. DB connections could be reused using tools like pgBouncer.
* More details about capacity planning can be found here and about thread and DB pool configuration here.
* Sizing requirements for the User Directory Synchronization service shall be contingent on the size of the User payload and the memory required for message transformation.
* Both Keycloak and the User Directory Sync service’s CPU and memory usage will be tracked on a Grafana dashboard for utilization patterns and will be tuned accordingly.
12.11 Authorization services
12.11.1 Overview
This section outlines the design of the authorization system of the R3 Platform. The authorization system vets external actor intent combined with their identity and the target resource and returns a decision that allows or denies the operation. External actors can be human users or machines.
The R3 Platform solution for Authorization services enables deployment of policies that aid making authorization decisions as Boolean or non-Boolean responses. This is one of the primary benefits of moving away from traditional authorization solutions, where the IdM/IdP also drives authorization decisions. In these traditional IAM solutions, determining access is a simple case of configuring yes/no decisions against end points for specific users or roles. RBAC is a popular choice for these systems because the role then gives a simple level of abstraction between users and decisions. The R3 Platform prefers ABAC for greater fine-grained flexibility. It also facilitates more than just yes/no decisions. For example, it is much easier to create an authorization policy which determines a list of resources which can be accessed by a particular user token. When we are dealing with users who own multiple assets, this is a model we can leverage accordingly.
The solution we employ is based around Open Policy Agent to expose policy end points and a policy language from which complex policy decisions are made (this is commonly known as the Policy Decision Point/PDP). It is backed by a relational database which holds dynamic information about resource ownership, such as which users own which assets (this is commonly known as the Policy Information Point/PIP). The PIP facilitates managing resource metadata and its ownership data.
Services which use the Authorization service to determine whether any specific request should be actioned or not are commonly referred to as Policy Enforcement Points/PEPs.
12.11.1.1 In scope
* Obtain timely authorization decisions.
* Resource permissions (PIP entries) are dynamically manageable within the platform at runtime (only to internal services).
* Resource access can be enforced by services and applications within the platform (PEPs).
* Authorization policy is centrally managed and not hard-coded in service and application code (PDP policy).
* Authorization decisions can be based on the context of the currently logged-in user, authorization policies, and the resource service.
* High availability and scalability of authorization service.
* Enable authorization policies to be authored and deployed as code to:
* Facilitate domain teams to write their own policy code, these teams understand the domain and policies that govern that domain.
* Enable decoupling.
* Enable Policy composability and encourage reusability of policies.
* Enable lifecycle management of authorization policies - testing, bundling, deployment, version upgrade of policies.
* Listening for deletion of users in user directory and effectuating them in resource service (PIP).
12.11.1.2 Out of scope
* Authorization of interactions between external systems and R3 Platform Apps of the same organization.
* Third party systems outside the boundary of the organization and R3 Platform of an organization trying to access data.
* Organizations settling value on the ledger - this falls under the purview of the ledger itself.
12.11.2 Dependencies
* Open Policy Agent
* Hasura GraphQL Engine
* PostgreSQL database
* OCI Registry for storage of policy bundles
* CI Pipeline to run tests and deploy policy bundles
* CI Pipeline to deploy and update policy bundles
12.11.3 Solution design
While resources are exposed by different domain services in the R3 platform, the ownership information for each resource, and its metadata about who can do what with each resource is maintained centrally in the organization. The service responsible for managing such resource information is referred to as the Resource Service.
Removal of users, by default, has no impact on the existence of the resource, but impacts the resource ownership. They are orphaned or are transferred to a successor. Listening for such user deletion events and actioning on resource ownership information is handled by a Resource Synchronization Service.
12.11.3.1 Architecture/context
The entire setup is replicated per organization.

Figure 137: Authorization Context
Authorization interacts with the following external systems:
* API gateway: To protect services exposed by the R3 Platform, the API Gateway prevents unauthorized access to protected endpoints. Upon successful user authentication, an authentication token is issued by the IdM. The token and the claims it contains are passed on to authorization along with the request (user intent) for an authorization decision. Authorization returns a decision that is enforced by the API Gateway.
* Identity management system for the same organization: To synchronize ownership of resources owned by users on the R3 platform, user deletion events are notified to Authorization, which impacts the resource ownership information held in Authorization system.
* R3 Platform service (generic): Similar to that of API gateway, this is representative of any domain service that deals exposes a kind of resource for users, whose authorization is managed by the Authorization system. Such services seek finer grained access control from the Authorization system. For example, filtering from a list of resources, that the user is permitted to operate on.
* Deployment pipeline: The Continuous Integration and Deployment pipeline builds policy code from Source Code Control (like Git), builds it and deploys it to the Authorization system. Such policy code usually resides as versioned bundles in a binary artifact registry. The deployment pipeline is version aware and can deploy specific versions of policy code bundles to the Authorization system.
The different logical containers that build up the Authorization system are:
* Policy Decision Service: This is the central engine where authorization policies are deployed. Policies are namespaced and versioned. A policy can be invoked by API Gateway or any R3 Platform service for an authorization decision.
* Resource Service: It exposes resources and their ownership information that can be consulted by the policy decision service to make a decision.
* Resource Database: A Postgres database. It is the repository for resources and their ownership information.
* Resource Synchronization Service: It handles resource ownership updates in the event of a user being deleted from the User Directory.
12.11.3.2 Sequence and interactions
The following section describes the key sequences involved in Authorization.
12.11.3.2.1 Invoking of policy via any Policy Enforcing Service
A user wishes to access a resource. Their identity is provided by the Identity Management and Federation service in the form of an authentication token (JWT). The token contains attributes or claims that define or help determine access to the resource. Information about the resource and its ownership is contained in the Resource Service backed by the Resource database.

Figure 138: Invoke Policy Sequence
12.11.3.2.2 Resource addition and modification
When authenticated and authorized, the user can add new resources or modify existing resources in the system using a service dedicated to the domain of the resource. Successful addition or modification of the resource results in change in the Resource service, subsequently the resource database - those being the single source of truth for resource and ownership details.
Note that the resource creation and the update of the resource service is a distributed transaction, and its design detail is elaborated in the domain of the service.

Figure 139: Add or Modify Policy Sequence
12.11.3.2.3 Resource synchronization when ownership has changed
Addition or removal of users should also result in the corresponding resource linkages of the user.

Figure 140: Synchronize Resource Sequence
12.11.4 Component 1 - Policy Decision Service
12.11.4.1 Overview design
The component is central to computing authorization decisions and is implemented using an off-the-shelf component called Open Policy Agent. It evaluates user permissions by interacting with policy data and resource information to provide authorization decisions. Policy data is static data that maps user attributes to permissions. Resource information is dynamic and is created and updated when new resources are created, or existing resources are modified. Resource information is provided by Resource Service. Policies are code (Rego) that are authored by developers and deployed on Open Policy Agent.
12.11.4.2 Architecture/context

Figure 141: Policy Decision Service
12.11.4.3 Policy structure
Policy is shipped as a signed TAR GZ bundle comprising Rego policy code, configuration, and static data. The bundle is pulled from an OCI registry and deployed in Open Policy Agent. The signed bundle is verified with a public key that is pre-configured in OPA to ensure integrity and authenticity of bundles.
Rego code is executable and seeks inputs from various sources for decision computation:
* Static data like permission details that help translate claims and attributes on a user JWT to meaningful context for the Rego code.
* Configuration like endpoints for resource service are static and fed via a static JSON file in the policy bundle.
* Dynamic data fetched from those endpoints via http. This is how policies connect to the Resource Service.

Figure 142: Policy Structure
The statelessness of OPA facilitates horizontal scaling. A centralized approach for deploying OPA is currently employed. Pushing all dynamic data used by OPA policies to the resource database pushes the complexity of scaling the data to the database layer.
A recommended model for scaling is to deploy OPA with its consuming service (as a sidecar) enabling finer-grained and domain-specific authorization decisions to happen close to the domain service.
Policies are tested, built, signed and published to an OCI artifact registry via a CI pipeline that undergoes environment promotion like all other deliverable artifacts. Customers can replace stock policies by publishing their own policies to the OCI artifact registry, at which point customers take responsibility for ensuring the integrity of the policies.

Figure 143: Pipeline
12.11.4.4 Features
* The policy decision service enables policy decision computation.
* Authors can deploy policy code using tar gz bundles deployed via a deployment pipeline.
* Policies can expand attributes in access tokens into claims which are understood by upstream services in the platform in code, if this is required by the downstream identity provider.
12.11.4.5 Availability guarantees
* Multiple instances of OPA are deployed to create a HA service, routing is managed by a Kubernetes Service.
* OPA is fundamentally stateless as it relies on the resource service and the user JWT for policy decisions.
* OPA stores the policy bundle in a filesystem backed persistent store.
12.11.4.6 Data consistency guarantees
* As OPA is stateless, data consistency is a concern for the Resource Database described in a following section.
12.11.4.7 Security guarantees
* Policy bundles need to be signed to ensure integrity and authenticity of policy code before they run in OPA.
* The R3 Platform disallows bundle discovery that auto fetches new bundles and versions. Instead, bundles are encouraged to be deployed manually.
* The private key for signing policy bundles will be stored securely in the Crypto Service described in another chapter.
12.11.5 Component 2 - Resource Service (using Hasura GraphQL Engine)
12.11.5.1 Overview design
The Resource Service is realized via an off-the-shelf component called Hasura GraphQL Engine. The GraphQL engine will be configured to recognize the schema of the resource database and expose GraphQL query and mutations API. The GraphQL engine is configured to expose attributes that are required for policy evaluation.
When expecting a large data volume, pagination could be applied to GraphQL queries pagination on Rego policies, although that may not be feasible in the context of the policy being created.
12.11.5.2 Features
* Query for resources and their ownership information using a GraphQL API exposed over HTTP.
* Limit the amount of information required by specifying attributes.
* Mutate entries in the Resource Service using a GraphQL API exposed over HTTP. Binding resource ownership to users.
12.11.5.3 Availability guarantees
* Multiple instances of Hasura are deployed to create a HA service, routing is managed by a Kubernetes Service.
12.11.5.4 Data consistency guarantees
* As Hasura is stateless data consistency is a concern for the Resource Database described in a following section.
12.11.5.5 Security guarantees
* Read only access is granted to Rego policies making GraphQL queries.
* Read-write access is granted to other domain services creating and updating resources.
12.11.6 Component 3 - Resource Database
12.11.6.1 Overview design
The resource database is implemented as a Postgres database.
12.11.6.2 Database schema
-- Enumeration for types of resources. Bootstrap with wallets. 
CREATE TYPE resource_type AS ENUM ('wallet');

-- Table to manage resource and it's attributes.
create table if not exists resources
(
    id text primary key, 
    name text not null,
    type resource_type not null,
    owning_org text not null,
    attributes jsonb not null default '{}' -- this is where attributes related to resources will be stored
);

create table if not exists resource_ownership 
(
 resource_id text not null references resources(id),
 owner_id text not null,
 attributes jsonb not null default '{}', -- resource ownership attributes, example: permissions to manage, delete, etc.
    primary key(resource_id, owner_id)
);
12.11.6.3 Features
* The resource service database stores information about resources and their ownership.
12.11.6.4 Availability guarantees
* The database availability is contingent on database service availability. Postgres is a commonly used database across the R3 Platform. Details on how it is made highly available and resilient are covered in another chapter.
12.11.6.5 Data consistency guarantees
* Change in resource and ownership to be executed in a database transaction to ensure consistency.
* Data consistency between replicas is managed by the underlying Postgres operator. For the R3 Platform, it will be managed by CNPG.
12.11.6.6 Fault tolerance and disaster recovery guarantees
* Fault tolerance, backup, recovery is managed by the underlying Postgres operator.
12.11.6.7 Security guarantees
* Grant only SELECT, UPDATE, DELETE, INSERT privileges to the database user configured in Resource Service.
* Grant only SELECT, and DELETE privileges to the database user configured in Resource Synchronization service.
12.11.7 Component 4 - Resource Synchronization Service
12.11.7.1 Overview design
A custom service using a plugin architecture that connects to the User Directory to listen user deletion changes and emit events on a pub-sub channel. The purpose of the service is to clean up resource mappings from users who no longer exist in the IAM user directory. This service does not manage resources themselves. Where users are removed from the user directory and are the only user mapped to an existing resource, the mapping will be removed but the resource will not. This effectively leaves the resource orphaned, although this is a completely recoverable process by a human operator.
The events trigger actions on upstream services like the resource service to make required changes to resources, such as updating and deleting them. The hook package defines interfaces for events and change listeners. The plugins encapsulate the logic specific to the User Directory, as shown in the package hook.impl. The resource-sync package defines the interfaces and classes to consume events emitted by the hook and action on them using Event Handlers.
12.11.8 Architecture/context

Figure 144: Resource Sync Service
12.11.8.1 Features
* Listens for changes in the User Directory and triggers the relevant resource endpoints for modification.
12.11.8.2 Availability guarantees
* Multiple instances of the Resource sync service are deployed across multiple availability zones, whose routing is managed by a load balancer.
12.11.8.3 Data consistency guarantees
* Events published via the hook will be accompanied by a deduplication identifier.
* The pub-sub channel offers at-least-once delivery.
* Acknowledge events from the channel only when the action on the resource service is complete.
* Retry failed event handler actions.
* Failure of the service results in no data loss or detrimental functionality regarding the platform. At worst some data may be retained which is useless to the R3 Platform at the minor inconvenience of some relatively small excess data usage in the Resource Database.
12.11.8.4 Security guarantees
* Ensure the credentials to connect to the User Directory are stored by the secrets manager - see chapter on Secrets Management.
12.12 Security information and event management (SIEM), monitoring and alerting
12.12.1 Overview
This section details the various methods available to monitor, report and alert on system metrics relating to the IAM system. The R3 Platform implements a platform wide solution for all monitoring, reporting and alarm functionality which is outside the scope of this section. Instead, it focuses on the nature of the log events the application layer of the Cryptography and PKI services will generate.
12.12.2 Dependencies
* A configured SIEM or reporting solution which can scrape logs, parse the entries and issue alerts in some form
* A configured alerting tool for Kubernetes health checks
* A configured time series telemetry capture tool
12.12.3 Kubernetes health checks
As well as application layer events, services that make up the IAM services, like all services in the R3 Platform run in containers deployed inside Kubernetes clusters. The expectation is that these containers and any mounted storage are monitored for health using reporting tools which integrate directly with Kubernetes. This is out of scope of this chapter.
12.12.4 Log analytics
Typically, any reporting system, including SIEM systems, do not integrate directly with the application layer, but instead are configured to scrape logs and make sense of the data asynchronously after the fact. An example of how this might be achieved is given here for illustrate purposes to give a flavor of how this fits into the platform architecture, for more details and to set up configuration, the reporting or SIEM documentation must be consulted directly. That is out of the scope of this document.
* Some kind of decoder is set up which decodes specific content in log lines based on a regular expression.
* The SIEM/reporting solution is configured to pick up this decoder.
* A rule is created with the SIEM/reporting solution to bind the decoder to an alert.
* Alerts can be monitored using a dashboard or other means provided the SIEM/reporting solution.
From the above it should be clear that the application layer’s responsibility towards SIEM/reporting is to ensure the necessary log events are generated. The application is not bound to any particular SIEM/reporting solution and is completely abstracted from it.
Integration of the platform with a specific SIEM solution is the responsibility of the integrator of the platform into the specific customer infrastructure. It is expected that the customer brings their own SIEM system and most likely this is integrated already with existing systems. The various components of the application layer should publish information about the format of events and the platform operator can decide which events to write rules and create alerts around.
The next sections describe the nature of log events generated by sub-systems of the R3 platform’s IAM solution.
12.12.5 Keycloak monitoring and logging
Keycloak performs security event monitoring through its dedicated Event Listener Interface. This event listener is configured to write both user and admin events to logs. The logs are then scraped as described above. Altering rules can be set for events for suspicious activity. Details of such rules are to be designed and implemented following consultation with the security experts of the network participant.
To ensure timely discovery of an incident it is important to detect it at the earliest. Monitoring and Alerting systems must be equipped to detect incidents with minimal delays. Patterns for suspicious activity can be configured through source IP addresses, concurrent usage across devices/browsers, abnormally spikes in usage, access of unauthorized objects, usage of expired tokens, usage of invalid signatures, and so on.
Admin console password leakage can be detected by suspicious activity detection (example: unusual geographical access, concurrent usage from multiple locations, abnormal usage patterns) in monitoring logs or via SIEM. Once detected, automated or manual operations must immediately rotate the password. Rotation can be done manually for the service account using the service account credentials (if not compromised), else through some administrator account whose password is not compromised. Changelog of actions can be observed on the compromised account to identify malicious operations and can be reset accordingly to the known configuration/setting.
Leakage of secrets can be detected through suspicious activity (example: unusual db access, abnormal querying patterns) using db/cache credentials. Appropriate detection and alerting is assumed to be implemented on the db/cache. Once detected, automated or manual rotation of secrets is performed. Rotation of secrets managed by the Secrets manager can be done in reference to the Secret management chapter.
Changelog of actions can be observed on the compromised account and service to identify malicious operations and can be reverted to the last good snapshot of the data.
12.12.6 Hasura monitoring
Hasura GraphQL engine is monitored using OpenTelemetry.
12.12.7 User Sync Service monitoring
The User Sync Service will expose metrics, logs and traces using Open Telemetry:
* Counter - User deleted
* Counter - Failed Syncs
* Counter - Successful Syncs
* Counter - Resource mapping rows deleted
* Log Monitoring of failed event consumption
12.12.8 Compromised JWTs
Compromised JWTs can be detected through suspicious activity detection (like geographical access, usage from multiple locations, abnormal API usage patterns). SIEMs can aid detection of compromised JWTs through reuse of jti claim or usage timestamps to identify replayed tokens. As response, the JWT can be revoked immediately. Sessions linked to the compromised account can be terminated to require the user to log in again.
Changelog of actions can be observed on the compromised account to identify malicious operations and can be reverted to the last good snapshot of the data.


13 Network identity detailed design
13.1 Overview
Services need to communicate securely within and between networks. Parties which receive messages from other parties in the same or different networks must be able to guarantee the identity of the originator of the message. Furthermore, we have other entities in the network which require identities. Certificates which carry public keys associated with cryptographic asymmetric key pairs used for any purpose must be identifiable as belonging to a particular end-entity. This is also true of the intermediate CA which governs certificate issuance for a network. The intermediate certificate forms part of trust chains and must also be identified using some common means.
This chapter covers the entire topic of identity regardless of the end use case, but also pays particular attention to Application Identity, because that domain has some extra requirements, notably the means to transmit and present identity to other parties on the network.
This chapter deals in two primary concepts: the format of identity for any end-entities, including applications and CAs, and the format of the signed token which carries an identity securely between applications. In both cases we use off-the-shelf standards to realize these concepts. They are:
* SPIFFE IDs for identity
* SPIFFE JWT-SVID as a container for identity transmission via tokens
The chapter also describes the framework around how these concepts are employed in the R3 Platform.
13.1.1 In scope
* Implementing the framework which brings network identity to the R3 Platform.
* Defining what an identity looks like.
* Defining how an entity is carried in a JWT for application identity.
13.2 Prerequisites
13.2.1 Terminology
* Network Participant: An entity or organization which is onboarded to the overall platform. A participant is represented in the platform by a private network of services.
* Platform Operator: The entity which owns/operates the platform (the entire Corda Network) on behalf of network participants.
* JWT/JSON Web Token: A means of encoding and signing an authorization token in JSON.
* PKI: Public key infrastructure; a means of distributing public keys bound securely to the identities they are associated with.
* IAM: Identity and access management; this is a topic centered around authentication of end users and authorizing their access to resources and services within the platform. The topic of user authentication is different to the topic of application identity described in this document; however, the same authorization services can be employed in both cases.
* CA: Certificate authority; an entity which issues certificates for public keys bound to identities after validating the request comes from a valid identity.
* PII: Personally identifiable information.
* SPIFFE: An open standard for defining and transmitting identity.
The table below explains the terminology relating to JSON-based tokens.
Specification shorthand
Specification name
Purpose
JOSE
JSON Object Signing and Encryption
This is an overriding term for the set of standards which relate to using JSON for signed or encrypted data. Everything we define below falls into this.
JWS
JSON Web Signature
This is a format for encoding signed data. The data (aka payload) that is signed does not have to be in any particular format. The format of a JWS consists of a JSON header, more specifically this a JOSE header, followed by the data which is signed over, followed by the signature bytes for that payload.
JWT
JSON Web Token
This is a type of JWS which uses JSON for the payload. The JSON payload will contain a set of “claims” (key/value pairs) which describe the identity of the requestor.
Table 66: JSON-Based Tokens Terminology
13.2.2 Background reading
The following links provide optional background reading for subjects touched on in this chapter, although they are not mandatory reading.
* The chapter Cryptography and PKI
* The chapter Identity and Access Management, specifically for details on authorization services
* RFC7515 - JSON Web Signature
* RFC7519 - JSON Web Tokens
* RFC6750 - Use of Bearer Tokens in HTTP Authorization headers (note this is part of the OAuth 2.0 specification but explicitly permits the use of Bearer Tokens for any Authorization use, not just OAuth 2.0)
13.2.3 Dependencies
* R3 Platform Cryptography Services
* Corda Workflow SDK
* Corda Networks, to secure end-to-end transport
* Deployment solution, to annotate applications with identity
13.3 SPIFFE identity format
13.3.1 Introductory concepts
In order to set the scene for the network identity, the table below summarizes the different kinds of identity in the R3 Platform.
Identity type
Description
Example of entity to which this type is applied
Manifestation
User
End user within the context of a network participant. The user is not known outside the network participant.
Consumer or merchant who banks with a particular financial institution and whose PII never leaves that financial institution.
A JWT containing user context provided by an IAM solution.
Resource
Data or resource which can be accessed by a user.
An account or wallet in a CBDC system accessible to a consumer for the purposes of spending and receiving funds.
An entry in a Policy Information Point (part of the IAM solution) which maps permissions to resources.
Corda network
A group of interconnected private networks operating applications that interact with each other.
A central bank which operates a network of banks.
A complete deployment of the Corda platform.
Member
A participant in a Corda network. An organization which manages users and resources.
A bank which has customers with accounts or wallets.
A private network of micro-services all under the operation of an organization that hosts a CA which can authoritatively issue certificates with the identity of the organization.
Application
A particular type of application process within a participant network.
A wallet micro-service running in the private network of a specific bank.
An attribute applied to an instance of a process running in the organization’s private network.
End-entity
A function of an application which requires an asymmetric key pair. The private key must be identifiable for signing purposes, and the public key must be identifiable in order to verify signatures.
Ledger key pair used to sign and verify transactions or key pair used to sign/validate JWTs when messages are sent between applications.
The private key is stored in a secure key management solution and the public key is securely bound to the identity and distributed publicly through the PKI via a certificate.
Table 67: R3 Platform Identity Types
User and resource identities are covered by the IAM solution and are outside the scope of this document. They are mentioned here for reference so that they can be disambiguated from the network and application identities, and also to illustrate application identity is not the same as user identity. User identity and application identity should never be conflated.
The Corda Network, member, application and end-entity identities are related because there is a hierarchical relationship between all three. From an identity perspective, members can be considered parents of applications, and applications can be considered parents of end-entities. All members are parents of a single Corda Network.
The network identity format facilitates this hierarchy.
13.3.2 Identity attestation
Identity is assigned to entities in the SPIFFE format. As SPIFFE IDs are a standard, this document does not attempt to detail the format in its entirety. The SPIFFE ID format is well explained in the specification here: https://github.com/spiffe/spiffe/blob/main/standards/JWT-SVID.md. SPIFFE is URI-based and thus automatically hierarchical. In the use cases defined above, a SPIFFE URL defining a member would look something like:
spiffe://<corda_network>/<member>
Note we insert corda_network here only to make the SPIFFE URL globally unique and to honor the SPIFFE specification. Corda Networks do not typically interact with other Corda Networks and identity across Corda Networks is not interoperable.
For a single instance of the R3 Platform, the <member> identifier would be the same and set at deployment time by the platform operator when the member is onboarded to the Corda Network.
This member’s identity is not only a conceptual identity for the private network of the member, but also the subjectAlternativeName of the intermediate certificate of the CA which services this private network only. In this sense, the CA “protects” the member’s private network as a whole. The subjectAlternativeName field support URIs and it is common across the industry to push SPIFFE IDs into this field.
For an application, the SPIFFE ID would become:
spiffe://<corda_network>/<member>/<application>
Pods are annotated with SPIFFE application IDs at deployment time. This annotation can be read by the application code, although application writers would not do this explicitly. Instead, it would be handled behind the scenes by the Corda Workflow SDK.
For end-entities, the SPIFFE ID would become:
spiffe://<corda_network>/<member>/<application>/<end-entity>
Anything that requires an asymmetric key pair can technically be an end-entity, although our hierarchy structure means that this should always be bound to an application. Applications and networks are actually types of end-entity too, because applications have a need to identify themselves securely, and the normal way to do this is via the use of asymmetric key pairs just like any other end-entity. Similarly, member’s private networks are protected by a CA which needs an intermediate certificate signed by a root, and the identity of that certificate is the same as the member identity as stated above. In essence, you can sign data as a member (for signing other certificates), applications (for signing application identity in comms) and end-entities (which have explicit signing responsibilities like signing ledger transactions).
13.3.3 Hierarchy and trust chain
There is a direct relationship between the names of members, applications and end-entities as shown above and, if assigned correctly, these names match in all certificates up the trust chain. For the crypto library to verify that an application certificate was allocated by an authoritative CA for the member it pertains to, all it has to do is look at the SPIFFE ID path and check that the member part of the application ID matches the member certificate name one link up on the trust chain. The member certificate was issued and signed by the root trust anchor (that is, the platform operator of the Corda Network) so you know that can be trusted if it was by a known root. It would not be possible for a malicious member to use a different intermediate CA to create a rogue application certificate or identity because that malicious CA would not itself have the intermediate certificate with the spoofed member name signed by the root.
The same is true for end-entities, although note that applications do not sign end-entity certificates, only CAs do. This means a certificate with ID spiffe://<corda_network>/<member>/<application>/<entity> is signed by a certificate spiffe://<corda_network>/<member> . To check the trust chain of an end-entity certificate, you skip the <application> part and go straight for the <member> which represents the CA. As long as they match, you know you can trust the end-entity certificate identity.
13.3.4 Private key naming
There is no technical requirement which requires us to link the SPIFFE ID of an end-entity with the private key identifier in the Vault Transit engine. The Vault Transit engine has a copy of the associated certificate for all private keys it manages, and it is this link in Vault which is actually used to provide back information about the certificate needed to verify any signature. This information is returned at the point of signing and is injected into any data at rest persisted with the signature, or in a JWT kid field. The R3 Platform PKI would work quite happily with any private key identifiers.
However, we do want to provide a convention for naming, in order that application developers have only one ID to generate for any key pairs they need to generate, and that ID is only a SPIFFE ID.
Private keys must have a unique identifier across their own network, because an instance of a Vault Transit engine is <network>-specific and private key identifiers must be unique in that engine instance. We can safely ignore the <member> part of the SPIFFE ID, because all private keys in the same engine would have the same value for <member> and thus it becomes extraneous.
The convention then is to strip off the part of the SPIFFE path up to, but not including <member> and use this as the private key identifier.
For an application this would simply leave us with the <application> part of the path from the SPIFFE ID.
For an end-entity this would leave us with <application>/<end-entity>. To avoid confusion the / character is stripped from the private key name before sending to the Vault Transit engine, and this is true both for signing operations from the Crypto SDK and also key generation operations from the operator script/scheduled task which manages key pairs.
13.4 Exchanging application identity via tokens
Application identity is a distinct feature from end user identity, which gives context to a human operator using the platform. Events from within services that action communication to other services do not need to be triggered by an end user action. Even if they are, the context of an end user cannot be passed between members’ private networks. This would not only create privacy issues, but the receiving private member network would not be able to usefully use the context as it would have no record of the instigating user. This is before we consider the token would not pass signature validation as it is signed by an IdM from a different private network. In fact, end user context is not passed widely even within a private network. Instead, private networks apply the principle of least privilege, and each service is exposed only to the minimum subset of information required to operate.
The R3 Platform associates identity with applications and implements a mechanism by which this identity can be securely passed to a receiving application along with any message. The receiving application can independently verify the authenticity of that identity. We wish to propagate SPIFFE-based application identity using standard techniques and protocols, such as JSON web tokens and HTTP headers. Provision is made via a library to support injecting and validating these identity tokens, making this a relatively pain-free experience for internal R3 platform service developers. The use of standard protocols also means the scheme is extensible to future applications which do not use the R3 SDKs.
Application identity is dealt with at the application layer because it means the transmission of identity is not opinionated about the means of transport. A signed JWT is commonly sent over HTTP in a header, but it can also be sent over any other protocol and does not even need to be point-to-point, so could be delivered via a message bus or some other technology. Note that the network identity solution is not responsible for securing the transport layer.
As mentioned above, applications are annotated with an identity at deployment time. Securely providing the identity is a matter for solution delivery/deployment. For the purposes of this chapter, there is an assumption that applications are able to communicate with one another by making HTTP requests (or similar if another protocol is required) to a FQDN. Everything further down the network stack, from proxying via HTTPS, network routing, and passage through API gateways is out of scope of this chapter.
13.4.1 Secure transmission of application identity
Tokens which contain application identity are signed and embedded into HTTP headers. The format of these JWTs will follow The JWT SPIFFE Verifiable Identity Document (SVID) format. This is an open standard and as such, this section does not attempt to detail the format in its entirety. The SPIFFE SVID format is well explained in the specification here: https://github.com/spiffe/spiffe/blob/main/standards/JWT-SVID.md
13.4.1.1 JOSE header
An SVID JOSE header has an optional kid field. In the R3 Platform this will be populated with the certificate key which can be used to fetch the certificate for the public key associated with the private key that signed the token. That will be the hash of:
* The SPIFFE identity of the CA which issued the certificate which corresponds to the private key doing the signing. Note: not the SPIFFE id of the end-entity. Here we need the name of the authoritative source of the end-entity certificate which is the CA that signed it.
* The serial number of the certificate within that CA. This is the part of the hash which identifies the end-entity certificate uniquely.
These two elements combined are guaranteed to produce a completely unique identifier under the rules of https://www.rfc-editor.org/rfc/rfc5280#section-4.1.2.2. This is the basis of forming keys for certificates made available through the common PKI solution. More details can be found in the section Cryptography and PKI.
We do not use the SPIFFE ID of the end-entity doing the signing to identify the associated certificate, because the ID cannot uniquely identify a single certificate. For any one key identifier, there could be many versions of the actual keys as key pairs are version capable. Where keys are rotated, a certificate is created with the exact same SPIFFE ID subjectAlternativeName as the previous. This is why we must use the CA responsible for the generation of the certificate and the certificate serial number, which is unique within that CA.
13.4.2 Architecture/context
A high-level overview of the components involved in application identity exchange via tokens is shown below.

Figure 145: Network Identity Context
Messages are normally sent and received between applications using the Corda Workflow SDK. It is possible to avoid using the Corda Workflow SDK as long as the same protocols used by network identity are adhered to, but in this chapter, we assume the Corda Workflow is used for illustrative purposes.
Applications can be in the same private network or in another private network belonging to other member network participants. Where applications are communicating with applications in other private networks, the FQDN of the recipient might actually be an API gateway of the private network (which then forwards the request), although this is incidental to the application initiating communications and also to network identity. In this case, the API gateway must also forward the JWT which identifies the sending application.
The Corda Workflow SDK uses the Crypto Client Library in order to sign identity at the sending side, and verify identity at the receiving side. This allows the use of the R3 Platform Cryptography services to sign and validate token signatures. This makes network identity an application-level concern.

Figure 146: Network Identity Container
The Corda Workflow SDK handles the injection of tokens into outgoing requests and validates the tokens received by incoming requests. Note that the components in this section, including their names, are illustrative as functional blocks. The implementation is not tied to this exact structure and naming convention and indeed might change over subsequent versions as refactoring or other maintenance is applied to the codebase.

Figure 147: Network Identity Component
13.4.3 Security guarantees
We rely on mTLS at the network layer to prevent man in the middle attacks, with the added protection of short expiries should a token ever be leaked at either side of the mTLS connection.
Security considerations of SVID tokens are described in section 7 of the linked specification.
13.4.4 Sequence and interactions
When a message is sent via the Corda Workflow SDK, the sending application creates a JSON web token containing its own SPIFFE identity and the identity of the expected recipient. The token is then signed by the application’s private key and injected into the message as a HTTP Authorization header of type Bearer. The receiving application has the Corda Workflow SDK validate the JWT is signed by the sender via the certificate for the identity in the JWT circulated by the PKI. At this point, the application can access the incoming message and check the identity of the sender is guaranteed by the Workflow SDK, Crypto Services and PKI of the platform. It can also validate it was the intended recipient of the message.
What the application does with the identity is application domain-specific. The application code is free to use the Authorization services, or to perform in-process validation of its own; for example, match the identity with a persisted notion of identity. This is out of scope of this document.
13.4.5 Token validation responsibilities
Application identity token validation is entirely the responsibility of the service which receives it. There is no off-the-shelf support for the API gateway to handle identity tokens, and therefore it is not involved in this process. Compare this with end user ODIC token validation, which is done, at a basic level, by the API gateway. In practical terms, this communication is between private trusted networks which have been onboarded by the platform operator to the R3 platform. Messages sent by a malicious party must be sent from a trusted organization, and thus we consider this a much lower risk than APIs which are open to the public internet. In any case, the API gateway is only the first entity in the network which validates tokens, and malicious requests would still be rejected by the upstream services.
The crypto libraries used by platform services not only validate the identity of a token against the identity in the certificate, but they also validate the hierarchy of SPIFFE IDs described in the sections above. Signatures with trust chains that do not adhere to the hierarchy are considered invalid.
13.4.6 Crypto Client Library integration
13.4.6.1 Overview design
The Crypto Client Library implements signing via a third-party service and fetching private keys securely bound to identities via the PKI. For more information on this see the chapter Cryptography and PKI.
The core functionality of the Crypto Client Library for signing and verifying signatures can be used to create signed JWTs and also to validate the signatures on those JWTs at the receiving end. The Crypto Client Library has dedicated functions for creating signed JWTs and verifying those JWTs, which differ slightly from the functions used to sign data at rest. Primarily this is due to the way signatures are stored in JWS format for tokens, rather than provided as a flexible Signature class for serialization to a persistent data store.
13.4.6.2 Features
* Sign a JWT given an identity and private key identifier. It encodes the identity of the CA which issues the end-entity certificate and its serial number into the JOSE header so that it can be retrieved from the PKI on the receiving end. This encoding will be a hash of CA SPIFFE ID + serial number.
* Verify a JWT is signed by the identity recorded in the JOSE header within the JWT. It ensures the chain of trust is validated, which includes ensuring that the organization that operates the CA which issued the end-entity certificate matches the identity of the end-entity certificate used to validate the signature.
* Return the signed identity as a SPIFFE ID.
13.4.6.3 Security guarantees
The security guarantees are provided by the PKI and Cryptographic signing operations. The client library is an API to those services, with the added feature that it makes extra checks on the chain of trust as described above.
13.4.7 Corda Workflow SDK integration
13.4.7.1 Overview design
As illustrated above, the Crypto Workflow SDK will handle most of the work involved in SVID creation and validation for an application writer. This will be done automatically when a message is sent, with the sending application’s SPIFFE identity read from an attribute and pushed into the token (and then signed) without the application writer getting involved. Upon receiving a message, the SDK will validate the signature using the crypto library and provide the SPIFFE ID of the sender to the application writer for their validation. Where signature validation fails, the SDK will reject the incoming message before it gets to application code.
13.4.7.2 Security guarantees
The security guarantees are provided by the PKI and Cryptographic signing operations. The client library is an API to those services, with the added feature that it makes extra checks on the chain of trust as described above.
13.4.8 Example flow utilizing components of network identity
* In the com.r3 Corda Network, we have a member organization called acme with a private network which contains a wallet service and a dlt service. The dlt service has two end-entity keys: one for signing ledger transactions, named ledger and one for the notary, named notary. The wallet service sends the dlt service requests via HTTP, although this is proxied via mTLS (HTTPS) in the service mesh.
* The wallet service sends its application identity in each request as spiffe://com.r3/acme/wallet. The token in which the identity is passed is signed with a private key owned by the acme member network’s Vault Transit Engine. The private key ID is wallet. The token also contains the certificate identifier which holds the public key which can validate this signature. That is a hash of spiffe://com.r3/acme (from the intermediate CA certificate subjectAlternativeName) and the certificate serial number for the certificate which holds the public key of the asymmetric key pair used to sign.
* The PKI holds a certificate keyed by hash(spiffe://com.r3/acme + serial number) already from the key generation process.
* When the dlt application receives the message, it fetches the certificate from the PKI and:
* Validates the signature of the token with the private key in the certificate.
* Validates the subjectAlternativeName in the certificate matches the application ID (both must be spiffe://com.r3/acme/wallet)
* Validates the identity of the CA (from the CA’s intermediate certificate subjectAlternativeName in the trust chain) is spiffe://com.r3/acme.
* Validates the CA’s intermediate certificate is signed by a root certificate known to the platform.
* Now that the token signature is validated, the dlt service can also look at the name of the sending app by extracting it from the SPIFFE ID; in this case wallet. It knows it is permitted to accept requests from a wallet service so proceeds. It could also extract acme at this point if required. Both of these components of the sending application are guaranteed by the PKI at this point.
* As a further example, imagine the request to the dlt service requires the ledger to sign a transaction. The transaction is signed with the dlt/ledger private key ID using the Vault Transit engine of the acme member private network. The dlt service writes the hash of the name of the intermediate CA certificate and serial number that can be used to verify the signature into the ledger too, this is hash(spiffe://com.r3/acme + serial number).
* Another member private network in the future reading this persisted data can pull the certificate from the PKI using the hash(spiffe://com.r3/acme + serial number) to verify that transaction belongs to the spiffe://com.r3/acme/dlt/ledger end-entity. At this point it also is able to check that the network (organization) that signed that transaction is acme if required.




14 Appendices
14.1 Appendix A: Contract execution examples

Figure 148: Wallet Hierarchy Examples
In this example, there is a three-level deep wallet hierarchy. The yellow and green wallets represent those that are tagged. Each tag has a contract applied.
The table below describes what contracts will be executed when the contract execution algorithm is run.
Wallet
Contracts executed
Description
1
A
A is applied to this wallet.
2
A, B
B is applied to this wallet; A is applied to an ancestor (1).
3
A
No contract is applied directly to this wallet, but A is applied to its parent (1).
4
A
No contract is applied directly to this wallet, but A is applied to its parent (1).
5
A, B
No contract is applied directly to this wallet, but A and B are applied to ancestors (1 and 2 respectively).
6
A, B, D
D is applied to this wallet; ancestors also have contracts applied.
7
A, B
No contract is applied directly to this wallet, but ancestors have A and B applied.
8
A, F
F is applied to this wallet.
9
A
No contract is applied directly to this wallet, but A is applied to an ancestor (1).
10
A, G
G applied directly; A applied to an ancestor (wallet 1).
Table 68: Contract Execution Example
14.2 Appendix B: G42 to on-prem: developer access
Developers will each be assigned a dedicated VDI from which they can access the On Premise network. All access will be monitored and recorded by the PAM solution. When connecting from the VDI to the solution, they will use the Bastion servers as outlined below:


On-Prem Developer Access
Each developer is assigned their own VDI, and access to it is controlled through PAM. Developers can connect through PAM to the UAT Bastion and the mBridge VMs. They will be able to access the Kubernetes APIs from the Bastion server which has developer tools installed such as K9s and Git client.




Disclaimer
The high-level design document is a Deliverable identified in Annexure A of the Phase 2 Framework Agreement between R3 and CBUAE. The elements of this Deliverable constitute R3 Pre-existing Property or Creations, except for those elements which (i) are third party Intellectual Property, and (ii) are identified as CBUAE New Intellectual Property in Section 4 of Annexure A, as may be amended in the Intellectual Property Memorandum to be issued by R3 with the final Deliverable.




About R3
R3 is a leading provider of digital currency, digital asset and interoperability solutions. R3 supports Central Banks, Corporates and FMIs by providing them with the tools to navigate the complexities of digitization.  
Corda is the world leading open, permissioned platform powering the tokenization of assets and currencies connecting global markets.  
R3 is committed to progressing financial markets. Learn more at www.r3.com. 






















[RN1]Comically small
[PM2R1]Updated with more legible version.
[RN3]Why is there a line coming off the diagram?
[PM4R3]I only see that line when Markup is being viewed, so won’t be in final PDF
[RN5]Text too small
[PM6R5]Rotated.
[RN7]Text too small
[PM8R7]Rotated.
[RN9]Text too small
[PM10R9]Unfortunately this one is rendered by Mermaid: according to Simon, not able to render it in a way that make the text any larger.





2
© Copyright – R3



© Copyright – R3




© Copyright – R3 | Commercial in Confidence
© Copyright – R3




2
© Copyright – R3







© Copyright – R3


