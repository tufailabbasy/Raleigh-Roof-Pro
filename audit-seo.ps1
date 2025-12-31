$files = Get-ChildItem -Path "g:\My Drive\Vibe\Raleigh Roof Pro" -Recurse -Filter *.html | Where-Object { $_.FullName -notmatch "components" }

$results = @()

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    
    $title = "MISSING"
    if ($content -match '<title>(.*?)</title>') {
        $title = $matches[1]
    }
    
    $desc = "MISSING"
    if ($content -match '<meta name="description"\s+content="(.*?)">') {
        $desc = $matches[1]
    }
    elseif ($content -match '<meta\s+content="(.*?)"\s+name="description">') {
        $desc = $matches[1]
    }
    
    $results += [PSCustomObject]@{
        File        = $file.Name
        Title       = $title
        TitleLength = $title.Length
        Description = $desc
        DescLength  = $desc.Length
    }
}

$results | Format-Table -AutoSize -Wrap
