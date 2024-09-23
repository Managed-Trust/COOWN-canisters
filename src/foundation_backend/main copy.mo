// import Nat "mo:base/Nat";
// import Text "mo:base/Text";
// import Array "mo:base/Array";
// import Time "mo:base/Time";
// import Int "mo:base/Int";

// actor AdminSystem {
//   type SuperAdmin = {
//     id : Nat;
//     name : Text;
//     email : Text;
//     phone : Text;
//     since : Int;
//   };

//   type Policy = {
//     documentName : Text;
//     owner : Text;
//     applicability : Text;
//     draft : Text;
//     archive : Text;
//     original : Text;
//     operatorAcceptance : [Text];
//   };

//   type Country = {
//     name : Text;
//     isoCode : Text;
//     specialEconomicZone : Text;
//     transactionVolume : Nat;
//     acceptsCryptoWithoutKYC : Bool;
//     acceptsCryptoWithKYC : Bool;
//     acceptsForeignCasinos : Bool;
//     issuesCASPs : Bool;
//     bannedCrypto : Bool;
//   };

//   type SpecialEconomicZone = {
//     name : Text;
//     description : Text;
//     relatedCountry : Text;
//   };

//   type Sanction = {
//     id : Nat;
//     sanctionName : Text;
//     assetType : Text;
//     applicability : Text;
//     bCountry : Text;
//     bIndustry : Text;
//     amountRange : Text;
//     operatorAcceptance : [Text];
//   };

//   var superAdmins : [SuperAdmin] = [];
//   var policies : [Policy] = [];
//   var countries : [Country] = [];
//   var specialEconomicZones : [SpecialEconomicZone] = [];
//   var sanctions : [Sanction] = [];

//   public func addSuperAdmin(newAdmin : SuperAdmin) : () {
//     superAdmins := Array.append<SuperAdmin>(superAdmins, [newAdmin]);
//   };

//   public func listSuperAdmins() : async [SuperAdmin] {
//     return superAdmins;
//   };

//   public func addPolicy(newPolicy : Policy) : () {
//     policies := Array.append<Policy>(policies, [newPolicy]);
//   };

//   public func listPolicies() : async [Policy] {
//     return policies;
//   };

//   public query func findSuperAdminById(id : Nat) : async ?SuperAdmin {
//     return Array.find<SuperAdmin>(superAdmins, func(admin) { admin.id == id });
//   };

//   public query func findPolicyByName(name : Text) : async ?Policy {
//     return Array.find<Policy>(policies, func(policy) { policy.documentName == name });
//   };

//   public func addCountry(newCountry : Country) : () {
//     countries := Array.append<Country>(countries, [newCountry]);
//   };

//   public func listCountries() : async [Country] {
//     return countries;
//   };

//   public func addSpecialEconomicZone(newZone : SpecialEconomicZone) : () {
//     specialEconomicZones := Array.append<SpecialEconomicZone>(specialEconomicZones, [newZone]);
//   };

//   public func listSpecialEconomicZones() : async [SpecialEconomicZone] {
//     return specialEconomicZones;
//   };

//   public func addSanction(newSanction : Sanction) : () {
//     sanctions := Array.append<Sanction>(sanctions, [newSanction]);
//   };

//   public func listSanctions() : async [Sanction] {
//     return sanctions;
//   };

//   public query func findSanctionById(id : Nat) : async ?Sanction {
//     return Array.find<Sanction>(sanctions, func(sanc) { sanc.id == id });
//   };
// };


// actor AdminSystem {
//   type SuperAdmin = {
//     id : Nat;
//     name : Text;
//     email : Text;
//     phone : Text;
//     since : Int;
//   };

//   type Policy = {
//     documentName : Text;
//     owner : Text;
//     applicability : Text;
//     draft : Text;
//     archive : Text;
//     original : Text;
//     operatorAcceptance : [Text];
//   };

//   type Country = {
//     name : Text;
//     isoCode : Text;
//     specialEconomicZone : Text;
//     transactionVolume : Nat;
//     acceptsCryptoWithoutKYC : Bool;
//     acceptsCryptoWithKYC : Bool;
//     acceptsForeignCasinos : Bool;
//     issuesCASPs : Bool;
//     bannedCrypto : Bool;
//   };

