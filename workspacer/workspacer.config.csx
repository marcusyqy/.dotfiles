// Development
// #r "C:\Users\dalyisaac\Repos\workspacer\src\workspacer.Shared\bin\Debug\net5.0-windows\win10-x64\workspacer.Shared.dll"
// #r "C:\Users\dalyisaac\Repos\workspacer\src\workspacer.Bar\bin\Debug\net5.0-windows\win10-x64\workspacer.Bar.dll"
// #r "C:\Users\dalyisaac\Repos\workspacer\src\workspacer.Gap\bin\Debug\net5.0-windows\win10-x64\workspacer.Gap.dll"
// #r "C:\Users\dalyisaac\Repos\workspacer\src\workspacer.ActionMenu\bin\Debug\net5.0-windows\win10-x64\workspacer.ActionMenu.dll"
// #r "C:\Users\dalyisaac\Repos\workspacer\src\workspacer.FocusIndicator\bin\Debug\net5.0-windows\win10-x64\workspacer.FocusIndicator.dll"


// Production
#r "C:\Program Files\workspacer\workspacer.Shared.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.Bar\workspacer.Bar.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.Gap\workspacer.Gap.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.ActionMenu\workspacer.ActionMenu.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.FocusIndicator\workspacer.FocusIndicator.dll"

using System;
using System.Collections.Generic;
using System.Linq;
using workspacer;
using workspacer.Bar;
using workspacer.Bar.Widgets;
using workspacer.Gap;
using workspacer.ActionMenu;
using workspacer.FocusIndicator;

