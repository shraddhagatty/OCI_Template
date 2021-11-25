#############################################################################
# Module Output Values:
#############################################################################

output "vcn_id" {
  value = oci_core_vcn.vcn.id
}

output "vcn_name" {
  value = oci_core_vcn.vcn.display_name
}

output "vcn_route_table_id" {
  value = oci_core_vcn.vcn.default_route_table_id
}

output "vcn_security_list_id" {
  value = oci_core_vcn.vcn.default_security_list_id
}

output "igw_id" {
  value = oci_core_internet_gateway.internet_gateway.*.id
}

output "ngw_id" {
  value = oci_core_nat_gateway.nat_gateway.*.id
}

output "drg_id" {
  value = oci_core_drg.drg.*.id
}

output "sgw_id" {
  value = oci_core_service_gateway.service_gateway.*.id
}

output "lpg_id" {
  value = oci_core_local_peering_gateway.local_peering_gateway.*.id
}

#############################################################################
