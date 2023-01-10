curl --connect-timeout 5 \
    --max-time 10 \
    --retry 5 \
    --retry-delay 0 \
    --retry-max-time 40 \
    'http://your_url'


--max-time 10     (how long each retry will wait)
--retry 5         (it will retry 5 times)
--retry-delay 0   (an exponential backoff algorithm)
--retry-max-time  (total time before it's considered failed)
