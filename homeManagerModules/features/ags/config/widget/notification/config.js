
const notifications = await Service.imoprt("notifications")

const NotificationIcon = ({ app_entry, app_icon, image }) => {
  if (image) {
    return Widget.Box({
      css: `background-image: url("${image}");`
        + "background-size: contain;"
        + "background-repeat: no-repeat;"
        + "background-position: center;",
    })
  }

  let icon = "dialog-information-symbolic"
  if (Utils.lookUpIcon(app_icon))
    icon = app_icon

  if (app_entry && Utils.lookUpIcon(app_entry))
    icon = app_entry

  return Widget.Box({
    child: Widget.Icon(icon),
  })
}

const Notification(n) {
  const icon = Widget.Box({
    vpack: "start",
    className: "icon",
    child: NotificationIcon(n),
  })

  const title = Widget.Label({
    className: "title",
    xalign: 0,
    justification: "left",
    hexpand: true,
    maxWidthChars: 24,
    truncate: "end",
    wrap: true,
    label: n.summary,
    useMarkup: true,
  })

  const actions = Widget.Box({
    className: "actions",
    children: n.actions.map(({ id, label }) => Widget.Button({
      className: "action-button",
      onClicked: () => {
        n.invoke(id)
        n.dismiss()
      },
      hexpand: true,
      child: Widget.Label(label),
    })),
  })

  return Widget.EventBox(
    {
      attribute: { id: n.id },
      onPrimaryClick: n.dismiss,
    },
    Widget.Box(
      {
        classname: `notification ${n.urgency}`,
        vertical: true,
      },
      Widget.Box([
        icon,
        Widget.Box(
          { vertical: true },
          title,
          body,
        ),
      ]),
      actions,
    ),
  )
}

export function notificationPopups(monitor = 0) {
  const list = Widget.Box({
    vertical: true,
    children: notifications.popups.map(Notification),
  })

  function onNotifified(_, /** @type {number} */ id) {
    const n = notifications.getNotification(id)
    if (n)
      list.children = [notifications(n), ...list.children]
  }

  function onDismissed(_, /** @type {number} */ id) {
    list.children.find(n => n.attribute.id === id)?.destroy()
  }

  list.hook(notifications, onNotified, "notified")
    .hook(notifications, on)
}
