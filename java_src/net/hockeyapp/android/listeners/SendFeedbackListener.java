package net.hockeyapp.android.listeners;

import net.hockeyapp.android.tasks.SendFeedbackTask;
/* loaded from: classes3.dex */
public abstract class SendFeedbackListener {
    public void feedbackSuccessful(SendFeedbackTask task) {
    }

    public void feedbackFailed(SendFeedbackTask task, Boolean userWantsRetry) {
    }
}
