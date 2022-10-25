.class public abstract Lcom/vkontakte/android/audio/utils/LazyLoadTask;
.super Ljava/lang/Object;
.source "LazyLoadTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;,
        Lcom/vkontakte/android/audio/utils/LazyLoadTask$Tag;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Target:",
        "Ljava/lang/Object;",
        "Progress:",
        "Ljava/lang/Object;",
        "Result:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final TAGS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Lcom/vkontakte/android/audio/utils/LazyLoadTask$Tag;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mTask:Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/audio/utils/LazyLoadTask",
            "<TTarget;TProgress;TResult;>.Task;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 11
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->TAGS:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    .local p0, "this":Lcom/vkontakte/android/audio/utils/LazyLoadTask;, "Lcom/vkontakte/android/audio/utils/LazyLoadTask<TTarget;TProgress;TResult;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/util/Map;
    .locals 1

    .prologue
    .line 9
    sget-object v0, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->TAGS:Ljava/util/Map;

    return-object v0
.end method

.method private cancel()V
    .locals 2

    .prologue
    .line 163
    .local p0, "this":Lcom/vkontakte/android/audio/utils/LazyLoadTask;, "Lcom/vkontakte/android/audio/utils/LazyLoadTask<TTarget;TProgress;TResult;>;"
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->mTask:Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;

    if-nez v0, :cond_0

    .line 164
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Task was not executed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 166
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->mTask:Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;->cancel(Z)Z

    .line 167
    return-void
.end method

.method public static cancel(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Target:",
            "Ljava/lang/Object;",
            ">(TTarget;)V"
        }
    .end annotation

    .prologue
    .line 55
    .local p0, "target":Ljava/lang/Object;, "TTarget;"
    sget-object v1, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->TAGS:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Tag;

    .line 56
    .local v0, "tag":Lcom/vkontakte/android/audio/utils/LazyLoadTask$Tag;
    if-eqz v0, :cond_1

    .line 57
    iget-object v1, v0, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Tag;->task:Lcom/vkontakte/android/audio/utils/LazyLoadTask;

    if-eqz v1, :cond_0

    .line 58
    iget-object v1, v0, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Tag;->task:Lcom/vkontakte/android/audio/utils/LazyLoadTask;

    invoke-direct {v1}, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->cancel()V

    .line 59
    :cond_0
    sget-object v1, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->TAGS:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    :cond_1
    return-void
.end method

