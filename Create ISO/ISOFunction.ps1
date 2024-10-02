function New-IsoFile {
    param (
        [string]$Path,
        [string]$Source
    )

    $iso = New-Object -ComObject "IMAPI2FS.ImageManager"
    $image = $iso.CreateImage()
    $fileSystemImage = $image.FileSystemImage

    $fileSystemImage.RootFolder.AddTree($Source, $null)
    $fileSystemImage.CreateResultImage().ImageFile = $Path
}
