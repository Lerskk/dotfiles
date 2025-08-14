import app from "ags/gtk4/app"
import { Astal } from "ags/gtk4"
import { createPoll } from "ags/time"
import { Variable } from "astal"
import Hyprland from "gi://AstalHyprland"
const hyprland = Hyprland.get_default()

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
        <box>
          {i + 1}
        </box>
      )}
    </box>
  )
}

app.start({
  main() {
    const { TOP, LEFT, RIGHT } = Astal.WindowAnchor
    const clock = createPoll("", 1000, "date")

    return (
      <window
        visible
        anchor={TOP | LEFT | RIGHT}>
        <centerbox>
          <Workspaces />
          <label label={clock} />
          <box />
        </centerbox>
      </window>
    )
  }
})