//   type SpecialEconomicZone = {
//     name : Text;
//     description : Text;
//     relatedCountry : Text;
//   };

//   type Sanction = {
//     id : Nat;
//     sanctionName : Text;
//     assetType : Text;
//     applicability : Text;
//     bCountry : Text;
//     bIndustry : Text;
//     amountRange : Text;
//     operatorAcceptance : [Text];
//   };

//   type Operator = {
//     id : Nat;
//     groupName : Text;
//     owner : Text;
//     staff : Nat;
//     balance : Nat;
//     totalRevenue : Nat;
//     licensedIn : [Text];
//     nonExclusiveAreas : [Text];
//     exclusiveAreas : [Text];
//     since : Int;
//   };

//   type OperatorGroup = {
//     groupId : Nat;
//     description : Text;
//     ownerDetails : Text;
//   };

//   var superAdmins : [SuperAdmin] = [];
//   var policies : [Policy] = [];
//   var countries : [Country] = [];
//   var specialEconomicZones : [SpecialEconomicZone] = [];
//   var sanctions : [Sanction] = [];
//   var operators : [Operator] = [];
//   var operatorGroups : [OperatorGroup] = [];

//   public func addSuperAdmin(newAdmin : SuperAdmin) : () {
//     superAdmins := Array.append<SuperAdmin>(superAdmins, [newAdmin]);
//   };

//   public func listSuperAdmins() : async [SuperAdmin] {
//     return superAdmins;
//   };

//   public func addPolicy(newPolicy : Policy) : () {
//     policies := Array.append<Policy>(policies, [newPolicy]);
//   };

//   public func listPolicies() : async [Policy] {
//     return policies;
//   };

//   public query func findSuperAdminById(id : Nat) : async ?SuperAdmin {
//     return Array.find<SuperAdmin>(superAdmins, func(admin) { admin.id == id });
//   };

//   public query func findPolicyByName(name : Text) : async ?Policy {
//     return Array.find<Policy>(policies, func(policy) { policy.documentName == name });
//   };

//   public func addCountry(newCountry : Country) : () {
//     countries := Array.append<Country>(countries, [newCountry]);
//   };

//   public func listCountries() : async [Country] {
//     return countries;
//   };

//   public func addSpecialEconomicZone(newZone : SpecialEconomicZone) : () {
//     specialEconomicZones := Array.append<SpecialEconomicZone>(specialEconomicZones, [newZone]);
//   };

//   public func listSpecialEconomicZones() : async [SpecialEconomicZone] {
//     return specialEconomicZones;
//   };

//   public func addSanction(newSanction : Sanction) : () {
//     sanctions := Array.append<Sanction>(sanctions, [newSanction]);
//   };

//   public func listSanctions() : async [Sanction] {
//     return sanctions;
//   };

//   public func addOperator(newOperator : Operator) : () {
//     operators := Array.append<Operator>(operators, [newOperator]);
//   };

//   public func listOperators() : async [Operator] {
//     return operators;
//   };

//   public func addOperatorGroup(newGroup : OperatorGroup) : () {
//     operatorGroups := Array.append<OperatorGroup>(operatorGroups, [newGroup]);
//   };

//   public func listOperatorGroups() : async [OperatorGroup] {
//     return operatorGroups;
//   };

//   public query func findOperatorById(id : Nat) : async ?Operator {
//     return Array.find<Operator>(operators, func(op) { op.id == id });
//   };

//   public query func findOperatorGroupById(id : Nat) : async ?OperatorGroup {
//     return Array.find<OperatorGroup>(operatorGroups, func(group) { group.groupId == id });
//   };
// };

// import Nat "mo:base/Nat";
// import Text "mo:base/Text";
// import Array "mo:base/Array";
// import Int "mo:base/Int";

// actor AdminSystem {
//   type SuperAdmin = {
//     id : Nat;
//     name : Text;
//     email : Text;
//     phone : Text;
//     since : Int;
//   };

//   type Policy = {
//     documentName : Text;
//     owner : Text;
//     applicability : Text;
//     draft : Text;
//     archive : Text;
//     original : Text;
//     operatorAcceptance : [Text];
//   };

//   type Marketplace = {
//     description : Text;
//     manager : Text;
//     url : Text;
//     features : [Feature];
//   };

