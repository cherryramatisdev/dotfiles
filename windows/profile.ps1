$env:CDPATH = "d:/git"

Set-Alias -Name c -Value Clear-Host

function Get-GitStatus { & git status $args }
Set-Alias -Force -Name gs -Value Get-GitStatus
function Set-GitCommit { & git commit -am $args }
Set-Alias -Force -Name gc -Value Set-GitCommit
function  Set-GitPush { & git push origin $(git rev-parse --abbrev-ref HEAD) $args }
Set-Alias -Force -Name gp -Value Set-GitPush
function  Set-GitPull { & git pull origin $(git rev-parse --abbrev-ref HEAD) $args }
Set-Alias -Force -Name gf -Value Set-GitPull
function  Set-GitCheckout { & git checkout $args }
Set-Alias -Force -Name gch -Value Set-GitCheckout
function  Get-GitDiff { & git diff }
Set-Alias -Force -Name gd -Value Get-GitDiff

function cd2 {
    param($path)
    if(-not $path){return;}

    if((test-path $path) -or (-not $env:CDPATH)){
        Set-Location $path
        return
    }
    $cdpath = $env:CDPATH.split(";") | % { $ExecutionContext.InvokeCommand.ExpandString($_) }
    $npath = ""
    foreach($p in $cdpath){
        $tpath = join-path $p $path
        if(test-path $tpath){$npath = $tpath; break;}
    }
    if($npath){
        #write-host -fore yellow "Using CDPATH"
        Set-Location $npath
        return
    }

    set-location $path
}

set-alias -Name cd -value cd2 -Option AllScope
