.class public abstract Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;
.super Landroid/os/AsyncTask;
.source "AsyncTaskCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Params:",
        "Ljava/lang/Object;",
        "Progress:",
        "Ljava/lang/Object;",
        "Result:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/os/AsyncTask",
        "<TParams;TProgress;TResult;>;"
    }
.end annotation


# static fields
.field private static final QUICK_EXECUTORS:Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;

.field private static final SLOW_EXECUTORS:Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 15
    new-instance v0, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;

    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;-><init>(I)V

    sput-object v0, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;->QUICK_EXECUTORS:Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;

    .line 16
    new-instance v0, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;-><init>(I)V

    sput-object v0, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;->SLOW_EXECUTORS:Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    .local p0, "this":Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;, "Lcom/vkontakte/android/audio/utils/AsyncTaskCompat<TParams;TProgress;TResult;>;"
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs executeQuick(Lcom/vkontakte/android/audio/utils/Priority;[Ljava/lang/Object;)V
    .locals 1
    .param p1, "priority"    # Lcom/vkontakte/android/audio/utils/Priority;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/audio/utils/Priority;",
            "[TParams;)V"
        }
    .end annotation

    .prologue
    .line 20
    .local p0, "this":Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;, "Lcom/vkontakte/android/audio/utils/AsyncTaskCompat<TParams;TProgress;TResult;>;"
    .local p2, "params":[Ljava/lang/Object;, "[TParams;"
    sget-object v0, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;->QUICK_EXECUTORS:Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;->getExecutor(Lcom/vkontakte/android/audio/utils/Priority;)Ljava/util/concurrent/Executor;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 21
    return-void
.end method

.method public varargs executeQuick([Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TParams;)V"
        }
    .end annotation

    .prologue
    .line 25
    .local p0, "this":Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;, "Lcom/vkontakte/android/audio/utils/AsyncTaskCompat<TParams;TProgress;TResult;>;"
    .local p1, "params":[Ljava/lang/Object;, "[TParams;"
    sget-object v0, Lcom/vkontakte/android/audio/utils/Priority;->MEDIUM:Lcom/vkontakte/android/audio/utils/Priority;

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;->executeQuick(Lcom/vkontakte/android/audio/utils/Priority;[Ljava/lang/Object;)V

    .line 26
    return-void
.end method

.method public varargs executeSlow(Lcom/vkontakte/android/audio/utils/Priority;[Ljava/lang/Object;)V
    .locals 1
    .param p1, "priority"    # Lcom/vkontakte/android/audio/utils/Priority;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/audio/utils/Priority;",
            "[TParams;)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p0, "this":Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;, "Lcom/vkontakte/android/audio/utils/AsyncTaskCompat<TParams;TProgress;TResult;>;"
    .local p2, "params":[Ljava/lang/Object;, "[TParams;"
    sget-object v0, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;->SLOW_EXECUTORS:Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;->getExecutor(Lcom/vkontakte/android/audio/utils/Priority;)Ljava/util/concurrent/Executor;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 31
    return-void
.end method

.method public varargs executeSlow([Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TParams;)V"
        }
    .end annotation

    .prologue
    .line 35
    .local p0, "this":Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;, "Lcom/vkontakte/android/audio/utils/AsyncTaskCompat<TParams;TProgress;TResult;>;"
    .local p1, "params":[Ljava/lang/Object;, "[TParams;"
    sget-object v0, Lcom/vkontakte/android/audio/utils/Priority;->MEDIUM:Lcom/vkontakte/android/audio/utils/Priority;

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;->executeSlow(Lcom/vkontakte/android/audio/utils/Priority;[Ljava/lang/Object;)V

    .line 36
    return-void
.end method