//   type Feature = {
//     name : Text;
//     priceMaker : Text;
//     reach : Text;
//     trustLevel : Text;
//     operatorAcceptance : Text;
//   };

//   type TransactionRule = {
//     id : Nat;
//     name : Text;
//     assetType : Text;
//     region : Text;
//     minAmount : Int;
//     feePercentage : Float;
//     feeCap : Int;
//   };

//   var superAdmins : [SuperAdmin] = [];
//   var policies : [Policy] = [];
//   var marketplaces : [Marketplace] = [];
//   var transactionRules : [TransactionRule] = [];

//   public func addSuperAdmin(newAdmin : SuperAdmin) : () {
//     superAdmins := Array.append<SuperAdmin>(superAdmins, [newAdmin]);
//   };

//   public func addPolicy(newPolicy : Policy) : () {
//     policies := Array.append<Policy>(policies, [newPolicy]);
//   };

//   public func addMarketplace(newMarketplace : Marketplace) : () {
//     marketplaces := Array.append<Marketplace>(marketplaces, [newMarketplace]);
//   };

//   public func addTransactionRule(newRule : TransactionRule) : () {
//     transactionRules := Array.append<TransactionRule>(transactionRules, [newRule]);
//   };

//   public func listSuperAdmins() : async [SuperAdmin] {
//     return superAdmins;
//   };

//   public func listPolicies() : async [Policy] {
//     return policies;
//   };

//   public func listMarketplaces() : async [Marketplace] {
//     return marketplaces;
//   };

//   public func listTransactionRules() : async [TransactionRule] {
//     return transactionRules;
//   };

//   public query func findSuperAdminById(id : Nat) : async ?SuperAdmin {
//     return Array.find<SuperAdmin>(superAdmins, func(admin) { admin.id == id });
//   };

//   public query func findPolicyByName(name : Text) : async ?Policy {
//     return Array.find<Policy>(policies, func(policy) { policy.documentName == name });
//   };

//   public query func findMarketplaceByDescription(description : Text) : async ?Marketplace {
//     return Array.find<Marketplace>(marketplaces, func(m) { m.description == description });
//   };

//   public query func findTransactionRuleById(id : Nat) : async ?TransactionRule {
//     return Array.find<TransactionRule>(transactionRules, func(rule) { rule.id == id });
//   };
// };
// import Nat "mo:base/Nat";
// import Text "mo:base/Text";
// import Array "mo:base/Array";
// import Int "mo:base/Int";

// actor AdminSystem {
//   type SuperAdmin = {
//     id : Nat;
//     name : Text;
//     email : Text;
//     phone : Text;
//     since : Int;
//   };

//   type Policy = {
//     documentName : Text;
//     owner : Text;
//     applicability : Text;
//     draft : Text;
//     archive : Text;
//     original : Text;
//     operatorAcceptance : [Text];
//   };

//   type Marketplace = {
//     description : Text;
//     manager : Text;
//     url : Text;
//     features : [Feature];
//   };

//   type Feature = {
//     name : Text;
//     priceMaker : Text;
//     reach : Text;
//     trustLevel : Text;
//     operatorAcceptance : Text;
//   };

//   type TransactionRule = {
//     id : Nat;
//     name : Text;
//     assetType : Text;
//     region : Text;
//     minAmount : Int;
//     feePercentage : Float;
//     feeCap : Int;
//   };

//   type CommitteeMember = {
//     id : Nat;
//     role : Text;
//     name : Text;
//     contact : Text;
//     amountOfCoins : Nat;
//     website1 : Text;
//     website2 : Text;
//     principalPlaceOfBusiness : Text;
//     since : Int;
//   };

//   type Committee = {
//     name : Text;
//     description : Text;
//     members : [CommitteeMember];
//   };

//   var superAdmins : [SuperAdmin] = [];
//   var policies : [Policy] = [];
//   var marketplaces : [Marketplace] = [];
//   var transactionRules : [TransactionRule] = [];
//   var committees : [Committee] = [];

//   public func addSuperAdmin(newAdmin : SuperAdmin) : () {
//     superAdmins := Array.append<SuperAdmin>(superAdmins, [newAdmin]);
//   };

//   public func addPolicy(newPolicy : Policy) : () {
//     policies := Array.append<Policy>(policies, [newPolicy]);
//   };

