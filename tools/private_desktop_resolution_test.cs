using System;
using System.Diagnostics;
using System.IO;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading;

public static class DfPrivateDesktopResolutionTest
{
    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)]
    private struct STARTUPINFO
    {
        public int cb;
        public string lpReserved;
        public string lpDesktop;
        public string lpTitle;
        public int dwX, dwY, dwXSize, dwYSize;
        public int dwXCountChars, dwYCountChars, dwFillAttribute, dwFlags;
        public short wShowWindow, cbReserved2;
        public IntPtr lpReserved2, hStdInput, hStdOutput, hStdError;
    }

    [StructLayout(LayoutKind.Sequential)]
    private struct PROCESS_INFORMATION
    {
        public IntPtr hProcess, hThread;
        public uint dwProcessId, dwThreadId;
    }

    [StructLayout(LayoutKind.Sequential)]
    private struct RECT { public int Left, Top, Right, Bottom; }

    private delegate bool EnumProc(IntPtr hwnd, IntPtr parameter);

    [DllImport("user32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
    private static extern IntPtr CreateDesktop(string name, IntPtr device,
        IntPtr mode, uint flags, uint access, IntPtr attributes);
    [DllImport("user32.dll", SetLastError = true)]
    private static extern bool CloseDesktop(IntPtr desktop);
    [DllImport("user32.dll", SetLastError = true)]
    private static extern bool EnumDesktopWindows(IntPtr desktop,
        EnumProc callback, IntPtr parameter);
    [DllImport("user32.dll")]
    private static extern uint GetWindowThreadProcessId(IntPtr hwnd,
        out uint processId);
    [DllImport("user32.dll")]
    private static extern bool SetThreadDesktop(IntPtr desktop);
    [DllImport("kernel32.dll")]
    private static extern uint GetCurrentThreadId();
    [DllImport("user32.dll")]
    private static extern bool AttachThreadInput(uint from, uint to, bool attach);
    [DllImport("user32.dll")]
    private static extern IntPtr SetActiveWindow(IntPtr hwnd);
    [DllImport("user32.dll")]
    private static extern bool SetForegroundWindow(IntPtr hwnd);
    [DllImport("user32.dll")]
    private static extern IntPtr SetFocus(IntPtr hwnd);
    [DllImport("user32.dll")]
    private static extern bool ShowWindow(IntPtr hwnd, int command);
    [DllImport("user32.dll")]
    private static extern bool SetWindowPos(IntPtr hwnd, IntPtr insertAfter,
        int x, int y, int width, int height, uint flags);
    [DllImport("user32.dll")]
    private static extern IntPtr SendMessage(IntPtr hwnd, uint message,
        IntPtr wParam, IntPtr lParam);
    [DllImport("user32.dll")]
    private static extern bool PostMessage(IntPtr hwnd, uint message,
        IntPtr wParam, IntPtr lParam);
    [DllImport("user32.dll")]
    private static extern bool GetClientRect(IntPtr hwnd, out RECT rect);
    [DllImport("user32.dll")]
    private static extern bool PrintWindow(IntPtr hwnd, IntPtr dc, uint flags);

    [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
    private static extern bool CreateProcess(string application,
        StringBuilder commandLine, IntPtr processAttributes,
        IntPtr threadAttributes, bool inheritHandles, uint flags,
        IntPtr environment, string currentDirectory, ref STARTUPINFO startup,
        out PROCESS_INFORMATION process);
    [DllImport("kernel32.dll")]
    private static extern bool ReadProcessMemory(IntPtr process, IntPtr address,
        byte[] buffer, IntPtr size, out IntPtr bytesRead);
    [DllImport("kernel32.dll")]
    private static extern uint WaitForSingleObject(IntPtr handle,
        uint milliseconds);
    [DllImport("kernel32.dll")]
    private static extern bool TerminateProcess(IntPtr process, uint exitCode);
    [DllImport("kernel32.dll")]
    private static extern bool CloseHandle(IntPtr handle);
    [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
    private static extern bool SetDllDirectory(string path);
    [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
    private static extern IntPtr LoadLibrary(string path);
    [DllImport("kernel32.dll", SetLastError = true)]
    private static extern bool FreeLibrary(IntPtr module);
    [DllImport("kernel32.dll", CharSet = CharSet.Ansi, SetLastError = true)]
    private static extern IntPtr GetProcAddress(IntPtr module, string name);
    [DllImport("kernel32.dll", SetLastError = true)]
    private static extern IntPtr CreateRemoteThread(IntPtr process,
        IntPtr attributes, IntPtr stackSize, IntPtr startAddress,
        IntPtr parameter, uint flags, IntPtr threadId);
    [DllImport("kernel32.dll", SetLastError = true)]
    private static extern bool GetExitCodeThread(IntPtr thread,
        out uint exitCode);

    private static IntPtr FindWindow(IntPtr desktop, uint processId)
    {
        IntPtr found = IntPtr.Zero;
        long largestArea = 0;
        EnumDesktopWindows(desktop, delegate(IntPtr hwnd, IntPtr unused) {
            uint candidate;
            GetWindowThreadProcessId(hwnd, out candidate);
            if (candidate != processId) return true;
            RECT rect;
            if (!GetClientRect(hwnd, out rect)) return true;
            long area = (long)(rect.Right - rect.Left) *
                (rect.Bottom - rect.Top);
            if (area > largestArea) {
                largestArea = area;
                found = hwnd;
            }
            return true;
        }, IntPtr.Zero);
        return found;
    }

    private static byte[] Read(IntPtr process, long address, int count)
    {
        byte[] bytes = new byte[count];
        IntPtr read;
        if (!ReadProcessMemory(process, new IntPtr(address), bytes,
                new IntPtr(count), out read) || read.ToInt64() != count)
            return null;
        return bytes;
    }

    private static string ReadGrid(IntPtr process, long graphics)
    {
        byte[] widthBytes = Read(process, graphics + 1808, 4);
        byte[] heightBytes = Read(process, graphics + 1812, 4);
        if (widthBytes == null || heightBytes == null) return "";
        int width = BitConverter.ToInt32(widthBytes, 0);
        int height = BitConverter.ToInt32(heightBytes, 0);
        if (width < 1 || width > 1000 || height < 1 || height > 1000)
            return "";
        byte[] pointerBytes = Read(process, graphics + 480, 8);
        if (pointerBytes == null) return "";
        long screen = BitConverter.ToInt64(pointerBytes, 0);
        if (screen == 0) return "";
        byte[] raw = Read(process, screen, width * height * 8);
        if (raw == null) return "";
        StringBuilder text = new StringBuilder((width + 1) * height);
        for (int y = 0; y < height; ++y) {
            for (int x = 0; x < width; ++x) {
                byte value = raw[(x * height + y) * 8];
                text.Append(value >= 32 && value <= 126 ? (char)value : ' ');
            }
            text.Append('\n');
        }
        return text.ToString();
    }

    private static bool WaitForGrid(IntPtr process, long graphics,
        string first, string second, int seconds, out string grid)
    {
        DateTime deadline = DateTime.UtcNow.AddSeconds(seconds);
        do {
            grid = ReadGrid(process, graphics);
            if (grid.Contains(first) && grid.Contains(second)) return true;
            Thread.Sleep(400);
        } while (DateTime.UtcNow < deadline);
        grid = "";
        return false;
    }

    private static void Key(IntPtr hwnd, int virtualKey, int scanCode)
    {
        long down = 1L | ((long)scanCode << 16);
        // Navigation keys use the E0-prefixed/extended form.  Without bit 24
        // SDL interprets VK_UP/DOWN/LEFT/RIGHT as numeric-keypad scancodes,
        // so the title selection never moves on the private desktop.
        if (virtualKey == 0x21 || virtualKey == 0x22 ||
            virtualKey == 0x23 || virtualKey == 0x24 ||
            virtualKey == 0x25 || virtualKey == 0x26 ||
            virtualKey == 0x27 || virtualKey == 0x28 ||
            virtualKey == 0x2d || virtualKey == 0x2e)
            down |= 1L << 24;
        long up = down | 0xc0000000L;
        SendMessage(hwnd, 0x0100, new IntPtr(virtualKey), new IntPtr(down));
        Thread.Sleep(100);
        SendMessage(hwnd, 0x0101, new IntPtr(virtualKey), new IntPtr(up));
        Thread.Sleep(350);
    }

    private static void Click(IntPtr hwnd, int x, int y)
    {
        long position = ((long)y << 16) | (uint)(x & 0xffff);
        // SDL updates its internal mouse state while draining the owning
        // window thread's queue. Direct SendMessage calls invoke the WndProc
        // synchronously but bypass that pump state, so post a complete native
        // click and leave enough time for the private process to consume it.
        PostMessage(hwnd, 0x0200, IntPtr.Zero, new IntPtr(position));
        PostMessage(hwnd, 0x0201, new IntPtr(1), new IntPtr(position));
        Thread.Sleep(100);
        PostMessage(hwnd, 0x0202, IntPtr.Zero, new IntPtr(position));
        Thread.Sleep(600);
    }

    private static void Wheel(IntPtr hwnd, int x, int y, short delta)
    {
        long position = ((long)y << 16) | (uint)(x & 0xffff);
        long wheel = (long)(ushort)delta << 16;
        SendMessage(hwnd, 0x020A, new IntPtr(wheel), new IntPtr(position));
    }

    private static void ClickGridText(IntPtr hwnd, string grid, string text)
    {
        string[] lines = grid.Split('\n');
        int width = 0;
        for (int row = 0; row < lines.Length; ++row) {
            width = Math.Max(width, lines[row].Length);
            int column = lines[row].IndexOf(text, StringComparison.Ordinal);
            if (column < 0) continue;
            RECT rect;
            if (!GetClientRect(hwnd, out rect) || width < 1 || lines.Length < 2)
                throw new Exception("Cannot map grid text: " + text);
            int x = (int)(((column + text.Length / 2.0) * rect.Right) / width);
            int y = (int)(((row + 0.5) * rect.Bottom) / (lines.Length - 1));
            Click(hwnd, x, y);
            return;
        }
        throw new Exception("Grid text not found: " + text);
    }

    private static void ClickGridTextLogical(IntPtr hwnd, IntPtr process,
        uint processId, string workingDirectory, long graphics, string grid,
        string text)
    {
        string[] lines = grid.Split('\n');
        int gridWidth = lines.Length == 0 ? 0 : lines[0].Length;
        int gridHeight = Math.Max(0, lines.Length - 1);
        byte[] geometry = Read(process, graphics + 464, 16);
        if (geometry == null || gridWidth < 1 || gridHeight < 1)
            throw new Exception("Cannot read logical grid geometry");
        int screenWidth = BitConverter.ToInt32(geometry, 0);
        int screenHeight = BitConverter.ToInt32(geometry, 4);
        int tileWidth = BitConverter.ToInt32(geometry, 8);
        int tileHeight = BitConverter.ToInt32(geometry, 12);
        if (screenWidth < 1 || screenHeight < 1 || tileWidth < 1 ||
            tileHeight < 1)
            throw new Exception("Invalid logical grid geometry");
        int originX = (screenWidth - tileWidth * gridWidth) / 2;
        int originY = (screenHeight - tileHeight * gridHeight) / 2;
        RECT client;
        if (!GetClientRect(hwnd, out client) || client.Right < 1)
            throw new Exception("Cannot read private client rectangle");
        // Native Win32 coordinates are DPI-virtualized and include the
        // letterbox viewport.  SDL maps them back with
        // logical = native * scale - viewport, so add the physical viewport
        // before dividing by the DPI scale below.
        double clientScale = (double)screenWidth / client.Right;
        int physicalWidth = (int)Math.Round(client.Right * clientScale);
        int physicalHeight = (int)Math.Round(client.Bottom * clientScale);
        int viewportX = (physicalWidth - screenWidth) / 2;
        int viewportY = (physicalHeight - screenHeight) / 2;
        for (int row = 0; row < gridHeight; ++row) {
            int column = lines[row].IndexOf(text, StringComparison.Ordinal);
            if (column < 0) continue;
            int x = (int)Math.Round(originX +
                (column + text.Length / 2.0) * tileWidth);
            int y = (int)Math.Round(originY +
                (row + 0.5) * tileHeight);
            // Post the native click to the exact isolated HWND so SDL's
            // Windows backend updates both its event queue and mouse state.
            // Convert the high-DPI drawable/letterbox coordinate back to the
            // DPI-virtualized client coordinate used by that window.
            int eventX = (int)Math.Round((x + viewportX) / clientScale);
            int eventY = (int)Math.Round((y + viewportY) / clientScale);
            Console.WriteLine("logical-click text={0};grid={1}x{2};screen={3}x{4};" +
                "tile={5}x{6};origin={7},{8};client-size={9}x{10};" +
                "scale={11:F3};viewport={12},{13};drawable-click={14},{15};" +
                "event-click={16},{17}",
                text, gridWidth, gridHeight, screenWidth, screenHeight,
                tileWidth, tileHeight, originX, originY, client.Right,
                client.Bottom, clientScale, viewportX, viewportY, x, y,
                eventX, eventY);
            string clickMethod = Environment.GetEnvironmentVariable(
                "DFCN_PRIVATE_TEST_CLICK_METHOD") ?? "";
            if (String.Equals(clickMethod, "private",
                    StringComparison.OrdinalIgnoreCase)) {
                ClickPrivateSdl(process, processId, workingDirectory,
                    x, y + viewportY);
                PushPrivateSdlKey(process, processId, workingDirectory, 13);
            } else if (String.Equals(clickMethod, "drawable",
                    StringComparison.OrdinalIgnoreCase)) {
                // A hidden high-DPI private-desktop window can receive raw
                // WM_MOUSE coordinates without DPI virtualization. In that
                // mode the already-converted event coordinate is scaled and
                // letterboxed a second time by SDL; send the drawable point
                // directly so the game sees the requested logical cell.
                Click(hwnd, x, y);
            } else if (String.Equals(clickMethod, "wm-logical",
                    StringComparison.OrdinalIgnoreCase)) {
                // WM_MOUSE coordinates on this private high-DPI window keep
                // drawable X but SDL removes the physical letterbox from Y.
                Click(hwnd, x, y + viewportY);
            } else {
                Click(hwnd, eventX, eventY);
            }
            return;
        }
        throw new Exception("Grid text not found: " + text);
    }

    private static void Capture(IntPtr hwnd, string path)
    {
        // Ask the hook to capture the isolated process' SDL backbuffer. This
        // does not depend on a visible desktop or System.Drawing, and it also
        // cannot accidentally capture a user-owned game window.
        string archivePath = Path.ChangeExtension(path, ".bmp");
        TriggerRuntimeCapture(archivePath);
    }

    private static void ClickLogicalPoint(IntPtr hwnd, IntPtr process,
        uint processId, string workingDirectory, long graphics,
        int logicalX, int logicalY)
    {
        byte[] geometry = Read(process, graphics + 464, 16);
        RECT client;
        if (geometry == null ||
            !GetClientRect(hwnd, out client) || client.Right < 1)
            throw new Exception("Cannot resolve private logical viewport");
        int screenWidth = BitConverter.ToInt32(geometry, 0);
        int screenHeight = BitConverter.ToInt32(geometry, 4);
        if (screenWidth < 1 || screenHeight < 1)
            throw new Exception("Invalid private logical viewport");
        double clientScale = (double)screenWidth / client.Right;
        int physicalWidth = (int)Math.Round(client.Right * clientScale);
        int physicalHeight = (int)Math.Round(client.Bottom * clientScale);
        int viewportX = (physicalWidth - screenWidth) / 2;
        int viewportY = (physicalHeight - screenHeight) / 2;
        int eventX = (int)Math.Round((logicalX + viewportX) / clientScale);
        int eventY = (int)Math.Round((logicalY + viewportY) / clientScale);
        Click(hwnd, eventX, eventY);
    }

    private static void TriggerRuntimeCapture()
    {
        TriggerRuntimeCapture(null);
    }

    private static void TriggerRuntimeCapture(string archivePath)
    {
        string trigger = Environment.GetEnvironmentVariable(
            "DFCN_CAPTURE_TRIGGER");
        string output = Environment.GetEnvironmentVariable(
            "DFCN_CAPTURE_PATH");
        if (String.IsNullOrEmpty(trigger) || String.IsNullOrEmpty(output))
            throw new Exception("Runtime capture environment is incomplete");
        if (File.Exists(output)) File.Delete(output);
        string parent = Path.GetDirectoryName(trigger);
        if (!String.IsNullOrEmpty(parent)) Directory.CreateDirectory(parent);
        File.WriteAllText(trigger, "capture", Encoding.ASCII);
        DateTime deadline = DateTime.UtcNow.AddSeconds(10);
        while (DateTime.UtcNow < deadline && !File.Exists(output))
            Thread.Sleep(100);
        if (!String.IsNullOrEmpty(archivePath) && File.Exists(output))
            File.Copy(output, archivePath, true);
        if (!File.Exists(output))
            throw new Exception("Runtime capture timeout: " + output);
    }

    private static void CallPrivateSdlTest(IntPtr processHandle,
        uint processId, string workingDirectory, string procedureName,
        IntPtr parameter)
    {
        // Dwarf Fortress discovers dfhooks modules in the process working
        // directory.  Test against that exact root module; a similarly named
        // development copy under dfcn may be a different build.
        string libraryPath = Path.Combine(workingDirectory,
            "dfhooks_dfcn.dll");
        SetDllDirectory(workingDirectory);
        IntPtr localModule = LoadLibrary(libraryPath);
        if (localModule == IntPtr.Zero)
            throw new Exception("Cannot load local test hook: " +
                Marshal.GetLastWin32Error());
        try {
            IntPtr localProcedure = GetProcAddress(localModule,
                procedureName);
            if (localProcedure == IntPtr.Zero)
                throw new Exception("Private SDL test export missing: " +
                    procedureName);
            IntPtr remoteModule = IntPtr.Zero;
            string expectedLibrary = Path.GetFullPath(libraryPath);
            StringBuilder matchingModules = new StringBuilder();
            using (Process target = Process.GetProcessById((int)processId)) {
                foreach (ProcessModule module in target.Modules) {
                    string remotePath = "";
                    try { remotePath = Path.GetFullPath(module.FileName); }
                    catch { remotePath = ""; }
                    if (String.Equals(module.ModuleName, "dfhooks_dfcn.dll",
                            StringComparison.OrdinalIgnoreCase))
                        matchingModules.Append(" [").Append(remotePath).Append("]");
                    if (String.Equals(remotePath, expectedLibrary,
                            StringComparison.OrdinalIgnoreCase)) {
                        remoteModule = module.BaseAddress;
                        break;
                    }
                }
            }
            if (remoteModule == IntPtr.Zero)
                throw new Exception("Remote test hook module missing; expected=" +
                    expectedLibrary + "; loaded=" + matchingModules.ToString());
            long procedureOffset = localProcedure.ToInt64() -
                localModule.ToInt64();
            IntPtr remoteProcedure = new IntPtr(remoteModule.ToInt64() +
                procedureOffset);
            IntPtr thread = CreateRemoteThread(processHandle, IntPtr.Zero,
                IntPtr.Zero, remoteProcedure, parameter, 0,
                IntPtr.Zero);
            if (thread == IntPtr.Zero)
                throw new Exception("CreateRemoteThread failed: " +
                    Marshal.GetLastWin32Error());
            try {
                if (WaitForSingleObject(thread, 5000) != 0)
                    throw new Exception("Private SDL key timeout");
                uint result;
                if (!GetExitCodeThread(thread, out result) || result != 0)
                    throw new Exception("Private SDL key failed: " + result);
            } finally {
                CloseHandle(thread);
            }
        } finally {
            FreeLibrary(localModule);
            SetDllDirectory(null);
        }
        Thread.Sleep(400);
    }

    private static void PushPrivateSdlKey(IntPtr processHandle,
        uint processId, string workingDirectory, int keycode)
    {
        CallPrivateSdlTest(processHandle, processId, workingDirectory,
            "dfcn_private_test_push_key", new IntPtr(keycode));
    }

    private static void PushPrivateSdlWheel(IntPtr processHandle,
        uint processId, string workingDirectory, int delta)
    {
        CallPrivateSdlTest(processHandle, processId, workingDirectory,
            "dfcn_private_test_wheel", new IntPtr(delta));
    }

    private static void PostPrivateWindowKey(IntPtr hwnd, int virtualKey,
        int scanCode, bool extended)
    {
        long down = 1L | ((long)scanCode << 16);
        if (extended) down |= 1L << 24;
        long up = down | (1L << 30) | (1L << 31);
        if (!PostMessage(hwnd, 0x0100, new IntPtr(virtualKey),
                new IntPtr(down)))
            throw new Exception("Private WM_KEYDOWN failed: " +
                Marshal.GetLastWin32Error());
        Thread.Sleep(160);
        if (!PostMessage(hwnd, 0x0101, new IntPtr(virtualKey),
                new IntPtr(up)))
            throw new Exception("Private WM_KEYUP failed: " +
                Marshal.GetLastWin32Error());
        Thread.Sleep(400);
    }

    private static void ClickPrivateSdl(IntPtr processHandle,
        uint processId, string workingDirectory, int x, int y)
    {
        long packed = (long)(uint)x | ((long)(uint)y << 32);
        CallPrivateSdlTest(processHandle, processId, workingDirectory,
            "dfcn_private_test_click", new IntPtr(packed));
    }

    public static string Run(string executable, string workingDirectory,
        string outputPath)
    {
        string desktopName = "DFCNTest_" + Guid.NewGuid().ToString("N");
        IntPtr desktop = CreateDesktop(desktopName, IntPtr.Zero, IntPtr.Zero,
            0, 0x01ff, IntPtr.Zero);
        if (desktop == IntPtr.Zero)
            throw new Exception("CreateDesktop failed: " + Marshal.GetLastWin32Error());
        PROCESS_INFORMATION process = new PROCESS_INFORMATION();
        STARTUPINFO startup = new STARTUPINFO();
        startup.cb = Marshal.SizeOf(typeof(STARTUPINFO));
        startup.lpDesktop = desktopName;
        try {
            string extraArguments = Environment.GetEnvironmentVariable(
                "DFCN_PRIVATE_TEST_ARGS") ?? "";
            StringBuilder command = new StringBuilder("\"" + executable + "\"");
            if (!String.IsNullOrWhiteSpace(extraArguments))
                command.Append(" ").Append(extraArguments.Trim());
            if (!CreateProcess(executable, command, IntPtr.Zero, IntPtr.Zero,
                    false, 0x08000000, IntPtr.Zero, workingDirectory,
                    ref startup, out process))
                throw new Exception("CreateProcess failed: " +
                    Marshal.GetLastWin32Error());
            try {
                IntPtr hwnd = IntPtr.Zero;
                DateTime windowDeadline = DateTime.UtcNow.AddSeconds(30);
                while (DateTime.UtcNow < windowDeadline &&
                       (hwnd = FindWindow(desktop, process.dwProcessId)) == IntPtr.Zero)
                    Thread.Sleep(250);
                if (hwnd == IntPtr.Zero) throw new Exception("Window timeout");

                long moduleBase = 0;
                DateTime moduleDeadline = DateTime.UtcNow.AddSeconds(15);
                while (DateTime.UtcNow < moduleDeadline) {
                    try {
                        moduleBase = Process.GetProcessById(
                            (int)process.dwProcessId).MainModule.BaseAddress.ToInt64();
                    } catch { }
                    if (moduleBase != 0) break;
                    Thread.Sleep(250);
                }
                if (moduleBase == 0) throw new Exception("Module timeout");

                string state = "";
                Exception workerError = null;
                Thread worker = new Thread(delegate() {
                    try {
                        if (!SetThreadDesktop(desktop))
                            throw new Exception("SetThreadDesktop failed: " +
                                Marshal.GetLastWin32Error());
                        SetWindowPos(hwnd, IntPtr.Zero, 0, 0, 2560, 2000, 0x0004);
                        ShowWindow(hwnd, 5);
                        uint ignored;
                        uint windowThread = GetWindowThreadProcessId(hwnd, out ignored);
                        uint currentThread = GetCurrentThreadId();
                        AttachThreadInput(currentThread, windowThread, true);
                        SetForegroundWindow(hwnd);
                        SetActiveWindow(hwnd);
                        SetFocus(hwnd);
                        AttachThreadInput(currentThread, windowThread, false);

                        long graphics = moduleBase + 0x0264a3f0;
                        string privateTestMode =
                            Environment.GetEnvironmentVariable(
                                "DFCN_PRIVATE_TEST_MODE") ?? "";
                        string privateTestFlow =
                            Environment.GetEnvironmentVariable(
                                "DFCN_PRIVATE_TEST_FLOW") ?? privateTestMode;
                        bool probeMode = String.Equals(privateTestMode,
                            "probe", StringComparison.OrdinalIgnoreCase);
                        string grid = "";
                        string previousStartupGrid = "";
                        StringBuilder startupGrids = new StringBuilder();
                        DateTime startupDeadline = DateTime.UtcNow.AddSeconds(
                            probeMode ? 15 : 50);
                        int startupFrame = 0;
                        while (DateTime.UtcNow < startupDeadline) {
                            grid = ReadGrid(process.hProcess, graphics);
                            if (grid != previousStartupGrid) {
                                startupGrids.AppendLine("=== FRAME " +
                                    startupFrame++ + " ===");
                                startupGrids.Append(grid);
                                previousStartupGrid = grid;
                            }
                            if (grid.Contains("Create new world") &&
                                grid.Contains("Settings"))
                                break;
                            if (probeMode &&
                                (grid.Contains("Welcome to the arena!") ||
                                 grid.Contains("Small arena") ||
                                 grid.Contains("Create a creature to begin.")))
                                break;
                            Thread.Sleep(50);
                        }
                        File.WriteAllText(outputPath + ".startup-grids.txt",
                            startupGrids.ToString(), Encoding.UTF8);
                        if (probeMode) {
                            File.WriteAllText(outputPath + ".probe-grid.txt",
                                grid, Encoding.UTF8);
                            Thread.Sleep(500);
                            TriggerRuntimeCapture();
                            state = "probe=1";
                            return;
                        }
                        if (!grid.Contains("Create new world") ||
                            !grid.Contains("Settings"))
                            throw new Exception("Title timeout");
                        File.WriteAllText(outputPath + ".title-grid.txt",
                            grid, Encoding.UTF8);
                        if (String.Equals(privateTestFlow, "startup",
                                StringComparison.OrdinalIgnoreCase)) {
                            Thread.Sleep(800);
                            TriggerRuntimeCapture();
                            state = "startup_title=1";
                            return;
                        }
                        if (String.Equals(privateTestFlow, "arena",
                                StringComparison.OrdinalIgnoreCase)) {
                            int keySteps;
                            string keyStepText =
                                Environment.GetEnvironmentVariable(
                                    "DFCN_PRIVATE_TEST_KEY_STEPS") ?? "";
                            if (Int32.TryParse(keyStepText, out keySteps) &&
                                keySteps >= 0 && keySteps <= 12) {
                                bool postKeys = String.Equals(
                                    Environment.GetEnvironmentVariable(
                                        "DFCN_PRIVATE_TEST_KEY_METHOD"),
                                    "post", StringComparison.OrdinalIgnoreCase);
                                for (int step = 0; step < keySteps; ++step) {
                                    if (postKeys)
                                        PostPrivateWindowKey(hwnd, 0x28, 0x50,
                                            true); // VK_DOWN
                                    else
                                        PushPrivateSdlKey(process.hProcess,
                                            process.dwProcessId,
                                            workingDirectory,
                                            1073741905); // SDLK_DOWN
                                }
                                if (postKeys)
                                    PostPrivateWindowKey(hwnd, 0x0d, 0x1c,
                                        false); // VK_RETURN
                                else
                                    PushPrivateSdlKey(process.hProcess,
                                        process.dwProcessId, workingDirectory,
                                        13); // SDLK_RETURN
                            } else {
                                ClickGridTextLogical(hwnd, process.hProcess,
                                    process.dwProcessId, workingDirectory,
                                    graphics, grid, "Object testing arena");
                            }
                            int arenaWaitSeconds = 20;
                            Int32.TryParse(Environment.GetEnvironmentVariable(
                                "DFCN_PRIVATE_TEST_NAV_TIMEOUT"),
                                out arenaWaitSeconds);
                            if (arenaWaitSeconds < 1 || arenaWaitSeconds > 30)
                                arenaWaitSeconds = 20;
                            if (!WaitForGrid(process.hProcess, graphics,
                                    "Welcome to the arena!", "Small arena",
                                    arenaWaitSeconds,
                                    out grid)) {
                                File.WriteAllText(outputPath +
                                    ".arena-timeout-grid.txt",
                                    ReadGrid(process.hProcess, graphics),
                                    Encoding.UTF8);
                                TriggerRuntimeCapture();
                                throw new Exception("Arena menu timeout");
                            }
                            File.WriteAllText(outputPath + ".arena-menu-grid.txt",
                                grid, Encoding.UTF8);
                            string arenaFlow =
                                Environment.GetEnvironmentVariable(
                                    "DFCN_PRIVATE_TEST_ARENA_FLOW") ?? "";
                            if (String.Equals(arenaFlow, "main",
                                    StringComparison.OrdinalIgnoreCase) ||
                                String.Equals(arenaFlow, "creature",
                                    StringComparison.OrdinalIgnoreCase) ||
                                String.Equals(arenaFlow, "equipment",
                                    StringComparison.OrdinalIgnoreCase) ||
                                String.Equals(arenaFlow, "conditions",
                                    StringComparison.OrdinalIgnoreCase) ||
                                String.Equals(arenaFlow, "all",
                                    StringComparison.OrdinalIgnoreCase)) {
                                ClickGridTextLogical(hwnd, process.hProcess,
                                    process.dwProcessId, workingDirectory,
                                    graphics, grid, "Small arena");
                                Thread.Sleep(500);
                                grid = ReadGrid(process.hProcess, graphics);
                                ClickGridTextLogical(hwnd, process.hProcess,
                                    process.dwProcessId, workingDirectory,
                                    graphics, grid, "Create arena");
                                if (!WaitForGrid(process.hProcess, graphics,
                                        "Create a creature to begin.",
                                        "Conflict Level", 30, out grid)) {
                                    File.WriteAllText(outputPath +
                                        ".arena-main-timeout-grid.txt",
                                        ReadGrid(process.hProcess, graphics),
                                        Encoding.UTF8);
                                    TriggerRuntimeCapture();
                                    throw new Exception("Arena main timeout");
                                }
                                File.WriteAllText(outputPath +
                                    ".arena-main-grid.txt", grid,
                                    Encoding.UTF8);
                                if (String.Equals(arenaFlow, "creature",
                                        StringComparison.OrdinalIgnoreCase) ||
                                    String.Equals(arenaFlow, "equipment",
                                        StringComparison.OrdinalIgnoreCase) ||
                                    String.Equals(arenaFlow, "conditions",
                                        StringComparison.OrdinalIgnoreCase) ||
                                    String.Equals(arenaFlow, "all",
                                        StringComparison.OrdinalIgnoreCase)) {
                                    // First of the four bottom-center arena
                                    // action buttons: create creature.
                                    bool creatureOpened = false;
                                    for (int attempt = 0; attempt < 4 &&
                                            !creatureOpened; ++attempt) {
                                        ClickLogicalPoint(hwnd,
                                            process.hProcess,
                                            process.dwProcessId,
                                            workingDirectory, graphics,
                                            1405, 2102);
                                        creatureOpened = WaitForGrid(
                                            process.hProcess, graphics,
                                            "Creature", "Equipment", 5,
                                            out grid);
                                    }
                                    if (!creatureOpened) {
                                        File.WriteAllText(outputPath +
                                            ".arena-creature-timeout-grid.txt",
                                            ReadGrid(process.hProcess,
                                                graphics), Encoding.UTF8);
                                        TriggerRuntimeCapture();
                                        throw new Exception(
                                            "Arena creature screen timeout");
                                    }
                                    File.WriteAllText(outputPath +
                                        ".arena-creature-grid.txt", grid,
                                        Encoding.UTF8);
                                    if (String.Equals(arenaFlow, "conditions",
                                            StringComparison.OrdinalIgnoreCase)) {
                                        ClickGridTextLogical(hwnd,
                                            process.hProcess,
                                            process.dwProcessId,
                                            workingDirectory, graphics,
                                            grid, "Conditions");
                                        Thread.Sleep(1200);
                                        ClickLogicalPoint(hwnd,
                                            process.hProcess,
                                            process.dwProcessId,
                                            workingDirectory, graphics,
                                            1000, 1100);
                                        StringBuilder conditionGrids =
                                            new StringBuilder();
                                        for (int page = 0; page < 5; ++page) {
                                            Thread.Sleep(2100);
                                            conditionGrids.AppendLine(
                                                "=== FRAME " + page + " ===");
                                            conditionGrids.Append(ReadGrid(
                                                process.hProcess, graphics));
                                            PushPrivateSdlWheel(
                                                process.hProcess,
                                                process.dwProcessId,
                                                workingDirectory, -6);
                                        }
                                        File.WriteAllText(outputPath +
                                            ".arena-conditions-scroll-grids.txt",
                                            conditionGrids.ToString(),
                                            Encoding.UTF8);
                                        TriggerRuntimeCapture(outputPath +
                                            ".arena-conditions-scrolled.bmp");
                                        state = "arena_conditions=1";
                                        return;
                                    }
                                    if (String.Equals(arenaFlow, "all",
                                            StringComparison.OrdinalIgnoreCase)) {
                                        foreach (string tab in new string[] {
                                                "Creature", "Skills",
                                                "Conditions"}) {
                                            grid = ReadGrid(process.hProcess,
                                                graphics);
                                            ClickGridTextLogical(hwnd,
                                                process.hProcess,
                                                process.dwProcessId,
                                                workingDirectory, graphics,
                                                grid, tab);
                                            Thread.Sleep(1200);
                                            // Put the private SDL pointer over
                                            // the central list so wheel input
                                            // cannot be consumed by the tab
                                            // strip or an outer scrollbar.
                                            ClickLogicalPoint(hwnd,
                                                process.hProcess,
                                                process.dwProcessId,
                                                workingDirectory, graphics,
                                                1000, 1100);
                                            StringBuilder auditGrids =
                                                new StringBuilder();
                                            for (int page = 0; page < 5;
                                                    ++page) {
                                                Thread.Sleep(2100);
                                                auditGrids.AppendLine(
                                                    "=== FRAME " + page +
                                                    " ===");
                                                auditGrids.Append(ReadGrid(
                                                    process.hProcess,
                                                    graphics));
                                                PushPrivateSdlWheel(
                                                    process.hProcess,
                                                    process.dwProcessId,
                                                    workingDirectory, -6);
                                            }
                                            File.WriteAllText(outputPath +
                                                ".arena-" +
                                                tab.ToLowerInvariant() +
                                                "-scroll-grids.txt",
                                                auditGrids.ToString(),
                                                Encoding.UTF8);
                                            TriggerRuntimeCapture(outputPath +
                                                ".arena-" +
                                                tab.ToLowerInvariant() +
                                                "-scrolled.bmp");
                                        }
                                    }
                                    if (String.Equals(arenaFlow, "equipment",
                                            StringComparison.OrdinalIgnoreCase) ||
                                        String.Equals(arenaFlow, "all",
                                            StringComparison.OrdinalIgnoreCase)) {
                                        ClickGridTextLogical(hwnd,
                                            process.hProcess,
                                            process.dwProcessId,
                                            workingDirectory, graphics, grid,
                                            "Equipment");
                                        Thread.Sleep(1200);
                                        grid = ReadGrid(process.hProcess,
                                            graphics);
                                        File.WriteAllText(outputPath +
                                            ".arena-equipment-grid.txt", grid,
                                            Encoding.UTF8);
                                        string equipmentCategory =
                                            Environment.GetEnvironmentVariable(
                                                "DFCN_PRIVATE_TEST_EQUIPMENT_CATEGORY") ??
                                            "Headwear";
                                        string equipmentFirstItem =
                                            Environment.GetEnvironmentVariable(
                                                "DFCN_PRIVATE_TEST_EQUIPMENT_ITEM") ??
                                            "iron helms";
                                        ClickGridTextLogical(hwnd,
                                            process.hProcess,
                                            process.dwProcessId,
                                            workingDirectory, graphics, grid,
                                            equipmentCategory);
                                        Thread.Sleep(1200);
                                        grid = ReadGrid(process.hProcess,
                                            graphics);
                                        File.WriteAllText(outputPath +
                                            ".arena-equipment-headwear-grid.txt",
                                            grid, Encoding.UTF8);
                                        if (String.Equals(Environment.
                                                GetEnvironmentVariable(
                                                    "DFCN_PRIVATE_TEST_EQUIPMENT_SCROLL"),
                                                "true",
                                                StringComparison.OrdinalIgnoreCase)) {
                                            ClickGridTextLogical(hwnd,
                                                process.hProcess,
                                                process.dwProcessId,
                                                workingDirectory, graphics,
                                                grid, equipmentFirstItem);
                                            for (int page = 0; page < 4;
                                                    ++page) {
                                                PushPrivateSdlWheel(
                                                    process.hProcess,
                                                    process.dwProcessId,
                                                    workingDirectory,
                                                    -3);
                                            }
                                            Thread.Sleep(800);
                                            grid = ReadGrid(
                                                process.hProcess, graphics);
                                            File.WriteAllText(outputPath +
                                                ".arena-equipment-scrolled-grid.txt",
                                                grid, Encoding.UTF8);
                                        }
                                    }
                                }
                                Thread.Sleep(800);
                                TriggerRuntimeCapture();
                                state = String.Equals(arenaFlow, "main",
                                    StringComparison.OrdinalIgnoreCase)
                                    ? "arena_main=1"
                                    : (String.Equals(arenaFlow, "equipment",
                                        StringComparison.OrdinalIgnoreCase)
                                        ? "arena_equipment=1"
                                        : "arena_creature=1");
                                return;
                            }
                            Thread.Sleep(800);
                            TriggerRuntimeCapture();
                            state = "arena_menu=1";
                            return;
                        }
                        for (int menuStep = 0; menuStep < 5; ++menuStep)
                            PushPrivateSdlKey(process.hProcess,
                                process.dwProcessId, workingDirectory,
                                1073741905); // SDLK_DOWN
                        PushPrivateSdlKey(process.hProcess,
                            process.dwProcessId, workingDirectory, 13);
                        Thread.Sleep(1200);
                        if (!WaitForGrid(process.hProcess, graphics,
                                "Resolution:", "Scale interface", 15, out grid)) {
                            File.WriteAllText(outputPath +
                                ".settings-timeout-grid.txt",
                                ReadGrid(process.hProcess, graphics),
                                Encoding.UTF8);
                            throw new Exception("Settings timeout");
                        }
                        Capture(hwnd, outputPath + ".video.png");

                        ClickGridTextLogical(hwnd, process.hProcess,
                            process.dwProcessId, workingDirectory, graphics,
                            grid, "Keybindings");
                        if (!WaitForGrid(process.hProcess, graphics,
                                "Don't repeat", "Fast repeat", 15, out grid))
                            throw new Exception("Keybindings timeout");
                        Thread.Sleep(800);
                        Capture(hwnd, outputPath + ".keybindings-general.png");
                        foreach (string page in new string[] {
                                "Fortress", "Building", "Text entry", "Macros"}) {
                            grid = ReadGrid(process.hProcess, graphics);
                            ClickGridTextLogical(hwnd, process.hProcess,
                                process.dwProcessId, workingDirectory,
                                graphics, grid, page);
                            Thread.Sleep(900);
                            Capture(hwnd, outputPath + ".keybindings-" +
                                page.ToLowerInvariant().Replace(" ", "-") + ".png");
                        }

                        grid = ReadGrid(process.hProcess, graphics);
                        ClickGridTextLogical(hwnd, process.hProcess,
                            process.dwProcessId, workingDirectory, graphics,
                            grid, "Announcements");
                        if (!WaitForGrid(process.hProcess, graphics,
                                "Name", "Popup", 15, out grid))
                            throw new Exception("Announcements timeout");
                        Thread.Sleep(1000);
                        Capture(hwnd, outputPath + ".announcements.png");

                        // Preserve the game's untranslated character grid for
                        // every scroll position.  The overlay changes rendered
                        // glyphs, not this backing grid, so this gives an exact
                        // inventory of the announcement labels without OCR.
                        StringBuilder announcementGrids = new StringBuilder();
                        string previousGrid = "";
                        int unchanged = 0;
                        int scrollSteps = 0;
                        RECT announcementRect;
                        if (!GetClientRect(hwnd, out announcementRect))
                            throw new Exception("Announcement client rect failed");
                        for (; scrollSteps < 180 && unchanged < 10; ++scrollSteps) {
                            grid = ReadGrid(process.hProcess, graphics);
                            announcementGrids.AppendLine("=== FRAME " +
                                scrollSteps + " ===");
                            announcementGrids.Append(grid);
                            if (grid == previousGrid) ++unchanged;
                            else unchanged = 0;
                            previousGrid = grid;
                            PushPrivateSdlWheel(process.hProcess,
                                process.dwProcessId, workingDirectory, -4);
                            Thread.Sleep(220);
                        }
                        File.WriteAllText(outputPath +
                            ".announcements-grids.txt",
                            announcementGrids.ToString(), Encoding.UTF8);
                        Capture(hwnd, outputPath + ".announcements-bottom.png");
                        state = "settings_pages=6;announcement_scroll_steps=" +
                            scrollSteps;
                    } catch (Exception error) {
                        workerError = error;
                    }
                });
                worker.SetApartmentState(ApartmentState.STA);
                worker.Start();
                worker.Join(85000);
                if (worker.IsAlive) throw new Exception("Worker timeout");
                if (workerError != null) throw workerError;
                return "pid=" + process.dwProcessId + ";" + state +
                    ";capture=" + outputPath;
            } finally {
                IntPtr hwnd = FindWindow(desktop, process.dwProcessId);
                if (hwnd != IntPtr.Zero)
                    SendMessage(hwnd, 0x0010, IntPtr.Zero, IntPtr.Zero);
                if (WaitForSingleObject(process.hProcess, 2500) == 0x102) {
                    TerminateProcess(process.hProcess, 0);
                    // Do not return while the test-owned process is still
                    // visible in the process table.  This wait is scoped to
                    // the exact handle created above and cannot affect an
                    // independently launched game instance.
                    WaitForSingleObject(process.hProcess, 5000);
                }
                CloseHandle(process.hThread);
                CloseHandle(process.hProcess);
            }
        } finally {
            CloseDesktop(desktop);
        }
    }

}
