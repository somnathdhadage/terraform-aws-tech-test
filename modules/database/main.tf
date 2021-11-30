# ---- database/main.tf -----

resource "aws_lambda_function" "ec2statuslog_lambda" {
   function_name = "ec2statuslog"
   filename      = "../../modules/database/lambda_db_ec2_insert.zip"
   role          = "arn:aws:iam::680558138144:role/service-role/ec2report-to-lambda"
   handler       = "ec2statuslog-function.lambda_handler"
   timeout       = "20"
   runtime       = "python3.7"
}


resource "aws_cloudwatch_event_rule" "ec2statuslog-schedule" {
   name                = "ec2statuslog-schedule"
   description         = "Runs the ec2statuslog lambda function every hour"
   schedule_expression = "cron(30 * * * ? *)"

}


resource "aws_cloudwatch_event_target" "ec2statuslog-target" {
   rule = aws_cloudwatch_event_rule.ec2statuslog-schedule.name
   arn  = aws_lambda_function.ec2statuslog_lambda.arn
}


resource "aws_lambda_permission" "ec2statuslog-caller" {
   statement_id  = "AllowExecutionFromCloudWatch"
   action        = "lambda:InvokeFunction"
   function_name = aws_lambda_function.ec2statuslog_lambda.function_name
   principal     = "events.amazonaws.com"
   source_arn    = aws_cloudwatch_event_rule.ec2statuslog-schedule.arn
}
