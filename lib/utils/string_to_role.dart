import '../models/roles.dart';

Role stringToRole(string) {
  Role role;
  if (string == "ADMIN") {
    role = Role.admin;
  } else if (string == "CARRIER_ADMIN") {
    role = Role.carrierAdmin;
  } else if (string == "GUARD") {
    role = Role.guard;
  } else if (string == "DRIVER") {
    role = Role.driver;
  } else if (string == "ORG_ADMIN") {
    role = Role.orgAdmin;
  } else {
    throw "Unkown role";
  }
  return role;
}

String beatuifyRole(Role? role) {
  switch (role) {
    case Role.admin:
      return "Administrator";
    case Role.carrierAdmin:
      return "Carrier Admin";
    case Role.driver:
      return "Driver";
    case Role.guard:
      return "Guard";
    case Role.orgAdmin:
      return "Org Admin";
    default:
      return "Unknown Role";
  }
}
