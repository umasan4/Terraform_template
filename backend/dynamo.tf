#------------------------------
# DynamoDB
#------------------------------
resource "aws_dynamodb_table" "terraform_locks" {
  name = "terraform-locks"

  # 課金体制・オンデマンド
  billing_mode = "PAY_PER_REQUEST"

  # 主キー
  hash_key = "LockID"

  # カラムを作成・ロック用
  attribute {
    name = "LockID"
    type = "S"
  }

  # 削除保護
  lifecycle {
    prevent_destroy = true
  }
}