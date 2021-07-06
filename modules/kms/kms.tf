resource "aws_kms_key" "test_env" {
  #description             = "KMS key for test environment"
  key_usage               = "ENCRYPT_DECRYPT"          #Specifies use of the key
  deletion_window_in_days = var.kms_deletion_window_in_days                       #days after key is deleted
  enable_key_rotation     = var.kms_enable_key_rotation       #roatation of key after 1 year
  tags   =  {
                name =  var.kms_tag_name
              
}

}


resource "aws_kms_alias" "test_env" {
  name          = "alias/${ var.kms_name }"
  target_key_id = aws_kms_key.test_env.key_id
}