//   public func addMarketplace(newMarketplace : Marketplace) : () {
//     marketplaces := Array.append<Marketplace>(marketplaces, [newMarketplace]);
//   };

//   public func addTransactionRule(newRule : TransactionRule) : () {
//     transactionRules := Array.append<TransactionRule>(transactionRules, [newRule]);
//   };

//   public func addCommittee(newCommittee : Committee) : () {
//     committees := Array.append<Committee>(committees, [newCommittee]);
//   };

//   public func listSuperAdmins() : async [SuperAdmin] {
//     return superAdmins;
//   };

//   public func listPolicies() : async [Policy] {
//     return policies;
//   };

//   public func listMarketplaces() : async [Marketplace] {
//     return marketplaces;
//   };

//   public func listTransactionRules() : async [TransactionRule] {
//     return transactionRules;
//   };

//   public func listCommittees() : async [Committee] {
//     return committees;
//   };

//   public query func findSuperAdminById(id : Nat) : async ?SuperAdmin {
//     return Array.find<SuperAdmin>(superAdmins, func(admin) { admin.id == id });
//   };

//   public query func findPolicyByName(name : Text) : async ?Policy {
//     return Array.find<Policy>(policies, func(policy) { policy.documentName == name });
//   };

//   public query func findMarketplaceByDescription(description : Text) : async ?Marketplace {
//     return Array.find<Marketplace>(marketplaces, func(m) { m.description == description });
//   };

//   public query func findTransactionRuleById(id : Nat) : async ?TransactionRule {
//     return Array.find<TransactionRule>(transactionRules, func(rule) { rule.id == id });
//   };

//   public query func findCommitteeByName(name : Text) : async ?Committee {
//     return Array.find<Committee>(committees, func(committee) { committee.name == name });
//   };
// };

import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Array "mo:base/Array";
import Time "mo:base/Time";
import Int "mo:base/Int";

