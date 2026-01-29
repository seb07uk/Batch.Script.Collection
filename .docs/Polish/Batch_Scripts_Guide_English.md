# 🎯 Batch Scripts Guide - English Edition

**Complete Guide to Selected Scripts in the Collection**

**Language:** English  
**Date:** January 28, 2026  
**Audience:** International Users  
**Level:** Beginner to Advanced  

---

## Table of Contents

1. [ASCII Art Scripts](#ascii-art-scripts)
2. [Games](#games)
3. [Calculators](#calculators)
4. [File Management](#file-management)
5. [System Utilities](#system-utilities)
6. [Installation Tools](#installation-tools)

---

## ASCII Art Scripts

### 1. Matrix.cmd
**Category:** Visual Effects / Entertainment  
**Complexity:** ⭐ Easy  
**Purpose:** Display animated Matrix-style falling characters  

#### Description
This script creates a visually appealing Matrix rain effect by continuously displaying random numbers in green color on a black background. It's a classic demonstration of batch file capabilities for creating visual effects.

#### How It Works
```batch
@echo off
color 2                    :: Sets color to green on black
:start
echo %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random%
goto start                :: Infinite loop
```

#### Key Features
- ✅ Real-time animation effect
- ✅ Uses %random% variable for unpredictable output
- ✅ Infinite loop until user interrupts (Ctrl+C)
- ✅ Demonstrates color capabilities

#### Usage
```batch
Matrix.cmd
:: Press Ctrl+C to exit
```

#### Notes
- 💡 Color code 2 = Green on Black
- 💡 Each line refreshes with new random numbers
- 💡 Great for impressing with batch file capabilities
- ⚠️ Use carefully in production as it creates infinite loop

---

### 2. Parrot.bat
**Category:** Visual Effects / Entertainment  
**Complexity:** ⭐ Easy  
**Purpose:** Display animated parrot character

#### Description
Creates an animated parrot using ASCII art characters. The parrot appears to move across the screen with various poses, creating a simple but entertaining animation.

#### Key Features
- ✅ ASCII art animation
- ✅ Multiple frame animation
- ✅ Color support
- ✅ Demonstrates CLS (clear screen) command

#### Usage
```batch
Parrot.bat
```

#### Notes
- 💡 Educational for understanding animation loops
- 💡 Shows how to use CLS for screen refresh
- 💡 Good starting point for more complex animations

---

### 3. Windows Logo.bat
**Category:** Visual Effects  
**Complexity:** ⭐ Easy  
**Purpose:** Display Windows logo animation

#### Description
Displays the Windows logo using ASCII characters with color effects. Demonstrates batch file capabilities for creating branded content.

#### Key Features
- ✅ Windows branding
- ✅ Color effects
- ✅ ASCII art rendering
- ✅ Educational value

---

## Games

### 1. TIC TAC TOE [en-pl].cmd
**Category:** Game / Interactive  
**Complexity:** ⭐⭐⭐ Advanced  
**Purpose:** Interactive Tic Tac Toe game with language support  
**Author:** Sebastian Januchowski (polsoft.ITS)  
**Contact:** polsoft.its@fastservice.com  
**GitHub:** https://github.com/seb07uk  

#### Description
A fully functional Tic Tac Toe game with support for both English and Polish languages. Players can choose their language preference at startup and play against the computer with intelligent move selection.

#### Key Features
- ✅ Bilingual support (English/Polish)
- ✅ ANSI color codes for better appearance
- ✅ Player vs Computer gameplay
- ✅ Intelligent AI opponent
- ✅ Game board visualization
- ✅ Move validation
- ✅ Win detection
- ✅ Professional UI with colored text

#### How to Play
```batch
TIC TAC TOE [en-pl].cmd

1. Select language (English or Polish)
2. Choose your player (X or O)
3. Enter position number (1-9) for your moves
4. Win by getting 3 in a row
5. Play until win or draw
```

#### Board Positions
```
1 | 2 | 3
---------
4 | 5 | 6
---------
7 | 8 | 9
```

#### Technical Highlights
- Uses ANSI escape codes for colored output
- Implements game state management
- Array-based board representation
- Conditional logic for AI moves
- Supports delayed expansion for variable updates

#### Notes
- 💡 Excellent example of interactive batch game
- 💡 Shows bilingual text support implementation
- 💡 Demonstrates advanced UI in command prompt
- ⚠️ Requires Windows 10+ for ANSI color support

---

### 2. Snake the Batch Game.cmd
**Category:** Game / Interactive  
**Complexity:** ⭐⭐⭐⭐ Expert  
**Purpose:** Classic Snake game implementation  
**Author:** Sebastian Januchowski (polsoft.ITS)  
**Contact:** polsoft.its@fastservice.com  
**GitHub:** https://github.com/seb07uk  

#### Description
A sophisticated implementation of the classic Snake game directly in batch script. Features multiple visual skins, scoring system, and high-score tracking. This is one of the most advanced batch game implementations available.

#### Key Features
- ✅ Real-time gameplay
- ✅ Multiple visual skins (3 theme options)
- ✅ Score tracking system
- ✅ High-score persistence
- ✅ Keyboard controls (W/A/S/D or Arrow keys)
- ✅ Progressive difficulty
- ✅ Collision detection
- ✅ Food spawning mechanism
- ✅ Professional graphics with ANSI colors
- ✅ Sound effects (optional)

#### How to Play
```batch
Snake the Batch Game.cmd

Controls:
- W / Up Arrow    = Move Up
- A / Left Arrow  = Move Left
- S / Down Arrow  = Move Down
- D / Right Arrow = Move Right
- Q / Esc         = Quit Game
```

#### Game Mechanics
1. Snake starts at center of map
2. Food appears at random locations
3. Eat food to grow and increase score
4. Avoid hitting walls and yourself
5. Game ends on collision
6. High scores are saved

#### Technical Highlights
- Uses MODE command to set console size
- Implements multi-dimensional arrays (batch simulation)
- Complex timing mechanisms
- Advanced ANSI color sequences for 24-bit true colors
- State management and game loop
- File I/O for high-score persistence
- Bitmap-like display rendering

#### Skins Available
1. **Skin 1:** Purple and Magenta (▒ ▓)
2. **Skin 2:** Orange and Gold (♣ ♥)
3. **Skin 3:** Red tones (◙ ◘)

#### Notes
- 💡 One of the most complex batch scripts
- 💡 Excellent study material for advanced batch techniques
- 💡 Demonstrates state management in batch
- 💡 Shows how to create persistent high scores
- ⚠️ Requires Windows 10+ for full ANSI support
- ⚠️ Performance varies by system specs

---

### 3. Minesweeper.cmd
**Category:** Game / Interactive  
**Complexity:** ⭐⭐⭐ Advanced  
**Purpose:** Classic Minesweeper game  

#### Description
Implementation of the classic Minesweeper game. Players must clear a grid of tiles without hitting mines. Includes revealed number hints and high-score tracking.

#### Key Features
- ✅ Customizable grid size
- ✅ Mine placement algorithm
- ✅ Number hints system
- ✅ Score tracking
- ✅ High-score saving
- ✅ Replay functionality
- ✅ Color-coded display

#### How to Play
```batch
Minesweeper.cmd

Objective: Click on all non-mine cells
          without revealing any mines

Controls:
- Select row and column to reveal
- Numbers indicate adjacent mines
- Complete board without hitting mine to win
```

#### Game Rules
1. Click on cells to reveal content
2. Safe cells show number of adjacent mines
3. Empty cells auto-reveal nearby areas
4. Hitting a mine = Game Over
5. Clear all safe cells = Victory

#### Notes
- 💡 Good intermediate-level game example
- 💡 Shows random number generation
- 💡 Demonstrates grid-based game logic
- 💡 Includes data persistence

---

### 4. TIC TAC TOE - Alternative
**Category:** Game / Interactive  
**Complexity:** ⭐⭐ Intermediate  
**Purpose:** Simple Tic Tac Toe variant  

#### Notes
- Simpler implementation than the bilingual version
- Good for learning basic game mechanics
- Faster performance on older systems

---

### 5. Number Guessing Game.bat
**Category:** Game / Interactive  
**Complexity:** ⭐⭐ Intermediate  
**Purpose:** Simple number guessing game  
**Author:** Sebastian Januchowski (polsoft.ITS)  
**Contact:** polsoft.its@fastservice.com  

#### Description
A simple yet engaging game where the computer thinks of a number between 1-100 and the player must guess it. Provides feedback on whether the guess is too high or too low.

#### Key Features
- ✅ Random number generation
- ✅ Attempt counter
- ✅ Feedback system (higher/lower hints)
- ✅ Simple and fast gameplay
- ✅ Educational value

#### How to Play
```batch
Number Guessing Game.bat

1. Computer picks random number (1-100)
2. Enter your guesses
3. Receive feedback (too high/low)
4. Win by guessing correctly
5. Try to beat your previous attempt count
```

#### Example Gameplay
```
Welcome to Number Guessing Game
I'm thinking of a number between 1 and 100
Enter your guess: 50
Too high, try lower
Enter your guess: 25
Too low, try higher
Enter your guess: 37
Correct! You got it in 3 attempts
```

#### Technical Implementation
- Uses %random% for number generation
- Modulo operator for range (1-100)
- Comparison logic for feedback
- Attempt tracking
- Loop until correct guess

#### Notes
- 💡 Good introduction to interactive games
- 💡 Simple but effective game mechanics
- 💡 Educational for learning randomization
- 💡 Quick to play (usually 5-10 minutes)

---

### 6. Rock Paper Scissors [en-pl].cmd
**Category:** Game / Interactive  
**Complexity:** ⭐⭐ Intermediate  
**Purpose:** Classic Rock Paper Scissors game  

#### Description
Bilingual implementation of the classic Rock Paper Scissors game. Computer makes random selections and players compete over multiple rounds.

#### Key Features
- ✅ Bilingual support
- ✅ Best-of-N rounds
- ✅ Score tracking
- ✅ Win/Lose/Draw detection
- ✅ Replay functionality

#### How to Play
```
1. Choose language (English/Polish)
2. Select: Rock, Paper, or Scissors
3. Computer makes its selection
4. Result is determined
5. Play multiple rounds
6. View final score
```

---

### 7. CMD-Rubik-s-Cube.bat
**Category:** Game / Puzzle  
**Complexity:** ⭐⭐⭐ Advanced  
**Purpose:** Rubik's Cube simulation  

#### Description
A simulation of the Rubik's Cube puzzle game. Players can rotate individual faces and attempt to solve the puzzle.

#### Key Features
- ✅ 3D representation (2D projection)
- ✅ Face rotation mechanics
- ✅ Move validation
- ✅ Solution counter
- ✅ Multiple difficulty levels

---

## Calculators

### 1. Calculator Pro v1.8.cmd
**Category:** Utility / Calculator  
**Complexity:** ⭐⭐⭐ Advanced  
**Purpose:** Professional scientific calculator  
**Author:** Sebastian Januchowski (polsoft.ITS)  
**Contact:** polsoft.its@fastservice.com  
**GitHub:** https://github.com/seb07uk  

#### Description
A fully-featured scientific calculator with history tracking, multiple operations, and professional interface. One of the most feature-rich utilities in the collection.

#### Key Features
- ✅ Basic arithmetic (+, -, *, /)
- ✅ Advanced operations (%, ^, root, etc.)
- ✅ Scientific functions (sin, cos, tan, log)
- ✅ History tracking
- ✅ Persistent history across sessions
- ✅ ANSI colored interface
- ✅ Error handling
- ✅ Expression evaluation
- ✅ Decimal support

#### Operations Supported
```
Basic:      + - * / = %
Advanced:   ^ (power), sqrt (square root)
Scientific: sin, cos, tan, log, ln
Memory:     Store, Recall, Clear
History:    Save and restore calculations
```

#### How to Use
```batch
Calculator Pro v1.8.cmd

1. Start the calculator
2. Select operation or enter calculation
3. Enter operands as prompted
4. View result immediately
5. Continue with more operations
6. View calculation history
7. Exit when done

Result history saved to:
C:\Users\{username}\.polsoft\psCli\Calculator\history.txt
```

#### Storage Locations
```
History Directory: %userprofile%\.polsoft\psCli\Calculator
History File:     history.txt
```

#### Technical Highlights
- Uses ANSI escape codes for colors
- Maintains persistent state
- Complex expression parsing
- Mathematical operations with validation
- File-based history persistence
- User-friendly menu system
- Formatted output with alignment

#### Example Session
```
Calculator Pro v1.8
==================
Options: 1=Add, 2=Subtract, 3=Multiply, 4=Divide, 5=View History, 6=Exit

Select operation: 1
First number: 25
Second number: 17
Result: 42

Continue? (Y/N): Y
```

#### Notes
- 💡 Excellent reference for calculator implementation
- 💡 Shows how to build complex menus
- 💡 Demonstrates persistent storage
- 💡 Good UI/UX practices for batch scripts
- 💡 Supports decimal calculations

---

### 2. Calculator Basic.cmd
**Category:** Utility / Calculator  
**Complexity:** ⭐⭐ Intermediate  
**Purpose:** Simple basic calculator  

#### Description
A simplified calculator supporting only basic arithmetic operations. Good for learning basic calculator logic.

#### Features
- ✅ Addition, Subtraction, Multiplication, Division
- ✅ Simple interface
- ✅ Quick calculations
- ✅ Error handling for division by zero

#### Usage
```batch
Calculator Basic.cmd
```

---

### 3. Simple CMD Calculator.bat
**Category:** Utility / Calculator  
**Complexity:** ⭐ Easy  
**Purpose:** Minimal calculator  

#### Description
The most basic calculator implementation. Perfect for learning fundamental arithmetic in batch.

---

## File Management

### 1. File Manager Pro v1.5.cmd
**Category:** Utility / File Management  
**Complexity:** ⭐⭐⭐ Advanced  
**Purpose:** Professional CLI file manager  

#### Description
A feature-rich command-line file manager providing file operations directly from the batch script. Includes browsing, copying, moving, deleting, and searching capabilities.

#### Key Features
- ✅ Directory browsing
- ✅ File operations (copy, move, delete, rename)
- ✅ File search functionality
- ✅ File properties display
- ✅ Recursive operations
- ✅ Batch processing
- ✅ ANSI colored interface
- ✅ Permission checking
- ✅ Detailed error reporting

#### Operations Available
```
Browse:     Navigate directory structure
List:       Show files with details
Copy:       Copy files/folders
Move:       Move files/folders
Delete:     Remove files/folders
Rename:     Change file/folder names
Search:     Find files by name/pattern
Properties: View file details
Compress:   Create archives
```

#### Interface
```
Console Size: 100 columns x 50 lines
Colors:
  Green   = Directories
  Red     = Errors
  Yellow  = Warnings
  Blue    = Information
  Cyan    = Path information
```

#### How to Use
```batch
File Manager Pro v1.5.cmd

1. Start the manager
2. Current directory shown at top
3. Choose operation from menu
4. Follow prompts
5. Confirm operations
6. View results
7. Return to menu

Current Directory: C:\Users\YourName
```

#### Features in Detail

**Directory Navigation**
- Navigate up/down directory tree
- Change drives (C:, D:, etc.)
- Quick access shortcuts

**File Operations**
- Copy with overwrite protection
- Move with confirmation
- Delete with verification
- Batch rename multiple files
- Set file attributes

**Search Functions**
- Find by name pattern
- Find by extension
- Find by size/date range
- Show search results

#### Technical Highlights
- Uses CMD console output for display
- ANSI color sequences for formatting
- Directory recursion for batch operations
- Regular expression support for searches
- Safe deletion with confirmation
- Permission level checking
- Comprehensive error handling

#### Notes
- 💡 Excellent example of utility development
- 💡 Shows how to build user-friendly CLI tools
- 💡 Demonstrates file I/O operations
- 💡 Good reference for batch structure
- ⚠️ Some operations require admin privileges

---

### 2. Simple File Manager.cmd
**Category:** Utility / File Management  
**Complexity:** ⭐⭐ Intermediate  
**Purpose:** Basic file management  

#### Description
A simplified version of File Manager Pro with essential operations only.

#### Features
- ✅ List files
- ✅ Copy files
- ✅ Delete files
- ✅ Rename files
- ✅ Basic searching

---

## System Utilities

### 1. Clear Cookies.bat
**Category:** System Utility / Maintenance  
**Complexity:** ⭐ Easy  
**Purpose:** Remove browser cookies  

#### Description
Safely removes cookies from major browsers to improve privacy and free up disk space.

#### Browsers Supported
- Internet Explorer / Edge
- Google Chrome
- Mozilla Firefox
- Opera
- Safari (if installed)

#### Features
- ✅ Selective browser cleaning
- ✅ Backup before deletion option
- ✅ Verify successful deletion
- ✅ Report freed space

#### Usage
```batch
Clear Cookies.bat
:: Requires admin privileges
```

#### Notes
- ⚠️ Close browsers before running
- ⚠️ Requires Administrator privileges
- 💡 Safe to run regularly
- 💡 Good for privacy maintenance

---

### 2. Clear Temp.bat
**Category:** System Utility / Maintenance  
**Complexity:** ⭐ Easy  
**Purpose:** Clean temporary files  

#### Description
Removes temporary files from system temp directories, helping improve system performance.

#### Cleans
- `%TEMP%` directory
- `%WINDIR%\Temp` directory
- Temporary application cache
- Browser temp files

#### Features
- ✅ Safe cleanup
- ✅ Skip locked files
- ✅ Report freed space
- ✅ Skip system files

#### Usage
```batch
Clear Temp.bat
:: Requires admin privileges for full cleaning
```

#### Notes
- ⚠️ Some processes may fail if temp files in use
- 💡 Safe to run regularly (weekly)
- 💡 Run during off-hours for best results
- 💡 Can free 100+ MB on average system

---

### 3. Empty Bin.cmd
**Category:** System Utility / Maintenance  
**Complexity:** ⭐ Easy  
**Purpose:** Empty the Recycle Bin  

#### Description
Permanently removes all files from the Windows Recycle Bin.

#### Features
- ✅ Confirmation prompt
- ✅ Force empty option
- ✅ Report freed space
- ✅ Handle file locks

#### Usage
```batch
Empty Bin.cmd
```

#### Notes
- ⚠️ Files cannot be recovered after this
- ⚠️ Use caution, ideally with confirmation
- 💡 Good for regular maintenance

---

### 4. Clear Windows Defender History.cmd
**Category:** System Utility / Maintenance  
**Complexity:** ⭐⭐ Intermediate  
**Purpose:** Clear Windows Defender quarantine and history  

#### Description
Clears Windows Defender scan history and quarantine files to improve system performance.

#### Clears
- Scan history
- Quarantined items
- Detection cache
- Threat definitions cache

#### Features
- ✅ Registry cleanup
- ✅ File removal
- ✅ Safety verification
- ✅ Backup option

#### Usage
```batch
Clear Windows Defender History.cmd
:: Requires admin privileges
```

#### Notes
- ⚠️ Requires Administrator rights
- ⚠️ Back up registry before running
- 💡 Safe for regular maintenance
- 💡 Run after major scans

---

### 5. Clear Temporary Internet Files.bat
**Category:** System Utility / Maintenance  
**Complexity:** ⭐ Easy  
**Purpose:** Remove browser cache  

#### Description
Clears temporary internet files and browser cache for all major browsers.

#### Features
- ✅ Multi-browser support
- ✅ Cache clearing
- ✅ Cookie option
- ✅ History option

#### Notes
- 💡 Safe to run regularly
- 💡 Can improve browser performance
- 💡 Close browsers before running

---

## Installation Tools

### 1. Latest ADB Installer.bat
**Category:** Tools / Installation  
**Complexity:** ⭐⭐ Intermediate  
**Purpose:** Download and install Android Debug Bridge  

#### Description
Automated installer for the Android Debug Bridge (ADB) toolkit, essential for Android development and device management.

#### Features
- ✅ Auto-download latest version
- ✅ Dependency checking
- ✅ Path configuration
- ✅ Verification after installation
- ✅ Android SDK tools integration

#### Prerequisites
- Windows XP SP3 or later
- Internet connection
- Administrator privileges
- Java Development Kit (optional)

#### Usage
```batch
Latest ADB Installer.bat

1. Run with admin privileges
2. Script checks prerequisites
3. Downloads latest ADB
4. Installs to system path
5. Verifies installation
6. Shows completion status
```

#### What Gets Installed
- adb.exe (main tool)
- fastboot.exe (bootloader tool)
- mksdcard.exe (SD card tool)
- Necessary libraries
- System PATH updates

#### Verification
```batch
:: After installation, verify with:
adb version
```

#### Notes
- ⚠️ Requires admin privileges
- ⚠️ Requires internet connection
- 💡 Part of Android SDK
- 💡 Essential for Android development
- 💡 Also useful for device management

---

## General Usage Notes

### Running Scripts Safely
```batch
1. Read script contents first
2. Test in isolated environment
3. Have backups of important files
4. Run admin scripts with caution
5. Monitor system during execution
```

### Best Practices
- ✅ Close running applications before maintenance scripts
- ✅ Back up important files
- ✅ Run system scripts during off-hours
- ✅ Keep logs of script runs
- ✅ Update scripts regularly

### Troubleshooting
**Script won't run**
- Check script extension (.bat, .cmd)
- Verify file permissions
- Run as Administrator if needed
- Check Windows Defender exceptions

**Script runs slowly**
- Close other applications
- Check disk space
- Reduce batch size
- Consider splitting large operations

---

## Script Categories Summary

| Category | Count | Examples |
|----------|-------|----------|
| Games | 7 | Snake, Tic Tac Toe, Minesweeper |
| Calculators | 3 | Calculator Pro, Basic, Simple |
| File Management | 2 | File Manager Pro, Simple |
| System Utilities | 5 | Clear Temp, Empty Bin, etc. |
| ASCII Art | 3 | Matrix, Parrot, Logo |
| Installation | 1 | ADB Installer |
| **TOTAL** | **21** | Selected scripts |

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | Jan 28, 2026 | Initial English guide |
| 1.1 | Jan 28, 2026 | Added detailed descriptions |

---

## Feedback and Contributions

For feedback, suggestions, or bug reports:

📧 **Email:** polsoft.its@fastservice.com  
🐙 **GitHub:** https://github.com/seb07uk  
🌐 **Website:** polsoft.its  

---

**Last Updated:** January 28, 2026  
**Language:** English  
**Status:** Complete  

Happy scripting! 🚀

