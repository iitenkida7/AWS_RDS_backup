# RDS SnapShot backup create Tool

## Installation

get this tools
```
git clone https://github.com/iiyuda7/AWS_RDS_backup
```

install awscli and jq 
```
pip install awscli --user
yum -y install jq
```
setup awlcli
```
mkdir -p ~/.aws

vi ~/.aws/config


#aws config sample
[profile hoge]
aws_access_key_id =  XXXXXXXXXXXXXXX
aws_secret_access_key = XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
region = ap-northeast-1 #tokyo


```
set cron
```
10 2 * * * /file/to/path/autoCreateDbSnapshot.sh       @aws_account_profile_name@
10 3 * * * /file/to/path/autoSnapshotCleaning.sh  @aws_account_profile_name@
```


