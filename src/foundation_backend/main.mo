import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Array "mo:base/Array";
import Time "mo:base/Time";
import Float "mo:base/Float";
import Bool "mo:base/Bool";
import Int "mo:base/Int";

actor FoundationDashboard {

    // Type Definitions

    // Represents the main foundation metrics displayed on the dashboard
    type FoundationMetrics = {
        totalUsers : Nat;
        usersGrowthRate : Float;
        totalEnterprises : Nat;
        enterprisesGrowthRate : Float;
        totalTransactions : Nat;
        transactionsGrowthRate : Float;
        totalRevenue : Float;
        revenueGrowthRate : Float;
        totalOperatorGroups : Nat;
        operatorGroupsGrowthRate : Float;
        totalOperators : Nat;
        operatorsGrowthRate : Float;
        totalBalance : Float;
        balanceGrowthRate : Float;
        feesCollected : Float;
        feesCollectedGrowthRate : Float;
        feesAllocated : Float;
        feesAllocatedGrowthRate : Float;
        pendingFees : Float;
    };

    // Represents an affiliate group within the foundation
    type AffiliateGroup = {
        groupId : Nat;
        groupName : Text;
        totalMembers : Nat;
        function : Text;
        since : Text; // e.g., "Jan 1, 2024"
    };

    // Represents a detailed affiliate group with additional information
    type DetailedAffiliateGroup = {
        id : Nat;
        name : Text;
        newType : Text; // e.g., "Foundation", "IT", etc.
        description : Text;
        contact : Text;
        members : [Member];
        function : Text; // e.g., "Foundation - BU"
        since : Text;
    };

    // Represents a member of an affiliate group
    type Member = {
        memberId : Nat;
        name : Text;
        role : Text;
        joinedDate : Text;
    };

    // Represents an operator within the foundation
    type Operator = {
        id : Nat;
        groupName : Text;
        staff : Nat;
        balance : Float;
        totalRevenue : Float;
        licensedIn : [Text]; // Countries where the operator is licensed
        nonExclusiveAreas : [Text]; // Regions that are not exclusive
        exclusiveAreas : [Text]; // Exclusive regions
        since : Text; // e.g., "Jan 1, 2024"
    };

    // Represents fee details for various entities
    type FeeDetail = {
        feePercentage : Float;
        feePerTransaction : Float;
        icpFeePerTransaction : Float;
        treasuryEscrow : Bool;
    };

    // Represents a support or information item
    type SupportItem = {
        title : Text;
        content : Text;
        link : Text; // e.g., FAQs, Customer Support
    };

    // Variables
    var foundationMetrics : FoundationMetrics = {
        totalUsers = 0;
        usersGrowthRate = 0.0;
        totalEnterprises = 0;
        enterprisesGrowthRate = 0.0;
        totalTransactions = 0;
        transactionsGrowthRate = 0.0;
        totalRevenue = 0.0;
        revenueGrowthRate = 0.0;
        totalOperatorGroups = 0;
        operatorGroupsGrowthRate = 0.0;
        totalOperators = 0;
        operatorsGrowthRate = 0.0;
        totalBalance = 0.0;
        balanceGrowthRate = 0.0;
        feesCollected = 0.0;
        feesCollectedGrowthRate = 0.0;
        feesAllocated = 0.0;
        feesAllocatedGrowthRate = 0.0;
        pendingFees = 0.0;
    };

    // Updated Transaction Rule type to include detailed fee information
    type TransactionRule = {
        id : Nat;
        ruleName : Text;
        totalFees : Float;
        assetType : Text;
        operatorAcceptance : [Text];
        description : Text;
        sendingAreas : [Text];
        receivingAreas : [Text];
        withdrawalCrypto : Bool; // Added based on screenshot details
        receivingIndustry : [Text];
        amountRange : Text;
        foundationFees : FeeDetail;
        daoFees : FeeDetail;
        operatorSandboxFees : FeeDetail;
        operatorFFees : FeeDetail;
    };

    // Represents an announcement in the system
    type Announcement = {
        id : Nat;
        message : Text;
        newType : AnnouncementType; // Internal or Public
        status : AnnouncementStatus; // Draft, Published, or Unpublished
        recipients : [Text]; // List of recipient identifiers (e.g., email addresses or group names)
        publishedBy : Text; // Name or ID of the person who published it
        publishedDate : ?Int; // Optional date of publication
    };

    // Enumeration for announcement types
    type AnnouncementType = {
        #Internal;
        #Public;
    };

    // Enumeration for announcement status
    type AnnouncementStatus = {
        #Draft;
        #Published;
        #Unpublished;
    };

    // Represents a link in the management system
    type Link = {
        id : Nat;
        name : Text; // Name of the link (e.g., "Management system")
        url : Text; // URL of the link
        description : Text; // Optional description or purpose of the link
    };
    // Represents a link item in the management section

    // Represents a policy document in the management section
    type Policy = {
        id : Nat;
        documentName : Text;
        applicability : Text;
        link : Text;
        responsibleEntity : Text;
        workingDirectory : Text;
        focalPoint : Text; // Contact email or point of contact
    };

    public func addLink(newLink : Link) : async () {
        links := Array.append<Link>(links, [newLink]);
    };

    public func updateLink(id : Nat, updatedLink : Link) : async Bool {
        let indexOpt = Array.indexOf<Link>(
            updatedLink,
            links,
            func(l1 : Link, l2 : Link) : Bool { l1.id == l2.id },
        );

        switch (indexOpt) {
            case (?idx) {
                let mutableLinks : [var Link] = Array.thaw(links);
                mutableLinks[idx] := updatedLink;
                links := Array.freeze<Link>(mutableLinks);
                return true;
            };
            case null {
                return false; // Link not found
            };
        };
    };

    public func deleteLink(id : Nat) : async Bool {
        let initialLength = Array.size(links);
        links := Array.filter<Link>(links, func(link) { link.id != id });
        return initialLength != Array.size(links); // Returns true if a deletion occurred
    };

    public query func listLinks() : async [Link] {
        return links;
    };

    // Variables
    var links : [Link] = [];
    var affiliateGroups : [AffiliateGroup] = [];
    var detailedAffiliateGroups : [DetailedAffiliateGroup] = [];
    var operators : [Operator] = [];
    var transactionRules : [TransactionRule] = [];
    var supportItems : [SupportItem] = [];
    var announcements : [Announcement] = [];
    var policies : [Policy] = [];

    // Functions

    // Function to update an existing link

    // Function to add a new policy
    public func addPolicy(newPolicy : Policy) : async () {
        policies := Array.append<Policy>(policies, [newPolicy]);
    };

    // Function to update an existing policy
    public func updatePolicy(id : Nat, updatedPolicy : Policy) : async Bool {
        let indexOpt = Array.indexOf<Policy>(
            updatedPolicy,
            policies,
            func(p1 : Policy, p2 : Policy) : Bool {
                p1.id == p2.id;
            },
        );

        switch (indexOpt) {
            case (?idx) {
                let mutablePolicies : [var Policy] = Array.thaw(policies);
                mutablePolicies[idx] := updatedPolicy;
                policies := Array.freeze<Policy>(mutablePolicies);
                return true;
            };
            case null {
                return false; // Policy not found
            };
        };
    };

    // Function to list all policies
    public query func listPolicies() : async [Policy] {
        return policies;
    };

    // Function to delete a policy by ID
    public func deletePolicy(id : Nat) : async Bool {
        let initialLength = Array.size(policies);
        policies := Array.filter<Policy>(policies, func(policy) { policy.id != id });
        return initialLength != Array.size(policies); // Returns true if deletion occurred
    };

    // Function to find a policy by ID
    public query func findPolicyById(id : Nat) : async ?Policy {
        return Array.find<Policy>(policies, func(p) { p.id == id });
    };

    // Functions to manage foundation metrics
    public func updateFoundationMetrics(newMetrics : FoundationMetrics) : async () {
        foundationMetrics := newMetrics;
    };

    public query func getFoundationMetrics() : async FoundationMetrics {
        return foundationMetrics;
    };

    // Functions to manage affiliate groups
    public func addAffiliateGroup(newGroup : AffiliateGroup) : async () {
        affiliateGroups := Array.append<AffiliateGroup>(affiliateGroups, [newGroup]);
    };

    public func updateAffiliateGroup(groupId : Nat, updatedGroup : AffiliateGroup) : async Bool {
        let index = Array.indexOf<AffiliateGroup>(
            updatedGroup,
            affiliateGroups,
            func(group1 : AffiliateGroup, group2 : AffiliateGroup) : Bool {
                group1.groupId == group2.groupId;
            },
        );

        switch (index) {
            case (?idx) {
                let mutableGroups : [var AffiliateGroup] = Array.thaw(affiliateGroups);
                mutableGroups[idx] := updatedGroup;
                affiliateGroups := Array.freeze<AffiliateGroup>(mutableGroups);
                return true;
            };
            case null {
                return false; // Group not found
            };
        };
    };

    public query func listAffiliateGroups() : async [AffiliateGroup] {
        return affiliateGroups;
    };

    // Functions to manage detailed affiliate groups
    public func addDetailedAffiliateGroup(newGroup : DetailedAffiliateGroup) : async () {
        detailedAffiliateGroups := Array.append<DetailedAffiliateGroup>(detailedAffiliateGroups, [newGroup]);
    };

    public func updateDetailedAffiliateGroup(groupId : Nat, updatedGroup : DetailedAffiliateGroup) : async Bool {
        let index = Array.indexOf<DetailedAffiliateGroup>(
            updatedGroup,
            detailedAffiliateGroups,
            func(group1 : DetailedAffiliateGroup, group2 : DetailedAffiliateGroup) : Bool {
                group1.id == group2.id;
            },
        );

        switch (index) {
            case (?idx) {
                let mutableGroups : [var DetailedAffiliateGroup] = Array.thaw(detailedAffiliateGroups);
                mutableGroups[idx] := updatedGroup;
                detailedAffiliateGroups := Array.freeze<DetailedAffiliateGroup>(mutableGroups);
                return true;
            };
            case null {
                return false; // Group not found
            };
        };
    };

    public query func listDetailedAffiliateGroups() : async [DetailedAffiliateGroup] {
        return detailedAffiliateGroups;
    };

    public query func findDetailedAffiliateGroupById(id : Nat) : async ?DetailedAffiliateGroup {
        return Array.find<DetailedAffiliateGroup>(detailedAffiliateGroups, func(group) { group.id == id });
    };

    // Functions to manage operators
    public func addOperator(newOperator : Operator) : async () {
        operators := Array.append<Operator>(operators, [newOperator]);
    };

    public func updateOperator(id : Nat, updatedOperator : Operator) : async Bool {
        let index = Array.indexOf<Operator>(
            updatedOperator,
            operators,
            func(op1 : Operator, op2 : Operator) : Bool {
                op1.id == op2.id;
            },
        );

        switch (index) {
            case (?idx) {
                let mutableOperators : [var Operator] = Array.thaw(operators);
                mutableOperators[idx] := updatedOperator;
                operators := Array.freeze<Operator>(mutableOperators);
                return true;
            };
            case null {
                return false; // Operator not found
            };
        };
    };

    public query func listOperators() : async [Operator] {
        return operators;
    };

    public query func findOperatorById(id : Nat) : async ?Operator {
        return Array.find<Operator>(operators, func(op) { op.id == id });
    };

    // Functions to manage transaction rules
    public func addTransactionRule(newRule : TransactionRule) : async () {
        transactionRules := Array.append<TransactionRule>(transactionRules, [newRule]);
    };

    public func updateTransactionRule(id : Nat, updatedRule : TransactionRule) : async Bool {
        let index = Array.indexOf<TransactionRule>(
            updatedRule,
            transactionRules,
            func(rule1 : TransactionRule, rule2 : TransactionRule) : Bool {
                rule1.id == rule2.id;
            },
        );

        switch (index) {
            case (?idx) {
                let mutableRules : [var TransactionRule] = Array.thaw(transactionRules);
                mutableRules[idx] := updatedRule;
                transactionRules := Array.freeze<TransactionRule>(mutableRules);
                return true;
            };
            case null {
                return false; // Rule not found
            };
        };
    };

    public query func listTransactionRules() : async [TransactionRule] {
        return transactionRules;
    };

    public query func findTransactionRuleById(id : Nat) : async ?TransactionRule {
        return Array.find<TransactionRule>(transactionRules, func(rule) { rule.id == id });
    };

    // Functions to manage support items
    public func addSupportItem(newItem : SupportItem) : async () {
        supportItems := Array.append<SupportItem>(supportItems, [newItem]);
    };

    public query func listSupportItems() : async [SupportItem] {
        return supportItems;
    };

    // Additional Features:

    // Function to filter affiliate groups by type
    public query func filterAffiliateGroupsByType(groupType : Text) : async [AffiliateGroup] {
        return Array.filter<AffiliateGroup>(affiliateGroups, func(group) { group.function == groupType });
    };

    // Function to delete an affiliate group by ID
    public func deleteAffiliateGroup(groupId : Nat) : async Bool {
        let initialLength = Array.size(affiliateGroups);
        affiliateGroups := Array.filter<AffiliateGroup>(affiliateGroups, func(group) { group.groupId != groupId });
        return initialLength != Array.size(affiliateGroups); // Returns true if deletion occurred
    };

    // Function to update a support item
    public func updateSupportItem(title : Text, updatedItem : SupportItem) : async Bool {
        let index = Array.indexOf<SupportItem>(
            updatedItem,
            supportItems,
            func(item1 : SupportItem, item2 : SupportItem) : Bool {
                item1.title == item2.title;
            },
        );

        switch (index) {
            case (?idx) {
                let mutableItems : [var SupportItem] = Array.thaw(supportItems);
                mutableItems[idx] := updatedItem;
                supportItems := Array.freeze<SupportItem>(mutableItems);
                return true;
            };
            case null {
                return false; // Support item not found
            };
        };
    };

    // Function to retrieve a support item by title
    public query func findSupportItemByTitle(title : Text) : async ?SupportItem {
        return Array.find<SupportItem>(supportItems, func(item) { item.title == title });
    };

    // Function to add a new announcement (either as draft or directly publish)
    public func addAnnouncement(newAnnouncement : Announcement) : async () {
        announcements := Array.append<Announcement>(announcements, [newAnnouncement]);
    };

    // Function to publish an existing draft announcement
    // Function to publish an announcement

    public func publishAnnouncement(id : Nat) : async Bool {
        // Find the announcement by ID
        let announcementOpt = Array.find<Announcement>(announcements, func(a : Announcement) : Bool { a.id == id });

        // Check if the announcement was found
        switch (announcementOpt) {
            case (?announcement) {
                // Find the index of the announcement using Array.indexOf
                let indexOpt = Array.indexOf<Announcement>(
                    announcement,
                    announcements,
                    func(a1 : Announcement, a2 : Announcement) : Bool {
                        a1.id == a2.id;
                    },
                );

                switch (indexOpt) {
                    case (?idx) {
                        let mutableAnnouncements : [var Announcement] = Array.thaw(announcements);

                        // Update the announcement's status and timestamp
                        let updatedAnnouncement : Announcement = {
                            id = announcement.id;
                            message = announcement.message;
                            newType = announcement.newType;
                            publishedBy = announcement.publishedBy;
                            publishedDate = ?Time.now(); // Correctly update published date
                            recipients = announcement.recipients;
                            status = #Published; // Assuming AnnouncementStatus is an enum type
                        };

                        // Assign the updated announcement back to the mutable array
                        mutableAnnouncements[idx] := updatedAnnouncement;
                        announcements := Array.freeze<Announcement>(mutableAnnouncements);
                        return true;
                    };
                    case null {
                        return false; // Should not happen if the element was found
                    };
                };
            };
            case null {
                return false; // Announcement not found
            };
        };
    };

    // Function to save an announcement as a draft
    public func saveAnnouncementAsDraft(newDraft : Announcement) : async () {
        announcements := Array.append<Announcement>(announcements, [newDraft]);
    };

    // Function to edit an existing announcement
    public func editAnnouncement(id : Nat, updatedAnnouncement : Announcement) : async Bool {
        // Find the announcement by ID
        let announcementOpt = Array.find<Announcement>(announcements, func(a : Announcement) : Bool { a.id == id });

        // Check if the announcement was found
        switch (announcementOpt) {
            case (?announcement) {
                // Find the index of the announcement using Array.indexOf
                let indexOpt = Array.indexOf<Announcement>(
                    announcement,
                    announcements,
                    func(a1 : Announcement, a2 : Announcement) : Bool {
                        a1.id == a2.id;
                    },
                );

                switch (indexOpt) {
                    case (?idx) {
                        let mutableAnnouncements : [var Announcement] = Array.thaw(announcements);

                        // Update the announcement with the provided updated announcement
                        mutableAnnouncements[idx] := updatedAnnouncement;

                        // Freeze the array back
                        announcements := Array.freeze<Announcement>(mutableAnnouncements);
                        return true;
                    };
                    case null {
                        return false; // Should not happen if the element was found
                    };
                };
            };
            case null {
                return false; // Announcement not found
            };
        };
    };

    // Function to unpublish an announcement
    public func unpublishAnnouncement(id : Nat) : async Bool {
        // Find the announcement by ID
        let announcementOpt = Array.find<Announcement>(announcements, func(a : Announcement) : Bool { a.id == id });

        // Check if the announcement was found
        switch (announcementOpt) {
            case (?announcement) {
                // Find the index of the announcement using Array.indexOf
                let indexOpt = Array.indexOf<Announcement>(
                    announcement,
                    announcements,
                    func(a1 : Announcement, a2 : Announcement) : Bool {
                        a1.id == a2.id;
                    },
                );

                switch (indexOpt) {
                    case (?idx) {
                        let mutableAnnouncements : [var Announcement] = Array.thaw(announcements);

                        // Update the announcement's status to Unpublished and clear publishedDate
                        let updatedAnnouncement : Announcement = {
                            id = announcement.id;
                            message = announcement.message;
                            newType = announcement.newType;
                            publishedBy = announcement.publishedBy;
                            publishedDate = null; // Clear the published date
                            recipients = announcement.recipients;
                            status = #Unpublished; // Set status to Unpublished
                        };

                        // Assign the updated announcement back to the mutable array
                        mutableAnnouncements[idx] := updatedAnnouncement;
                        announcements := Array.freeze<Announcement>(mutableAnnouncements);
                        return true;
                    };
                    case null {
                        return false; // Should not happen if the element was found
                    };
                };
            };
            case null {
                return false; // Announcement not found
            };
        };
    };

    // Function to list all announcements
    public query func listAnnouncements() : async [Announcement] {
        return announcements;
    };

    // Function to find an announcement by ID
    public query func findAnnouncementById(id : Nat) : async ?Announcement {
        return Array.find<Announcement>(announcements, func(a) { a.id == id });
    };

};
