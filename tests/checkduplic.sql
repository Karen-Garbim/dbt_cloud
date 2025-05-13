-- Esta fazendo o teste na source onde possui dados duplicados, sendo assim vai
-- falhar

/*select count(*) count, company_name, contact_name from
{{source("sources", "customers")}}
group by company_name, contact_name
having count > 1*/


-- Está fazendo o teste no modelo já retirando o duplicados então não é pra falhar
select count(*) count, company_name, contact_name from
{{ref("customers")}}
group by company_name, contact_name
having count > 1