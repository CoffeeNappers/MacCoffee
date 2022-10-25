.class Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;
.super Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;
.source "LazyLoadTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/utils/LazyLoadTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Task"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/audio/utils/AsyncTaskCompat",
        "<",
        "Ljava/lang/Void;",
        "TProgress;TResult;>;"
    }
.end annotation


# instance fields
.field private final targetReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<TTarget;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/vkontakte/android/audio/utils/LazyLoadTask;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/audio/utils/LazyLoadTask;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTarget;)V"
        }
    .end annotation

    .prologue
    .line 186
    .local p0, "this":Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;, "Lcom/vkontakte/android/audio/utils/LazyLoadTask<TTarget;TProgress;TResult;>.Task;"
    .local p2, "target":Ljava/lang/Object;, "TTarget;"
    iput-object p1, p0, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;->this$0:Lcom/vkontakte/android/audio/utils/LazyLoadTask;

    invoke-direct {p0}, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;-><init>()V

    .line 187
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;->targetReference:Ljava/lang/ref/WeakReference;

    .line 188
    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 183
    .local p0, "this":Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;, "Lcom/vkontakte/android/audio/utils/LazyLoadTask<TTarget;TProgress;TResult;>.Task;"
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;->doInBackground([Ljava/lang/Void;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Object;
    .locals 2
    .param p1, "params"    # [Ljava/lang/Void;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Void;",
            ")TResult;"
        }
    .end annotation

    .prologue
    .line 193
    .local p0, "this":Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;, "Lcom/vkontakte/android/audio/utils/LazyLoadTask<TTarget;TProgress;TResult;>.Task;"
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;->this$0:Lcom/vkontakte/android/audio/utils/LazyLoadTask;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->loadData()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 197
    :goto_0
    return-object v1

    .line 194
    :catch_0
    move-exception v0

    .line 195
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 197
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public varargs doPublishProgress([Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TProgress;)V"
        }
    .end annotation

    .prologue
    .line 239
    .local p0, "this":Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;, "Lcom/vkontakte/android/audio/utils/LazyLoadTask<TTarget;TProgress;TResult;>.Task;"
    .local p1, "values":[Ljava/lang/Object;, "[TProgress;"
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;->publishProgress([Ljava/lang/Object;)V

    .line 240
    return-void
.end method

.method protected onCancelled(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResult;)V"
        }
    .end annotation

    .prologue
    .line 219
    .local p0, "this":Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;, "Lcom/vkontakte/android/audio/utils/LazyLoadTask<TTarget;TProgress;TResult;>.Task;"
    .local p1, "result":Ljava/lang/Object;, "TResult;"
    if-eqz p1, :cond_0

    .line 220
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;->this$0:Lcom/vkontakte/android/audio/utils/LazyLoadTask;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->putToMemoryCache(Ljava/lang/Object;)V

    .line 221
    :cond_0
    return-void
.end method

.method protected onPostExecute(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResult;)V"
        }
    .end annotation

    .prologue
    .line 203
    .local p0, "this":Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;, "Lcom/vkontakte/android/audio/utils/LazyLoadTask<TTarget;TProgress;TResult;>.Task;"
    .local p1, "result":Ljava/lang/Object;, "TResult;"
    if-eqz p1, :cond_0

    .line 204
    iget-object v2, p0, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;->this$0:Lcom/vkontakte/android/audio/utils/LazyLoadTask;

    invoke-virtual {v2, p1}, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->putToMemoryCache(Ljava/lang/Object;)V

    .line 205
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;->isCancelled()Z

    move-result v2

    if-nez v2, :cond_1

    .line 206
    iget-object v2, p0, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;->targetReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    .line 207
    .local v1, "target":Ljava/lang/Object;, "TTarget;"
    if-eqz v1, :cond_1

    .line 208
    invoke-static {}, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->access$000()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Tag;

    .line 209
    .local v0, "tag":Lcom/vkontakte/android/audio/utils/LazyLoadTask$Tag;
    if-eqz v0, :cond_1

    iget-object v2, v0, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Tag;->task:Lcom/vkontakte/android/audio/utils/LazyLoadTask;

    iget-object v3, p0, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;->this$0:Lcom/vkontakte/android/audio/utils/LazyLoadTask;

    if-ne v2, v3, :cond_1

    .line 210
    const/4 v2, 0x0

    iput-object v2, v0, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Tag;->task:Lcom/vkontakte/android/audio/utils/LazyLoadTask;

    .line 211
    iget-object v2, p0, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;->this$0:Lcom/vkontakte/android/audio/utils/LazyLoadTask;

    const/4 v3, 0x0

    invoke-virtual {v2, v1, p1, v3}, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->updateTarget(Ljava/lang/Object;Ljava/lang/Object;Z)V

    .line 215
    .end local v0    # "tag":Lcom/vkontakte/android/audio/utils/LazyLoadTask$Tag;
    .end local v1    # "target":Ljava/lang/Object;, "TTarget;"
    :cond_1
    return-void
.end method

.method protected varargs onProgressUpdate([Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TProgress;)V"
        }
    .end annotation

    .prologue
    .line 225
    .local p0, "this":Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;, "Lcom/vkontakte/android/audio/utils/LazyLoadTask<TTarget;TProgress;TResult;>.Task;"
    .local p1, "values":[Ljava/lang/Object;, "[TProgress;"
    iget-object v2, p0, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;->targetReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    .line 226
    .local v1, "target":Ljava/lang/Object;, "TTarget;"
    if-eqz v1, :cond_0

    .line 227
    invoke-static {}, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->access$000()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Tag;

    .line 228
    .local v0, "tag":Lcom/vkontakte/android/audio/utils/LazyLoadTask$Tag;
    if-eqz v0, :cond_0

    iget-object v2, v0, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Tag;->task:Lcom/vkontakte/android/audio/utils/LazyLoadTask;

    iget-object v3, p0, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;->this$0:Lcom/vkontakte/android/audio/utils/LazyLoadTask;

    if-ne v2, v3, :cond_0

    .line 229
    iget-object v2, p0, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;->this$0:Lcom/vkontakte/android/audio/utils/LazyLoadTask;

    invoke-virtual {v2, v1, p1}, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->updateProgress(Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 236
    .end local v0    # "tag":Lcom/vkontakte/android/audio/utils/LazyLoadTask$Tag;
    :goto_0
    return-void

    .line 235
    :cond_0
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;->cancel(Z)Z

    goto :goto_0
.end method
