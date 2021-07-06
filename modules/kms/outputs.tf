output  "kms_key_name" {
value =  aws_kms_alias.test_env.name
}

output  "kms_key_id" {
value =  aws_kms_key.test_env.key_id
}
