variables {
  base_name         = "test"
  sierra_account_id = "123"
  kms_key_arns      = [ "arn:aws:kms:us-west-2:123:key/abc" ]
  s3_bucket_arns    = [ "arn:aws:s3:::test-bucket" ]
}

provider "aws" {}

# Checks that sierra_account_id or main_role_arn is set, but not both.
run "check_main_role_arn_mutually_exclusive" {
  command = plan

  variables {
    sierra_account_id = "123"
    main_role_arn     = "arn:aws:iam::123:role/test-role"
  }

  expect_failures = [
    var.main_role_arn
  ]
}

# Checks that sierra_account_id or main_role_arn is set, both can't be null.
run "check_main_role_arn_one_required" {
  command = plan

  variables {
    sierra_account_id = null
    main_role_arn     = null
  }

  expect_failures = [
    var.main_role_arn
  ]
}