actor AdminSystem {
 
  type SuperAdmin = {
    id : Nat;
    name : Text;
    email : Text;
    phone : Text;
    since : Int;
  };
  type Policy = {
    documentName : Text;
    owner : Text;
    applicability : Text;
    draft : Text;
    archive : Text;
    original : Text;
    operatorAcceptance : [Text];
  };


  type SpecialEconomicZone = {
    name : Text;
    description : Text;
    relatedCountry : Text;
  };

  type Sanction = {
    id : Nat;
    sanctionName : Text;
    assetType : Text;
    applicability : Text;
    bCountry : Text;
    bIndustry : Text;
    amountRange : Text;
    operatorAcceptance : [Text];
  };

  type Marketplace = {
    description : Text;
    manager : Text;
    url : Text;
    features : [Feature];
  };

  type Feature = {
    name : Text;
    priceMaker : Text;
    reach : Text;
    trustLevel : Text;
    operatorAcceptance : Text;
  };

  type TransactionRule = {
    id : Nat;
    name : Text;
    assetType : Text;
    region : Text;
    minAmount : Int;
    feePercentage : Float;
    feeCap : Int;
  };

  type Committee = {
    name : Text;
    description : Text;
    members : [CommitteeMember];
  };

  type CommitteeMember = {
    id : Nat;
    role : Text;
    name : Text;
    contact : Text;
    amountOfCoins : Nat;
    website1 : Text;
    website2 : Text;
    principalPlaceOfBusiness : Text;
    since : Int;
  };

  type Country = {
    name : Text;
    isoCode : Text;
    specialEconomicZone : Text;
    transactionVolume : Nat;
    acceptsCryptoWithoutKYC : Bool;
    acceptsCryptoWithKYC : Bool;
    acceptsForeignCasinos : Bool;
    issuesCASPs : Bool;
    bannedCrypto : Bool;
  };

  type Operator = {
    id : Nat;
    groupName : Text;
    owner : Text;
    staff : Nat;
    balance : Nat;
    totalRevenue : Nat;
    licensedIn : [Text];
    nonExclusiveAreas : [Text];
    exclusiveAreas : [Text];
    since : Int;
  };

  type OperatorGroup = {
    groupId : Nat;
    description : Text;
    ownerDetails : Text;
  };

  var superAdmins : [SuperAdmin] = [];
  var policies : [Policy] = [];
  var countries : [Country] = [];
  var specialEconomicZones : [SpecialEconomicZone] = [];
  var sanctions : [Sanction] = [];
  var operators : [Operator] = [];
  var operatorGroups : [OperatorGroup] = [];
  var marketplaces : [Marketplace] = [];
  var transactionRules : [TransactionRule] = [];
  var committees : [Committee] = [];

  public func addSuperAdmin(newAdmin : SuperAdmin) : () {
    superAdmins := Array.append<SuperAdmin>(superAdmins, [newAdmin]);
  };

  public func listSuperAdmins() : async [SuperAdmin] {
    return superAdmins;
  };

  public func addPolicy(newPolicy : Policy) : () {
    policies := Array.append<Policy>(policies, [newPolicy]);
  };

  public func listPolicies() : async [Policy] {
    return policies;
  };

  public query func findSuperAdminById(id : Nat) : async ?SuperAdmin {
    return Array.find<SuperAdmin>(superAdmins, func(admin) { admin.id == id });
  };

  public query func findPolicyByName(name : Text) : async ?Policy {
    return Array.find<Policy>(policies, func(policy) { policy.documentName == name });
  };

  public func addCountry(newCountry : Country) : () {
    countries := Array.append<Country>(countries, [newCountry]);
  };

  public func listCountries() : async [Country] {
    return countries;
  };

  public func addSpecialEconomicZone(newZone : SpecialEconomicZone) : () {
    specialEconomicZones := Array.append<SpecialEconomicZone>(specialEconomicZones, [newZone]);
  };

  public func listSpecialEconomicZones() : async [SpecialEconomicZone] {
    return specialEconomicZones;
  };

  public func addSanction(newSanction : Sanction) : () {
    sanctions := Array.append<Sanction>(sanctions, [newSanction]);
  };

  public func listSanctions() : async [Sanction] {
    return sanctions;
  };

  public func addOperator(newOperator : Operator) : () {
    operators := Array.append<Operator>(operators, [newOperator]);
  };

  public func listOperators() : async [Operator] {
    return operators;
  };

  public func addOperatorGroup(newGroup : OperatorGroup) : () {
    operatorGroups := Array.append<OperatorGroup>(operatorGroups, [newGroup]);
  };

  public func listOperatorGroups() : async [OperatorGroup] {
    return operatorGroups;
  };

  public query func findOperatorById(id : Nat) : async ?Operator {
    return Array.find<Operator>(operators, func(op) { op.id == id });
  };

  public query func findOperatorGroupById(id : Nat) : async ?OperatorGroup {
    return Array.find<OperatorGroup>(operatorGroups, func(group) { group.groupId == id });
  };

  public query func findSanctionById(id : Nat) : async ?Sanction {
    return Array.find<Sanction>(sanctions, func(sanc) { sanc.id == id });
  };

  public func addMarketplace(newMarketplace : Marketplace) : () {
    marketplaces := Array.append<Marketplace>(marketplaces, [newMarketplace]);
  };

  public func addTransactionRule(newRule : TransactionRule) : () {
    transactionRules := Array.append<TransactionRule>(transactionRules, [newRule]);
  };

  public func addCommittee(newCommittee : Committee) : () {
    committees := Array.append<Committee>(committees, [newCommittee]);
  };

  public func listMarketplaces() : async [Marketplace] {
    return marketplaces;
  };

  public func listTransactionRules() : async [TransactionRule] {
    return transactionRules;
  };

  public func listCommittees() : async [Committee] {
    return committees;
  };

  public query func findMarketplaceByDescription(description : Text) : async ?Marketplace {
    return Array.find<Marketplace>(marketplaces, func(m) { m.description == description });
  };

  public query func findTransactionRuleById(id : Nat) : async ?TransactionRule {
    return Array.find<TransactionRule>(transactionRules, func(rule) { rule.id == id });
  };

  public query func findCommitteeByName(name : Text) : async ?Committee {
    return Array.find<Committee>(committees, func(committee) { committee.name == name });
  };

};


// import Nat "mo:base/Nat";
// import Text "mo:base/Text";
// import Array "mo:base/Array";
// import Int "mo:base/Int";

// actor AdminSystem {

