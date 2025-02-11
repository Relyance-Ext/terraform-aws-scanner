locals {
  main_role_arn = (
    var.main_role_arn != null
    ? var.main_role_arn
    : "arn:aws:iam::${var.sierra_account_id}:role/${var.base_name}"
  )
}

resource "aws_iam_role" "scanner" {
  name = "${var.base_name}_Scanner"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "AssumeRole"
        Principal = {
          AWS = local.main_role_arn
        }
        Condition = {
          StringEquals = {
            "sts:ExternalId" : var.scanner_external_id
          }
        }
      },
    ]
  })

  tags = local.default_tags
}

resource "aws_iam_role_policy" "scanner_policy" {
  name = "${var.base_name}_Scanner_Policy"
  role = aws_iam_role.scanner.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = var.s3_bucket_arns
      },
      {
        Effect = "Allow"
        Action = [
          "kms:Decrypt"
        ]
        Resource = var.kms_key_arns
      }
    ]
  })
}
