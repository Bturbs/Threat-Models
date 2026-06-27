/*
 * This is a combined version of the following workspaces, with automatic layout enabled:
 *
 * - "Retail CDBC - System Landscape" (https://structurizr.com/share/28201/)
 * - "Retail CDBC - Retail CDBC System" (https://structurizr.com/share/36141/)
*/
workspace "Retail CDBC" "USE CDBC PHASE 2 RETAIL" {
    // !identifiers hierarchical
    model {

        

        mobileApp = softwaresystem "Mobile App" "Provides a limited subset of the retail CDBC functionality to customers via their mobile device." "Xamarin" {
            tags mobileApp
        }

        mobileApp2 = softwaresystem "Mobile App Bank2" "Provides a limited subset of the retail CDBC functionality to customers via their mobile device." "Xamarin" {
            tags mobileApp
        }
        customer = person "Personal Banking Customer" "A customer of the bank, with personal retail wallet." "Customer" {
            -> mobileApp
        }

        payee = person "Payee" "A customer of the bank, with personal retail wallet." "Customer" {
            -> mobileApp2
        }

        group "Central Bank" {
            CB_DLT = softwaresystem "Central Bank DLT" "Distributed Led gersystem for CDBC" "Corda ledger"
            notary = softwaresystem "Notary" "Notarizes and prevents double spending" "Corda"
            mBridge = softwaresystem "mBridge blockChain" "Cross border wholesale CDBC system" "blockchain"
            coreBanking = softwaresystem "CB Core Banking" "Core Banking system" {
            flexCube = container "Flexcube" "Flexcube core banking system" "Oracle Flexcube" {
                registeredClientKey = component "Client Public Key" "Registered client Public Key" "ECDSA 512" {
                    tags publicKey
                    }
                }
            }
        }

        group "merchant" {
            POS = softwaresystem "POS" "Point of sale" "Existing System"
        }

        group "LFI Bank" {
            adminUser = person "Admin Staff" "Admin user managing installation" "Bank Staff"

            DLT = softwaresystem "DLT Banking System" "Distributed Led gersystem for CDBC" "Corda ledger"
            notification = softwaresystem "Notification System" "Notification Notification system." "Notification System"

            walletBankingSystem = softwaresystem "Retail CDBC System" "Allows customers to view information about their retail wallet, and make payments." {
                
                webApplication = container "Web Application" "Delivers the static content and the retail CDBC single page application." "Java and Spring MVC"
                walletApplication = container "WalletAPI Application" "Provides retail CDBC functionality via a JSON/HTTPS API." "Java and Spring MVC" {
                    signinController = component "Sign In Controller" "Allows users to sign in to the Retail CDBC System." "Spring MVC Rest Controller"
                    accountsSummaryController = component "Accounts Summary Controller" "Provides customers with a summary of their retail wallet." "Spring MVC Rest Controller"
                    resetPasswordController = component "Reset Password Controller" "Allows users to reset their passwords with a single use URL." "Spring MVC Rest Controller"
                    securityComponent = component "Security Component" "Provides functionality related to signing in, changing passwords, etc." "Spring Bean"
                    DLTBankingSystemFacade = component "DLT Banking System Facade" "A facade onto the DLT banking system." "Spring Bean"
                    notificationComponent = component "Notification Component" "Sends Notifications to users." "Spring Bean"
                }
                apiGateway = container "API Gateway" "API GW: Enforces Authentication and security checks"{
                    mobileApp -> apiGateway
                }
                authenticationLFI = container "Authentication Bank1" "Authentication system" "OpenID Connect IDS"{
                    userDirectory = component "User Directory" "Keycloack DB"
                    apiGateway -> authenticationLFI
                    
                }
                BFF = container "BFF \n Banckend for Frontend" "orchestrate request and enforces authorization (PEP)" "Typescrip Server"{
                    
                    apiGateway -> this "forward"
                    this -> walletApplication "invoke"
                    
                }
                authorizationLFI = container "Authorization Bank1" "Authorization system (OPA: open policy agent, claim based)"{
                    url "https://engineering.r3.com/architecture-and-design/IAM/HLD/v1/README.html"
                    policyDecisionService =  component "Policy decision service"  "Open Policy Agent graphql TODO" "open policy agent OPA"
                    OPAresourceServer =  component "Policy decision resource server"  "Open Policy Agent resoruce serverO" "policy information point PIP"
                    OPA_Database = component "Policy Database" "policy data storage" "Sync with user directory and Policy Bundles (schema) TBC" "Database"
                    OPA_policyBundle = component "Policy Bundle" "Policy Bundles (policy data schema TBC)"
                    OPAresourceServer -> OPA_Database "Read/Write"
                    policyDecisionService -> OPA_Database "Read"
                    policyDecisionService -> OPA_policyBundle "refers to"
                }


                database = container "Database" "Stores user registration TODO" "Postgres Database Schema" "Database"
            }
        }

        group "LFI Bank 2" {
           
            walletBankingSystem2 = softwaresystem "Retail CDBC System Bank 2" "Allows customers to view information about their retail wallet, and make payments."     
        }
        


        # relationships between people and software systems

        mobileApp -> authenticationLFI "Log in"
        mobileApp -> BFF "Submit Transfer"
        BFF -> mobileApp "Transfer Notification"
        BFF -> authorizationLFI "enforce authorizatino"
        walletApplication -> DLT

        mobileApp -> mobileApp2 "Scan QR code"

        DLT -> CB_DLT "settle transfer"

        customer -> walletBankingSystem "Views account balances, and makes payments using"
        walletBankingSystem -> DLT "Gets accounts and makes payments using"
        walletBankingSystem -> notification "Sends Notification using"
        notification -> customer "Sends Notifications to"
        customer -> adminUser "Asks questions to" "Telephone"
        adminUser -> DLT "Uses"
        customer -> POS "Withdraws cash using"
        POS -> DLT "Uses"

        # relationships to/from containers
        customer -> webApplication "Visits bigbank.com/ib using" "HTTPS"
        customer -> mobileApp "Views account balances, and makes payments using"

        # relationships to/from components
      
        mobileApp -> signinController "Makes API calls to" "JSON/HTTPS"
        mobileApp -> accountsSummaryController "Makes API calls to" "JSON/HTTPS"
        mobileApp -> resetPasswordController "Makes API calls to" "JSON/HTTPS"
        signinController -> securityComponent "Uses"
        accountsSummaryController -> DLTBankingSystemFacade "Uses"
        resetPasswordController -> securityComponent "Uses"
        resetPasswordController -> notificationComponent "Uses"
        securityComponent -> database "Reads from and writes to" "SQL/TCP"
        DLTBankingSystemFacade -> DLT "Makes API calls to" "XML/HTTPS"
        notificationComponent -> notification "Sends Notification using"

        deploymentEnvironment "Development" {
            deploymentNode "Developer Laptop" "" "Microsoft Windows 10 or Apple macOS" {
                deploymentNode "Web Browser" "" "Chrome, Firefox, Safari, or Edge" {
                }
                deploymentNode "Docker Container - Web Server" "" "Docker" {
                    deploymentNode "Apache Tomcat" "" "Apache Tomcat 8.x" {
                        developerWebApplicationInstance = containerInstance webApplication
                        developerwalletApplicationInstance = containerInstance walletApplication
                    }
                }
                deploymentNode "Docker Container - Database Server" "" "Docker" {
                    deploymentNode "Database Server" "" "Oracle 12c" {
                        developerDatabaseInstance = containerInstance database
                    }
                }
            }
            deploymentNode "Retail CDBC" "" "Retail CDBC data center" "" {
                deploymentNode "bigbank-dev001" "" "" "" {
                    softwareSystemInstance DLT
                    tags "Amazon Web Services - RDS MySQL instance"
                }
            }

        }

        deploymentEnvironment "Live" {
            deploymentNode "Customer's mobile device" "" "Apple iOS or Android" {
                // liveMobileAppInstance = containerInstance mobileApp
                tags "Amazon Web Services - Mobile client"
            }
            deploymentNode "Customer's computer" "" "Microsoft Windows or Apple macOS" {
                deploymentNode "Web Browser" "" "Chrome, Firefox, Safari, or Edge" {
                }
            }

            deploymentNode "Retail CDBC" "" "Retail CDBC data center" {
                deploymentNode "bigbank-web***" "" "Ubuntu 16.04 LTS" "" 4 {
                    deploymentNode "Apache Tomcat" "" "Apache Tomcat 8.x" {
                        liveWebApplicationInstance = containerInstance webApplication
                    }
                }
                deploymentNode "bigbank-api***" "" "Ubuntu 16.04 LTS" "" 8 {
                    deploymentNode "Apache Tomcat" "" "Apache Tomcat 8.x" {
                        livewalletApplicationInstance = containerInstance walletApplication
                        tags "Amazon Web Services - RDS MySQL instance"
                    }
                }

                deploymentNode "bigbank-db01" "" "Ubuntu 16.04 LTS" {
                    primaryDatabaseServer = deploymentNode "Oracle - Primary" "" "Oracle 12c" {
                        livePrimaryDatabaseInstance = containerInstance database
                    }
                }
                deploymentNode "bigbank-db02" "" "Ubuntu 16.04 LTS" "Failover" {
                    secondaryDatabaseServer = deploymentNode "Oracle - Secondary" "" "Oracle 12c" "Failover" {
                        liveSecondaryDatabaseInstance = containerInstance database "Failover"
                    }
                }
                deploymentNode "bigbank-prod001" "" "" "" {
                    softwareSystemInstance DLT
                }
            }

            primaryDatabaseServer -> secondaryDatabaseServer "Replicates data to"
        }
    }

    views {
        theme diagramTheme.json
        systemlandscape "SystemLandscape" {
            
            
            
            include *

            autoLayout
        }

        // systemcontext walletBankingSystem "SystemContext" {
        //     include *

        //     autoLayout
        //     description "The system context diagram for the Retail CDBC System."
        //     properties {
        //         structurizr.groups false
        //     }
        // }

        component authorizationLFI "authorizationLFI" {
            include *
            
            autoLayout
        }




        container walletBankingSystem "walletsContainers" {
            include *
            
            // animation {
            //     customer DLT notification
            //     webApplication
            //     singlePageApplication
            //     mobileApp
            //     walletApplication
            //     database
            // }
            autoLayout
            description "The container diagram for the Retail CDBC System."
        }

        container coreBanking "coreBanking" {
            include *
            autoLayout
        } 
        component flexCube "flexCube" "flexCube Application"{
            include *
            autoLayout
        }

        component walletApplication "WalletAPIComponents" {
            include *
            // animation {
            //     singlePageApplication mobileApp database notification DLT
            //     signinController securityComponent
            //     accountsSummaryController DLTBankingSystemFacade
            //     resetPasswordController notificationComponent
            // }
            autoLayout
            description "The component diagram for the WalletAPI Application."
        }

        image DLTBankingSystemFacade "DLTBankingSystemFacade" {
            image https://raw.githubusercontent.com/structurizr/examples/main/dsl/big-bank-plc/internet-banking-system/DLT-banking-system-facade.png
            title "[Code] DLT Banking System Facade"
        }

        // dynamic walletApplication "SignIn" "Summarises how the sign in feature works in the single-page application." {
        //     singlePageApplication -> signinController "Submits credentials to"
        //     signinController -> securityComponent "Validates credentials using"
        //     securityComponent -> database "select * from users where username = ?"
        //     database -> securityComponent "Returns user data to"
        //     securityComponent -> signinController "Returns true if the hashed password matches"
        //     signinController -> singlePageApplication "Sends back an authentication token to"
        //     autoLayout
        //     description "Summarises how the sign in feature works in the single-page application."
        // }

        deployment walletBankingSystem "Development" "DevelopmentDeployment" {
            include *
            // animation {
            //     developerSinglePageApplicationInstance
            //     developerWebApplicationInstance developerwalletApplicationInstance
            //     developerDatabaseInstance
            // }
            autoLayout
            description "An example development deployment scenario for the Retail CDBC System."
        }

        deployment walletBankingSystem "Live" "LiveDeployment" {
            include *
            // animation {
            //     liveSinglePageApplicationInstance
            //     liveMobileAppInstance
            //     liveWebApplicationInstance livewalletApplicationInstance
            //     livePrimaryDatabaseInstance
            //     liveSecondaryDatabaseInstance
            // }
            autoLayout
            description "An example live deployment scenario for the Retail CDBC System."
        }

        styles {
            element "Person" {
                color #ffffff
                fontSize 22
                shape Person
            }
            element "Customer" {
                background #08427b
            }
            element "Bank Staff" {
                background #999999
            }
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Existing System" {
                background #999999
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Web Browser" {
                shape WebBrowser
            }
            element "Mobile App" {
                shape MobileDeviceLandscape
            }
            element "Database" {
                shape Cylinder
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
            element "Failover" {
                opacity 25
            }
        }
    }
}