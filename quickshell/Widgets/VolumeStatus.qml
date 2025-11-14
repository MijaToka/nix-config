pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Services.Pipewire

Singleton {
  id: root

  property bool muted: (Pipewire.defaultAudioSink?.audio.muted ?? false)
  property bool deafened
  property int volume : (Pipewire.defaultAudioSink?.audio.volume * 100 ?? 0)

  PwObjectTracker {
    objects: [Pipewire.defaultAudioSink]
  }
}