.method private execute(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTarget;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/vkontakte/android/audio/utils/LazyLoadTask;, "Lcom/vkontakte/android/audio/utils/LazyLoadTask<TTarget;TProgress;TResult;>;"
    .local p1, "target":Ljava/lang/Object;, "TTarget;"
    const/4 v2, 0x0

    .line 152
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->mTask:Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;

    if-eqz v0, :cond_0

    .line 153
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Task already was executed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 155
    :cond_0
    new-instance v0, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;-><init>(Lcom/vkontakte/android/audio/utils/LazyLoadTask;Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->mTask:Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;

    .line 156
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->isQuick()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 157
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->mTask:Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;

    invoke-virtual {p0}, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->getPriority()Lcom/vkontakte/android/audio/utils/Priority;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/Void;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;->executeQuick(Lcom/vkontakte/android/audio/utils/Priority;[Ljava/lang/Object;)V

    .line 160
    :goto_0
    return-void

    .line 159
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->mTask:Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;

    invoke-virtual {p0}, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->getPriority()Lcom/vkontakte/android/audio/utils/Priority;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/Void;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;->executeSlow(Lcom/vkontakte/android/audio/utils/Priority;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static load(Ljava/lang/Object;Lcom/vkontakte/android/audio/utils/LazyLoadTask;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Target:",
            "Ljava/lang/Object;",
            "Progress:",
            "Ljava/lang/Object;",
            "Result:",
            "Ljava/lang/Object;",
            ">(TTarget;",
            "Lcom/vkontakte/android/audio/utils/LazyLoadTask",
            "<TTarget;TProgress;TResult;>;)V"
        }
    .end annotation

    .prologue
    .line 24
    .local p0, "target":Ljava/lang/Object;, "TTarget;"
    .local p1, "task":Lcom/vkontakte/android/audio/utils/LazyLoadTask;, "Lcom/vkontakte/android/audio/utils/LazyLoadTask<TTarget;TProgress;TResult;>;"
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->getKey()Ljava/lang/String;

    move-result-object v0

    .line 27
    .local v0, "key":Ljava/lang/String;
    sget-object v3, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->TAGS:Ljava/util/Map;

    invoke-interface {v3, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Tag;

    .line 28
    .local v2, "tag":Lcom/vkontakte/android/audio/utils/LazyLoadTask$Tag;
    if-eqz v2, :cond_1

    .line 29
    if-eqz v0, :cond_0

    iget-object v3, v2, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Tag;->key:Ljava/lang/String;

    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 46
    :goto_0
    return-void

    .line 31
    :cond_0
    iget-object v3, v2, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Tag;->task:Lcom/vkontakte/android/audio/utils/LazyLoadTask;

    if-eqz v3, :cond_1

    .line 32
    iget-object v3, v2, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Tag;->task:Lcom/vkontakte/android/audio/utils/LazyLoadTask;

    invoke-direct {v3}, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->cancel()V

    .line 36
    :cond_1
    invoke-virtual {p1, p0}, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->initTarget(Ljava/lang/Object;)V

    .line 37
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->getFromMemoryCache()Ljava/lang/Object;

    move-result-object v1

    .line 38
    .local v1, "result":Ljava/lang/Object;, "TResult;"
    if-nez v1, :cond_2

    .line 39
    sget-object v3, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->TAGS:Ljava/util/Map;

    new-instance v4, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Tag;

    invoke-direct {v4, v0, p1}, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Tag;-><init>(Ljava/lang/String;Lcom/vkontakte/android/audio/utils/LazyLoadTask;)V

    invoke-interface {v3, p0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    invoke-virtual {p1, p0}, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->resetTarget(Ljava/lang/Object;)V

    .line 41
    invoke-direct {p1, p0}, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->execute(Ljava/lang/Object;)V

    goto :goto_0

    .line 43
    :cond_2
    const/4 v3, 0x1

    invoke-virtual {p1, p0, v1, v3}, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->updateTarget(Ljava/lang/Object;Ljava/lang/Object;Z)V

    .line 44
    sget-object v3, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->TAGS:Ljava/util/Map;

    new-instance v4, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Tag;

    invoke-direct {v4, v0}, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Tag;-><init>(Ljava/lang/String;)V

    invoke-interface {v3, p0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method


# virtual methods
.method protected abstract getFromMemoryCache()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TResult;"
        }
    .end annotation
.end method

.method protected abstract getKey()Ljava/lang/String;
.end method

.method protected getPriority()Lcom/vkontakte/android/audio/utils/Priority;
    .locals 1

    .prologue
    .line 141
    .local p0, "this":Lcom/vkontakte/android/audio/utils/LazyLoadTask;, "Lcom/vkontakte/android/audio/utils/LazyLoadTask<TTarget;TProgress;TResult;>;"
    sget-object v0, Lcom/vkontakte/android/audio/utils/Priority;->MEDIUM:Lcom/vkontakte/android/audio/utils/Priority;

    return-object v0
.end method

.method protected abstract initTarget(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTarget;)V"
        }
    .end annotation
.end method

.method public isCancelled()Z
    .locals 1

    .prologue
    .line 148
    .local p0, "this":Lcom/vkontakte/android/audio/utils/LazyLoadTask;, "Lcom/vkontakte/android/audio/utils/LazyLoadTask<TTarget;TProgress;TResult;>;"
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->mTask:Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->mTask:Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected isQuick()Z
    .locals 1

    .prologue
    .line 132
    .local p0, "this":Lcom/vkontakte/android/audio/utils/LazyLoadTask;, "Lcom/vkontakte/android/audio/utils/LazyLoadTask<TTarget;TProgress;TResult;>;"
    const/4 v0, 0x0

    return v0
.end method

.method protected abstract loadData()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation
.end method

.method protected varargs publishProgress([Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TProgress;)V"
        }
    .end annotation

    .prologue
    .line 122
    .local p0, "this":Lcom/vkontakte/android/audio/utils/LazyLoadTask;, "Lcom/vkontakte/android/audio/utils/LazyLoadTask<TTarget;TProgress;TResult;>;"
    .local p1, "values":[Ljava/lang/Object;, "[TProgress;"
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->mTask:Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;

    if-eqz v0, :cond_0

    .line 123
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/LazyLoadTask;->mTask:Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Task;->doPublishProgress([Ljava/lang/Object;)V

    .line 124
    :cond_0
    return-void
.end method

.method protected abstract putToMemoryCache(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResult;)V"
        }
    .end annotation
.end method

.method protected abstract resetTarget(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTarget;)V"
        }
    .end annotation
.end method

.method protected varargs abstract updateProgress(Ljava/lang/Object;[Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTarget;[TProgress;)V"
        }
    .end annotation
.end method

.method protected abstract updateTarget(Ljava/lang/Object;Ljava/lang/Object;Z)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTarget;TResult;Z)V"
        }
    .end annotation
.end method
