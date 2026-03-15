select
    id                                          as patient_id,
    gender,
    birthDate                                   as birth_date,
    name[1].family                              as last_name,
    name[1].given[1]                            as first_name,
    name[1].prefix[1]                           as prefix,
    address[1].line[1]                          as address_line,
    address[1].city                             as city,
    address[1].state                            as state,
    address[1].postalCode                       as postal_code,
    address[1].country                          as country,
    maritalStatus.text                          as marital_status,
    communication[1].language.text              as language,
    multipleBirthBoolean                        as multiple_birth,
    deceasedDateTime                            as deceased_date_time
from
    {{ source('fhir', 'patient') }}
