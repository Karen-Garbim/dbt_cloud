select *
from {{source("sources", 'shippers')}} sh 
left join {{ref("shippers_emails")}} se on (se.shippers_id = sh.shipper_id)