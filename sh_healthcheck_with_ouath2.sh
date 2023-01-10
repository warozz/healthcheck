  http://10.102.44.33:8280/token \
  -H ': ' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'Postman-Token: 77b16d77-ebaf-4818-b3d1-761b38fe3d9b' \
  -H 'cache-control: no-cache' \
  -d 'grant_type=client_credentials&client_id=VuG1ieGZE7ljKvJpPuyhv5aJMAga&client_secret=C_s5631zerP8HUzfYN0DI5wFLhka'`
echo $token
token=`echo $token|cut -d ',' -f 1|cut -d ':' -f 2`
token=`echo $token|cut -b 2-37 `
echo $token
result=`curl -X POST \
  http://10.102.44.33:8280/permissionService/1.0 \
  -H 'Authorization: Bearer '$token'' \
  -H 'Content-Type: application/json' \
  -H 'Postman-Token: 2994cdc2-8118-4ecc-b0f4-8f8f0a431739' \
  -H 'cache-control: no-cache' \
  -d '{
 "agentid":"00774354",
 "paydate":"25621028"
}'`
echo $result
result=`echo $result|grep SUCCESS`
if [ $? -eq 0 ] ; then
    echo "$result"
    echo "Service is OK"
    exit 0
else
   echo "Service is Critical"
   exit 1
fi
