# shc-example

Smart-Health-Card data extraction example.

This example just use the `health_cards` gem, doesn't implement spec.

## Usage

First, you must extract shc text from QR code, and then run as follows:

```console
$ bundle exec ruby shc.rb qr.txt
---
:iss: https://vc.vrs.digital.go.jp/issuer
:nbf: 1640015882
:vc:
  :type:
  - https://smarthealth.cards#health-card
  :credentialSubject:
    :fhirVersion: 4.0.1
    :fhirBundle:
      type: collection
      entry:
      - fullUrl: resource:0
        resource:
          name:
          - use: usual
            family: XXX
            given:
            - YYY
          birthDate: 'YYYY-MM-DD'
          resourceType: Patient
      - fullUrl: resource:1
        resource:
          status: completed
          vaccineCode:
            coding:
            - system: http://hl7.org/fhir/sid/cvx
              code: '207'
          patient:
            reference: resource:0
          occurrenceDateTime: 'YYYY-MM-DD'
          lotNumber: '9999999'
          performer:
          - actor:
              display: MHLW_Gov_of_JAPAN
          resourceType: Immunization
      - fullUrl: resource:2
        resource:
          status: completed
          vaccineCode:
            coding:
            - system: http://hl7.org/fhir/sid/cvx
              code: '207'
          patient:
            reference: resource:0
          occurrenceDateTime: 'YYYY-MM-DD'
          lotNumber: '9999999'
          performer:
          - actor:
              display: MHLW_Gov_of_JAPAN
          resourceType: Immunization
      resourceType: Bundle
```

## References
- https://spec.smarthealth.cards/
- https://spec.smarthealth.cards/examples/
- https://github.com/dvci/health_cards/

## License
MIT