//   // Type Definitions
//   type SuperAdmin = {
//     id : Nat;
//     name : Text;
//     email : Text;
//     phone : Text;
//     since : Int;
//   };

//   type Policy = {
//     documentName : Text;
//     owner : Text;
//     applicability : Text;
//     draft : Text;
//     archive : Text;
//     original : Text;
//     operatorAcceptance : [Text];
//   };

//   type Country = {
//     name : Text;
//     isoCode : Text;
//     specialEconomicZone : Text;
//     transactionVolume : Nat;
//     acceptsCryptoWithoutKYC : Bool;
//     acceptsCryptoWithKYC : Bool;
//     acceptsForeignCasinos : Bool;
//     issuesCASPs : Bool;
//     bannedCrypto : Bool;
//   };

//   type SpecialEconomicZone = {
//     name : Text;
//     description : Text;
//     relatedCountry : Text;
//   };

//   type Sanction = {
//     id : Nat;
//     sanctionName : Text;
//     assetType : Text;
//     applicability : Text;
//     bCountry : Text;
//     bIndustry : Text;
//     amountRange : Text;
//     operatorAcceptance : [Text];
//   };

//   type Operator = {
//     id : Nat;
//     groupName : Text;
//     owner : Text;
//     staff : Nat;
//     balance : Nat;
//     totalRevenue : Nat;
//     licensedIn : [Text];
//     nonExclusiveAreas : [Text];
//     exclusiveAreas : [Text];
//     since : Int;
//   };

//   type OperatorGroup = {
//     groupId : Nat;
//     description : Text;
//     ownerDetails : Text;
//   };

//   type Marketplace = {
//     description : Text;
//     manager : Text;
//     url : Text;
//     features : [Feature];
//   };

//   type Feature = {
//     name : Text;
//     priceMaker : Text;
//     reach : Text;
//     trustLevel : Text;
//     operatorAcceptance : [Text];
//   };

//   type TransactionRule = {
//     id : Nat;
//     name : Text;
//     assetType : Text;
//     region : Text;
//     minAmount : Int;
//     feePercentage : Float;
//     feeCap : Int;
//   };

//   type Committee = {
//     name : Text;
//     description : Text;
//     members : [CommitteeMember];
//   };

//   type CommitteeMember = {
//     id : Nat;
//     role : Text;
//     name : Text;
//     contact : Text;
//     amountOfCoins : Nat;
//     website1 : Text;
//     website2 : Text;
//     principalPlaceOfBusiness : Text;
//     since : Int;
//   };

//   type Partner = {
//     id : Nat;
//     name : Text;
//     description : Text;
//     interfaces : [Interface];
//     certifyingBodies : [CertifyingBody];
//   };

//   type Interface = {
//     groupName : Text;
//     owner : Text;
//     staff : Nat;
//     balance : Nat;
//     totalRevenue : Nat;
//     licensedIn : [Text];
//     exclusiveAreas : [Text];
//     since : Int;
//   };

//   type CertifyingBody = {
//     id : Nat;
//     groupName : Text;
//     owner : Text;
//     staff : Nat;
//     balance : Nat;
//     totalRevenue : Nat;
//     licensedIn : [Text];
//     exclusiveAreas : [Text];
//     since : Int;
//   };

//   // Data Storage
//   var superAdmins : [SuperAdmin] = [];
//   var policies : [Policy] = [];
//   var countries : [Country] = [];
//   var specialEconomicZones : [SpecialEconomicZone] = [];
//   var sanctions : [Sanction] = [];
//   var operators : [Operator] = [];
//   var operatorGroups : [OperatorGroup] = [];
//   var marketplaces : [Marketplace] = [];
//   var transactionRules : [TransactionRule] = [];
//   var committees : [Committee] = [];
//   var partners : [Partner] = [];

//   // SuperAdmin Functions
//   public func addSuperAdmin(newAdmin : SuperAdmin) : async () {
//     superAdmins := Array.append<SuperAdmin>(superAdmins, [newAdmin]);
//   };

//   public func updateSuperAdmin(id : Nat, updatedAdmin : SuperAdmin) : async Bool {
//     // Find the index of the super admin with the given id
//     let index = Array.indexOf<SuperAdmin>(
//       updatedAdmin,
//       superAdmins,
//       func(admin1 : SuperAdmin, admin2 : SuperAdmin) : Bool {
//         admin1.id == admin2.id;
//       },
//     );

