# tor.bridge

 ### Environment variables

| Name                         | Description                                                                  | Default value |
| ---------------------------- |:----------------------------------------------------------------------------:| -------------:|
| **RELAY_TYPE**               | The type of relay (bridge, middle or exit)                                   | bridge        |
| **RELAY_NICKNAME**           | The nickname of your relay                                                   | REINHILD      |
| **CONTACT_GPG_FINGERPRINT**  | Your GPG ID or fingerprint                                                   | none          |
| **CONTACT_NAME**             | Your name                                                                    | none          |
| **CONTACT_EMAIL**            | Your contact email                                                           | none          |
| **RELAY_BANDWIDTH_RATE**     | Limit how much traffic will be allowed through your relay (must be > 20KB/s) | 50 MBytes     |
| **RELAY_BANDWIDTH_BURST**    | Allow temporary bursts up to a certain amount                                | 50 MBytes     |
| **RELAY_PORT**               | Default port used for incoming Tor connections (ORPort)                      | 0.0.0.0:8443  |
| **TRANSPORT_PORT**           | Default port used for transport                                              | 0.0.0.0:8444  |
