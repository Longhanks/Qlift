import CQlift


open class QFrame: QWidget {
    public override init(parent: QWidget? = nil, flags: Qt.WindowFlags = .Widget) {
        super.init(ptr: QFrame_new(parent?.ptr, flags.rawValue), parent: parent)

        let rawSelf = Unmanaged.passUnretained(self).toOpaque()

        let functorSizeHint: @convention(c) (UnsafeMutableRawPointer?) -> UnsafeMutableRawPointer? = { context in
            let _self = Unmanaged<QFrame>.fromOpaque(context!).takeUnretainedValue()
            return _self.sizeHint.ptr
        }

        QFrame_sizeHint_Override(self.ptr, rawSelf, functorSizeHint)

        let functorMousePressEvent: @convention(c) (UnsafeMutableRawPointer?, UnsafeMutableRawPointer?) -> Void = { context, mouseEvent in
            let _self = Unmanaged<QFrame>.fromOpaque(context!).takeUnretainedValue()
            _self.mousePressEvent(event: QMouseEvent(ptr: mouseEvent!))
        }

        QFrame_mousePressEvent_Override(self.ptr, rawSelf, functorMousePressEvent)
    }

    override init(ptr: UnsafeMutableRawPointer, parent: QWidget? = nil) {
        super.init(ptr: ptr, parent: parent)
    }

    deinit {
        if self.ptr != nil {
            if QObject_parent(self.ptr) == nil {
                QFrame_delete(self.ptr)
            }
            self.ptr = nil
        }
    }
}
