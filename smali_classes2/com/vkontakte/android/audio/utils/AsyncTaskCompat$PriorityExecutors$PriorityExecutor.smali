.class Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors$PriorityExecutor;
.super Ljava/lang/Object;
.source "AsyncTaskCompat.java"

# interfaces
.implements Ljava/util/concurrent/Executor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PriorityExecutor"
.end annotation


# instance fields
.field private final mPriority:Lcom/vkontakte/android/audio/utils/Priority;

.field final synthetic this$0:Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;Lcom/vkontakte/android/audio/utils/Priority;)V
    .locals 0
    .param p2, "priority"    # Lcom/vkontakte/android/audio/utils/Priority;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors$PriorityExecutor;->this$0:Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput-object p2, p0, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors$PriorityExecutor;->mPriority:Lcom/vkontakte/android/audio/utils/Priority;

    .line 72
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/Runnable;)V
    .locals 3
    .param p1, "command"    # Ljava/lang/Runnable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 76
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors$PriorityExecutor;->this$0:Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;

    invoke-static {v0}, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;->access$000(Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;)Ljava/util/WeakHashMap;

    move-result-object v1

    monitor-enter v1

    .line 77
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors$PriorityExecutor;->this$0:Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;

    invoke-static {v0}, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;->access$000(Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;)Ljava/util/WeakHashMap;

    move-result-object v0

    iget-object v2, p0, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors$PriorityExecutor;->mPriority:Lcom/vkontakte/android/audio/utils/Priority;

    invoke-virtual {v0, p1, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 79
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors$PriorityExecutor;->this$0:Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;

    invoke-static {v0}, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;->access$100(Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;)Ljava/util/concurrent/Executor;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 80
    return-void

    .line 78
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method
