--Se você utilizar o pre hook para liberar a tabela você adiciona o commit no post hook
{{
    config(
        materialized='table',
        pre_hook=["begin; lock table {{target.schema}}.bi_report;
        "],
        post_hook=["commit;
            GRANT USAGE ON SCHEMA {{target.schema}} TO GROUP biusers;
            GRANT SELECT ON TABLE {{target.schema}}.bi_report TO GROUP biusers;
        "]        
    )
}}
select * from {{ref("joins")}}