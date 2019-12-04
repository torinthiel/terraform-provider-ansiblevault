provider ansiblevault {
  version     = "~> 2.0"
  alias       = "password_file"
  vault_path  = "../ansible/vault_pass_test.txt"
  root_folder = "../ansible"
}

data "ansiblevault_string" "raw_string" {
  provider  = ansiblevault.password_file
  encrypted = <<EOF
$ANSIBLE_VAULT;1.1;AES256
66306134666665663135666633346565363436333837376232613938393164353936333863653961
6563396637656665303736336463663332376463616431350a343336306234666665663038393430
66313666666366616565366536366563666135623730303462363430313532356333313734316363
6538313234313665350a313236333731656165303634616635663234636634363264383463386339
34346433386537313665666233626238613763643132346533376634356435323562
EOF
}

output "raw_string" {
  value = data.ansiblevault_string.raw_string.value
}
