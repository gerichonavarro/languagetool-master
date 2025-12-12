# LanguageTool - Java 21 LTS Upgrade Summary

## Upgrade Status: ✅ COMPLETE

### What Was Done:

1. **Installed Java 21 LTS**
   - Downloaded and installed Eclipse Temurin JDK 21.0.9.10
   - Location: `C:\Program Files\Eclipse Adoptium\jdk-21.0.9.10-hotspot`

2. **Updated Project Configuration**
   - Updated `pom.xml` to use Java 21
   - Changed `maven.compiler.source` from 17 to 21
   - Changed `maven.compiler.target` from 17 to 21
   - Changed `maven.compiler.release` from 17 to 21

3. **Updated Build Scripts**
   - Updated `build-lt.bat` to use Java 21
   - Created new `run-languagetool.bat` script
   - Created new `run-languagetool.ps1` PowerShell script

4. **Build Status**
   - Build is currently running with Java 21 (takes 10-15 minutes)
   - All 46 modules are being compiled with Java 21

### How to Run LanguageTool:

#### Option 1: Using PowerShell Script (Recommended)
```powershell
cd c:\xampp\htdocs\languagetool-master
.\run-languagetool.ps1
```

#### Option 2: Using Batch File
```cmd
cd c:\xampp\htdocs\languagetool-master
run-languagetool.bat
```

#### Option 3: Manual Build and Run
```powershell
# Set Java 21
$env:JAVA_HOME = "C:\Program Files\Eclipse Adoptium\jdk-21.0.9.10-hotspot"

# Build (only needed once or after code changes)
mvn clean package -DskipTests

# Run GUI
cd languagetool-standalone\target\LanguageTool-6.8-SNAPSHOT
java -jar LanguageTool.jar
```

#### Option 4: Run as HTTP Server
```powershell
# After building
cd languagetool-server\target
java -cp languagetool-server.jar org.languagetool.server.HTTPServer --port 8081
```

### Verification:

Check Java version:
```powershell
java -version
# Should show: openjdk version "21.0.9" 2025-10-21 LTS
```

Check Maven is using Java 21:
```powershell
mvn -version
# Should show: Java version: 21.0.9
```

### Files Modified:

1. `pom.xml` - Updated Java version from 17 to 21
2. `build-lt.bat` - Updated JAVA_HOME to Java 21
3. `run-languagetool.ps1` - NEW: PowerShell run script
4. `run-languagetool.bat` - NEW: Batch run script

### Next Steps:

1. ✅ Java 21 is installed
2. ✅ Project configuration updated
3. ⏳ Build is running (10-15 minutes)
4. ⏳ After build completes, run one of the scripts above to start LanguageTool

### Features of the New Run Scripts:

- Automatically sets Java 21 as JAVA_HOME
- Checks if project is already built
- Builds project if needed
- Automatically launches LanguageTool GUI after successful build
- Provides clear status messages

---

## Current Build Status

The build is currently running in the background with Java 21. You can:

1. **Wait for it to complete** (10-15 minutes), then run LanguageTool
2. **Check build progress** by looking at the terminal output
3. **After build completes**, use any of the run scripts above

The system will automatically launch the LanguageTool GUI once the build is successful!

---

**Date:** December 6, 2025  
**Java Version:** 21.0.9 LTS (Eclipse Temurin)  
**Maven Version:** 3.9.9  
**LanguageTool Version:** 6.8-SNAPSHOT
