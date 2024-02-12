try {
    $searchValue = $dataSource.searchValue
    $endPoint = '/tas/api/branches'
    $searchAttribute = 'name'

    Write-Verbose "Creating authorization headers"
    # Create authorization headers with TOPdesk API key
    $pair = "${topdeskApiUsername}:${topdeskApiSecret}"
    $bytes = [System.Text.Encoding]::ASCII.GetBytes($pair)
    $base64 = [System.Convert]::ToBase64String($bytes)
    $key = "Basic $base64"
    $headers = @{
        "authorization" = $Key
        "Accept"        = "application/json"
    }
    
    if ([String]::IsNullOrEmpty($searchValue) -eq $true) {
        return
    }
    else {
        Write-Information "searchValue: $searchValue"

        $splatParams = @{
            Uri         = $topdeskBaseUrl + $endPoint + "?query=" + $searchAttribute + "==" + "'$searchValue'"
            Method      = 'GET'
            Verbose     = $false
            Headers     = $headers
            ContentType = "application/json; charset=utf-8"
        }
        write-warning "$($splatParams.Uri)"
        $results = Invoke-RestMethod @splatParams
        $resultCount = @($results).Count
        Write-Information "Result count: $resultCount"
         
        if ($resultCount -gt 0) {
            foreach ($result in $results) {
                $returnObject = @{
                    name = $result.name;
                    id   = $result.id;
                }
                
                Write-Output $returnObject
            }
        }
    }
}
catch {
    $msg = "Error searching Topdesk operator [$searchValue]. Error: $($_.Exception.Message)"
    Write-Error $msg
}