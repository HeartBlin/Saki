import app from "ags/gtk4/app"
import { Astal, Gtk, Gdk } from "ags/gtk4"
import { execAsync } from "ags/process"
import { createPoll } from "ags/time"

export default (monitor: Gdk.Monitor) => {
  const { LEFT, TOP, RIGHT } = Astal.WindowAnchor;

  const HORIZONTAL = Gtk.Orientation.HORIZONTAL;
  const HEIGHT = 35;

}
