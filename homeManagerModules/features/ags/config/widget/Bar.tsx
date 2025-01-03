import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import { Variable } from "astal"
import Hyprland from "gi://AstalHyprland"
const hyprland = Hyprland.get_default()

const time = Variable("").poll(1000, "date")

const Workspaces = () => {
  const hyprWorkspaces = hyprland.workspaces
  hyprWorkspaces.sort((a, b) => a.id - b.id)

  const workspaces: (Hyprland.Workspace | undefined)[] = Array.from({ length: 5 }, (_, i) => {
    const workspace = hyprWorkspaces.find((ws) => ws.id == i)
    return workspace
  })


  print(workspaces.length)
  return (
    <box>
      {workspaces.map((workspace, i) => 
        <button className="workspace" onClick={() => hyprland.dispatch("workspace", (i + 1).toString())}>
          {i + 1}
        </button>
      )}
    </box>
  )
}

export default function Bar(gdkmonitor: Gdk.Monitor) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor


  return <window
    className="Bar"
    gdkmonitor={gdkmonitor}
    exclusivity={Astal.Exclusivity.EXCLUSIVE}
    anchor={TOP | LEFT | RIGHT}
    application={App}>
    <centerbox>
      <Workspaces />
      <button
        onClicked={() => print("hello")}
        halign={Gtk.Align.CENTER}
      >
        <label label={time()} />
      </button>
      <box />
    </centerbox>
  </window>
}
