package com.vkontakte.android.audio.utils;

import android.text.TextUtils;
import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;
/* loaded from: classes2.dex */
public abstract class LazyLoadTask<Target, Progress, Result> {
    private static final Map<Object, Tag> TAGS = new WeakHashMap();
    private LazyLoadTask<Target, Progress, Result>.Task mTask;

    protected abstract Result getFromMemoryCache();

    protected abstract String getKey();

    protected abstract void initTarget(Target target);

    protected abstract Result loadData() throws Throwable;

    protected abstract void putToMemoryCache(Result result);

    protected abstract void resetTarget(Target target);

    protected abstract void updateProgress(Target target, Progress... progressArr);

    protected abstract void updateTarget(Target target, Result result, boolean z);

    public static <Target, Progress, Result> void load(Target target, LazyLoadTask<Target, Progress, Result> task) {
        String key = task.getKey();
        Tag tag = TAGS.get(target);
        if (tag != null) {
            if (key == null || !TextUtils.equals(key, tag.key)) {
                if (tag.task != null) {
                    tag.task.cancel();
                }
            } else {
                return;
            }
        }
        task.initTarget(target);
        Result result = task.getFromMemoryCache();
        if (result == null) {
            TAGS.put(target, new Tag(key, task));
            task.resetTarget(target);
            task.execute(target);
            return;
        }
        task.updateTarget(target, result, true);
        TAGS.put(target, new Tag(key));
    }

    public static <Target> void cancel(Target target) {
        Tag tag = TAGS.get(target);
        if (tag != null) {
            if (tag.task != null) {
                tag.task.cancel();
            }
            TAGS.remove(target);
        }
    }

    protected void publishProgress(Progress... values) {
        if (this.mTask != null) {
            this.mTask.doPublishProgress(values);
        }
    }

    protected boolean isQuick() {
        return false;
    }

    protected Priority getPriority() {
        return Priority.MEDIUM;
    }

    public boolean isCancelled() {
        return this.mTask != null && this.mTask.isCancelled();
    }

    private void execute(Target target) {
        if (this.mTask != null) {
            throw new IllegalStateException("Task already was executed");
        }
        this.mTask = new Task(target);
        if (isQuick()) {
            this.mTask.executeQuick(getPriority(), new Void[0]);
        } else {
            this.mTask.executeSlow(getPriority(), new Void[0]);
        }
    }

    private void cancel() {
        if (this.mTask == null) {
            throw new IllegalStateException("Task was not executed");
        }
        this.mTask.cancel(true);
    }

    /* loaded from: classes2.dex */
    private static class Tag {
        public final String key;
        public LazyLoadTask<?, ?, ?> task;

        public Tag(String key, LazyLoadTask<?, ?, ?> task) {
            this.key = key;
            this.task = task;
        }

        public Tag(String key) {
            this.key = key;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class Task extends AsyncTaskCompat<Void, Progress, Result> {
        private final WeakReference<Target> targetReference;

        public Task(Target target) {
            this.targetReference = new WeakReference<>(target);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public Result doInBackground(Void... params) {
            try {
                return (Result) LazyLoadTask.this.loadData();
            } catch (Throwable e) {
                e.printStackTrace();
                return null;
            }
        }

        @Override // android.os.AsyncTask
        protected void onPostExecute(Result result) {
            Target target;
            Tag tag;
            if (result != null) {
                LazyLoadTask.this.putToMemoryCache(result);
            }
            if (!isCancelled() && (target = this.targetReference.get()) != null && (tag = (Tag) LazyLoadTask.TAGS.get(target)) != null && tag.task == LazyLoadTask.this) {
                tag.task = null;
                LazyLoadTask.this.updateTarget(target, result, false);
            }
        }

        @Override // android.os.AsyncTask
        protected void onCancelled(Result result) {
            if (result != null) {
                LazyLoadTask.this.putToMemoryCache(result);
            }
        }

        @Override // android.os.AsyncTask
        protected void onProgressUpdate(Progress... values) {
            Tag tag;
            Target target = this.targetReference.get();
            if (target != null && (tag = (Tag) LazyLoadTask.TAGS.get(target)) != null && tag.task == LazyLoadTask.this) {
                LazyLoadTask.this.updateProgress(target, values);
            } else {
                cancel(true);
            }
        }

        public void doPublishProgress(Progress... values) {
            publishProgress(values);
        }
    }
}
