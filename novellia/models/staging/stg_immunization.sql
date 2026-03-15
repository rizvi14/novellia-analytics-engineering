select
    id                                                      as immunization_id,
    status,
    vaccineCode.text                                        as vaccine_name,
    vaccineCode.coding[1].code                              as vaccine_code,
    vaccineCode.coding[1].system                            as vaccine_code_system,
    split_part(patient.reference, '/', 2)::uuid             as patient_id,
    split_part(encounter.reference, '/', 2)::uuid           as encounter_id,
    occurrenceDateTime                                      as occurrence_date_time,
    primarySource                                           as primary_source,
    location.display                                        as location
from
    {{ source('fhir', 'immunization') }}