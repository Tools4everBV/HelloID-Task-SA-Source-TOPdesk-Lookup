# HelloID-Task-SA-Source-TOPdesk-Lookup

## Prerequisites

- [ ] User-defined variable `topdeskApiSecret` created in your HelloID portal. Containing the Topdesk Api Secret.
- [ ] User-defined variable `topdeskApiUsername` created in your HelloID portal. Containing the Topdesk Api Username.
- [ ] User-defined variable `topdeskBaseUrl` created in your HelloID portal. Containing the Topdesk URL, for example: `https://<yourcompany>.topdesk.net`

## Description

This code snippet executes the following tasks:

1. Define a search value `$searchValue` based on the search parameter `$datasource.searchValue`
2. Define `$endPoint` based on the lookup field, for example `/tas/api/branches`
3. Define `$searchAttribute` based on the attribute that is used to search, for example `name`
4. Creating authorization headers
5. `GET` defined lookup field `$endPoint` where `$searchAttribute` equals `$searchValue`

> For more information about Topdesk `endPoints` and `searchAttributes`
> https://developers.topdesk.com/explorer/?page=supporting-files#/Branches/retrieveBranches

6. Return a hash table for each Topdesk lookupvalue using the `Write-Output` cmdlet.