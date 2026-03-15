select
    id                                                      as diagnostic_report_id,
    status,
    code.text                                               as report_name,
    code.coding[1].code                                     as report_code,
    code.coding[1].system                                   as report_code_system,
    split_part(subject.reference, '/', 2)::uuid             as patient_id,
    split_part(encounter.reference, '/', 2)::uuid           as encounter_id,
    effectiveDateTime                                       as effective_date_time,
    issued,
    performer[1].display                                    as performer
from
    {{ source('fhir', 'diagnosticreport') }}
