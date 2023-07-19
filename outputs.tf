output "vm_ids" {
  value = google_compute_instance.vms.*.id
}

output "vm_names" {
  value = google_compute_instance.vms.*.name
}
