# PowerShell script to batch update meta tags
$files = @{
    "fabric-api.html" = @{
        "oldTitle" = "Fabric API - Essential Library for Fabric Mods | MinecraftMods"
        "newTitle" = "Fabric API - Essential Library for Fabric Mods"
        "oldDesc" = "Download Fabric API - Essential core library required for all Fabric mods. Provides APIs, hooks, and compatibility layers for Minecraft modding. Required dependency for Fabric mod development."
        "newDesc" = "Download Fabric API - Essential core library required for all Fabric mods. Provides APIs, hooks, and compatibility layers for Minecraft modding development."
    }
    "farmers-delight.html" = @{
        "oldTitle" = "Farmer's Delight - Enhanced Cooking and Farming | MinecraftMods"
        "newTitle" = "Farmer's Delight - Enhanced Cooking & Farming"
        "oldDesc" = "Download Farmer's Delight - Revolutionary farming and cooking mod with over 120 new foods, advanced farming mechanics, cooking pots, and kitchen tools."
        "newDesc" = "Download Farmer's Delight - Revolutionary farming and cooking mod with over 120 new foods, advanced farming mechanics, cooking pots, and kitchen tools for enhanced gameplay."
    }
    "forestry.html" = @{
        "oldTitle" = "Forestry - Advanced Farming & Automation Legacy | MinecraftMods"
        "newTitle" = "Forestry - Advanced Farming & Automation Legacy"
        "oldDesc" = "Download Forestry - Classic advanced farming, bee keeping, and automation mod. Features tree breeding, bee genetics, advanced farms, and renewable energy systems for sustainable gameplay."
        "newDesc" = "Download Forestry - Classic advanced farming, bee keeping, and automation mod. Features tree breeding, bee genetics, advanced farms, and renewable energy systems."
    }
    "immersive-engineering.html" = @{
        "oldTitle" = "Immersive Engineering - Realistic Industrial Technology | Minecraft Engineering Mod"
        "newTitle" = "Immersive Engineering - Realistic Industrial Tech"
        "oldDesc" = "Download Immersive Engineering - Revolutionary multiblock-based technology mod featuring realistic industrial machinery, power systems, and engineering solutions for advanced automation and manufacturing."
        "newDesc" = "Download Immersive Engineering - Revolutionary multiblock-based technology mod featuring realistic industrial machinery, power systems, and engineering solutions."
    }
    "iris.html" = @{
        "oldTitle" = "Iris Shaders - Modern OptiFine Alternative for Fabric | MinecraftMods"
        "newTitle" = "Iris Shaders - Modern OptiFine Alternative"
        "oldDesc" = "Download Iris Shaders - Modern shader mod for Fabric with OptiFine compatibility, enhanced graphics, and better performance than traditional shader solutions."
        "newDesc" = "Download Iris Shaders - Modern shader mod for Fabric with OptiFine compatibility, enhanced graphics, and better performance than traditional shader solutions."
    }
    "iron-chests.html" = @{
        "oldTitle" = "Iron Chests - Upgraded Storage with Bigger Chests | MinecraftMods"
        "newTitle" = "Iron Chests - Upgraded Storage with Bigger Chests"
        "oldDesc" = "Download Iron Chests - Essential storage expansion mod featuring upgraded chests from Iron to Crystal with increased capacity, better organization, and improved inventory management for large-scale projects."
        "newDesc" = "Download Iron Chests - Essential storage expansion mod featuring upgraded chests from Iron to Crystal with increased capacity and improved inventory management."
    }
}

foreach ($file in $files.Keys) {
    $filepath = "d:\mc packs\packs\$file"
    if (Test-Path $filepath) {
        $content = Get-Content $filepath -Raw
        $fileInfo = $files[$file]
        
        # Update title
        $content = $content -replace [regex]::Escape($fileInfo.oldTitle), $fileInfo.newTitle
        
        # Update description if specified
        if ($fileInfo.oldDesc -and $fileInfo.newDesc) {
            $content = $content -replace [regex]::Escape($fileInfo.oldDesc), $fileInfo.newDesc
        }
        
        Set-Content -Path $filepath -Value $content -NoNewline
        Write-Host "Updated: $file"
    }
}
