function python {
    param(
        [parameter(ValueFromRemainingArguments = $true)][string]$Arguments
    )

    $Arguments = $Arguments -replace '\\', '/'
    docker run -it --rm -v ${PWD}:/app -w /app python python $Arguments
}

function poetry {
    param(
        [parameter(ValueFromRemainingArguments = $true)][string]$Arguments = ''
    )
    $Arguments = $Arguments -join ' '
    $Arguments = $Arguments -replace '\\', '/'
    Invoke-Expression "docker run -it --rm -v ${PWD}:/app -v ${env:APPDATA}/pypoetry:/root/.config/pypoetry -w /app poetry $Arguments"
}
