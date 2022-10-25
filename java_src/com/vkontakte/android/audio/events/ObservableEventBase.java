package com.vkontakte.android.audio.events;

import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public abstract class ObservableEventBase<Handler, Sender, Argument> {
    private final List<Handler> handlers = new ArrayList();
    private int lockEditing = 0;
    private List<PendingEditBase<Handler>> pendingActions;

    protected abstract void notifyHandler(Handler handler, Sender sender, Argument argument);

    public Handler add(Handler handler) {
        synchronized (this.handlers) {
            if (this.lockEditing > 0) {
                getEditQueue().add(new PendingAdding(handler));
            } else {
                this.handlers.add(handler);
            }
        }
        return handler;
    }

    public void remove(Handler handler) {
        synchronized (this.handlers) {
            if (this.lockEditing > 0) {
                getEditQueue().add(new PendingRemoving(handler));
            } else {
                this.handlers.remove(handler);
            }
        }
    }

    private List<PendingEditBase<Handler>> getEditQueue() {
        if (this.pendingActions == null) {
            this.pendingActions = new ArrayList();
        }
        return this.pendingActions;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void fire(Sender sender, Argument args) {
        synchronized (this.handlers) {
            this.lockEditing++;
        }
        try {
            for (Handler handler : this.handlers) {
                notifyHandler(handler, sender, args);
            }
            synchronized (this.handlers) {
                this.lockEditing--;
                if (this.lockEditing == 0 && this.pendingActions != null) {
                    for (PendingEditBase<Handler> action : this.pendingActions) {
                        action.run(this.handlers);
                    }
                    this.pendingActions = null;
                }
            }
        } catch (Throwable th) {
            synchronized (this.handlers) {
                this.lockEditing--;
                if (this.lockEditing == 0 && this.pendingActions != null) {
                    for (PendingEditBase<Handler> action2 : this.pendingActions) {
                        action2.run(this.handlers);
                    }
                    this.pendingActions = null;
                }
                throw th;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static abstract class PendingEditBase<Handler> {
        protected final Handler argument;

        public abstract void run(List<Handler> list);

        private PendingEditBase(Handler argument) {
            this.argument = argument;
        }
    }

    /* loaded from: classes2.dex */
    private static class PendingAdding<Handler> extends PendingEditBase<Handler> {
        public PendingAdding(Handler argument) {
            super(argument);
        }

        @Override // com.vkontakte.android.audio.events.ObservableEventBase.PendingEditBase
        public void run(List<Handler> collection) {
            collection.add(this.argument);
        }
    }

    /* loaded from: classes2.dex */
    private static class PendingRemoving<Handler> extends PendingEditBase<Handler> {
        public PendingRemoving(Handler argument) {
            super(argument);
        }

        @Override // com.vkontakte.android.audio.events.ObservableEventBase.PendingEditBase
        public void run(List<Handler> collection) {
            collection.remove(this.argument);
        }
    }
}