//     switch (index) {
//       case (?idx) {
//         // Remove the existing element at the found index
//         superAdmins := Array.append<SuperAdmin>(
//           Array.subArray<SuperAdmin>(superAdmins, 0, idx),
//           Array.subArray<SuperAdmin>(superAdmins, idx + 1, Array.size(superAdmins)),
//         );

//         // Insert the updated element back at the same position
//         superAdmins := Array.append<SuperAdmin>(
//           Array.subArray<SuperAdmin>(superAdmins, 0, idx),
//           [updatedAdmin],
//         );

//         superAdmins := Array.append<SuperAdmin>(
//           superAdmins,
//           Array.subArray<SuperAdmin>(superAdmins, idx, Array.size(superAdmins)),
//         );

//         return true;
//       };
//       case null {
//         return false; // SuperAdmin not found
//       };
//     };
//   };

//   public func listSuperAdmins() : async [SuperAdmin] {
//     return superAdmins;
//   };

//   // Policy Functions
//   public func addPolicy(newPolicy : Policy) : async () {
//     policies := Array.append<Policy>(policies, [newPolicy]);
//   };

//   public func listPolicies() : async [Policy] {
//     return policies;
//   };

//   public query func findPolicyByName(name : Text) : async ?Policy {
//     return Array.find<Policy>(policies, func(policy) { policy.documentName == name });
//   };

//   // Country Functions
//   public func addCountry(newCountry : Country) : async () {
//     countries := Array.append<Country>(countries, [newCountry]);
//   };

//   public func listCountries() : async [Country] {
//     return countries;
//   };

//   // SpecialEconomicZone Functions
//   public func addSpecialEconomicZone(newZone : SpecialEconomicZone) : async () {
//     specialEconomicZones := Array.append<SpecialEconomicZone>(specialEconomicZones, [newZone]);
//   };

//   public func listSpecialEconomicZones() : async [SpecialEconomicZone] {
//     return specialEconomicZones;
//   };

//   // Sanction Functions
//   public func addSanction(newSanction : Sanction) : async () {
//     sanctions := Array.append<Sanction>(sanctions, [newSanction]);
//   };

//   public func listSanctions() : async [Sanction] {
//     return sanctions;
//   };

//   public query func findSanctionById(id : Nat) : async ?Sanction {
//     return Array.find<Sanction>(sanctions, func(sanc) { sanc.id == id });
//   };

//   // Operator Functions
//   public func addOperator(newOperator : Operator) : async () {
//     operators := Array.append<Operator>(operators, [newOperator]);
//   };

//   public func listOperators() : async [Operator] {
//     return operators;
//   };

//   // OperatorGroup Functions
//   public func addOperatorGroup(newGroup : OperatorGroup) : async () {
//     operatorGroups := Array.append<OperatorGroup>(operatorGroups, [newGroup]);
//   };

//   public func listOperatorGroups() : async [OperatorGroup] {
//     return operatorGroups;
//   };

//   // Marketplace Functions
//   public func addMarketplace(newMarketplace : Marketplace) : async () {
//     marketplaces := Array.append<Marketplace>(marketplaces, [newMarketplace]);
//   };

//   public func listMarketplaces() : async [Marketplace] {
//     return marketplaces;
//   };

//   // TransactionRule Functions
//   public func addTransactionRule(newRule : TransactionRule) : async () {
//     transactionRules := Array.append<TransactionRule>(transactionRules, [newRule]);
//   };

//   public func listTransactionRules() : async [TransactionRule] {
//     return transactionRules;
//   };

//   // Committee Functions
//   public func addCommittee(newCommittee : Committee) : async () {
//     committees := Array.append<Committee>(committees, [newCommittee]);
//   };

//   public func listCommittees() : async [Committee] {
//     return committees;
//   };

//   // Partner Functions
//   public func addPartner(newPartner : Partner) : async () {
//     partners := Array.append<Partner>(partners, [newPartner]);
//   };

//   public func listPartners() : async [Partner] {
//     return partners;
//   };

//   public query func findPartnerById(id : Nat) : async ?Partner {
//     return Array.find<Partner>(partners, func(partner) { partner.id == id });
//   };

// };
