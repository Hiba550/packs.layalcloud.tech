# Batch update remaining long titles and descriptions
$updates = @{
    "refined-storage.html" = @{
        "title" = "Refined Storage - Advanced Digital Storage"
        "desc" = "Download Refined Storage - Advanced digital storage system with wireless access, autocrafting, and massive item capacity. Modern storage solution for large-scale projects."
    }
    "rei.html" = @{
        "title" = "Roughly Enough Items (REI) - Recipe Viewer"
        "desc" = "Download Roughly Enough Items (REI) - Clean recipe viewer for Fabric with search functionality, item filtering, and mod integration. Essential for modded gameplay."
    }
    "storage-drawers.html" = @{
        "title" = "Storage Drawers - Smart Bulk Storage Solution"
        "desc" = "Download Storage Drawers - Smart bulk storage solution with visual item displays, auto-sorting, and compacting upgrades. Perfect for organizing large quantities."
    }
    "thaumcraft.html" = @{
        "title" = "Thaumcraft - Magical Research & Thaumaturgy"
        "desc" = "Download Thaumcraft - Revolutionary magic mod with research system, wands, golems, and complex magical machinery. The pinnacle of magical gameplay in Minecraft."
    }
    "thermal-expansion.html" = @{
        "title" = "Thermal Expansion - Industrial Machinery & Energy"
        "desc" = "Download Thermal Expansion - Industrial machinery and energy systems with advanced automation, processing, and power generation. Essential technology mod."
    }
    "tinkers-construct.html" = @{
        "title" = "Tinkers' Construct - Revolutionary Tool Crafting"
        "desc" = "Download Tinkers' Construct - Revolutionary tool crafting system with customizable tools, smeltery, and modular weapon creation. Transform your crafting experience."
    }
    "xaeros-minimap.html" = @{
        "title" = "Xaero's Minimap - Fair-Play Minimap & Waypoints"
        "desc" = "Download Xaero's Minimap - Fair-play minimap with waypoints, cave mapping, and clean interface. The most popular minimap mod with 200M+ downloads."
    }
    "pams-harvestcraft.html" = @{
        "title" = "Pam's HarvestCraft - Ultimate Farming & Food"
        "desc" = "Download Pam's HarvestCraft - Ultimate farming and food expansion with 1600+ new foods, crops, trees, and cooking recipes. Transform your culinary experience."
    }
    "lithium.html" = @{
        "title" = "Lithium - Game Logic Optimization & Performance"
        "desc" = "Download Lithium - Game logic optimization mod that improves server performance by optimizing game mechanics without changing vanilla gameplay behavior."
    }
    "mantle.html" = @{
        "title" = "Mantle - Essential Library for Tinkers' Construct"
        "desc" = "Download Mantle - Essential core library required for Tinkers' Construct and related mods. Provides shared functionality and development frameworks for modding."
    }
}

foreach ($file in $updates.Keys) {
    $filepath = "d:\mc packs\packs\$file"
    if (Test-Path $filepath) {
        $content = Get-Content $filepath -Raw
        $fileInfo = $updates[$file]
        
        # Find and replace title tag content
        $content = $content -replace '(<title[^>]*>)[^<]+(<\/title>)', "`$1$($fileInfo.title)`$2"
        
        # Find and replace meta title content
        $content = $content -replace '(<meta name="title" content=")[^"]+(")', "`$1$($fileInfo.title)`$2"
        
        # Find and replace meta description content
        $content = $content -replace '(<meta name="description" content=")[^"]+(")', "`$1$($fileInfo.desc)`$2"
        
        Set-Content -Path $filepath -Value $content -NoNewline
        Write-Host "Updated: $file"
    }
}
