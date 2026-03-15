select
    id                                                      as observation_id,
    status,
    category[1].coding[1].code                             as category,
    code.text                                               as observation_name,
    code.coding[1].code                                     as observation_code,
    code.coding[1].system                                   as observation_code_system,
    split_part(subject.reference, '/', 2)::uuid             as patient_id,
    split_part(encounter.reference, '/', 2)::uuid           as encounter_id,
    effectiveDateTime                                       as effective_date_time,
    issued,
    valueQuantity."value"                                   as value_quantity,
    valueQuantity.unit                                      as value_unit,
    valueCodeableConcept.text                               as value_codeable_concept,
    valueString                                             as value_string
from
    {{ source('fhir', 'observation') }}