return new Action<IConfigContext>((IConfigContext context) =>
{
    /* Variables */
    var fontSize = 14;
    var barHeight = 20;
    var fontName = "JetBrainsMono NF";
    var background = new Color(0x0, 0x0, 0x0);

    /* Config */
    context.CanMinimizeWindows = false;

    /* Gap */
    var gap = barHeight - 8;
    var gapPlugin = context.AddGap(new GapPluginConfig() { InnerGap = gap, OuterGap = gap / 2, Delta = gap / 2 });

    /* Bar */
    context.AddBar(new BarPluginConfig()
    {
        FontSize = fontSize,
        BarHeight = barHeight,
        FontName = fontName,
        DefaultWidgetBackground = background,
        LeftWidgets = () => new IBarWidget[]
        {
            new WorkspaceWidget(), new TextWidget(": "), new TitleWidget() {
                IsShortTitle = true
            }
        },
        RightWidgets = () => new IBarWidget[]
        {
            new BatteryWidget(),
            new TimeWidget(1000, "HH:mm:ss dd-MMM-yyyy"),
            new ActiveLayoutWidget(),
        }
    });

    /* Bar focus indicator */
    context.AddFocusIndicator();

    /* Default layouts */
    Func<ILayoutEngine[]> defaultLayouts = () => new ILayoutEngine[]
    {
        new TallLayoutEngine(),
        new VertLayoutEngine(),
        new HorzLayoutEngine(),
        new FullLayoutEngine(),
    };

    context.DefaultLayouts = defaultLayouts;

    /* Workspaces */
    // Array of workspace names and their layouts
    (string, ILayoutEngine[])[] workspaces =
    {
        ("main", defaultLayouts()),
        ("misc", defaultLayouts()),
        ("code", defaultLayouts()),
        ("chat", defaultLayouts()),
        ("🎶", defaultLayouts()),
    };

    foreach ((string name, ILayoutEngine[] layouts) in workspaces)
    {
        context.WorkspaceContainer.CreateWorkspace(name, layouts);
    }

    /* Filters */
    context.WindowRouter.AddFilter((window) => !window.ProcessFileName.Equals("1Password.exe"));
    context.WindowRouter.AddFilter((window) => !window.ProcessFileName.Equals("pinentry.exe"));

    // The following filter means that Edge will now open on the correct display
    context.WindowRouter.AddFilter((window) => !window.Class.Equals("ShellTrayWnd"));

    /* Routes */
    context.WindowRouter.RouteProcessName("Slack", "chat");
    context.WindowRouter.RouteProcessName("Discord", "chat");
    context.WindowRouter.RouteProcessName("Telegram", "chat");
    context.WindowRouter.RouteProcessName("Spotify", "🎶");
    context.WindowRouter.RouteProcessName("Visual Studio Code", "code");
    context.WindowRouter.RouteProcessName("Windows Terminal Preview", "code");
    context.WindowRouter.RouteProcessName("Brave", "misc");

    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Screen Snipping"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("PowerLauncher"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Power"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Magnifier"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Notepad"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Express"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Dota"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Apex Legends"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("RetroArch"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Steam"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Search"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Desktop Window Manager"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Windows Input Experience"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Brawlhalla"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Virtualbox"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("VPN"));


    /* Action menu */
    var actionMenu = context.AddActionMenu(new ActionMenuPluginConfig()
    {
        RegisterKeybind = false,
        MenuHeight = barHeight,
        FontSize = fontSize,
        FontName = fontName,
        Background = background,
    });

    /* Action menu builder */
    Func<ActionMenuItemBuilder> createActionMenuBuilder = () =>
    {
        var menuBuilder = actionMenu.Create();

        // Switch to workspace
        menuBuilder.AddMenu("switch", () =>
        {
            var workspaceMenu = actionMenu.Create();
            var monitor = context.MonitorContainer.FocusedMonitor;
            var workspaces = context.WorkspaceContainer.GetWorkspaces(monitor);

            Func<int, Action> createChildMenu = (workspaceIndex) => () =>
            {
                context.Workspaces.SwitchMonitorToWorkspace(monitor.Index, workspaceIndex);
            };

            int workspaceIndex = 0;
            foreach (var workspace in workspaces)
            {
                workspaceMenu.Add(workspace.Name, createChildMenu(workspaceIndex));
                workspaceIndex++;
            }

            return workspaceMenu;
        });

        // Move window to workspace
        menuBuilder.AddMenu("move", () =>
        {
            var moveMenu = actionMenu.Create();
            var focusedWorkspace = context.Workspaces.FocusedWorkspace;

            var workspaces = context.WorkspaceContainer.GetWorkspaces(focusedWorkspace).ToArray();
            Func<int, Action> createChildMenu = (index) => () => { context.Workspaces.MoveFocusedWindowToWorkspace(index); };

            for (int i = 0; i < workspaces.Length; i++)
            {
                moveMenu.Add(workspaces[i].Name, createChildMenu(i));
            }

            return moveMenu;
        });

        // Rename workspace
        menuBuilder.AddFreeForm("rename", (name) =>
        {
            context.Workspaces.FocusedWorkspace.Name = name;
        });

        // Create workspace
        menuBuilder.AddFreeForm("create workspace", (name) =>
        {
            context.WorkspaceContainer.CreateWorkspace(name);
        });

        // Delete focused workspace
        menuBuilder.Add("close", () =>
        {
            context.WorkspaceContainer.RemoveWorkspace(context.Workspaces.FocusedWorkspace);
        });

        // Workspacer
        menuBuilder.Add("toggle keybind helper", () => context.Keybinds.ShowKeybindDialog());
        menuBuilder.Add("toggle enabled", () => context.Enabled = !context.Enabled);
        menuBuilder.Add("restart", () => context.Restart());
        menuBuilder.Add("quit", () => context.Quit());

        return menuBuilder;
    };

    var actionMenuBuilder = createActionMenuBuilder();
    /* Keybindings */
    Action setKeybindings = () =>
    {
        // to not clash with the win buttons i decided not to map win at all
        KeyModifiers mod = KeyModifiers.Alt; 
        KeyModifiers mod2 = KeyModifiers.Alt | KeyModifiers.Control;

        IKeybindManager manager = context.Keybinds;

        var workspaces = context.Workspaces;

        manager.UnsubscribeAll();
        manager.Subscribe(MouseEvent.LButtonDown, () => workspaces.SwitchFocusedMonitorToMouseLocation());

        // Left, Right keys
        manager.Subscribe(mod, Keys.Left, () => workspaces.FocusedWorkspace.ShrinkPrimaryArea(), "shrink primary area");
        manager.Subscribe(mod, Keys.Right, () => workspaces.FocusedWorkspace.ExpandPrimaryArea(), "expand primary area");

        manager.Subscribe(mod2, Keys.Left, () => workspaces.FocusedWorkspace.DecrementNumberOfPrimaryWindows(), "decrement number of primary windows");
        manager.Subscribe(mod2, Keys.Right, () => workspaces.FocusedWorkspace.IncrementNumberOfPrimaryWindows(), "increment number of primary windows");

        manager.Subscribe(mod, Keys.H, () => workspaces.SwitchToPreviousWorkspace(), "switch to previous workspace");
        manager.Subscribe(mod, Keys.L, () => workspaces.SwitchToNextWorkspace(), "switch to next workspace");

        manager.Subscribe(mod2, Keys.H, () => workspaces.MoveFocusedWindowToPreviousMonitor(), "move focused window to previous monitor");
        manager.Subscribe(mod2, Keys.L, () => workspaces.MoveFocusedWindowToNextMonitor(), "move focused window to next monitor");
        // H, L keys
        manager.Subscribe(mod, Keys.K, () => workspaces.FocusedWorkspace.FocusNextWindow(), "focus next window");
        manager.Subscribe(mod, Keys.J, () => workspaces.FocusedWorkspace.FocusPreviousWindow(), "focus previous window");
        // K, J keys
        manager.Subscribe(mod2, Keys.K, () => workspaces.FocusedWorkspace.SwapFocusAndNextWindow(), "swap focus and next window");
        manager.Subscribe(mod2, Keys.J, () => workspaces.FocusedWorkspace.SwapFocusAndPreviousWindow(), "swap focus and previous window");

        // Add, Subtract keys
        manager.Subscribe(mod2, Keys.Add, () => gapPlugin.IncrementInnerGap(), "increment inner gap");
        manager.Subscribe(mod2, Keys.Subtract, () => gapPlugin.DecrementInnerGap(), "decrement inner gap");

        manager.Subscribe(mod, Keys.Add, () => gapPlugin.IncrementOuterGap(), "increment outer gap");
        manager.Subscribe(mod, Keys.Subtract, () => gapPlugin.DecrementOuterGap(), "decrement outer gap");

        // Other shortcuts
        manager.Subscribe(mod, Keys.P, () => actionMenu.ShowMenu(actionMenuBuilder), "show menu");
        manager.Subscribe(mod, Keys.Escape, () => context.Enabled = !context.Enabled, "toggle enabled/disabled");
        manager.Subscribe(mod2, Keys.I, () => context.ToggleConsoleWindow(), "toggle console window");

        manager.Subscribe(mod, Keys.Enter, () => System.Diagnostics.Process.Start(@"C:\Users\Marcus\AppData\Local\Microsoft\WindowsApps\wt.exe"));
        
        manager.Subscribe(mod, Keys.D1, ()=> workspaces.SwitchToWorkspace(0));
        manager.Subscribe(mod, Keys.D2, ()=> workspaces.SwitchToWorkspace(1));
        manager.Subscribe(mod, Keys.D3, ()=> workspaces.SwitchToWorkspace(2));
        manager.Subscribe(mod, Keys.D4, ()=> workspaces.SwitchToWorkspace(3));
        manager.Subscribe(mod, Keys.D5, ()=> workspaces.SwitchToWorkspace(4));
        manager.Subscribe(mod, Keys.D6, ()=> workspaces.SwitchToWorkspace(5));
        manager.Subscribe(mod, Keys.D7, ()=> workspaces.SwitchToWorkspace(6));
        manager.Subscribe(mod, Keys.D8, ()=> workspaces.SwitchToWorkspace(7));
        manager.Subscribe(mod, Keys.D9, ()=> workspaces.SwitchToWorkspace(8));
        manager.Subscribe(mod, Keys.D0, ()=> workspaces.SwitchToWorkspace(9));

        manager.Subscribe(mod2, Keys.D1, ()=> workspaces.MoveFocusedWindowToWorkspace(0));
        manager.Subscribe(mod2, Keys.D2, ()=> workspaces.MoveFocusedWindowToWorkspace(1));
        manager.Subscribe(mod2, Keys.D3, ()=> workspaces.MoveFocusedWindowToWorkspace(2));
        manager.Subscribe(mod2, Keys.D4, ()=> workspaces.MoveFocusedWindowToWorkspace(3));
        manager.Subscribe(mod2, Keys.D5, ()=> workspaces.MoveFocusedWindowToWorkspace(4));
        manager.Subscribe(mod2, Keys.D6, ()=> workspaces.MoveFocusedWindowToWorkspace(5));
        manager.Subscribe(mod2, Keys.D7, ()=> workspaces.MoveFocusedWindowToWorkspace(6));
        manager.Subscribe(mod2, Keys.D8, ()=> workspaces.MoveFocusedWindowToWorkspace(7));
        manager.Subscribe(mod2, Keys.D9, ()=> workspaces.MoveFocusedWindowToWorkspace(8));
        manager.Subscribe(mod2, Keys.D0, ()=> workspaces.MoveFocusedWindowToWorkspace(9));

    };

    setKeybindings();
});
